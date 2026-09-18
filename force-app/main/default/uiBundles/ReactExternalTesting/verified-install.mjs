#!/usr/bin/env node
/**
 * verified-install.mjs - verified bootstrap install for the MF pilot.
 *
 * Safe-by-default ordering: nothing is downloaded or executed until the exact
 * resolved dependency tree has passed the allowlist and the scans.
 *
 *   1. Preconditions   - clean slate + .npmrc hardening present.
 *   2. Allowlist gate  - every DIRECT dependency must be approved.
 *   3. Resolve-only    - build the lockfile from registry METADATA only
 *                        (no tarballs downloaded, no scripts run).
 *   4. Scan (GATE)     - osv-scanner against the resolved lockfile, ignoring
 *                        ONLY the advisory IDs formally accepted in
 *                        accepted-advisories.json (RA-001). Fails on anything
 *                        new. npm audit is also run, but as ADVISORY OUTPUT
 *                        ONLY (printed, not gating) since it cannot ignore by ID.
 *   5. Install         - npm ci from the verified lockfile, scripts disabled.
 *   6. Provenance      - npm audit signatures on the installed tree.
 *
 * Usage:    node verified-install.mjs
 * Requires: Node 18+, npm >= 11.10.0, osv-scanner on PATH (the GATE now depends
 *           on it - if absent the script FAILS rather than skipping, because the
 *           accept-list gate cannot run without it).
 */
import { execSync } from 'node:child_process';
import { existsSync, readFileSync, writeFileSync, unlinkSync } from 'node:fs';

const sh    = (cmd) => execSync(cmd, { stdio: 'inherit' });
const shCap = (cmd) => execSync(cmd, { encoding: 'utf8', stdio: ['ignore', 'pipe', 'pipe'] });
const shOut = (cmd) => execSync(cmd, { encoding: 'utf8', stdio: ['ignore', 'pipe', 'ignore'] });
const fail  = (m) => { console.error(`\n\u2716 ${m}\n`); process.exit(1); };
const ok    = (m) => console.log(`\u2713 ${m}`);
const warn  = (m) => console.warn(`\u26a0 ${m}`);

// --- 1. Preconditions -------------------------------------------------------
if (existsSync('node_modules'))
  fail('node_modules already exists. Run from a clean checkout so the lockfile is built fresh.');
if (!existsSync('package.json')) fail('No package.json in the current directory.');
if (!existsSync('.npmrc'))
  fail('.npmrc not found. Create it first (ignore-scripts + min-release-age) - see Phase 1 control A1.');
const npmrc = readFileSync('.npmrc', 'utf8');
if (!/ignore-scripts\s*=\s*true/.test(npmrc)) fail('.npmrc must set  ignore-scripts=true');
if (!/min-release-age\s*=\s*\d+/.test(npmrc))  fail('.npmrc must set a  min-release-age  cooldown');
ok('.npmrc hardening present (ignore-scripts + cooldown).');

try {
  const [maj, min] = shOut('npm --version').trim().split('.').map(Number);
  if (maj < 11 || (maj === 11 && min < 10))
    warn(`npm ${maj}.${min}.x does not support min-release-age (needs >= 11.10.0). Cooldown will NOT be enforced.`);
} catch { /* ignore */ }

// --- 2. Allowlist gate ------------------------------------------------------
if (!existsSync('allowed-packages.json')) fail('allowed-packages.json not found.');
const allow = JSON.parse(readFileSync('allowed-packages.json', 'utf8')).allowed || [];
const isAllowed = (name) => allow.some((a) =>
  a === name || ((a.endsWith('/') || a.endsWith('*')) && name.startsWith(a.replace(/\*$/, ''))));
const pkg    = JSON.parse(readFileSync('package.json', 'utf8'));
const direct = { ...(pkg.dependencies || {}), ...(pkg.devDependencies || {}) };
const blocked = Object.keys(direct).filter((n) => !isAllowed(n));
if (blocked.length)
  fail(`These DIRECT dependencies are not on the allowlist:\n   - ${blocked.join('\n   - ')}\n` +
       `Review them, then add to allowed-packages.json - or remove them from package.json.`);
ok(`Allowlist gate passed (${Object.keys(direct).length} direct dependencies, all approved).`);

// --- 3. Resolve-only: build the lockfile WITHOUT installing code ------------
console.log('\n\u2192 Resolving dependency tree (registry metadata only - no download, no scripts)\u2026');
sh('npm install --package-lock-only --ignore-scripts');
try {
  const lock  = JSON.parse(readFileSync('package-lock.json', 'utf8'));
  const total = Object.keys(lock.packages || {}).length - 1;
  ok(`package-lock.json generated - ${total} packages resolved (incl. transitive). No code on disk yet.`);
} catch { ok('package-lock.json generated. No code on disk yet.'); }

// --- 4a. npm audit: ADVISORY OUTPUT ONLY (not a gate) -----------------------
console.log('\n\u2192 npm audit (advisory output only - not the gate):');
try { console.log(shCap('npm audit --audit-level=high')); }
catch (e) { console.log(e.stdout || ''); warn('npm audit reports advisories above (informational). The osv-scanner gate below is authoritative.'); }

// --- 4b. osv-scanner: THE GATE, ignoring only accepted advisory IDs ---------
if (!existsSync('accepted-advisories.json'))
  fail('accepted-advisories.json not found - the gate needs the RA accept-list to run. See RA-001.');
const ra = JSON.parse(readFileSync('accepted-advisories.json', 'utf8'));
const acceptedIds = (ra.accepted || []).map((a) => a.id);
console.log(`\n\u2192 Scanning resolved tree (osv-scanner GATE). ${acceptedIds.length} advisories formally accepted (${ra.record}); gate fails on anything else.`);

// verify osv-scanner is present - the gate cannot run without it
try { shOut('osv-scanner --version'); }
catch { fail('osv-scanner not found on PATH. The accept-list gate requires it (install via Scoop / release binary - NOT npx).'); }

// osv-scanner config: ignore ONLY the accepted IDs. Written fresh each run from RA-001 so the two can never drift.
const osvConfig = `# GENERATED from accepted-advisories.json (${ra.record}) - do not hand-edit.\n[[IgnoredVulns]]\n` +
  acceptedIds.map((id) => `id = "${id}"`).join('\n\n[[IgnoredVulns]]\n') + '\n';
writeFileSync('osv-scanner.toml', osvConfig);

let gatePass = false;
try {
  sh('osv-scanner --config=osv-scanner.toml --lockfile=package-lock.json');
  gatePass = true;
} catch {
  // osv-scanner exits non-zero if any NON-ignored vuln remains
  gatePass = false;
}
if (!gatePass)
  fail('osv-scanner found advisories NOT on the accepted list (RA-001). Review the output above:\n' +
       '  - if it is a genuinely new issue, fix it or take a documented decision;\n' +
       '  - do NOT add IDs to accepted-advisories.json without a recorded reason + review trigger.');
ok('Scan gate passed: only formally-accepted advisories remain (RA-001).');

// --- 5. Real install from the verified lockfile, scripts disabled -----------
console.log('\n\u2192 Installing from the verified lockfile\u2026');
sh('npm ci --ignore-scripts');
ok('npm ci complete (exact versions, integrity hashes verified, install scripts disabled).');

// --- 6. Post-install provenance / signature check --------------------------
console.log('\n\u2192 Verifying registry signatures / provenance\u2026');
try { sh('npm audit signatures'); ok('Signatures / provenance verified.'); }
catch { warn('npm audit signatures reported issues - review before trusting the tree.'); }

console.log('\n\u2714 Verified install complete.');
console.log('   Accepted advisories are recorded in accepted-advisories.json (RA-001).');
console.log('   Commit: package.json, package-lock.json, .npmrc, allowed-packages.json, accepted-advisories.json');

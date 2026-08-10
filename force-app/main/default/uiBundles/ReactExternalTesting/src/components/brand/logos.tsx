import { cn } from '@/lib/utils';

/**
 * Brand logos, recreated as inline SVG so they scale crisply, need no
 * network requests (CSP-safe) and can be themed.
 *
 * If official artwork files become available, drop them into
 * `src/assets/brand/` and swap the SVG markup here — every consumer
 * imports the logo through these components, so nothing else changes.
 */

interface LogoProps {
  className?: string;
  /** Accessible label. Pass an empty string for decorative use. */
  title?: string;
}

/**
 * AnimalOS wordmark — tall condensed "ANIMAL" with a heavy "OS".
 * Renders in `currentColor`, so set a text colour class to theme it
 * (e.g. `text-foreground`, `text-white`).
 */
export function AnimalOsLogo({ className, title = 'AnimalOS' }: LogoProps) {
  return (
    <svg
      viewBox="0 0 560 150"
      role={title ? 'img' : 'presentation'}
      aria-label={title || undefined}
      aria-hidden={title ? undefined : true}
      className={cn('h-8 w-auto fill-current', className)}
    >
      <text
        x="0"
        y="128"
        textLength="380"
        lengthAdjust="spacingAndGlyphs"
        fontFamily="'Arial Narrow', 'Helvetica Neue', Arial, sans-serif"
        fontWeight="300"
        fontSize="150"
        letterSpacing="2"
      >
        ANIMAL
      </text>
      <text
        x="388"
        y="128"
        textLength="170"
        lengthAdjust="spacingAndGlyphs"
        fontFamily="'Arial Narrow', 'Helvetica Neue', Arial, sans-serif"
        fontWeight="800"
        fontSize="150"
      >
        OS
      </text>
    </svg>
  );
}

/** A single paw print used by the RSPCA logo. Fill is inherited. */
function Paw() {
  return (
    <g>
      <ellipse cx="-21" cy="-6" rx="7.5" ry="10.5" transform="rotate(-28 -21 -6)" />
      <ellipse cx="-7.5" cy="-16" rx="7" ry="10.5" transform="rotate(-9 -7.5 -16)" />
      <ellipse cx="7.5" cy="-16" rx="7" ry="10.5" transform="rotate(9 7.5 -16)" />
      <ellipse cx="21" cy="-6" rx="7.5" ry="10.5" transform="rotate(28 21 -6)" />
      <path d="M -17 8 Q 0 -6 17 8 Q 21 22 0 26 Q -21 22 -17 8 Z" />
    </g>
  );
}

/**
 * RSPCA logo — bold blue wordmark with two green paw prints.
 * Uses fixed brand colours by default (logos should not re-theme);
 * pass `monochrome` to render everything in `currentColor` instead.
 */
export function RspcaLogo({
  className,
  title = 'RSPCA',
  monochrome = false,
}: LogoProps & { monochrome?: boolean }) {
  return (
    <svg
      viewBox="0 0 640 140"
      role={title ? 'img' : 'presentation'}
      aria-label={title || undefined}
      aria-hidden={title ? undefined : true}
      className={cn('h-8 w-auto', className)}
    >
      <text
        x="0"
        y="112"
        textLength="440"
        lengthAdjust="spacingAndGlyphs"
        fontFamily="'Helvetica Neue', Arial, sans-serif"
        fontWeight="800"
        fontSize="124"
        fill={monochrome ? 'currentColor' : '#0089cf'}
      >
        RSPCA
      </text>
      <g fill={monochrome ? 'currentColor' : '#8dc63f'}>
        <g transform="translate(510 48) rotate(18) scale(1.15)">
          <Paw />
        </g>
        <g transform="translate(594 84) rotate(24) scale(0.92)">
          <Paw />
        </g>
      </g>
    </svg>
  );
}

/**
 * Combined lockup for headers/footers: AnimalOS wordmark alongside a
 * small RSPCA mark, separated by a rule.
 */
export function BrandLockup({ className }: { className?: string }) {
  return (
    <span className={cn('inline-flex items-center gap-3', className)}>
      <AnimalOsLogo className="h-6 text-foreground" />
      <span aria-hidden="true" className="h-6 w-px bg-border" />
      <RspcaLogo className="h-5" />
    </span>
  );
}

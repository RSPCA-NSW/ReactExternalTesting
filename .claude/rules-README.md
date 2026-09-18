# React / Multi-Framework rules

One rule file per topic. Each is self-contained and directive — rules, not
essays. The reasoning behind them lives in `docs/REACT_CONVENTIONS.md`.

Files use `.mdc` (markdown plus YAML frontmatter) so they work as
`.cursor/rules/` entries, as Claude Code rules, and as plain documentation.

all rules can be found in /home/admin2/ReactExternalTesting/react-rules/rules

| File | Covers |
|---|---|
| `01-architecture-layers.mdc` | The four layers and what may import what |
| `02-data-access-routing.mdc` | GraphQL for reads, AOS bridge for writes |
| `03-aos-rest-bridge.mdc` | **How all Apex calls are made.** Non-negotiable |
| `04-folder-structure.mdc` | Feature-first organisation, file naming |
| `05-services.mdc` | The `api/` layer |
| `06-hooks-reads.mdc` | The three-state pattern, dependency arrays |
| `07-writes-and-handlers.mdc` | Writes never use hooks |
| `08-component-extraction.mdc` | **When to extract rather than branch** |
| `09-forms-and-validation.mdc` | Controlled inputs, both-sides validation |
| `10-types.mdc` | Codegen, UI API field access |
| `11-styling.mdc` | Tailwind and shadcn conventions |
| `12-apex-processors.mdc` | The processor contract from the React side |
| `13-security-checklist.mdc` | Run before testing any new screen |
| `14-platform-constraints.mdc` | Known defects and limits |

## Precedence

`03` and `13` are hard rules — breaking them produces a broken build or a
security gap. The rest are conventions: if you need/want to deviate, you MUST check with the user with justifaction and not proceed without their go-ahead

## Before adding a rule

A rule earns its place by having cost someone time. If it is preference rather
than consequence, it belongs in a code review comment, not here.

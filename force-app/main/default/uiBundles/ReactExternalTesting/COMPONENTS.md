# Component Guide

Quick reference for every component in `src/components/`. Three groups:

- **Brand** (`@/components/brand`) — AnimalOS-styled building blocks. Import from the barrel: `import { PageHeader, StatCard } from '@/components/brand'`.
- **Layout & app shell** (`@/components/layout`, `@/components/layouts`, `@/components/alerts`, `@/components/CenteredState`) — page chrome and wrappers.
- **UI primitives** (`@/components/ui`) — shadcn/ui base components. Import individually, e.g. `import { Button } from '@/components/ui/button'`.

Unless noted, `className` merges extra Tailwind classes onto the root element, and props typed `React.ReactNode` accept strings or JSX.

---

## Brand components

### PageHeader

Standard page heading block. Use at the top of every page.

| Prop | Type | Default | Description |
|---|---|---|---|
| `title` | `ReactNode` | required | Page title (`h1`). |
| `eyebrow` | `ReactNode` | — | Small green pill label above the title (e.g. object or section name). |
| `description` | `ReactNode` | — | Muted paragraph under the title. |
| `actions` | `ReactNode` | — | Right-aligned action buttons. |
| `children` | `ReactNode` | — | Extra content below the header row (breadcrumbs, tabs, filters). |

```tsx
<PageHeader eyebrow="Foster Care" title="Home" description="Your animals at a glance"
  actions={<Button>New record</Button>} />
```

### Section

Titled content group within a page (`h2` heading).

| Prop | Type | Default | Description |
|---|---|---|---|
| `title` | `ReactNode` | required | Section heading. |
| `description` | `ReactNode` | — | Muted line under the heading. |
| `actions` | `ReactNode` | — | Right-aligned controls (buttons, filters). |
| `children` | `ReactNode` | required | Section body. |

### StatCard

Dashboard metric tile with an optional **trend** (change vs a previous period). Use when the number has a delta; for fixed-meaning tiles use `MetricCard`.

| Prop | Type | Default | Description |
|---|---|---|---|
| `label` | `ReactNode` | required | Small heading above the value. |
| `value` | `ReactNode` | required | The big figure. |
| `icon` | `ReactNode` | — | Lucide icon, rendered in a brand-tinted square. |
| `delta` | `number` | — | % change vs a previous period. Sign picks the arrow/colour (≥ 0 green ↗, < 0 red ↘); rendered as `Math.abs(delta)%`. Omit to hide the trend row. |
| `deltaLabel` | `ReactNode` | — | Context after the delta, e.g. `"vs last month"`. |

```tsx
<StatCard label="Adoptions" value={42} icon={<HeartIcon />} delta={-12} deltaLabel="vs last month" />
```

Note: up is always green, down always red — for metrics where a decrease is good, use `MetricCard` with an explicit tone instead.

### MetricCard

Dashboard metric tile with a **fixed tone** instead of a trend. Tone tints the icon square and the value.

| Prop | Type | Default | Description |
|---|---|---|---|
| `label` | `ReactNode` | required | Small heading above the value. |
| `value` | `ReactNode` | required | The big figure. |
| `icon` | `ReactNode` | — | Lucide icon in a tinted square. |
| `hint` | `ReactNode` | — | Small muted text under the value (e.g. `"3 awaiting vet check"`). |
| `tone` | see below | `'brand'` | Colour scheme. |

Tones:

- `brand` (default) — brand-gradient icon tile, neutral value. Plain counts.
- `green-soft` → `green` → `green-deep` → `green-solid` — green ramp, lightest to strongest; grade a row of tiles by emphasis (`green-solid` = filled tile for the hero metric).
- `success` / `warning` / `danger` — semantic; for metrics with a fixed meaning (overdue = `danger`).
- `neutral` — muted grey, de-emphasised.

```tsx
<MetricCard label="Overdue tasks" value={7} tone="danger" icon={<AlertTriangleIcon />} />
<MetricCard label="In care" value={412} tone="green-solid" icon={<PawPrintIcon />} hint="12 new this week" />
```

### StatusBadge

Tonal status pill for record states ("In Care", "Available", "Adopted", "Overdue"). Also spreads any `<span>` props. Exports `statusBadgeVariants` for reuse.

| Prop | Type | Default | Description |
|---|---|---|---|
| `tone` | `'neutral' \| 'info' \| 'success' \| 'warning' \| 'danger' \| 'brand'` | `'neutral'` | Semantic colour. `brand` is solid green; the rest are tints. |
| `withDot` | `boolean` | `true` | Leading status dot. |
| `children` | `ReactNode` | — | Badge text. |

```tsx
<StatusBadge tone="success">Available</StatusBadge>
```

### EmptyState

Placeholder for empty lists and zero-result searches (dashed border card).

| Prop | Type | Default | Description |
|---|---|---|---|
| `icon` | `ReactNode` | paw print | Lucide icon in a brand-tinted tile. |
| `title` | `ReactNode` | required | Headline. |
| `description` | `ReactNode` | — | Supporting text. |
| `action` | `ReactNode` | — | Call-to-action button(s). |

### LoadingState

Centred loading placeholder (paw loader + label) for pages/panels while data fetches. Announces via `role="status"`.

| Prop | Type | Default | Description |
|---|---|---|---|
| `label` | `ReactNode` | `'Loading…'` | Visible text under the spinner. |

### ErrorState

Centred error placeholder with optional retry. Announces via `role="alert"`.

| Prop | Type | Default | Description |
|---|---|---|---|
| `title` | `ReactNode` | `'Something went wrong'` | Headline. |
| `message` | `ReactNode` | — | Detail, e.g. the error from a data hook. |
| `onRetry` | `() => void` | — | Shows a "Try again" button that calls this; button hidden if omitted. |

```tsx
if (loading) return <LoadingState label="Fetching animals…" />;
if (error) return <ErrorState message={error.message} onRetry={refetch} />;
```

### PawLoader

Branded loading indicator — the outline paw draws itself in and out. Size/colour via `className` (defaults to `size-8 text-brand`). Static outline under reduced motion. Spreads `<span>` props.

| Prop | Type | Default | Description |
|---|---|---|---|
| `label` | `string` | `'Loading'` | Accessible label. Pass `""` when a parent already announces loading — the paw becomes decorative. |

### DetailList / DetailItem

Label/value pairs (`<dl>`) for record detail views. `DetailList` spreads `<dl>` props and just wraps `DetailItem` children.

`DetailItem`:

| Prop | Type | Default | Description |
|---|---|---|---|
| `label` | `ReactNode` | required | Field name (left column on `sm+`). |
| `value` | `ReactNode` | required | Field value; `null`/`undefined` renders an em dash. |

```tsx
<DetailList>
  <DetailItem label="Name" value="Bella" />
  <DetailItem label="Status" value={<StatusBadge tone="success">Available</StatusBadge>} />
</DetailList>
```

### ThemeToggle

Light/dark mode switch button. Persists the choice to `localStorage` (`animalos-theme`) and toggles the `dark` class on `<html>`. Only prop: `className`.

### Logos — AnimalOsLogo, RspcaLogo, BrandLockup

Inline-SVG brand marks (CSP-safe, scale crisply).

| Component | Props | Notes |
|---|---|---|
| `AnimalOsLogo` | `className`, `title` (default `'AnimalOS'`) | Renders in `currentColor` — theme via a text colour class. Pass `title=""` for decorative use. |
| `RspcaLogo` | `className`, `title` (default `'RSPCA'`), `monochrome` (default `false`) | Fixed brand colours by default; `monochrome` renders in `currentColor`. |
| `BrandLockup` | `className` | AnimalOS wordmark + small RSPCA mark separated by a rule, for headers/footers. |

---

## Layout & app shell

### AppHeader (`@/components/layout/app-header`)

Sticky glassy top nav: AnimalOS wordmark, pill nav on desktop, collapsible menu on mobile, theme toggle. Requires react-router context.

| Prop | Type | Description |
|---|---|---|
| `items` | `NavItem[]` (`{ path: string; label: string }`) | Nav links; active state matched on exact pathname. |

### AppFooter (`@/components/layout/app-footer`)

Minimal footer with the RSPCA mark and copyright line. Only prop: `className`.

### CardLayout (`@/components/layouts/card-layout`)

Card with header (title + optional description) and content — used for authentication pages.

| Prop | Type | Description |
|---|---|---|
| `title` | `string` | Card title. |
| `description` | `string` | Optional subtitle. |
| `children` | `ReactNode` | Card body. |

### CenteredState (`@/components/CenteredState`)

Centres its `children` in a `min-h-[50vh]` flex box. No other props.

### StatusAlert (`@/components/alerts/status-alert`)

Inline alert for error/success/info messages. Renders nothing when `children` is empty, so it's safe to pass a possibly-empty message straight through.

| Prop | Type | Default | Description |
|---|---|---|---|
| `variant` | `'error' \| 'success' \| 'info'` | `'error'` | Picks the icon, colour and aria role (`alert` for error, `status` otherwise). |
| `children` | `ReactNode` | — | Message; `null`/empty → renders nothing. |

```tsx
<StatusAlert variant="error">{error?.message}</StatusAlert>
```

---

## UI primitives (`@/components/ui`)

shadcn/ui components — standard APIs; see [ui.shadcn.com](https://ui.shadcn.com/docs/components) for full docs. Ones with notable variants here:

### Button

`React.ComponentProps<'button'>` plus:

- `variant`: `default` (solid brand) · `outline` · `secondary` · `ghost` · `destructive` · `link`
- `size`: `default` · `xs` · `sm` · `lg` · `icon` · `icon-xs` · `icon-sm` · `icon-lg`
- `asChild`: render as the child element (e.g. wrap a `<Link>`)

### Badge

`variant`: `default` · `secondary` · `destructive` · `outline` · `ghost` · `link`, plus `asChild`. For record *status* prefer the brand `StatusBadge`.

### Alert

`variant`: `default` · `destructive`. Compose with `AlertTitle` / `AlertDescription`. Usually reached via `StatusAlert`.

### The rest

`avatar`, `breadcrumb`, `calendar`, `card` (Card/CardHeader/CardTitle/CardDescription/CardContent/CardFooter), `checkbox`, `collapsible`, `datePicker`, `dialog`, `dropdown-menu`, `field`, `input`, `label`, `pagination`, `popover`, `select`, `separator`, `skeleton`, `sonner` (toasts), `spinner`, `table`, `tabs` — stock shadcn APIs.

---

## Conventions

- **Icons** are [lucide-react](https://lucide.dev); components size them internally (`[&_svg]:size-*`), so pass the bare icon: `icon={<HeartIcon />}`.
- **Tones/variants** are defined with `cva`; when a component exports its variants (`statusBadgeVariants`, `metricCardIconVariants`, `buttonVariants`), reuse them rather than copying class strings.
- **Colours** come from tokens in `src/styles/global.css` (`--brand`, `--brand-deep`, `--brand-ink`, `--success`, `--warning`, `--destructive`) — never hardcode hex values in components.

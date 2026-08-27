import { cva, type VariantProps } from 'class-variance-authority';

import { Card, CardContent } from '@/components/ui/card';
import { Skeleton } from '@/components/ui/skeleton';
import { cn } from '@/lib/utils';

const metricCardIconVariants = cva(
  'flex size-10 shrink-0 items-center justify-center rounded-xl [&_svg]:size-5',
  {
    variants: {
      tone: {
        neutral: 'bg-muted text-muted-foreground',
        brand:
          'bg-gradient-to-br from-brand/15 to-brand-deep/10 text-brand-deep dark:text-brand',
        'green-soft': 'bg-brand/8 text-brand',
        green: 'bg-brand/18 text-brand-deep dark:text-brand',
        'green-deep': 'bg-brand-deep/18 text-brand-deep dark:text-brand',
        'green-solid': 'bg-brand-deep text-white dark:bg-brand dark:text-brand-ink',
        success: 'bg-success/12 text-success',
        warning: 'bg-warning/15 text-warning',
        danger: 'bg-destructive/10 text-destructive',
      },
    },
    defaultVariants: {
      tone: 'brand',
    },
  }
);

const metricCardValueVariants = cva(
  'text-3xl font-semibold tracking-tight',
  {
    variants: {
      tone: {
        neutral: 'text-foreground',
        brand: 'text-foreground',
        'green-soft': 'text-brand',
        green: 'text-brand-deep dark:text-brand',
        'green-deep': 'text-brand-ink dark:text-brand',
        'green-solid': 'text-brand-ink dark:text-foreground',
        success: 'text-success',
        warning: 'text-warning',
        danger: 'text-destructive',
      },
    },
    defaultVariants: {
      tone: 'brand',
    },
  }
);

interface MetricCardProps
  extends VariantProps<typeof metricCardIconVariants> {
  label: React.ReactNode;
  value?: React.ReactNode;
  /** Lucide icon rendered in a tinted square. */
  icon?: React.ReactNode;
  /** Supporting text below the value (e.g. "3 awaiting vet check"). */
  hint?: React.ReactNode;
  /** Show skeleton placeholders in place of the value and hint. */
  loading?: boolean;
  /** Error message shown in place of the value; takes precedence over `loading`. */
  error?: React.ReactNode;
  className?: string;
}

/**
 * Dashboard metric tile with a fixed semantic tone instead of a trend.
 * Use `tone` to colour the icon tile and value: `brand` (default) for
 * plain counts, the green ramp (`green-soft` → `green` → `green-deep` →
 * `green-solid`) to grade a row of tiles by emphasis, `success`/
 * `warning`/`danger` for metrics with a fixed meaning (e.g. overdue
 * tasks are always `danger`), `neutral` to mute.
 *
 * While `loading` the value and hint render as skeletons; when `error`
 * is set its message replaces the value (and wins over `loading`).
 */
export function MetricCard({
  label,
  value,
  icon,
  hint,
  loading = false,
  error,
  tone = 'brand',
  className,
}: MetricCardProps) {
  return (
    <Card
      className={cn(
        'py-5 transition-shadow duration-200 hover:shadow-md',
        className
      )}
    >
      <CardContent className="flex items-start justify-between gap-4 px-5">
        <div className="min-w-0 space-y-1.5">
          <p className="text-sm font-medium text-muted-foreground">{label}</p>
          {error ? (
            <p className="text-sm font-medium text-destructive">{error}</p>
          ) : loading ? (
            <>
              <Skeleton className="h-9 w-16" />
              {hint && <Skeleton className="h-4 w-28" />}
            </>
          ) : (
            <>
              <p className={metricCardValueVariants({ tone })}>{value}</p>
              {hint && <p className="text-xs text-muted-foreground">{hint}</p>}
            </>
          )}
        </div>
        {icon && (
          <div
            aria-hidden="true"
            className={metricCardIconVariants({ tone })}
          >
            {icon}
          </div>
        )}
      </CardContent>
    </Card>
  );
}

export { metricCardIconVariants };

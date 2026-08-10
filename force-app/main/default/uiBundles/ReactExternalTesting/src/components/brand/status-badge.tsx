import { cva, type VariantProps } from 'class-variance-authority';

import { cn } from '@/lib/utils';

const statusBadgeVariants = cva(
  'inline-flex w-fit shrink-0 items-center gap-1.5 rounded-full px-2.5 py-1 text-xs font-medium whitespace-nowrap',
  {
    variants: {
      tone: {
        neutral: 'bg-muted text-muted-foreground',
        info: 'bg-brand/12 text-brand-deep dark:text-brand',
        success: 'bg-success/12 text-success',
        warning: 'bg-warning/15 text-warning',
        danger: 'bg-destructive/10 text-destructive',
        brand: 'bg-brand text-white dark:text-primary-foreground',
      },
    },
    defaultVariants: {
      tone: 'neutral',
    },
  }
);

interface StatusBadgeProps
  extends React.ComponentProps<'span'>,
    VariantProps<typeof statusBadgeVariants> {
  /** Show a leading status dot. @default true */
  withDot?: boolean;
}

/**
 * Tonal status pill for record states (e.g. "In Care", "Available",
 * "Adopted", "Overdue"). Use `tone` to pick the semantic colour.
 */
export function StatusBadge({
  className,
  tone = 'neutral',
  withDot = true,
  children,
  ...props
}: StatusBadgeProps) {
  return (
    <span
      data-slot="status-badge"
      className={cn(statusBadgeVariants({ tone }), className)}
      {...props}
    >
      {withDot && (
        <span
          aria-hidden="true"
          className="size-1.5 shrink-0 rounded-full bg-current"
        />
      )}
      {children}
    </span>
  );
}

export { statusBadgeVariants };

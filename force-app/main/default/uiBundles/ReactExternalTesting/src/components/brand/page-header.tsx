import { cn } from '@/lib/utils';

interface PageHeaderProps {
  title: React.ReactNode;
  /** Small label rendered above the title (e.g. object or section name). */
  eyebrow?: React.ReactNode;
  description?: React.ReactNode;
  /** Right-aligned action buttons. */
  actions?: React.ReactNode;
  /** Extra content below the header row (e.g. breadcrumbs, tabs, filters). */
  children?: React.ReactNode;
  className?: string;
}

/**
 * Standard page heading block: eyebrow, title, description and actions.
 * Use at the top of every page for consistent hierarchy.
 */
export function PageHeader({
  title,
  eyebrow,
  description,
  actions,
  children,
  className,
}: PageHeaderProps) {
  return (
    <div className={cn('flex flex-col gap-4 pb-6', className)}>
      <div className="flex flex-col gap-4 sm:flex-row sm:items-start sm:justify-between">
        <div className="min-w-0 space-y-2">
          {eyebrow && (
            <p className="inline-flex items-center gap-1.5 rounded-full bg-brand/10 px-2.5 py-1 font-sans text-xs font-medium text-brand-deep dark:text-brand">
              <span
                aria-hidden="true"
                className="size-1.5 rounded-full bg-current"
              />
              {eyebrow}
            </p>
          )}
          <h1 className="text-4xl font-medium tracking-tight text-foreground">
            {title}
          </h1>
          {description && (
            <p className="max-w-prose text-sm text-muted-foreground sm:text-base">
              {description}
            </p>
          )}
        </div>
        {actions && (
          <div className="flex shrink-0 flex-wrap items-center gap-2">
            {actions}
          </div>
        )}
      </div>
      {children}
    </div>
  );
}

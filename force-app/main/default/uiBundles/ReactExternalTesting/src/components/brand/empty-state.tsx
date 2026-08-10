import { PawPrintIcon } from 'lucide-react';

import { cn } from '@/lib/utils';

interface EmptyStateProps {
  /** Lucide icon; defaults to a paw print. */
  icon?: React.ReactNode;
  title: React.ReactNode;
  description?: React.ReactNode;
  /** Call-to-action button(s). */
  action?: React.ReactNode;
  className?: string;
}

/**
 * Placeholder for empty lists and zero-result searches.
 */
export function EmptyState({
  icon,
  title,
  description,
  action,
  className,
}: EmptyStateProps) {
  return (
    <div
      className={cn(
        'flex flex-col items-center justify-center gap-3 rounded-2xl border border-dashed border-border/80 bg-card/50 px-6 py-14 text-center',
        className
      )}
    >
      <div
        aria-hidden="true"
        className="flex size-12 items-center justify-center rounded-2xl bg-gradient-to-br from-brand/15 to-brand-deep/10 text-brand-deep dark:text-brand [&_svg]:size-6"
      >
        {icon ?? <PawPrintIcon />}
      </div>
      <div className="space-y-1">
        <p className="text-sm font-semibold text-foreground">{title}</p>
        {description && (
          <p className="mx-auto max-w-sm text-sm text-muted-foreground">
            {description}
          </p>
        )}
      </div>
      {action && <div className="mt-1 flex items-center gap-2">{action}</div>}
    </div>
  );
}

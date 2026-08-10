import { cn } from '@/lib/utils';

interface SectionProps {
  title: React.ReactNode;
  description?: React.ReactNode;
  /** Right-aligned controls for the section (buttons, filters). */
  actions?: React.ReactNode;
  children: React.ReactNode;
  className?: string;
}

/**
 * Titled content section for grouping related content within a page.
 */
export function Section({
  title,
  description,
  actions,
  children,
  className,
}: SectionProps) {
  return (
    <section className={cn('space-y-4', className)}>
      <div className="flex flex-wrap items-end justify-between gap-2">
        <div className="min-w-0">
          <h2 className="text-2xl font-medium tracking-tight text-foreground">
            {title}
          </h2>
          {description && (
            <p className="text-sm text-muted-foreground">{description}</p>
          )}
        </div>
        {actions && (
          <div className="flex shrink-0 items-center gap-2">{actions}</div>
        )}
      </div>
      {children}
    </section>
  );
}

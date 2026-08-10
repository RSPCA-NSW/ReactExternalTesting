import { cn } from '@/lib/utils';

/**
 * Label/value pairs for record detail views.
 *
 * Usage:
 *   <DetailList>
 *     <DetailItem label="Name" value="Bella" />
 *     <DetailItem label="Status" value={<StatusBadge tone="success">Available</StatusBadge>} />
 *   </DetailList>
 */
export function DetailList({
  className,
  children,
  ...props
}: React.ComponentProps<'dl'>) {
  return (
    <dl className={cn('divide-y', className)} {...props}>
      {children}
    </dl>
  );
}

interface DetailItemProps {
  label: React.ReactNode;
  value: React.ReactNode;
  className?: string;
}

export function DetailItem({ label, value, className }: DetailItemProps) {
  return (
    <div
      className={cn(
        'grid grid-cols-1 gap-1 py-2.5 sm:grid-cols-[10rem_1fr] sm:gap-4',
        className
      )}
    >
      <dt className="text-sm font-medium text-muted-foreground">{label}</dt>
      <dd className="text-sm text-foreground">
        {value ?? <span className="text-muted-foreground">—</span>}
      </dd>
    </div>
  );
}

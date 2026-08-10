import { TrendingDownIcon, TrendingUpIcon } from 'lucide-react';

import { Card, CardContent } from '@/components/ui/card';
import { cn } from '@/lib/utils';

interface StatCardProps {
  label: React.ReactNode;
  value: React.ReactNode;
  /** Lucide icon rendered in a tinted square. */
  icon?: React.ReactNode;
  /** Change vs a previous period; sign drives the trend colour/arrow. */
  delta?: number;
  /** Context for the delta (e.g. "vs last month"). */
  deltaLabel?: React.ReactNode;
  className?: string;
}

/**
 * Dashboard metric tile: label, big value, optional icon and trend.
 */
export function StatCard({
  label,
  value,
  icon,
  delta,
  deltaLabel,
  className,
}: StatCardProps) {
  const trend =
    delta === undefined ? undefined : delta >= 0 ? 'up' : ('down' as const);

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
          <p className="text-3xl font-semibold tracking-tight text-foreground">
            {value}
          </p>
          {trend && (
            <p className="flex items-center gap-1 text-xs text-muted-foreground">
              <span
                className={cn(
                  'inline-flex items-center gap-0.5 font-medium',
                  trend === 'up' ? 'text-success' : 'text-destructive'
                )}
              >
                {trend === 'up' ? (
                  <TrendingUpIcon aria-hidden="true" className="size-3.5" />
                ) : (
                  <TrendingDownIcon aria-hidden="true" className="size-3.5" />
                )}
                {Math.abs(delta ?? 0)}%
              </span>
              {deltaLabel}
            </p>
          )}
        </div>
        {icon && (
          <div
            aria-hidden="true"
            className="flex size-10 shrink-0 items-center justify-center rounded-xl bg-gradient-to-br from-brand/15 to-brand-deep/10 text-brand-deep dark:text-brand [&_svg]:size-5"
          >
            {icon}
          </div>
        )}
      </CardContent>
    </Card>
  );
}

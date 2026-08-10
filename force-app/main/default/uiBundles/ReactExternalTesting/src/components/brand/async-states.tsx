import { AlertCircleIcon, RotateCcwIcon } from 'lucide-react';

import { PawLoader } from '@/components/brand/paw-loader';
import { Button } from '@/components/ui/button';
import { cn } from '@/lib/utils';

interface LoadingStateProps {
  /** Visible label under the spinner. @default "Loading…" */
  label?: React.ReactNode;
  className?: string;
}

/**
 * Centred loading placeholder for pages and panels while data fetches.
 */
export function LoadingState({
  label = 'Loading…',
  className,
}: LoadingStateProps) {
  return (
    <div
      role="status"
      className={cn(
        'flex flex-col items-center justify-center gap-3 py-16 text-muted-foreground',
        className
      )}
    >
      <PawLoader className="size-9" label="" />
      <p className="text-sm">{label}</p>
    </div>
  );
}

interface ErrorStateProps {
  title?: React.ReactNode;
  /** Detail message, e.g. the error from a data hook. */
  message?: React.ReactNode;
  /** Called when the user clicks "Try again"; button hidden if omitted. */
  onRetry?: () => void;
  className?: string;
}

/**
 * Centred error placeholder with an optional retry action.
 */
export function ErrorState({
  title = 'Something went wrong',
  message,
  onRetry,
  className,
}: ErrorStateProps) {
  return (
    <div
      role="alert"
      className={cn(
        'flex flex-col items-center justify-center gap-3 rounded-2xl border border-destructive/20 bg-destructive/5 px-6 py-14 text-center',
        className
      )}
    >
      <div
        aria-hidden="true"
        className="flex size-12 items-center justify-center rounded-full bg-destructive/10 text-destructive"
      >
        <AlertCircleIcon className="size-6" />
      </div>
      <div className="space-y-1">
        <p className="text-sm font-semibold text-foreground">{title}</p>
        {message && (
          <p className="mx-auto max-w-sm text-sm text-muted-foreground">
            {message}
          </p>
        )}
      </div>
      {onRetry && (
        <Button variant="outline" size="sm" onClick={onRetry} className="mt-1">
          <RotateCcwIcon aria-hidden="true" />
          Try again
        </Button>
      )}
    </div>
  );
}

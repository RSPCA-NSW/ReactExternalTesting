import { RspcaLogo } from '@/components/brand';
import { cn } from '@/lib/utils';

/**
 * Minimal footer with the RSPCA mark and copyright line.
 */
export function AppFooter({ className }: { className?: string }) {
  return (
    <footer className={cn('border-t border-border/60', className)}>
      <div className="mx-auto flex max-w-7xl flex-col items-center justify-between gap-3 px-4 py-8 sm:flex-row sm:px-6 lg:px-8">
        <RspcaLogo className="h-5 opacity-80 transition-opacity hover:opacity-100" />
        <p className="text-xs text-muted-foreground">
          AnimalOS — RSPCA NSW © {new Date().getFullYear()}
        </p>
      </div>
    </footer>
  );
}

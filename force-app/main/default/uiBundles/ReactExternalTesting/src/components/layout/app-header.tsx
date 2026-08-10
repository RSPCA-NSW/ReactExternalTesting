import { useState } from 'react';
import { Link, useLocation } from 'react-router';
import { MenuIcon, XIcon } from 'lucide-react';

import { AnimalOsLogo, ThemeToggle } from '@/components/brand';
import { Button } from '@/components/ui/button';
import { cn } from '@/lib/utils';

export interface NavItem {
  path: string;
  label: string;
}

interface AppHeaderProps {
  items: NavItem[];
  className?: string;
}

/**
 * Glassy top navigation: AnimalOS wordmark, pill nav on desktop,
 * collapsible menu on mobile, theme toggle.
 */
export function AppHeader({ items, className }: AppHeaderProps) {
  const [isOpen, setIsOpen] = useState(false);
  const location = useLocation();

  const isActive = (path: string) => location.pathname === path;

  const linkClasses = (active: boolean) =>
    cn(
      'rounded-full px-3.5 py-1.5 text-sm transition-colors',
      active
        ? 'bg-muted font-medium text-foreground'
        : 'text-muted-foreground hover:text-foreground'
    );

  return (
    <header
      className={cn(
        'sticky top-0 z-40 border-b border-border/60 bg-background/70 backdrop-blur-xl',
        className
      )}
    >
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div className="flex h-14 items-center justify-between gap-4">
          <Link
            to="/"
            className="shrink-0 rounded-md focus-visible:ring-3 focus-visible:ring-ring/50 outline-none"
            aria-label="AnimalOS home"
          >
            <AnimalOsLogo className="h-6 text-foreground" />
          </Link>

          <nav
            aria-label="Primary"
            className="hidden items-center gap-0.5 md:flex"
          >
            {items.map((item) => (
              <Link
                key={item.path}
                to={item.path}
                aria-current={isActive(item.path) ? 'page' : undefined}
                className={linkClasses(isActive(item.path))}
              >
                {item.label}
              </Link>
            ))}
          </nav>

          <div className="flex items-center gap-1">
            <ThemeToggle />
            <Button
              variant="ghost"
              size="icon"
              className="md:hidden"
              onClick={() => setIsOpen(!isOpen)}
              aria-expanded={isOpen}
              aria-label="Toggle menu"
            >
              {isOpen ? (
                <XIcon aria-hidden="true" />
              ) : (
                <MenuIcon aria-hidden="true" />
              )}
            </Button>
          </div>
        </div>

        {isOpen && (
          <nav
            aria-label="Primary"
            className="flex flex-col gap-1 pb-4 md:hidden"
          >
            {items.map((item) => (
              <Link
                key={item.path}
                to={item.path}
                onClick={() => setIsOpen(false)}
                aria-current={isActive(item.path) ? 'page' : undefined}
                className={cn(
                  'rounded-lg px-3 py-2 text-sm transition-colors',
                  isActive(item.path)
                    ? 'bg-muted font-medium text-foreground'
                    : 'text-muted-foreground hover:bg-muted/60 hover:text-foreground'
                )}
              >
                {item.label}
              </Link>
            ))}
          </nav>
        )}
      </div>
    </header>
  );
}

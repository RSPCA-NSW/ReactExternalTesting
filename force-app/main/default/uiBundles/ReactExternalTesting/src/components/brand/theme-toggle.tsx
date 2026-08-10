import { useEffect, useState } from 'react';
import { MoonIcon, SunIcon } from 'lucide-react';

import { Button } from '@/components/ui/button';

const STORAGE_KEY = 'animalos-theme';

function applyTheme(dark: boolean) {
  document.documentElement.classList.toggle('dark', dark);
}

/**
 * Light/dark mode switch. Persists the choice and applies the `dark`
 * class to the document root (matching the `@custom-variant dark`).
 */
export function ThemeToggle({ className }: { className?: string }) {
  const [dark, setDark] = useState(
    () =>
      typeof document !== 'undefined' &&
      document.documentElement.classList.contains('dark')
  );

  useEffect(() => {
    const stored = localStorage.getItem(STORAGE_KEY);
    if (stored !== null) {
      const isDark = stored === 'dark';
      setDark(isDark);
      applyTheme(isDark);
    }
  }, []);

  const toggle = () => {
    const next = !dark;
    setDark(next);
    applyTheme(next);
    localStorage.setItem(STORAGE_KEY, next ? 'dark' : 'light');
  };

  return (
    <Button
      variant="ghost"
      size="icon"
      onClick={toggle}
      aria-label={dark ? 'Switch to light mode' : 'Switch to dark mode'}
      className={className}
    >
      {dark ? <SunIcon aria-hidden="true" /> : <MoonIcon aria-hidden="true" />}
    </Button>
  );
}

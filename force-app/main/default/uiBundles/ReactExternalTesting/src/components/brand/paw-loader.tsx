import { cn } from '@/lib/utils';

/**
 * Outline paw glyph — same geometry as lucide's PawPrint (used by
 * EmptyState), duplicated here so each subpath can carry
 * pathLength/dash attributes for the drawing animation.
 */
const PAW_PARTS = [
  { type: 'circle' as const, cx: 11, cy: 4, r: 2 },
  { type: 'circle' as const, cx: 18, cy: 8, r: 2 },
  { type: 'circle' as const, cx: 20, cy: 16, r: 2 },
  {
    type: 'path' as const,
    d: 'M9 10a5 5 0 0 1 5 5v3.5a3.5 3.5 0 0 1-6.84 1.045Q6.52 17.48 4.46 16.84A3.5 3.5 0 0 1 5.5 10Z',
  },
];

function PawOutline({ animated }: { animated?: boolean }) {
  return (
    <g
      className={
        animated ? 'animate-paw-draw motion-reduce:animate-none' : undefined
      }
    >
      {PAW_PARTS.map((part, i) =>
        part.type === 'circle' ? (
          <circle
            key={i}
            cx={part.cx}
            cy={part.cy}
            r={part.r}
            pathLength={100}
            strokeDasharray={animated ? 100 : undefined}
          />
        ) : (
          <path
            key={i}
            d={part.d}
            pathLength={100}
            strokeDasharray={animated ? 100 : undefined}
          />
        )
      )}
    </g>
  );
}

interface PawLoaderProps extends React.ComponentProps<'span'> {
  /**
   * Accessible label. Pass an empty string when a parent element already
   * announces loading — the paw becomes decorative. @default "Loading"
   */
  label?: string;
}

/**
 * Branded loading indicator: the outline paw print draws itself in and
 * back out, as if traced by a pen. Size and colour via className
 * (defaults to size-8 text-brand). Falls back to a static outline when
 * the user prefers reduced motion.
 */
export function PawLoader({
  className,
  label = 'Loading',
  ...props
}: PawLoaderProps) {
  const decorative = label === '';

  return (
    <span
      role={decorative ? undefined : 'status'}
      aria-label={decorative ? undefined : label}
      aria-hidden={decorative || undefined}
      className={cn('relative inline-block size-8 text-brand', className)}
      {...props}
    >
      <svg
        viewBox="0 0 24 24"
        fill="none"
        stroke="currentColor"
        strokeWidth={2}
        strokeLinecap="round"
        strokeLinejoin="round"
        aria-hidden="true"
        className="absolute inset-0 size-full"
      >
        {/* faint track so the shape stays readable mid-animation */}
        <g className="opacity-15">
          <PawOutline />
        </g>
        <PawOutline animated />
      </svg>
    </span>
  );
}

import { Link } from 'react-router';
import { Button } from '@/components/ui/button';
import { EmptyState } from '@/components/brand';

export default function NotFound() {
  return (
    <div className="mx-auto w-full max-w-7xl px-4 py-12 sm:px-6 lg:px-8">
      <EmptyState
        title="Page not found"
        description="The page you're looking for doesn't exist or has moved."
        action={
          <Button asChild>
            <Link to="/">Go to Home</Link>
          </Button>
        }
      />
    </div>
  );
}

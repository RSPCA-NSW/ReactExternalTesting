import { useEffect, useState } from 'react';
import { fetchFosterAnimals } from "@/api/foster/fosterService";

export function useFosterAnimals(locations: any[]) {
  const [animals, setAnimals] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const ids = locations.map(l => l.node.Id);
  const idKey = ids.join(',');

  useEffect(() => {
    if (ids.length === 0) {
      setLoading(false);
      return;
    }

    let cancelled = false;
    setLoading(true);
    setError(null);

    fetchFosterAnimals(ids)
      .then(result => {
        if (!cancelled) setAnimals(result?.edges ?? []);
      })
      .catch(err => {
        if (!cancelled) setError(err.message);
      })
      .finally(() => {
        if (!cancelled) setLoading(false);
      });

    return () => { cancelled = true; };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [idKey]);

  return { animals, loading, error };
}
import { useState, useEffect } from 'react';
export function useAlerts(targetIds: string[]) {
  const [alertsByTarget, setAlertsByTarget] = useState<Record<string, AlertEdge[]>>({});
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const idKey = targetIds.join(',');

  useEffect(() => {
    if (targetIds.length === 0) {
      setAlertsByTarget({});
      return;
    }

    let cancelled = false;
    setLoading(true);
    setError(null);

    fetchAlerts(targetIds)
      .then(result => {
        if (cancelled) return;
        const grouped = (result?.edges ?? []).reduce((acc, a) => {
          const key = a.node.Target_Record__c?.value;
          if (key) (acc[key] ??= []).push(a);
          return acc;
        }, {} as Record<string, AlertEdge[]>);
        setAlertsByTarget(grouped);
      })
      .catch(err => { if (!cancelled) setError(err.message); })
      .finally(() => { if (!cancelled) setLoading(false); });

    return () => { cancelled = true; };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [idKey]);

  return { alertsByTarget, loading, error };
}
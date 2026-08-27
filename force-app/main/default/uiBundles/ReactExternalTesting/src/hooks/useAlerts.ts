import { useState, useEffect } from 'react';
import { fetchAlerts, type AlertEdge } from '@/api/alerts/alertService';

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

                const grouped: Record<string, AlertEdge[]> = {};

                for (const a of result?.edges ?? []) {  
                    if(!a) continue;                                      
                    if (!a.node) continue;

                    const animalId = a.node.animalos__Target_Record_Id__c?.value;
                    if(!animalId)continue; 

                    if(!grouped[animalId]) {
                        grouped[animalId] = [];
                    }
                    grouped[animalId].push(a);
                }

                setAlertsByTarget(grouped);
            })
            .catch(err => { if (!cancelled) setError(err.message); })
            .finally(() => { if (!cancelled) setLoading(false); });

        return () => { cancelled = true; };
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [idKey]);

    return { alertsByTarget, loading, error };
}
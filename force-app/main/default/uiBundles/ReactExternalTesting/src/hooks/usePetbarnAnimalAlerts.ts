import { useState, useEffect } from 'react';
import { fetchPetbarnAnimalAlerts } from '@/api/petbarn/petbarnService';

export function usePetbarnAnimalAlerts(animals: any[]) {
    const [alerts, setAlert] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);


    const ids = animals.map(a => a.node.Id);
    const idKey = ids.join(',');

    useEffect(() => {
        if (ids.length === 0) {
            setLoading(false)
            return;
        }
        let cancelled = false;
        setLoading(true);
        setError(null);

        fetchPetbarnAnimalAlerts(ids)
            .then (result => {
            if(!cancelled) setAlert(result?.edges ?? []);
        })
            .catch(err => {
            if(!cancelled) setError(err.message);
        })
            .finally(() => {
            if(!cancelled) setLoading(false);
        })


    return () => { cancelled = true; };
    },[idKey]);


return { alerts, error, loading };
}










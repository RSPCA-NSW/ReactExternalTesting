import { useState, useEffect } from 'react';
import { fetchPetbarnAnimals } from '@/api/petbarn/petbarnService';

export function usePetbarnAnimals(locations: any[]){
    const [animals, setAnimals] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<String | null>(null);

    const ids = locations.map(l => l.node.Id);
    const idKey = ids.join(',');

    useEffect (() =>{
        if (ids.length === 0){
            setLoading(false)
            return;
        }
    let cancelled = false;
    setLoading(true);
    setError(null);

    fetchPetbarnAnimals(ids) 
        .then (result => {
            if(!cancelled) setAnimals(result?.edges ?? []);
        })
        .catch (err => {
            if(!cancelled) setError(err.message);

        })
        .finally(() => {
            if(!cancelled) setLoading(false);
        })
    
    
        return () => {cancelled = true; };
    }, [idKey]);

    return { animals, loading, error };


}
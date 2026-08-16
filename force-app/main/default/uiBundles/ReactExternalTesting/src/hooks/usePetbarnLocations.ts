import { useState, useEffect } from 'react';
import { fetchPetbarnLocations } from '@/api/petbarn/petbarnService';

export function usePetbarnLocations(){
    const [locations, setLocations] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<String | null>(null);

    useEffect (() => {
        let cancelled = false;

        fetchPetbarnLocations()
        .then (result => {
            if(!cancelled) setLocations(result?.edges ?? [])                
        })
        .catch(err =>{
            if(!cancelled) setError(err.message);
        })
        .finally(()=> {
            if(!cancelled) setLoading(false);
        })
    return () => {cancelled = true; };
    }, []);

    return { locations, loading, error };

}
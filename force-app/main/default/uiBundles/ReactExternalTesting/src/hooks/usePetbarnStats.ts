import { fetchPetbarnStats, PetbarnStats }  from '@/api/petbarnStatsService';
import { useState, useEffect } from 'react';



export function usePetbarnStats(location: any){
    const [stats, setStats] = useState<PetbarnStats | null>(null);
    const [statsLoading, setStatsLoading] = useState(true);
    const [statsError, setStatsError] = useState<String | null>(null);

    const idKey = location.join(',')
    useEffect (() =>{
        if (location.length === 0){
            setStatsLoading(false)
            return;
        }

    
    

    let cancelled = false;
    setStatsLoading(true);
    setStatsError(null);

    fetchPetbarnStats(location)
        .then(result => {
            if(!cancelled) setStats(result);
        })
        .catch(error =>{
            if(!cancelled) setStatsError(error.message);
        })
        .finally(() => {
            if(!cancelled) setStatsLoading(false);
        })
    return () => {cancelled = true; };
    
    }, [idKey]);

    return {stats, statsLoading, statsError};


    }




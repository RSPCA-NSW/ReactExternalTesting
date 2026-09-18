import { useState, useEffect } from 'react';
import { fetchPetbarnStats, type SelectOptions, type PetbarnStats } from '@/api/petbarnStatsService';



export function usePetbarnStats(location: any){
    const [stats, setStats] = useState<PetbarnStats | null>(null);
    const [statsLoading, setStatsLoading] = useState(true);
    const [statsError, setStatsError] = useState<String | null>(null);
    const [options, setOptions] = useState<SelectOptions | null>(null);

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
            if(cancelled) return; 
            setStats(result.stats);
            setOptions(result.options)
        })
        .catch(error =>{
            if(!cancelled) setStatsError(error.message);
        })
        .finally(() => {
            if(!cancelled) setStatsLoading(false);
        })
    return () => {cancelled = true; };
    
    }, [idKey]);

    return {stats, options, statsLoading, statsError};


    }




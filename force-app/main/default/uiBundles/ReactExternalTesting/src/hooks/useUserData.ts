import { useState, useEffect } from 'react';
import { fetchUserData,  } from '@/api/user/userService';

export function useUserData(){
    const [user, setUser] = useState<any>(null);
    const [userLoading, setUserLoading] = useState(true);
    const [userError, setUserError] = useState<String | null>(null);

    useEffect (() => {
        let cancelled = false;

        fetchUserData()
        .then (result => {
            if(!cancelled) setUser(result)                
        })
        .catch(err =>{
            if(!cancelled) setUserError(err.message);
        })
        .finally(()=> {
            if(!cancelled) setUserLoading(false);
        })
    return () => {cancelled = true; };
    }, []);

    return { user,userLoading, userError };

}















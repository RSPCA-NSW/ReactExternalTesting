import { usePetbarnAnimals } from "./usePetbarnAnimals";
import { usePetbarnLocations } from "./usePetbarnLocations";


export function usePetbarnHome() {
    const locations = usePetbarnLocations();
    const animals = usePetbarnAnimals(locations.locations);


      console.log('locations:', locations.locations, 'animals:', animals.animals)


    return{
        animals: animals.animals,
        alerts: alerts.alerts,
        loading: locations.loading || animals.loading,
        error: locations.error ?? animals.error,

    };
}
import { usePetbarnAnimals } from "./usePetbarnAnimals";
import { usePetbarnLocations } from "./usePetbarnLocations";



export function usePetbarnHome() {
    const locations = usePetbarnLocations();
    const animals = usePetbarnAnimals(locations.locations);


    return{
        animals: animals.animals,
        locations: locations.locations,
        loading: locations.loading || animals.loading,
        error: locations.error ?? animals.error 

    };
}
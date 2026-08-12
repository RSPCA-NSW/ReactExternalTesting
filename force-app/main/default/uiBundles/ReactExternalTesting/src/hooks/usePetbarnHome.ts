import { usePetbarnAnimals } from "./usePetbarnAnimals";
import { usePetbarnLocations } from "./usePetabarnLocations";

export function usePetbarnHome() {
    const locations = usePetbarnLocations();
    const animals = usePetbarnAnimals(locations.locations);

    return{
        animals: animals.animals,
        loading: locations.loading || null,
        error: locations.error ?? animals.error,

    };
}
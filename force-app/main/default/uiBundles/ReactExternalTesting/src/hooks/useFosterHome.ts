import { useFosterAnimals } from "./useFosterAnimals";
import { useFosterlocations } from "./useFosterLocations";

export function useFosterHome() {
  const loc = useFosterlocations();
  const animals = useFosterAnimals(loc.locations);


  return {
    animals: animals.animals,
    loading: loc.loading || animals.loading,
    error: loc.error ?? animals.error,
  };
}
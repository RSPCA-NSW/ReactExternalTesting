import FOSTER_LOCATIONS_QUERY from "./query/fosterLocations.graphql?raw";
import FOSTER_ANIMALS_QUERY from "./query/fosterAnimals.graphql?raw";
import { executeGraphQL } from "../graphqlClient";
import type {
  FosterLocationsQuery,
  FosterAnimalsQuery,
  FosterAnimalsQueryVariables,
} from "../graphql-operations-types";

export async function fetchFosterLocations() {
  const data = await executeGraphQL<FosterLocationsQuery, never>(FOSTER_LOCATIONS_QUERY);
  return data.uiapi.query.animalos__Location__c;
}

export async function fetchFosterAnimals(unitIds: string[]) {
  const data = await executeGraphQL<FosterAnimalsQuery, FosterAnimalsQueryVariables>(
    FOSTER_ANIMALS_QUERY,
    { unitIds }
  );
  return data.uiapi.query.animalos__Animal__c;
}
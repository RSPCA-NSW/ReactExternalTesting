import PETBARN_LOCATIONS_QUERY from "./query/petbarnLocations.graphql?raw";
import PETBARN_ANIMALS_QUERY from "./query/petbarnAnimals.graphql?raw"; 

import { executeGraphQL } from "../graphqlClient";

import type {
    PetbarnLocationsQuery,
    PetbarnAnimalsQuery,
    PetbarnAnimalsQueryVariables,
} from "../graphql-operations-types";

export async function fetchPetbarnLocations() {
    const data = await executeGraphQL<PetbarnLocationsQuery, never>(PETBARN_LOCATIONS_QUERY);
    return data.uiapi.query.animalos__Location__c;
}

export async function fetchPetbarnAnimals(locationIds: string[]) {
    const data = await executeGraphQL<PetbarnAnimalsQuery, PetbarnAnimalsQueryVariables>(
     PETBARN_ANIMALS_QUERY,
        { locationIds }
    );
    return data.uiapi.query.animalos__Animal__c;
}
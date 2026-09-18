import PETBARN_LOCATIONS_QUERY from "./query/petbarnLocations.graphql?raw";
import PETBARN_ANIMALS_QUERY from "./query/petbarnAnimals.graphql?raw";
import ALERTS_QUERY from "../alerts/query/Alerts.graphql?raw"; 

import { executeGraphQL } from "../graphqlClient";

import {
    PetbarnLocationsQuery,
    PetbarnAnimalsQuery,
    PetbarnAnimalsQueryVariables,
    AlertsQuery,
    AlertsQueryVariables,

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

export async function fetchPetbarnAnimalAlerts(ids: string[]) {
    const data = await executeGraphQL<AlertsQuery, AlertsQueryVariables>(
       ALERTS_QUERY,
        { ids }
    );
    return data.uiapi.query.animalos__Alert__c;
}
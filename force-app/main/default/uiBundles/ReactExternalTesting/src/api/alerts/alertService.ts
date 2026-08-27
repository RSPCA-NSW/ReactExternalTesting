import ALERTS_QUERY from "./query/Alerts.graphql?raw";
import { executeGraphQL } from "../graphqlClient";
import {
    AlertsQuery,
    AlertsQueryVariables,
} from "../graphql-operations-types"


export type AlertEdge = {
  node?: {
    Id: string;
    animalos__Message_Formatted__c?: { value?: string | null } | null;
    animalos__Variant__c?: { value?: string | null } | null;
    animalos__Target_Record_Id__c?: { value?: string | null } | null;
  } | null;
};


export async function fetchAlerts(ids: string[]) {
  const data = await executeGraphQL<AlertsQuery, AlertsQueryVariables>(
    ALERTS_QUERY,
    { ids }
  );
  return data.uiapi.query.animalos__Alert__c;
}
import USER_QUERY from "./query/userQuery.graphql?raw";
import { executeGraphQL } from "../graphqlClient";

import {
    GetCurrentUserQuery
} from "../graphql-operations-types"



export async function fetchUserData(){
    const data = await executeGraphQL<GetCurrentUserQuery,never>(USER_QUERY);
    return data.uiapi.currentUser;

}



import { fetchProcessor } from "./apexClient";

export interface PetbarnStats {
    adoptionCount: number;
    animalCount: number;
}

export async function fetchPetbarnStats(locationId: any[]): Promise<PetbarnStats> {
    const response = await fetchProcessor<any>(
        'PetbarnHomeMetaProc',
        { locationId }
    );
    return response.dto.stats;

}
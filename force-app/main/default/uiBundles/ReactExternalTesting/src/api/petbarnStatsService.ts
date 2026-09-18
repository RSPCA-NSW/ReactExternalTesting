import { fetchProcessor } from "./apexClient";

export type SelectOption = { value: string; label: string };
export type SelectOptions = Record<string, SelectOption[]>;

export type PetbarnStats = {
    adoptionCount: number;
    animalCount: number;
    adoptionsByUserCount: number;
}

export type PetbarnHomeData = {
    stats: PetbarnStats;
    options: SelectOptions;
}



export async function fetchPetbarnStats(locationId: any[]): Promise<PetbarnHomeData> {
    const envelope = await fetchProcessor<any>(
        'PetbarnHomeMetaProc',
        { locationId }
    );

    return {
        stats: envelope.dto.stats,
        options: envelope.selectOptions,
    };
}
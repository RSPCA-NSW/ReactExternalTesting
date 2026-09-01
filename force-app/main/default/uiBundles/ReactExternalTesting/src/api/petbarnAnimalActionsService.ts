import { fetchProcessor } from '@/api/apexClient';

export type LogWeightResult = {
  animalActionId: string;
  currentWeight: number;
};

export async function logWeight(
  animalId: string,
  weightKg: number,
  loggedAt?: string
): Promise<LogWeightResult> {
  const envelope = await fetchProcessor<any>('PetbarnLogWeightProc', {
    animalId,
    weightKg,
    loggedAt
  });
  return envelope.dto.result; 
}
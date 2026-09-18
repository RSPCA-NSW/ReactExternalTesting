import { fetchProcessor } from '@/api/apexClient';

export type LogWeightResult = {
  animalActionId: string;
  currentWeight: number;
};

export type DailyActionsResult = {
  animalActionId: string;
};

export type DailyActionsInput = {
  eat: string;
  drink: string;
  urine: string;
  faecalScore: number;
  vasScore: string | null;
  loggedAt: string | null;
  comments: string;
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



/**
 * Submits a Daily Observation for one animal. The observation fields are
 * spread onto the top level of the request because PetbarnDailyActionsProc
 * reads them with flat getters (request.getString('eat'), etc).
 */
export async function dailyActions(
  animalId: string,
  obs: DailyActionsInput
): Promise<DailyActionsResult> {
  const envelope = await fetchProcessor<any>('PetbarnDailyActionsProc', {
    animalId,
    ...obs
  });
  return envelope.dto.result;
}

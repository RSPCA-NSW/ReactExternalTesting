import { fetchProcessor } from '@/api/apexClient';

export type LogWeightResult = {
  animalActionId: string;
  currentWeight: number;
};

export type dailyActionsResult = {
    animalActionId: string;
}

export type DailyActionsInput = {
  eat: boolean;
  drink: boolean;
  urine: boolean;
  faecalScore: number;
  loggedAt: string;
  comments: string
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

export async function dailyActions(
    animalId: string, obs: DailyActionsInput

): Promise<dailyActionsResult>{
      
  const envelope = await fetchProcessor<any>('petbarnDailyActionsProc',{
        animalId,
        obs

    });
    return envelope.dto.result;
}
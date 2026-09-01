/**
 * Logs a weight for one animal: creates a Weight-type Animal_Action and
 * updates the animal's current weight. Both writes happen in one
 * transaction - aos_CommonCtrl holds the savepoint, so throwing anywhere
 * in here rolls the whole thing back.
 */

public without sharing class PetbarnLogWeightProc extends aos_AbstractProcessor {

    private static final String WEIGHT_RT = 'Weigh_In';
    private static final Decimal MAX_SANE_KG = 200;

    public override aos_Response process(aos_Request request) {
        this.request = request == null ? new aos_Request() : request;
        this.logWeight();
        return this.response;
    }

    private void logWeight() {

        // --- read + validate -------------------------------------------
        String animalId = this.request.getRequiredString(
            'animalId', 'No animal was supplied.'
        );
        Decimal weightKg = this.request.getDecimal('weightKg');
        Decimal weightRound = weightKg.setScale(2);
        String loggedAtRaw = this.request.getString('loggedAt');

        this.validateWeight(weightKg);

        Datetime loggedAt = String.isBlank(loggedAtRaw)
            ? Datetime.now()
            : (Datetime) JSON.deserialize('"' + loggedAtRaw + '"', Datetime.class);

        // --- build ------------------------------------------------------
        Id weightRtId = Schema.SObjectType.animalos__Animal_Action__c
            .getRecordTypeInfosByDeveloperName()
            .get(WEIGHT_RT)
            .getRecordTypeId();

        animalos__Animal__c animal = new animalos__Animal__c(
            Id = animalId,
            animalos__Current_Weight__c = weightKg
        );

        animalos__Animal_Action__c action = new animalos__Animal_Action__c(
            RecordTypeId = weightRtId,
            animalos__Animal__c = animalId,
            animalos__Weight_KG__c = weightRound,
            animalos__Date_Time_Action_Completed__c = loggedAt,
            animalos__Date_Time_of_Action__c = loggedAt,
            animalos__Action_Status__c = 'given'

        );

        // --- commit, parents first --------------------------------------
        aos_UnitOfWork uow = new aos_UnitOfWork(new List<SObjectType>{
            animalos__Animal__c.SObjectType,
            animalos__Animal_Action__c.SObjectType
        });

        uow.registerUpsert(animal);
        uow.registerUpsert(action); 
        uow.commitWork();

        // --- respond ----------------------------------------------------
        this.response.put('result', new Map<String, Object>{
            'animalActionId' => action.Id,
            'currentWeight'  => weightKg
        });
    }

    private void validateWeight(Decimal weightRound) {
        if (weightRound == 0) {
            throw new aos_Structs.CommonException(
                'Enter a weight greater than zero.');
        }
        if (weightRound > MAX_SANE_KG) {
            throw new aos_Structs.CommonException(
                'That weight looks too high. Please check and try again.');
        }
    }
}
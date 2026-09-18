/**
 * Records a Daily Observation for one animal: finds the animal's most recent
 * Daily_Observation Animal_Action and marks it Given with the observation
 * values from the Petbarn portal. Implements IRollbackable so aos_CommonCtrl
 * wraps the DML in a savepoint.
 *
 * Request keys (flat): animalId, eat, drink, urine, faecalScore, vasScore,
 * loggedAt (yyyy-MM-dd or ISO datetime), comments.
 */
public without sharing class PetbarnDailyActionsProc extends aos_AbstractProcessor implements aos_Structs.IRollbackable {

    private static final String DAILYOBS_RT = 'Daily_Observation';

    public override aos_Response process(aos_Request request) {
        this.request = request == null ? new aos_Request() : request;
        this.dailyActions();
        return this.response;
    }

    private void dailyActions(){

        // --- read -------------------------------------------------------
        String animalId = this.request.getRequiredString(
            'animalId', 'no Animal Id was supplied.'
        );

        String urine = this.request.getString('urine');
        String drink = this.request.getString('drink');
        String eat = this.request.getString('eat');

        Integer faecalScore = this.request.getInteger('faecalScore');
        String faecalScoreFormatted = faecalScore == null ? null : String.valueOf(faecalScore);

        String vasScore = this.request.getString('vasScore');
        String loggedAtRaw = this.request.getString('loggedAt');
        String comments = this.request.getString('comments');

        Datetime loggedAt = String.isBlank(loggedAtRaw)
            ? Datetime.now()
            : (Datetime) JSON.deserialize('"' + loggedAtRaw + '"', Datetime.class);

        // --- find the open Daily Observation action ---------------------
        Id dailyObsRtId = Schema.SObjectType.animalos__Animal_Action__c
            .getRecordTypeInfosByDeveloperName()
            .get(DAILYOBS_RT)
            .getRecordTypeId();

        List<animalos__Animal_Action__c> dailyActions = [
            SELECT Id, animalos__Action_Status__c, Eat__c, Drink__c, Urine__c,
                   Feacal_Scoring__c, Daily_Summary__c, Distress_in_Shelter_Score_VAS__c,
                   animalos__Date_Time_Action_Completed__c
            FROM animalos__Animal_Action__c
            WHERE animalos__Animal__c = :animalId
            AND RecordTypeId = :dailyObsRtId
            WITH USER_MODE
            ORDER BY CreatedDate DESC
            LIMIT 1
        ];

        animalos__Animal_Action__c action = (animalos__Animal_Action__c) aos_Utils.arrays.firstOrException(
            dailyActions,
            'No Daily Observation action found for this animal.',
            aos_Structs.NotFoundException.class
        );

        // --- update -----------------------------------------------------
        action.animalos__Action_Status__c = 'Given';
        action.Eat__c = eat;
        action.Drink__c = drink;
        action.Urine__c = urine;
        action.Feacal_Scoring__c = faecalScoreFormatted;
        action.Daily_Summary__c = comments;
        action.animalos__Date_Time_Action_Completed__c = loggedAt;

        if (String.isNotBlank(vasScore)) {
            action.Distress_in_Shelter_Score_VAS__c = vasScore;
        }

        aos_UnitOfWork uow = new aos_UnitOfWork(new List<SObjectType>{
            animalos__Animal_Action__c.SObjectType
        });

        uow.registerUpsert(action);
        uow.commitWork();

        // --- respond ----------------------------------------------------
        this.response.put('result', new Map<String, Object> {
            'animalActionId' => action.Id
        });
    }
}

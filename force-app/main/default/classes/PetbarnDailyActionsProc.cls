public without sharing class PetbarnDailyActionsProc extends aos_AbstractProcessor {

    private static final String DAILYOBS_RT = 'Daily_Observation';
    private static final List<Integer> FAECAL_SCORES = new Integer[]{1, 2, 3, 4, 5, 6, 7};

    public override aos_Response process(aos_Request request) {
        this.request = request == null ? new aos_Request() : request;
        this.dailyActions();
        return this.response;
    }

    private void dailyActions(){

        String animalId = this.request.getRequiredString(
            'animalId', 'no Animal Id was supplied.'
        );
        
        Boolean isUrine = this.request.getBoolean('urine');
        String urine = isUrine ? 'Yes' : 'No';
        
        Boolean isDrink = this.request.getBoolean('drink');
        String drink = isDrink ? 'Yes' : 'No';

        Boolean isEat = this.request.getBoolean('eat');        
        String eat = isEat ? 'Yes' : 'No';
        
        
        Integer faecalScore = this.request.getInteger('faecalScore');
        this.validateScore(faecalScore);
        String fsFormatted = String.valueOf(faecalScore);
        
        
        String loggedAtRaw = this.request.getString('loggedAt');
        String comments =  this.request.getString('comments');

        
        
    
        Datetime loggedAt = String.isBlank(loggedAtRaw)
        ? Datetime.now()
        : (Datetime) JSON.deserialize('"' + loggedAtRaw + '"', Datetime.class);



        Id dailyObsRtId = Schema.SObjectType.animalos__Animal_Action__c
            .getRecordTypeInfosByDeveloperName()
            .get(DAILYOBS_RT)
            .getRecordTypeId();
        
        List<animalos__Animal_Action__c> dailyActions = [
            SELECT Id, animalos__Action_Status__c, Eat__c, Drink__c, Urine__c, Feacal_Scoring__c, Daily_Summary__c
            FROM animalos__Animal_Action__c
            WHERE animalos__Animal__c = :animalId 
            AND recordTypeId = :dailyObsRtId
            WITH USER_MODE
            ORDER BY createdDate DESC
            LIMIT 1            
        ];

        animalos__Animal_Action__c action = (animalos__Animal_Action__c) aos_Utils.arrays.firstOrException(
            dailyActions,
            'No Actions Found',
            aos_Structs.NotFoundException.class
        );


        action.animalos__Action_Status__c = 'Given';   
        action.Eat__c = eat;
        action.Drink__c = drink;
        action.Urine__c = urine;
        action.Feacal_Scoring__c = fsFormatted;
        action.Daily_Summary__c = comments;


        aos_UnitOfWork uow = new aos_UnitOfWork(new List<SObjectType>{
        animalos__Animal_Action__c.SObjectType
        });
                
        uow.registerUpsert(action);
        uow.commitWork();


        this.response.put('result', new Map<String, Object> {
            'animalActionId' => action.Id
        });

    }

    private void validateScore(Integer faecalScore){
        if(!FAECAL_SCORES.contains(faecalScore)) {
            throw new aos_Structs.ValidationException(
                'Invalid! Score must be: ' + FAECAL_SCORES
            );
        }
    }







}
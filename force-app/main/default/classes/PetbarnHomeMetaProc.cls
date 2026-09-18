public without sharing class PetbarnHomeMetaProc extends aos_MetadataProcessor {

    public override aos_Response process(aos_Request request) {
        this.request = request == null
            ? new aos_MetadataProcessor.MetadataRequest()
            : (aos_MetadataProcessor.MetadataRequest) request;

        this.request.fields = new Set<SObjectField>{
            animalos__Animal_Action__c.Distress_in_Shelter_Score_VAS__c
        };

        super.process(this.request);

        this.fetchPetbarnStats();

        return this.response;
    }

    private void fetchPetbarnStats() {
        List<String> locationId = this.request.getListAsStrings('locationId');
        Set<String> locationIds = new Set<String>(locationId);

        Id currentUserId = UserInfo.getUserId();

        Integer adoptionCount = [
            SELECT COUNT()
            FROM animalos__Animal_Referral__c
            WHERE animalos__Site__c IN :locationIds
            AND animalos__Referral__r.RecordType.DeveloperName = 'Adoption'
            AND Animal_Referral_Stage__c = 'Completed'
        ];

        Integer animalCount = [
            SELECT COUNT()
            FROM animalos__Animal__c
            WHERE animalos__current_site__c IN :locationIds
        ];

        Integer adoptionsByUserCount = [
            SELECT COUNT()
            FROM animalos__Animal_Referral__c
            WHERE animalos__Site__c IN :locationIds
            AND animalos__Referral__r.RecordType.DeveloperName = 'Adoption'
            AND createdById = :currentUserId
            AND animal_Referral_Stage__c = 'Completed'
        ];

        


        this.response.put('stats', new Map<String, Object>{
            'adoptionCount' => adoptionCount,
            'animalCount' => animalCount,
            'adoptionsByUserCount' => adoptionsByUserCount 
        });
    }

}

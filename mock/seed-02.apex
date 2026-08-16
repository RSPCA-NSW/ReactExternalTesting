// Seed mock data into an org — part 2 of 12.
//
// GENERATED from mock/schemas/*.json (insert order from mock/import-plan.json),
// split across parts because anonymous Apex scripts are capped at 32,000 chars.
// Regenerate after editing the JSON.
//
// Run every part IN ORDER against the same org (or use mock/seed.sh):
//   sf apex run --file mock/seed-01.apex --target-org <alias>
//   sf apex run --file mock/seed-02.apex --target-org <alias>
//   sf apex run --file mock/seed-03.apex --target-org <alias>
//   sf apex run --file mock/seed-04.apex --target-org <alias>
//   sf apex run --file mock/seed-05.apex --target-org <alias>
//   sf apex run --file mock/seed-06.apex --target-org <alias>
//   sf apex run --file mock/seed-07.apex --target-org <alias>
//   sf apex run --file mock/seed-08.apex --target-org <alias>
//   sf apex run --file mock/seed-09.apex --target-org <alias>
//   sf apex run --file mock/seed-10.apex --target-org <alias>
//   sf apex run --file mock/seed-11.apex --target-org <alias>
//   sf apex run --file mock/seed-12.apex --target-org <alias>

class MockSeedException extends Exception {}

Integer partNumber = 2;
Integer totalParts = 12;

List<String> groupTypes = new List<String>();
List<String> groupJson = new List<String>();

// schemas/JobContacts.json (9 records)
groupTypes.add('animalos__Job_Contact__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"JobContactRef12"},"animalos__Job__c":"@JobRef6","animalos__Contact__c":"@ContactRef2","animalos__Organization__c":"@AccountRef2","animalos__Contact_Type__c":"Person Of Interest","animalos__Start_Date__c":"2026-04-06T09:30:00.000+0000"},{"attributes":{"referenceId":"JobContactRef13"},"animalos__Job__c":"@JobRef7","animalos__Contact__c":"@ContactRef1","animalos__Organization__c":"@AccountRef2","animalos__Contact_Type__c":"Informant","animalos__Start_Date__c":"2026-04-07T09:00:00.000+0000"},{"attributes":{"referenceId":"JobContactRef14"},"animalos__Job__c":"@JobRef7","animalos__Contact__c":"@ContactRef2","animalos__Organization__c":"@AccountRef3","animalos__Contact_Type__c":"Person Of Interest","animalos__Start_Date__c":"2026-04-07T09:30:00.000+0000"},{"attributes":{"referenceId":"JobContactRef15"},"animalos__Job__c":"@JobRef8","animalos__Contact__c":"@ContactRef1","animalos__Organization__c":"@AccountRef3","animalos__Contact_Type__c":"Informant","animalos__Start_Date__c":"2026-04-08T09:00:00.000+0000"},{"attributes":{"referenceId":"JobContactRef16"},"animalos__Job__c":"@JobRef8","animalos__Contact__c":"@ContactRef2","animalos__Organization__c":"@AccountRef1","animalos__Contact_Type__c":"Person Of Interest","animalos__Start_Date__c":"2026-04-08T09:30:00.000+0000"},{"attributes":{"referenceId":"JobContactRef17"},"animalos__Job__c":"@JobRef9","animalos__Contact__c":"@ContactRef1","animalos__Organization__c":"@AccountRef1","animalos__Contact_Type__c":"Informant","animalos__Start_Date__c":"2026-04-09T09:00:00.000+0000"},{"attributes":{"referenceId":"JobContactRef18"},"animalos__Job__c":"@JobRef9","animalos__Contact__c":"@ContactRef2","animalos__Organization__c":"@AccountRef2","animalos__Contact_Type__c":"Person Of Interest","animalos__Start_Date__c":"2026-04-09T09:30:00.000+0000"},{"attributes":{"referenceId":"JobContactRef19"},"animalos__Job__c":"@JobRef10","animalos__Contact__c":"@ContactRef1","animalos__Organization__c":"@AccountRef2","animalos__Contact_Type__c":"Informant","animalos__Start_Date__c":"2026-04-10T09:00:00.000+0000"},{"attributes":{"referenceId":"JobContactRef20"},"animalos__Job__c":"@JobRef10","animalos__Contact__c":"@ContactRef2","animalos__Organization__c":"@AccountRef3","animalos__Contact_Type__c":"Person Of Interest","animalos__Start_Date__c":"2026-04-10T09:30:00.000+0000"}]}');

// schemas/InteractionCautions.json (14 records)
groupTypes.add('animalos__Interaction_Caution__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"InteractionCautionRef1"},"animalos__Job_Contact__c":"@JobContactRef1","animalos__Contact__c":"@ContactRef1","animalos__Caution_Type__c":"Physical Violence","animalos__Caution_Source__c":"Reported","animalos__Caution_Date_Time__c":"2026-04-12T08:20:00.000+0000","animalos__Caution_Details__c":"Caller reported prior physical violence incident at the location."},{"attributes":{"referenceId":"InteractionCautionRef2"},"animalos__Job_Contact__c":"@JobContactRef1","animalos__Contact__c":"@ContactRef1","animalos__Caution_Type__c":"Physical Violence","animalos__Caution_Source__c":"Reported","animalos__Caution_Date_Time__c":"2026-04-18T09:15:00.000+0000","animalos__Caution_Details__c":"Caller reported a further physical violence concern during follow-up."},{"attributes":{"referenceId":"InteractionCautionRef3"},"animalos__Job_Contact__c":"@JobContactRef4","animalos__Contact__c":"@ContactRef2","animalos__Caution_Type__c":"Verbal Abuse","animalos__Caution_Source__c":"Observed","animalos__Caution_Date_Time__c":"2026-04-22T14:05:00.000+0000","animalos__Caution_Details__c":"Officer observed verbal abuse on attendance."},{"attributes":{"referenceId":"InteractionCautionRef4"},"animalos__Job_Contact__c":"@JobContactRef5","animalos__Contact__c":"@ContactRef1","animalos__Caution_Type__c":"Substance Abuse","animalos__Caution_Source__c":"Reported","animalos__Caution_Date_Time__c":"2026-04-11T20:45:00.000+0000","animalos__Caution_Details__c":"Informant reported suspected substance abuse at the premises."},{"attributes":{"referenceId":"InteractionCautionRef5"},"animalos__Job_Contact__c":"@JobContactRef8","animalos__Contact__c":"@ContactRef2","animalos__Caution_Type__c":"Firearms/weapons","animalos__Caution_Source__c":"Observed","animalos__Caution_Date_Time__c":"2026-04-24T10:10:00.000+0000","animalos__Caution_Details__c":"Weapons were observed during inspection."},{"attributes":{"referenceId":"InteractionCautionRef6"},"animalos__Job_Contact__c":"@JobContactRef8","animalos__Contact__c":"@ContactRef2","animalos__Caution_Type__c":"Firearms/weapons","animalos__Caution_Source__c":"Observed","animalos__Caution_Date_Time__c":"2026-04-26T11:20:00.000+0000","animalos__Caution_Details__c":"Additional weapons observed on re-attendance."},{"attributes":{"referenceId":"InteractionCautionRef7"},"animalos__Job_Contact__c":"@JobContactRef9","animalos__Contact__c":"@ContactRef1","animalos__Caution_Type__c":"Known to Police","animalos__Caution_Source__c":"Reported","animalos__Caution_Date_Time__c":"2026-04-03T08:00:00.000+0000","animalos__Caution_Details__c":"Informant advised the occupant is known to police."},{"attributes":{"referenceId":"InteractionCautionRef8"},"animalos__Job_Contact__c":"@JobContactRef12","animalos__Contact__c":"@ContactRef2","animalos__Caution_Type__c":"Physical Violence","animalos__Caution_Source__c":"Observed","animalos__Caution_Date_Time__c":"2026-04-29T16:10:00.000+0000","animalos__Caution_Details__c":"Physical violence was observed during attendance."},{"attributes":{"referenceId":"InteractionCautionRef9"},"animalos__Job_Contact__c":"@JobContactRef13","animalos__Contact__c":"@ContactRef1","animalos__Caution_Type__c":"Verbal Abuse","animalos__Caution_Source__c":"Reported","animalos__Caution_Date_Time__c":"2026-03-26T17:00:00.000+0000","animalos__Caution_Details__c":"Initial report of verbal abuse at the location."},{"attributes":{"referenceId":"InteractionCautionRef10"},"animalos__Job_Contact__c":"@JobContactRef13","animalos__Contact__c":"@ContactRef1","animalos__Caution_Type__c":"Verbal Abuse","animalos__Caution_Source__c":"Reported","animalos__Caution_Date_Time__c":"2026-03-28T17:40:00.000+0000","animalos__Caution_Details__c":"Second verbal abuse report received from informant."},{"attributes":{"referenceId":"InteractionCautionRef11"},"animalos__Job_Contact__c":"@JobContactRef13","animalos__Contact__c":"@ContactRef1","animalos__Caution_Type__c":"Verbal Abuse","animalos__Caution_Source__c":"Reported","animalos__Caution_Date_Time__c":"2026-03-30T18:25:00.000+0000","animalos__Caution_Details__c":"Latest verbal abuse report recorded prior to triage."},{"attributes":{"referenceId":"InteractionCautionRef12"},"animalos__Job_Contact__c":"@JobContactRef16","animalos__Contact__c":"@ContactRef2","animalos__Caution_Type__c":"Substance Abuse","animalos__Caution_Source__c":"Observed","animalos__Caution_Date_Time__c":"2026-04-15T13:40:00.000+0000","animalos__Caution_Details__c":"Substance abuse indicators were observed on site."},{"attributes":{"referenceId":"InteractionCautionRef13"},"animalos__Job_Contact__c":"@JobContactRef17","animalos__Contact__c":"@ContactRef1","animalos__Caution_Type__c":"Firearms/weapons","animalos__Caution_Source__c":"Reported","animalos__Caution_Date_Time__c":"2026-04-10T07:55:00.000+0000","animalos__Caution_Details__c":"Informant reported firearms/weapons kept at the location."},{"attributes":{"referenceId":"InteractionCautionRef14"},"animalos__Job_Contact__c":"@JobContactRef20","animalos__Contact__c":"@ContactRef2","animalos__Caution_Type__c":"Known to Police","animalos__Caution_Source__c":"Observed","animalos__Caution_Date_Time__c":"2026-04-20T10:30:00.000+0000","animalos__Caution_Details__c":"Officer confirmed the party is known to police."}]}');

// schemas/ActionPlans.json (20 records)
groupTypes.add('animalos__Action_Plan__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"ActionPlanRef1"},"Name":"Standard Enrichment Plan","animalos__Status__c":"Active","animalos__Animal_Type__c":"Cat;Dog;Kitten;Puppy","animalos__Frequency__c":"Daily","animalos__Specific_Animal__c":false},{"attributes":{"referenceId":"ActionPlanRef2"},"Name":"Standard Exercise Plan","animalos__Status__c":"Active","animalos__Animal_Type__c":"Dog;Puppy","animalos__Frequency__c":"Daily","animalos__Specific_Animal__c":false},{"attributes":{"referenceId":"ActionPlanRef3"},"Name":"Daily Observation","animalos__Status__c":"Active","animalos__Animal_Type__c":"Bird;Cat;Cattle;Crab/Fish;Dog;Farm;Ferret;Fowl;Goat;Guinea Pig;Hamster;Horse;Insect / Arachnid;Kitten;Livestock;Native Amphibians;Native Birds;Native Mammal;Native Marsupial;Native Monotreme;Native Reptiles;Non Native Amphibians;Non Native Birds;Non Native Mammals;Non Native Reptiles;Pig;Puppy;Rabbit;Rodent;Sheep;Zoo","animalos__Frequency__c":"Daily","animalos__Specific_Animal__c":false},{"attributes":{"referenceId":"ActionPlanRef4"},"Name":"Standard Interaction","animalos__Status__c":"Active","animalos__Animal_Type__c":"Cat;Kitten","animalos__Frequency__c":"Daily","animalos__Specific_Animal__c":false},{"attributes":{"referenceId":"ActionPlanRef5"},"Name":"Weigh In - Weekly","animalos__Status__c":"Active","animalos__Animal_Type__c":"Arachnid;Bird;Cat;Cattle;Crab/Fish;Dog;Donkey;Farm;Ferret;Fowl;Gerbil;Goat;Guinea Pig;Hamster;Hedgehog;Horse;Insect / Arachnid;Kitten;Livestock;Mammal;Marsupial;Monotremes;Native Amphibians;Native Birds;Native Mammal;Native Marsupial;Native Monotreme;Native Reptiles;Non Native Amphibians;Non Native Birds;Non Native Mammals;Non Native Reptiles;Pig;Placental Mammals;Pony;Poultry;Puppy;Rabbit;Rat;Reptile;Rodent;Sheep;Small Pets;Unknown;Wildlife;Zoo;Fish;Chicken;Duck;Goose;Other","animalos__Frequency__c":"Weekly","animalos__Specific_Animal__c":false},{"attributes":{"referenceId":"ActionPlanRef6"},"Name":"Weekly Sanitation Plan","animalos__Status__c":"Active","animalos__Animal_Type__c":"Bird;Cat;Dog;Ferret;Guinea Pig;Hamster;Horse;Kitten;Puppy;Rabbit","animalos__Frequency__c":"Weekly","animalos__Specific_Animal__c":false},{"attributes":{"referenceId":"ActionPlanRef7"},"Name":"Weigh In - Daily","animalos__Status__c":"Active","animalos__Animal_Type__c":"Arachnid;Bird;Cat;Cattle;Crab/Fish;Dog;Donkey;Farm;Ferret;Fowl;Gerbil;Goat;Guinea Pig;Hamster;Hedgehog;Horse;Insect / Arachnid;Kitten;Livestock;Mammal;Marsupial;Monotremes;Native Amphibians;Native Birds;Native Mammal;Native Marsupial;Native Monotreme;Native Reptiles;Non Native Amphibians;Non Native Birds;Non Native Mammals;Non Native Reptiles;Pig;Placental Mammals;Pony;Poultry;Puppy;Rabbit;Rat;Reptile;Rodent;Sheep;Small Pets;Unknown;Wildlife;Zoo;Fish;Chicken;Duck;Goose;Other","animalos__Frequency__c":"Daily","animalos__Specific_Animal__c":false},{"attributes":{"referenceId":"ActionPlanRef8"},"Name":"Weigh In - Every 2 Days","animalos__Status__c":"Active","animalos__Animal_Type__c":"Arachnid;Bird;Cat;Cattle;Crab/Fish;Dog;Donkey;Farm;Ferret;Fowl;Gerbil;Goat;Guinea Pig;Hamster;Hedgehog;Horse;Insect / Arachnid;Kitten;Livestock;Mammal;Marsupial;Monotremes;Native Amphibians;Native Birds;Native Mammal;Native Marsupial;Native Monotreme;Native Reptiles;Non Native Amphibians;Non Native Birds;Non Native Mammals;Non Native Reptiles;Pig;Placental Mammals;Pony;Poultry;Puppy;Rabbit;Rat;Reptile;Rodent;Sheep;Small Pets;Unknown;Wildlife;Zoo;Fish;Chicken;Duck;Goose;Other","animalos__Frequency__c":"Daily","animalos__Specific_Animal__c":false},{"attributes":{"referenceId":"ActionPlanRef9"},"Name":"Malaseb Bath Weekly","animalos__Status__c":"Active","animalos__Animal_Type__c":"Bird;Cat;Cattle;Crab/Fish;Dog;Farm;Ferret;Fowl;Goat;Guinea Pig;Hamster;Horse;Insect / Arachnid;Kitten;Livestock;Native Amphibians;Native Birds;Native Mammal;Native Marsupial;Native Monotreme;Native Reptiles;Non Native Amphibians;Non Native Birds;Non Native Mammals;Non Native Reptiles;Pig;Puppy;Rabbit;Rodent;Sheep;Zoo","animalos__Frequency__c":"Weekly","animalos__Specific_Animal__c":false},{"attributes":{"referenceId":"ActionPlanRef10"},"Name":"Malaseb Bath Every 3 Days","animalos__Status__c":"Active","animalos__Animal_Type__c":"Bird;Cat;Cattle;Crab/Fish;Dog;Farm;Ferret;Fowl;Goat;Guinea Pig;Hamster;Horse;Insect / Arachnid;Kitten;Livestock;Native Amphibians;Native Birds;Native Mammal;Native Marsupial;Native Monotreme;Native Reptiles;Non Native Amphibians;Non Native Birds;Non Native Mammals;Non Native Reptiles;Pig;Puppy;Rabbit;Rodent;Sheep;Zoo","animalos__Frequency__c":"Daily","animalos__Specific_Animal__c":false},{"attributes":{"referenceId":"ActionPlanRef11"},"Name":"Weekly Weigh-In (Pocket Pet)","animalos__Status__c":"Inactive","animalos__Animal_Type__c":"Crab/Fish;Ferret;Guinea Pig;Rabbit;Rodent","animalos__Frequency__c":"Weekly","animalos__Specific_Animal__c":false},{"attributes":{"referenceId":"ActionPlanRef12"},"Name":"FAS Observations","animalos__Status__c":"Inactive","animalos__Animal_Type__c":"Cat;Dog;Kitten;Puppy","animalos__Frequency__c":"Daily","animalos__Specific_Animal__c":false},{"attributes":{"referenceId":"ActionPlanRef13"},"Name":"Feline Toileting Habits","animalos__Status__c":"Active","animalos__Animal_Type__c":"Cat;Kitten","animalos__Frequency__c":"Daily","animalos__Specific_Animal__c":false},{"attributes":{"referenceId":"ActionPlanRef14"},"Name":"Weigh In - Monthly","animalos__Status__c":"Active","animalos__Animal_Type__c":"Arachnid;Bird;Cat;Cattle;Crab/Fish;Dog;Donkey;Farm;Ferret;Fowl;Gerbil;Goat;Guinea Pig;Hamster;Hedgehog;Horse;Insect / Arachnid;Kitten;Livestock;Mammal;Marsupial;Monotremes;Native Amphibians;Native Birds;Native Mammal;Native Marsupial;Native Monotreme;Native Reptiles;Non Native Amphibians;Non Native Birds;Non Native Mammals;Non Native Reptiles;Pig;Placental Mammals;Pony;Poultry;Puppy;Rabbit;Rat;Reptile;Rodent;Sheep;Small Pets;Unknown;Wildlife;Zoo;Fish;Chicken;Duck;Goose;Other","animalos__Frequency__c":"Monthly","animalos__Specific_Animal__c":false},{"attributes":{"referenceId":"ActionPlanRef15"},"Name":"Fortnightly In Care Review","animalos__Status__c":"Active","animalos__Animal_Type__c":"Bird;Cat;Cattle;Crab/Fish;Dog;Farm;Ferret;Fowl;Goat;Guinea Pig;Hamster;Horse;Insect / Arachnid;Kitten;Livestock;Native Amphibians;Native Birds;Native Mammal;Native Marsupial;Native Monotreme;Native Reptiles;Non Native Amphibians;Non Native Birds;Non Native Mammals;Non Native Reptiles;Pig;Puppy;Rabbit;Rodent;Sheep;Zoo","animalos__Frequency__c":"Weekly","animalos__Specific_Animal__c":false},{"attributes":{"referenceId":"ActionPlanRef16"},"Name":"Treatment Default Plan","animalos__Status__c":"Inactive","animalos__Animal_Type__c":null,"animalos__Frequency__c":null,"animalos__Specific_Animal__c":false},{"attributes":{"referenceId":"ActionPlanRef17"},"Name":"Nutrition","animalos__Status__c":"Inactive","animalos__Animal_Type__c":null,"animalos__Frequency__c":null,"animalos__Specific_Animal__c":false},{"attributes":{"referenceId":"ActionPlanRef18"},"Name":"Enrichment","animalos__Status__c":"Inactive","animalos__Animal_Type__c":null,"animalos__Frequency__c":null,"animalos__Specific_Animal__c":false},{"attributes":{"referenceId":"ActionPlanRef19"},"Name":"Weigh In","animalos__Status__c":"Inactive","animalos__Animal_Type__c":null,"animalos__Frequency__c":null,"animalos__Specific_Animal__c":false},{"attributes":{"referenceId":"ActionPlanRef20"},"Name":"Weigh In - Every 3 Days","animalos__Status__c":"Active","animalos__Animal_Type__c":"Arachnid;Bird;Cat;Cattle;Crab/Fish;Dog;Donkey;Farm;Ferret;Fowl;Gerbil;Goat;Guinea Pig;Hamster;Hedgehog;Horse;Insect / Arachnid;Kitten;Livestock;Mammal;Marsupial;Monotremes;Native Amphibians;Native Birds;Native Mammal;Native Marsupial;Native Monotreme;Native Reptiles;Non Native Amphibians;Non Native Birds;Non Native Mammals;Non Native Reptiles;Pig;Placental Mammals;Pony;Poultry;Puppy;Rabbit;Rat;Reptile;Rodent;Sheep;Small Pets;Unknown;Wildlife;Zoo;Fish;Chicken;Duck;Goose;Other","animalos__Frequency__c":"Daily","animalos__Specific_Animal__c":false}]}');

// schemas/ActionItems.json (20 records)
groupTypes.add('animalos__Action_Item__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"ActionItemRef1"},"animalos__Action_Plan__c":"@ActionPlanRef1","animalos__Action_Type__c":"Enrichment","animalos__First_Given__c":false,"animalos__Description__c":"Enrichment activities from at least three enrichment categories (Cognitive, Dietary, Physical, Sensory and Social) should be implemented each day, and on a rotational basis to ensure maximum benefit and avoid animals becoming bored"},{"attributes":{"referenceId":"ActionItemRef2"},"animalos__Action_Plan__c":"@ActionPlanRef2","animalos__Action_Type__c":"Exercise","animalos__First_Given__c":false,"animalos__Description__c":"Exercise time"},{"attributes":{"referenceId":"ActionItemRef3"},"animalos__Action_Plan__c":"@ActionPlanRef3","animalos__Action_Type__c":"Daily Observation","animalos__First_Given__c":false,"animalos__Description__c":"Daily Observation tasks, including EDUF."},{"attributes":{"referenceId":"ActionItemRef4"},"animalos__Action_Plan__c":"@ActionPlanRef4","animalos__Action_Type__c":"Enrichment","animalos__First_Given__c":false,"animalos__Description__c":"Interaction with animal"},{"attributes":{"referenceId":"ActionItemRef5"},"animalos__Action_Plan__c":"@ActionPlanRef5","animalos__Action_Type__c":"Weigh In","animalos__First_Given__c":false,"animalos__Description__c":"Weekly Weigh-In"},{"attributes":{"referenceId":"ActionItemRef6"},"animalos__Action_Plan__c":"@ActionPlanRef6","animalos__Action_Type__c":"Treatment","animalos__First_Given__c":false,"animalos__Description__c":"Sanitation","animalos__Time_of_Day__c":"Breakfast"},{"attributes":{"referenceId":"ActionItemRef7"},"animalos__Action_Plan__c":"@ActionPlanRef7","animalos__Action_Type__c":"Weigh In","animalos__First_Given__c":false,"animalos__Description__c":"Daily Weigh-In"},{"attributes":{"referenceId":"ActionItemRef8"},"animalos__Action_Plan__c":"@ActionPlanRef8","animalos__Action_Type__c":"Weigh In","animalos__First_Given__c":false,"animalos__Description__c":"Weigh-in Every 2 Days"},{"attributes":{"referenceId":"ActionItemRef9"},"animalos__Action_Plan__c":"@ActionPlanRef9","animalos__Action_Type__c":"Treatment","animalos__First_Given__c":false,"animalos__Description__c":"Malaseb Bath"},{"attributes":{"referenceId":"ActionItemRef10"},"animalos__Action_Plan__c":"@ActionPlanRef10","animalos__Action_Type__c":"Treatment","animalos__First_Given__c":false,"animalos__Description__c":"Malaseb Bath"},{"attributes":{"referenceId":"ActionItemRef11"},"animalos__Action_Plan__c":"@ActionPlanRef11","animalos__Action_Type__c":"Weigh In","animalos__First_Given__c":false,"animalos__Description__c":"Weekly Weigh-In"},{"attributes":{"referenceId":"ActionItemRef12"},"animalos__Action_Plan__c":"@ActionPlanRef12","animalos__Action_Type__c":"Daily Observation","animalos__First_Given__c":false,"animalos__Description__c":"Fear/Anxiety/Stress Score (FAS)","animalos__Time_of_Day__c":"Lunch"},{"attributes":{"referenceId":"ActionItemRef13"},"animalos__Action_Plan__c":"@ActionPlanRef13","animalos__Action_Type__c":"Daily Observation","animalos__First_Given__c":false,"animalos__Description__c":"Feline Toileting Habits","animalos__Time_of_Day__c":"Breakfast"},{"attributes":{"referenceId":"ActionItemRef14"},"animalos__Action_Plan__c":"@ActionPlanRef14","animalos__Action_Type__c":"Weigh In","animalos__First_Given__c":false,"animalos__Description__c":"Monthly Weigh-In"},{"attributes":{"referenceId":"ActionItemRef15"},"animalos__Action_Plan__c":"@ActionPlanRef15","animalos__Action_Type__c":"Daily Observation","animalos__First_Given__c":false,"animalos__Time_of_Day__c":"Breakfast"},{"attributes":{"referenceId":"ActionItemRef16"},"animalos__Action_Plan__c":"@ActionPlanRef16","animalos__Action_Type__c":"Treatment","animalos__First_Given__c":false,"animalos__Description__c":"Default treatment action item"},{"attributes":{"referenceId":"ActionItemRef17"},"animalos__Action_Plan__c":"@ActionPlanRef17","animalos__Action_Type__c":"Nutrition","animalos__First_Given__c":false,"animalos__Description__c":"Default nutrition action item"},{"attributes":{"referenceId":"ActionItemRef18"},"animalos__Action_Plan__c":"@ActionPlanRef18","animalos__Action_Type__c":"Enrichment","animalos__First_Given__c":false,"animalos__Description__c":"Default enrichment action item"},{"attributes":{"referenceId":"ActionItemRef19"},"animalos__Action_Plan__c":"@ActionPlanRef19","animalos__Action_Type__c":"Weigh In","animalos__First_Given__c":false,"animalos__Description__c":"Default weigh-in action item"},{"attributes":{"referenceId":"ActionItemRef20"},"animalos__Action_Plan__c":"@ActionPlanRef20","animalos__Action_Type__c":"Weigh In","animalos__First_Given__c":false,"animalos__Description__c":"Weigh-in Every 3 Days"}]}');

// schemas/Medicines.json (1 records)
groupTypes.add('animalos__Medicine__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"MedicineRef1"},"Name":"Parvo Test","animalos__Type__c":"Medicine","animalos__Active__c":true}]}');

// ---------------------------------------------------------------------------
// Engine (identical in every part): resolves RecordTypes dynamically, resolves
// '@Ref' lookups against the Ids of records inserted by this and earlier
// parts, coerces field values via describe metadata, and inserts in order.
// The referenceId -> Id map is carried between parts in a ContentVersion.
// ---------------------------------------------------------------------------

String refsTitle = 'mock-seed-refs';
Map<String, Schema.SObjectType> globalDescribe = Schema.getGlobalDescribe();

Map<String, Id> refIds = new Map<String, Id>();
Id refsDocumentId = null;

if (partNumber == 1) {
    delete [SELECT Id FROM ContentDocument WHERE Title = :refsTitle];
} else {
    List<ContentVersion> existing = [
        SELECT VersionData, ContentDocumentId
        FROM ContentVersion
        WHERE Title = :refsTitle AND IsLatest = true
        LIMIT 1
    ];
    if (existing.isEmpty()) {
        throw new MockSeedException(
            'Reference map not found. Run the seed parts in order, starting with seed-01.apex.'
        );
    }
    refsDocumentId = existing[0].ContentDocumentId;
    Map<String, Object> stored =
        (Map<String, Object>) JSON.deserializeUntyped(existing[0].VersionData.toString());
    for (String key : stored.keySet()) {
        refIds.put(key, (Id) ((String) stored.get(key)));
    }
}

// Only ACTIVE record types can be assigned on insert. Orgs may carry both a
// managed (animalos) and a local copy of the same DeveloperName — prefer the
// active one, and the org-local one when both are active.
Set<String> chunkSobjects = new Set<String>(groupTypes);
Map<String, Id> recordTypeIds = new Map<String, Id>();
Set<String> activeRtKeys = new Set<String>();
for (RecordType rt : [
    SELECT Id, DeveloperName, SobjectType, IsActive, NamespacePrefix
    FROM RecordType
    WHERE SobjectType IN :chunkSobjects
]) {
    String key = rt.SobjectType + '.' + rt.DeveloperName;
    if (rt.IsActive && (!activeRtKeys.contains(key) || rt.NamespacePrefix == null)) {
        recordTypeIds.put(key, rt.Id);
        activeRtKeys.add(key);
    }
}
Set<String> warnedRecordTypes = new Set<String>();

// Fallbacks for orgs where the managed record types are deactivated and
// replaced by local equivalents (e.g. RSPCA sandboxes). The exact
// DeveloperName always wins when it has an active record type.
Map<String, String> recordTypeAliases = new Map<String, String>{
    'animalos__Referral__c.Inbound_Return' =>
        'Return_Animals_returned_less_that_14_days_post_adoption',
    'animalos__Referral__c.Inbound_Stray' => 'Stray',
    'animalos__Referral__c.Inbound_Surrender' => 'Surrender'
};

Integer totalInserted = 0;

for (Integer g = 0; g < groupTypes.size(); g++) {
    String sobjectName = groupTypes[g];
    Schema.SObjectType sobjectType = globalDescribe.get(sobjectName);
    if (sobjectType == null) {
        throw new MockSeedException('Unknown sObject type: ' + sobjectName);
    }
    Map<String, Schema.SObjectField> fieldMap = sobjectType.getDescribe().fields.getMap();

    Map<String, Object> payload = (Map<String, Object>) JSON.deserializeUntyped(groupJson[g]);
    List<Object> records = (List<Object>) payload.get('records');

    List<SObject> toInsert = new List<SObject>();
    List<String> referenceIds = new List<String>();

    for (Object recordObj : records) {
        Map<String, Object> recordMap = (Map<String, Object>) recordObj;
        Map<String, Object> attributes = (Map<String, Object>) recordMap.get('attributes');
        SObject record = sobjectType.newSObject();

        for (String key : recordMap.keySet()) {
            if (key == 'attributes') {
                continue;
            }
            Object value = recordMap.get(key);

            if (key == 'RecordType') {
                String developerName = (String) ((Map<String, Object>) value).get('DeveloperName');
                String rtKey = sobjectName + '.' + developerName;
                Id recordTypeId = recordTypeIds.get(rtKey);
                if (recordTypeId == null && recordTypeAliases.containsKey(rtKey)) {
                    recordTypeId = recordTypeIds.get(
                        sobjectName + '.' + recordTypeAliases.get(rtKey));
                }
                if (recordTypeId != null) {
                    record.put('RecordTypeId', recordTypeId);
                } else if (warnedRecordTypes.add(rtKey)) {
                    System.debug(LoggingLevel.WARN,
                        'No active RecordType ' + developerName + ' for ' + sobjectName +
                        ' in this org — affected records will use the default record type.');
                }
                continue;
            }

            if (value == null) {
                continue;
            }

            Schema.SObjectField field = fieldMap.get(key.toLowerCase());
            if (field == null) {
                throw new MockSeedException('Unknown field ' + key + ' on ' + sobjectName);
            }
            Schema.DisplayType fieldType = field.getDescribe().getType();

            if (value instanceof String) {
                String stringValue = (String) value;
                if (stringValue.startsWith('@')) {
                    Id refId = refIds.get(stringValue.substring(1));
                    if (refId == null) {
                        throw new MockSeedException(
                            'Unresolved reference ' + stringValue + ' on ' + sobjectName + '.' + key +
                            '. Run the seed parts in order, starting with seed-01.apex.'
                        );
                    }
                    record.put(field, refId);
                } else if (fieldType == Schema.DisplayType.DATE) {
                    record.put(field, Date.valueOf(stringValue));
                } else if (fieldType == Schema.DisplayType.DATETIME) {
                    record.put(field, (Datetime) JSON.deserialize('"' + stringValue + '"', Datetime.class));
                } else {
                    record.put(field, stringValue);
                }
            } else if (value instanceof Boolean) {
                record.put(field, value);
            } else {
                Decimal decimalValue = (value instanceof Decimal)
                    ? (Decimal) value
                    : Decimal.valueOf(String.valueOf(value));
                if (fieldType == Schema.DisplayType.INTEGER) {
                    record.put(field, decimalValue.intValue());
                } else {
                    record.put(field, decimalValue);
                }
            }
        }

        toInsert.add(record);
        referenceIds.add(attributes == null ? null : (String) attributes.get('referenceId'));
    }

    if (toInsert.isEmpty()) {
        continue;
    }

    insert toInsert;
    totalInserted += toInsert.size();

    for (Integer i = 0; i < toInsert.size(); i++) {
        if (referenceIds[i] != null) {
            refIds.put(referenceIds[i], toInsert[i].Id);
        }
    }

    System.debug('Inserted ' + toInsert.size() + ' ' + sobjectName + ' record(s)');
}

if (partNumber < totalParts) {
    ContentVersion refsVersion = new ContentVersion(
        Title = refsTitle,
        PathOnClient = refsTitle + '.json',
        VersionData = Blob.valueOf(JSON.serialize(refIds))
    );
    if (refsDocumentId != null) {
        refsVersion.ContentDocumentId = refsDocumentId;
    }
    insert refsVersion;
} else if (refsDocumentId != null) {
    delete [SELECT Id FROM ContentDocument WHERE Id = :refsDocumentId];
}

System.debug('Seed part ' + partNumber + ' of ' + totalParts +
    ' complete. Records inserted by this part: ' + totalInserted);

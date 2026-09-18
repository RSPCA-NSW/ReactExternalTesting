// Seed mock data into an org — part 11 of 12.
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

Integer partNumber = 11;
Integer totalParts = 12;

List<String> groupTypes = new List<String>();
List<String> groupJson = new List<String>();

// schemas/AnimalActions.json (29 records)
groupTypes.add('animalos__Animal_Action__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"AnimalActionRef122"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef41","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-03-25T18:00:00.000+0000","animalos__Description__c":"Weight review overdue. Historical overdue seed data for Mochi.","animalos__Weight_KG__c":2.1},{"attributes":{"referenceId":"AnimalActionRef123"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef41","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-13T11:00:00.000+0000","animalos__Description__c":"Upcoming care observation. Upcoming seed data for Mochi."},{"attributes":{"referenceId":"AnimalActionRef124"},"RecordType":{"DeveloperName":"Exercise"},"animalos__Animal__c":"@AnimalRef42","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-03-25T20:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-03-25T20:20:00.000+0000","animalos__Description__c":"Completed exercise session. Historical seed data for Marley (Owner Surrender).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef125"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef42","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-03-27T19:00:00.000+0000","animalos__Description__c":"Follow-up weigh-in pending. Historical overdue seed data for Marley.","animalos__Weight_KG__c":31.4},{"attributes":{"referenceId":"AnimalActionRef126"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef42","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-08T09:00:00.000+0000","animalos__Description__c":"Upcoming welfare observation. Upcoming seed data for Marley."},{"attributes":{"referenceId":"AnimalActionRef127"},"RecordType":{"DeveloperName":"Enrichment"},"animalos__Animal__c":"@AnimalRef43","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-03-27T21:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-03-27T21:20:00.000+0000","animalos__Description__c":"Completed enrichment activity. Historical seed data for Piper (Stray)."},{"attributes":{"referenceId":"AnimalActionRef128"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef43","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-03-29T20:00:00.000+0000","animalos__Description__c":"Observation review overdue. Historical overdue seed data for Piper."},{"attributes":{"referenceId":"AnimalActionRef129"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef43","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-09T10:00:00.000+0000","animalos__Description__c":"Upcoming weigh-in to monitor condition. Upcoming seed data for Piper.","animalos__Weight_KG__c":3.9},{"attributes":{"referenceId":"AnimalActionRef130"},"RecordType":{"DeveloperName":"Exercise"},"animalos__Animal__c":"@AnimalRef44","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-03-29T18:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-03-29T18:20:00.000+0000","animalos__Description__c":"Completed exercise session. Historical seed data for Murphy (Stray).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef131"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef44","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-03-31T17:00:00.000+0000","animalos__Description__c":"Follow-up weigh-in pending. Historical overdue seed data for Murphy.","animalos__Weight_KG__c":24.7},{"attributes":{"referenceId":"AnimalActionRef132"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef44","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-10T11:00:00.000+0000","animalos__Description__c":"Upcoming welfare observation. Upcoming seed data for Murphy."},{"attributes":{"referenceId":"AnimalActionRef133"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef45","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-03-31T19:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-03-31T19:20:00.000+0000","animalos__Description__c":"Completed care observation. Historical seed data for Sunny (Owner Surrender)."},{"attributes":{"referenceId":"AnimalActionRef134"},"RecordType":{"DeveloperName":"Treatment"},"animalos__Animal__c":"@AnimalRef45","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-04-02T18:00:00.000+0000","animalos__Description__c":"Follow-up treatment action overdue. Historical overdue seed data for Sunny."},{"attributes":{"referenceId":"AnimalActionRef135"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef45","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-11T09:00:00.000+0000","animalos__Description__c":"Upcoming care observation. Upcoming seed data for Sunny."},{"attributes":{"referenceId":"AnimalActionRef136"},"RecordType":{"DeveloperName":"Enrichment"},"animalos__Animal__c":"@AnimalRef46","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-04-02T20:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-04-02T20:20:00.000+0000","animalos__Description__c":"Completed enrichment activity. Historical seed data for Lulu (Owner Surrender)."},{"attributes":{"referenceId":"AnimalActionRef137"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef46","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-04-04T19:00:00.000+0000","animalos__Description__c":"Observation review overdue. Historical overdue seed data for Lulu."},{"attributes":{"referenceId":"AnimalActionRef138"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef46","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-12T10:00:00.000+0000","animalos__Description__c":"Upcoming weigh-in to monitor condition. Upcoming seed data for Lulu.","animalos__Weight_KG__c":4.1},{"attributes":{"referenceId":"AnimalActionRef139"},"RecordType":{"DeveloperName":"Exercise"},"animalos__Animal__c":"@AnimalRef47","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-04-04T21:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-04-04T21:20:00.000+0000","animalos__Description__c":"Completed exercise session. Historical seed data for Chester (Owner Surrender).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef140"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef47","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-04-06T20:00:00.000+0000","animalos__Description__c":"Follow-up weigh-in pending. Historical overdue seed data for Chester.","animalos__Weight_KG__c":27.8},{"attributes":{"referenceId":"AnimalActionRef141"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef47","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-13T11:00:00.000+0000","animalos__Description__c":"Upcoming welfare observation. Upcoming seed data for Chester."},{"attributes":{"referenceId":"AnimalActionRef142"},"RecordType":{"DeveloperName":"Exercise"},"animalos__Animal__c":"@AnimalRef48","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-04-06T18:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-04-06T18:20:00.000+0000","animalos__Description__c":"Completed exercise session. Historical seed data for Blue (Returns).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef143"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef48","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-04-08T17:00:00.000+0000","animalos__Description__c":"Follow-up weigh-in pending. Historical overdue seed data for Blue.","animalos__Weight_KG__c":31.4},{"attributes":{"referenceId":"AnimalActionRef144"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef48","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-08T09:00:00.000+0000","animalos__Description__c":"Upcoming welfare observation. Upcoming seed data for Blue."},{"attributes":{"referenceId":"AnimalActionRef145"},"RecordType":{"DeveloperName":"Enrichment"},"animalos__Animal__c":"@AnimalRef49","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-04-08T19:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-04-08T19:20:00.000+0000","animalos__Description__c":"Completed enrichment activity. Historical seed data for Phoebe (Owner Surrender)."},{"attributes":{"referenceId":"AnimalActionRef146"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef49","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-04-10T18:00:00.000+0000","animalos__Description__c":"Observation review overdue. Historical overdue seed data for Phoebe."},{"attributes":{"referenceId":"AnimalActionRef147"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef49","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-09T10:00:00.000+0000","animalos__Description__c":"Upcoming weigh-in to monitor condition. Upcoming seed data for Phoebe.","animalos__Weight_KG__c":3.9},{"attributes":{"referenceId":"AnimalActionRef148"},"RecordType":{"DeveloperName":"Nutrition"},"animalos__Animal__c":"@AnimalRef50","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-04-10T20:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-04-10T20:20:00.000+0000","animalos__Description__c":"Completed nutrition check. Historical seed data for Remy (Owner Surrender).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef149"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef50","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-04-12T19:00:00.000+0000","animalos__Description__c":"Weight review overdue. Historical overdue seed data for Remy.","animalos__Weight_KG__c":2.1},{"attributes":{"referenceId":"AnimalActionRef150"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef50","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-10T11:00:00.000+0000","animalos__Description__c":"Upcoming care observation. Upcoming seed data for Remy."}]}');

// schemas/JobActivityAnimals.json (10 records)
groupTypes.add('animalos__Job_Activity_Animal__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"JobActivityAnimalRef1"},"animalos__Job_Activity__c":"@JobActivityRef1","animalos__Animal__c":"@AnimalRef1"},{"attributes":{"referenceId":"JobActivityAnimalRef2"},"animalos__Job_Activity__c":"@JobActivityRef2","animalos__Animal__c":"@AnimalRef2"},{"attributes":{"referenceId":"JobActivityAnimalRef3"},"animalos__Job_Activity__c":"@JobActivityRef3","animalos__Animal__c":"@AnimalRef3"},{"attributes":{"referenceId":"JobActivityAnimalRef4"},"animalos__Job_Activity__c":"@JobActivityRef4","animalos__Animal__c":"@AnimalRef4"},{"attributes":{"referenceId":"JobActivityAnimalRef5"},"animalos__Job_Activity__c":"@JobActivityRef5","animalos__Animal__c":"@AnimalRef5"},{"attributes":{"referenceId":"JobActivityAnimalRef6"},"animalos__Job_Activity__c":"@JobActivityRef6","animalos__Animal__c":"@AnimalRef6"},{"attributes":{"referenceId":"JobActivityAnimalRef7"},"animalos__Job_Activity__c":"@JobActivityRef7","animalos__Animal__c":"@AnimalRef7"},{"attributes":{"referenceId":"JobActivityAnimalRef8"},"animalos__Job_Activity__c":"@JobActivityRef8","animalos__Animal__c":"@AnimalRef8"},{"attributes":{"referenceId":"JobActivityAnimalRef9"},"animalos__Job_Activity__c":"@JobActivityRef9","animalos__Animal__c":"@AnimalRef9"},{"attributes":{"referenceId":"JobActivityAnimalRef10"},"animalos__Job_Activity__c":"@JobActivityRef10","animalos__Animal__c":"@AnimalRef10"}]}');

// schemas/Movements.json (32 records)
groupTypes.add('animalos__Movement__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"MovementRef1"},"animalos__Animal__c":"@AnimalRef1","animalos__Location__c":"@UnitRef1","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-01-10T09:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef2"},"animalos__Animal__c":"@AnimalRef2","animalos__Location__c":"@UnitRef2","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-03-28T14:30:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef3"},"animalos__Animal__c":"@AnimalRef3","animalos__Location__c":"@UnitRef3","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-02-05T10:15:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef4"},"animalos__Animal__c":"@AnimalRef4","animalos__Location__c":"@UnitRef4","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-01-20T11:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef5"},"animalos__Animal__c":"@AnimalRef5","animalos__Location__c":"@UnitRef5","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-03-15T08:45:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef6"},"animalos__Animal__c":"@AnimalRef6","animalos__Location__c":"@UnitRef5","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-02-28T13:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef7"},"animalos__Animal__c":"@AnimalRef7","animalos__Location__c":"@UnitRef1","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-02-10T09:30:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef8"},"animalos__Animal__c":"@AnimalRef8","animalos__Location__c":"@UnitRef4","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-03-01T10:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef9"},"animalos__Animal__c":"@AnimalRef9","animalos__Location__c":"@UnitRef2","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-01-17T10:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef10"},"animalos__Animal__c":"@AnimalRef10","animalos__Location__c":"@UnitRef1","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-01-19T11:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef11"},"animalos__Animal__c":"@AnimalRef11","animalos__Location__c":"@UnitRef4","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-01-21T12:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef12"},"animalos__Animal__c":"@AnimalRef12","animalos__Location__c":"@UnitRef3","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-01-23T09:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef13"},"animalos__Animal__c":"@AnimalRef13","animalos__Location__c":"@UnitRef5","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-01-25T10:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef14"},"animalos__Animal__c":"@AnimalRef14","animalos__Location__c":"@UnitRef5","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-01-27T11:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef15"},"animalos__Animal__c":"@AnimalRef15","animalos__Location__c":"@UnitRef2","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-01-29T12:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef16"},"animalos__Animal__c":"@AnimalRef16","animalos__Location__c":"@UnitRef1","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-01-31T09:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef17"},"animalos__Animal__c":"@AnimalRef17","animalos__Location__c":"@UnitRef4","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-02-02T10:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef18"},"animalos__Animal__c":"@AnimalRef18","animalos__Location__c":"@UnitRef3","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-02-04T11:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef19"},"animalos__Animal__c":"@AnimalRef19","animalos__Location__c":"@UnitRef2","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-02-06T12:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef20"},"animalos__Animal__c":"@AnimalRef20","animalos__Location__c":"@UnitRef1","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-02-08T09:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef21"},"animalos__Animal__c":"@AnimalRef21","animalos__Location__c":"@UnitRef4","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-02-10T10:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef22"},"animalos__Animal__c":"@AnimalRef22","animalos__Location__c":"@UnitRef1","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-02-12T11:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef23"},"animalos__Animal__c":"@AnimalRef23","animalos__Location__c":"@UnitRef5","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-02-14T12:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef24"},"animalos__Animal__c":"@AnimalRef24","animalos__Location__c":"@UnitRef1","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-02-16T09:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef25"},"animalos__Animal__c":"@AnimalRef25","animalos__Location__c":"@UnitRef4","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-02-18T10:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef26"},"animalos__Animal__c":"@AnimalRef26","animalos__Location__c":"@UnitRef1","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-02-20T11:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef27"},"animalos__Animal__c":"@AnimalRef27","animalos__Location__c":"@UnitRef4","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-02-22T12:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef28"},"animalos__Animal__c":"@AnimalRef28","animalos__Location__c":"@UnitRef1","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-02-24T09:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef29"},"animalos__Animal__c":"@AnimalRef29","animalos__Location__c":"@UnitRef5","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-02-26T10:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef30"},"animalos__Animal__c":"@AnimalRef30","animalos__Location__c":"@UnitRef5","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-02-28T11:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef31"},"animalos__Animal__c":"@AnimalRef31","animalos__Location__c":"@UnitRef2","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-03-02T12:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef32"},"animalos__Animal__c":"@AnimalRef32","animalos__Location__c":"@UnitRef1","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-03-04T09:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"}]}');

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

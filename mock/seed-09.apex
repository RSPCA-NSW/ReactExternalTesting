// Seed mock data into an org — part 9 of 12.
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

Integer partNumber = 9;
Integer totalParts = 12;

List<String> groupTypes = new List<String>();
List<String> groupJson = new List<String>();

// schemas/AnimalActions.json (55 records)
groupTypes.add('animalos__Animal_Action__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"AnimalActionRef12"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef4","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-12T10:00:00.000+0000","animalos__Description__c":"Upcoming weigh-in to monitor condition. Upcoming seed data for Milo.","animalos__Weight_KG__c":5.1},{"attributes":{"referenceId":"AnimalActionRef13"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef5","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-03-16T17:45:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-03-16T18:05:00.000+0000","animalos__Description__c":"Completed care observation. Historical seed data for Kiwi (Owner Surrender)."},{"attributes":{"referenceId":"AnimalActionRef14"},"RecordType":{"DeveloperName":"Treatment"},"animalos__Animal__c":"@AnimalRef5","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-03-18T16:45:00.000+0000","animalos__Description__c":"Follow-up treatment action overdue. Historical overdue seed data for Kiwi."},{"attributes":{"referenceId":"AnimalActionRef15"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef5","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-13T11:00:00.000+0000","animalos__Description__c":"Upcoming care observation. Upcoming seed data for Kiwi."},{"attributes":{"referenceId":"AnimalActionRef16"},"RecordType":{"DeveloperName":"Nutrition"},"animalos__Animal__c":"@AnimalRef6","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-03-01T22:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-03-01T22:20:00.000+0000","animalos__Description__c":"Completed nutrition check. Historical seed data for Pepper (Owner Surrender).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef17"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef6","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-03-03T21:00:00.000+0000","animalos__Description__c":"Weight review overdue. Historical overdue seed data for Pepper.","animalos__Weight_KG__c":1.8},{"attributes":{"referenceId":"AnimalActionRef18"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef6","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-08T09:00:00.000+0000","animalos__Description__c":"Upcoming care observation. Upcoming seed data for Pepper."},{"attributes":{"referenceId":"AnimalActionRef19"},"RecordType":{"DeveloperName":"Exercise"},"animalos__Animal__c":"@AnimalRef7","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-02-11T18:30:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-02-11T18:50:00.000+0000","animalos__Description__c":"Completed exercise session. Historical seed data for Rocky (Returns).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef20"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef7","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-02-13T17:30:00.000+0000","animalos__Description__c":"Follow-up weigh-in pending. Historical overdue seed data for Rocky.","animalos__Weight_KG__c":18.5},{"attributes":{"referenceId":"AnimalActionRef21"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef7","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-09T10:00:00.000+0000","animalos__Description__c":"Upcoming welfare observation. Upcoming seed data for Rocky."},{"attributes":{"referenceId":"AnimalActionRef22"},"RecordType":{"DeveloperName":"Enrichment"},"animalos__Animal__c":"@AnimalRef8","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-03-02T19:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-03-02T19:20:00.000+0000","animalos__Description__c":"Completed enrichment activity. Historical seed data for Whiskers (Stray)."},{"attributes":{"referenceId":"AnimalActionRef23"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef8","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-03-04T18:00:00.000+0000","animalos__Description__c":"Observation review overdue. Historical overdue seed data for Whiskers."},{"attributes":{"referenceId":"AnimalActionRef24"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef8","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-10T11:00:00.000+0000","animalos__Description__c":"Upcoming weigh-in to monitor condition. Upcoming seed data for Whiskers.","animalos__Weight_KG__c":3.8},{"attributes":{"referenceId":"AnimalActionRef25"},"RecordType":{"DeveloperName":"Exercise"},"animalos__Animal__c":"@AnimalRef9","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-01-18T19:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-01-18T19:20:00.000+0000","animalos__Description__c":"Completed exercise session. Historical seed data for Daisy (Owner Surrender).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef26"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef9","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-01-20T18:00:00.000+0000","animalos__Description__c":"Follow-up weigh-in pending. Historical overdue seed data for Daisy.","animalos__Weight_KG__c":18.2},{"attributes":{"referenceId":"AnimalActionRef27"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef9","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-11T09:00:00.000+0000","animalos__Description__c":"Upcoming welfare observation. Upcoming seed data for Daisy."},{"attributes":{"referenceId":"AnimalActionRef28"},"RecordType":{"DeveloperName":"Exercise"},"animalos__Animal__c":"@AnimalRef10","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-01-20T20:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-01-20T20:20:00.000+0000","animalos__Description__c":"Completed exercise session. Historical seed data for Charlie (Stray).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef29"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef10","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-01-22T19:00:00.000+0000","animalos__Description__c":"Follow-up weigh-in pending. Historical overdue seed data for Charlie.","animalos__Weight_KG__c":22.5},{"attributes":{"referenceId":"AnimalActionRef30"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef10","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-12T10:00:00.000+0000","animalos__Description__c":"Upcoming welfare observation. Upcoming seed data for Charlie."},{"attributes":{"referenceId":"AnimalActionRef31"},"RecordType":{"DeveloperName":"Enrichment"},"animalos__Animal__c":"@AnimalRef11","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-01-22T21:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-01-22T21:20:00.000+0000","animalos__Description__c":"Completed enrichment activity. Historical seed data for Coco (Owner Surrender)."},{"attributes":{"referenceId":"AnimalActionRef32"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef11","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-01-24T20:00:00.000+0000","animalos__Description__c":"Observation review overdue. Historical overdue seed data for Coco."},{"attributes":{"referenceId":"AnimalActionRef33"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef11","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-13T11:00:00.000+0000","animalos__Description__c":"Upcoming weigh-in to monitor condition. Upcoming seed data for Coco.","animalos__Weight_KG__c":4.8},{"attributes":{"referenceId":"AnimalActionRef34"},"RecordType":{"DeveloperName":"Enrichment"},"animalos__Animal__c":"@AnimalRef12","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-01-24T18:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-01-24T18:20:00.000+0000","animalos__Description__c":"Completed enrichment activity. Historical seed data for Archie (Owner Surrender)."},{"attributes":{"referenceId":"AnimalActionRef35"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef12","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-01-26T17:00:00.000+0000","animalos__Description__c":"Observation review overdue. Historical overdue seed data for Archie."},{"attributes":{"referenceId":"AnimalActionRef36"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef12","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-08T09:00:00.000+0000","animalos__Description__c":"Upcoming weigh-in to monitor condition. Upcoming seed data for Archie.","animalos__Weight_KG__c":5.0},{"attributes":{"referenceId":"AnimalActionRef37"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef13","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-01-26T19:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-01-26T19:20:00.000+0000","animalos__Description__c":"Completed care observation. Historical seed data for Hazel (Owner Surrender)."},{"attributes":{"referenceId":"AnimalActionRef38"},"RecordType":{"DeveloperName":"Treatment"},"animalos__Animal__c":"@AnimalRef13","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-01-28T18:00:00.000+0000","animalos__Description__c":"Follow-up treatment action overdue. Historical overdue seed data for Hazel."},{"attributes":{"referenceId":"AnimalActionRef39"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef13","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-09T10:00:00.000+0000","animalos__Description__c":"Upcoming care observation. Upcoming seed data for Hazel."},{"attributes":{"referenceId":"AnimalActionRef40"},"RecordType":{"DeveloperName":"Nutrition"},"animalos__Animal__c":"@AnimalRef14","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-01-28T20:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-01-28T20:20:00.000+0000","animalos__Description__c":"Completed nutrition check. Historical seed data for Ollie (Owner Surrender).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef41"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef14","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-01-30T19:00:00.000+0000","animalos__Description__c":"Weight review overdue. Historical overdue seed data for Ollie.","animalos__Weight_KG__c":2.1},{"attributes":{"referenceId":"AnimalActionRef42"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef14","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-10T11:00:00.000+0000","animalos__Description__c":"Upcoming care observation. Upcoming seed data for Ollie."},{"attributes":{"referenceId":"AnimalActionRef43"},"RecordType":{"DeveloperName":"Exercise"},"animalos__Animal__c":"@AnimalRef15","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-01-30T21:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-01-30T21:20:00.000+0000","animalos__Description__c":"Completed exercise session. Historical seed data for Ruby (Returns).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef44"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef15","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-02-01T20:00:00.000+0000","animalos__Description__c":"Follow-up weigh-in pending. Historical overdue seed data for Ruby.","animalos__Weight_KG__c":18.2},{"attributes":{"referenceId":"AnimalActionRef45"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef15","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-11T09:00:00.000+0000","animalos__Description__c":"Upcoming welfare observation. Upcoming seed data for Ruby."},{"attributes":{"referenceId":"AnimalActionRef46"},"RecordType":{"DeveloperName":"Exercise"},"animalos__Animal__c":"@AnimalRef16","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-02-01T18:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-02-01T18:20:00.000+0000","animalos__Description__c":"Completed exercise session. Historical seed data for Toby (Owner Surrender).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef47"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef16","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-02-03T17:00:00.000+0000","animalos__Description__c":"Follow-up weigh-in pending. Historical overdue seed data for Toby.","animalos__Weight_KG__c":22.5},{"attributes":{"referenceId":"AnimalActionRef48"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef16","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-12T10:00:00.000+0000","animalos__Description__c":"Upcoming welfare observation. Upcoming seed data for Toby."},{"attributes":{"referenceId":"AnimalActionRef49"},"RecordType":{"DeveloperName":"Enrichment"},"animalos__Animal__c":"@AnimalRef17","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-02-03T19:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-02-03T19:20:00.000+0000","animalos__Description__c":"Completed enrichment activity. Historical seed data for Nala (Stray)."},{"attributes":{"referenceId":"AnimalActionRef50"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef17","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-02-05T18:00:00.000+0000","animalos__Description__c":"Observation review overdue. Historical overdue seed data for Nala."},{"attributes":{"referenceId":"AnimalActionRef51"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef17","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-13T11:00:00.000+0000","animalos__Description__c":"Upcoming weigh-in to monitor condition. Upcoming seed data for Nala.","animalos__Weight_KG__c":4.8},{"attributes":{"referenceId":"AnimalActionRef52"},"RecordType":{"DeveloperName":"Enrichment"},"animalos__Animal__c":"@AnimalRef18","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-02-05T20:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-02-05T20:20:00.000+0000","animalos__Description__c":"Completed enrichment activity. Historical seed data for Jasper (Owner Surrender)."},{"attributes":{"referenceId":"AnimalActionRef53"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef18","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-02-07T19:00:00.000+0000","animalos__Description__c":"Observation review overdue. Historical overdue seed data for Jasper."},{"attributes":{"referenceId":"AnimalActionRef54"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef18","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-08T09:00:00.000+0000","animalos__Description__c":"Upcoming weigh-in to monitor condition. Upcoming seed data for Jasper.","animalos__Weight_KG__c":5.0},{"attributes":{"referenceId":"AnimalActionRef55"},"RecordType":{"DeveloperName":"Exercise"},"animalos__Animal__c":"@AnimalRef19","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-02-07T21:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-02-07T21:20:00.000+0000","animalos__Description__c":"Completed exercise session. Historical seed data for Poppy (Owner Surrender).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef56"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef19","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-02-09T20:00:00.000+0000","animalos__Description__c":"Follow-up weigh-in pending. Historical overdue seed data for Poppy.","animalos__Weight_KG__c":15.9},{"attributes":{"referenceId":"AnimalActionRef57"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef19","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-09T10:00:00.000+0000","animalos__Description__c":"Upcoming welfare observation. Upcoming seed data for Poppy."},{"attributes":{"referenceId":"AnimalActionRef58"},"RecordType":{"DeveloperName":"Exercise"},"animalos__Animal__c":"@AnimalRef20","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-02-09T18:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-02-09T18:20:00.000+0000","animalos__Description__c":"Completed exercise session. Historical seed data for Leo (Stray).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef59"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef20","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-02-11T17:00:00.000+0000","animalos__Description__c":"Follow-up weigh-in pending. Historical overdue seed data for Leo.","animalos__Weight_KG__c":24.7},{"attributes":{"referenceId":"AnimalActionRef60"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef20","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-10T11:00:00.000+0000","animalos__Description__c":"Upcoming welfare observation. Upcoming seed data for Leo."},{"attributes":{"referenceId":"AnimalActionRef61"},"RecordType":{"DeveloperName":"Enrichment"},"animalos__Animal__c":"@AnimalRef21","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-02-11T19:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-02-11T19:20:00.000+0000","animalos__Description__c":"Completed enrichment activity. Historical seed data for Willow (Owner Surrender)."},{"attributes":{"referenceId":"AnimalActionRef62"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef21","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-02-13T18:00:00.000+0000","animalos__Description__c":"Observation review overdue. Historical overdue seed data for Willow."},{"attributes":{"referenceId":"AnimalActionRef63"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef21","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-11T09:00:00.000+0000","animalos__Description__c":"Upcoming weigh-in to monitor condition. Upcoming seed data for Willow.","animalos__Weight_KG__c":3.4},{"attributes":{"referenceId":"AnimalActionRef64"},"RecordType":{"DeveloperName":"Exercise"},"animalos__Animal__c":"@AnimalRef22","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-02-13T20:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-02-13T20:20:00.000+0000","animalos__Description__c":"Completed exercise session. Historical seed data for Finn (Owner Surrender).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef65"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef22","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-02-15T19:00:00.000+0000","animalos__Description__c":"Follow-up weigh-in pending. Historical overdue seed data for Finn.","animalos__Weight_KG__c":22.5},{"attributes":{"referenceId":"AnimalActionRef66"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef22","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-12T10:00:00.000+0000","animalos__Description__c":"Upcoming welfare observation. Upcoming seed data for Finn."}]}');

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

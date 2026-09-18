// Seed mock data into an org — part 10 of 12.
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

Integer partNumber = 10;
Integer totalParts = 12;

List<String> groupTypes = new List<String>();
List<String> groupJson = new List<String>();

// schemas/AnimalActions.json (55 records)
groupTypes.add('animalos__Animal_Action__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"AnimalActionRef67"},"RecordType":{"DeveloperName":"Nutrition"},"animalos__Animal__c":"@AnimalRef23","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-02-15T21:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-02-15T21:20:00.000+0000","animalos__Description__c":"Completed nutrition check. Historical seed data for Rosie (Owner Surrender).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef68"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef23","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-02-17T20:00:00.000+0000","animalos__Description__c":"Weight review overdue. Historical overdue seed data for Rosie.","animalos__Weight_KG__c":2.1},{"attributes":{"referenceId":"AnimalActionRef69"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef23","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-13T11:00:00.000+0000","animalos__Description__c":"Upcoming care observation. Upcoming seed data for Rosie."},{"attributes":{"referenceId":"AnimalActionRef70"},"RecordType":{"DeveloperName":"Exercise"},"animalos__Animal__c":"@AnimalRef24","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-02-17T18:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-02-17T18:20:00.000+0000","animalos__Description__c":"Completed exercise session. Historical seed data for Scout (Returns).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef71"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef24","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-02-19T17:00:00.000+0000","animalos__Description__c":"Follow-up weigh-in pending. Historical overdue seed data for Scout.","animalos__Weight_KG__c":31.4},{"attributes":{"referenceId":"AnimalActionRef72"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef24","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-08T09:00:00.000+0000","animalos__Description__c":"Upcoming welfare observation. Upcoming seed data for Scout."},{"attributes":{"referenceId":"AnimalActionRef73"},"RecordType":{"DeveloperName":"Enrichment"},"animalos__Animal__c":"@AnimalRef25","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-02-19T19:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-02-19T19:20:00.000+0000","animalos__Description__c":"Completed enrichment activity. Historical seed data for Cleo (Stray)."},{"attributes":{"referenceId":"AnimalActionRef74"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef25","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-02-21T18:00:00.000+0000","animalos__Description__c":"Observation review overdue. Historical overdue seed data for Cleo."},{"attributes":{"referenceId":"AnimalActionRef75"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef25","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-09T10:00:00.000+0000","animalos__Description__c":"Upcoming weigh-in to monitor condition. Upcoming seed data for Cleo.","animalos__Weight_KG__c":3.9},{"attributes":{"referenceId":"AnimalActionRef76"},"RecordType":{"DeveloperName":"Exercise"},"animalos__Animal__c":"@AnimalRef26","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-02-21T20:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-02-21T20:20:00.000+0000","animalos__Description__c":"Completed exercise session. Historical seed data for Bruno (Owner Surrender).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef77"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef26","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-02-23T19:00:00.000+0000","animalos__Description__c":"Follow-up weigh-in pending. Historical overdue seed data for Bruno.","animalos__Weight_KG__c":24.7},{"attributes":{"referenceId":"AnimalActionRef78"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef26","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-10T11:00:00.000+0000","animalos__Description__c":"Upcoming welfare observation. Upcoming seed data for Bruno."},{"attributes":{"referenceId":"AnimalActionRef79"},"RecordType":{"DeveloperName":"Enrichment"},"animalos__Animal__c":"@AnimalRef27","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-02-23T21:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-02-23T21:20:00.000+0000","animalos__Description__c":"Completed enrichment activity. Historical seed data for Maisie (Owner Surrender)."},{"attributes":{"referenceId":"AnimalActionRef80"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef27","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-02-25T20:00:00.000+0000","animalos__Description__c":"Observation review overdue. Historical overdue seed data for Maisie."},{"attributes":{"referenceId":"AnimalActionRef81"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef27","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-11T09:00:00.000+0000","animalos__Description__c":"Upcoming weigh-in to monitor condition. Upcoming seed data for Maisie.","animalos__Weight_KG__c":3.4},{"attributes":{"referenceId":"AnimalActionRef82"},"RecordType":{"DeveloperName":"Exercise"},"animalos__Animal__c":"@AnimalRef28","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-02-25T18:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-02-25T18:20:00.000+0000","animalos__Description__c":"Completed exercise session. Historical seed data for Oscar (Stray).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef83"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef28","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-02-27T17:00:00.000+0000","animalos__Description__c":"Follow-up weigh-in pending. Historical overdue seed data for Oscar.","animalos__Weight_KG__c":22.5},{"attributes":{"referenceId":"AnimalActionRef84"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef28","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-12T10:00:00.000+0000","animalos__Description__c":"Upcoming welfare observation. Upcoming seed data for Oscar."},{"attributes":{"referenceId":"AnimalActionRef85"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef29","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-02-27T19:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-02-27T19:20:00.000+0000","animalos__Description__c":"Completed care observation. Historical seed data for Bonnie (Owner Surrender)."},{"attributes":{"referenceId":"AnimalActionRef86"},"RecordType":{"DeveloperName":"Treatment"},"animalos__Animal__c":"@AnimalRef29","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-03-01T18:00:00.000+0000","animalos__Description__c":"Follow-up treatment action overdue. Historical overdue seed data for Bonnie."},{"attributes":{"referenceId":"AnimalActionRef87"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef29","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-13T11:00:00.000+0000","animalos__Description__c":"Upcoming care observation. Upcoming seed data for Bonnie."},{"attributes":{"referenceId":"AnimalActionRef88"},"RecordType":{"DeveloperName":"Nutrition"},"animalos__Animal__c":"@AnimalRef30","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-03-01T20:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-03-01T20:20:00.000+0000","animalos__Description__c":"Completed nutrition check. Historical seed data for Teddy (Owner Surrender).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef89"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef30","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-03-03T19:00:00.000+0000","animalos__Description__c":"Weight review overdue. Historical overdue seed data for Teddy.","animalos__Weight_KG__c":1.6},{"attributes":{"referenceId":"AnimalActionRef90"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef30","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-08T09:00:00.000+0000","animalos__Description__c":"Upcoming care observation. Upcoming seed data for Teddy."},{"attributes":{"referenceId":"AnimalActionRef91"},"RecordType":{"DeveloperName":"Exercise"},"animalos__Animal__c":"@AnimalRef31","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-03-03T21:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-03-03T21:20:00.000+0000","animalos__Description__c":"Completed exercise session. Historical seed data for Maple (Returns).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef92"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef31","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-03-05T20:00:00.000+0000","animalos__Description__c":"Follow-up weigh-in pending. Historical overdue seed data for Maple.","animalos__Weight_KG__c":15.9},{"attributes":{"referenceId":"AnimalActionRef93"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef31","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-09T10:00:00.000+0000","animalos__Description__c":"Upcoming welfare observation. Upcoming seed data for Maple."},{"attributes":{"referenceId":"AnimalActionRef94"},"RecordType":{"DeveloperName":"Exercise"},"animalos__Animal__c":"@AnimalRef32","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-03-05T18:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-03-05T18:20:00.000+0000","animalos__Description__c":"Completed exercise session. Historical seed data for Gus (Owner Surrender).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef95"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef32","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-03-07T17:00:00.000+0000","animalos__Description__c":"Follow-up weigh-in pending. Historical overdue seed data for Gus.","animalos__Weight_KG__c":24.7},{"attributes":{"referenceId":"AnimalActionRef96"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef32","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-10T11:00:00.000+0000","animalos__Description__c":"Upcoming welfare observation. Upcoming seed data for Gus."},{"attributes":{"referenceId":"AnimalActionRef97"},"RecordType":{"DeveloperName":"Enrichment"},"animalos__Animal__c":"@AnimalRef33","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-03-07T19:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-03-07T19:20:00.000+0000","animalos__Description__c":"Completed enrichment activity. Historical seed data for Millie (Owner Surrender)."},{"attributes":{"referenceId":"AnimalActionRef98"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef33","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-03-09T18:00:00.000+0000","animalos__Description__c":"Observation review overdue. Historical overdue seed data for Millie."},{"attributes":{"referenceId":"AnimalActionRef99"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef33","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-11T09:00:00.000+0000","animalos__Description__c":"Upcoming weigh-in to monitor condition. Upcoming seed data for Millie.","animalos__Weight_KG__c":3.4},{"attributes":{"referenceId":"AnimalActionRef100"},"RecordType":{"DeveloperName":"Exercise"},"animalos__Animal__c":"@AnimalRef34","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-03-09T20:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-03-09T20:20:00.000+0000","animalos__Description__c":"Completed exercise session. Historical seed data for Winston (Owner Surrender).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef101"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef34","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-03-11T19:00:00.000+0000","animalos__Description__c":"Follow-up weigh-in pending. Historical overdue seed data for Winston.","animalos__Weight_KG__c":22.5},{"attributes":{"referenceId":"AnimalActionRef102"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef34","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-12T10:00:00.000+0000","animalos__Description__c":"Upcoming welfare observation. Upcoming seed data for Winston."},{"attributes":{"referenceId":"AnimalActionRef103"},"RecordType":{"DeveloperName":"Enrichment"},"animalos__Animal__c":"@AnimalRef35","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-03-11T21:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-03-11T21:20:00.000+0000","animalos__Description__c":"Completed enrichment activity. Historical seed data for Frankie (Stray)."},{"attributes":{"referenceId":"AnimalActionRef104"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef35","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-03-13T20:00:00.000+0000","animalos__Description__c":"Observation review overdue. Historical overdue seed data for Frankie."},{"attributes":{"referenceId":"AnimalActionRef105"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef35","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-13T11:00:00.000+0000","animalos__Description__c":"Upcoming weigh-in to monitor condition. Upcoming seed data for Frankie.","animalos__Weight_KG__c":4.8},{"attributes":{"referenceId":"AnimalActionRef106"},"RecordType":{"DeveloperName":"Enrichment"},"animalos__Animal__c":"@AnimalRef36","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-03-13T18:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-03-13T18:20:00.000+0000","animalos__Description__c":"Completed enrichment activity. Historical seed data for Olive (Owner Surrender)."},{"attributes":{"referenceId":"AnimalActionRef107"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef36","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-03-15T17:00:00.000+0000","animalos__Description__c":"Observation review overdue. Historical overdue seed data for Olive."},{"attributes":{"referenceId":"AnimalActionRef108"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef36","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-08T09:00:00.000+0000","animalos__Description__c":"Upcoming weigh-in to monitor condition. Upcoming seed data for Olive.","animalos__Weight_KG__c":5.0},{"attributes":{"referenceId":"AnimalActionRef109"},"RecordType":{"DeveloperName":"Exercise"},"animalos__Animal__c":"@AnimalRef37","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-03-15T19:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-03-15T19:20:00.000+0000","animalos__Description__c":"Completed exercise session. Historical seed data for Harvey (Stray).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef110"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef37","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-03-17T18:00:00.000+0000","animalos__Description__c":"Follow-up weigh-in pending. Historical overdue seed data for Harvey.","animalos__Weight_KG__c":15.9},{"attributes":{"referenceId":"AnimalActionRef111"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef37","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-09T10:00:00.000+0000","animalos__Description__c":"Upcoming welfare observation. Upcoming seed data for Harvey."},{"attributes":{"referenceId":"AnimalActionRef112"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef38","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-03-17T20:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-03-17T20:20:00.000+0000","animalos__Description__c":"Completed care observation. Historical seed data for Ziggy (Owner Surrender)."},{"attributes":{"referenceId":"AnimalActionRef113"},"RecordType":{"DeveloperName":"Treatment"},"animalos__Animal__c":"@AnimalRef38","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-03-19T19:00:00.000+0000","animalos__Description__c":"Follow-up treatment action overdue. Historical overdue seed data for Ziggy."},{"attributes":{"referenceId":"AnimalActionRef114"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef38","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-10T11:00:00.000+0000","animalos__Description__c":"Upcoming care observation. Upcoming seed data for Ziggy."},{"attributes":{"referenceId":"AnimalActionRef115"},"RecordType":{"DeveloperName":"Enrichment"},"animalos__Animal__c":"@AnimalRef39","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-03-19T21:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-03-19T21:20:00.000+0000","animalos__Description__c":"Completed enrichment activity. Historical seed data for Ginger (Owner Surrender)."},{"attributes":{"referenceId":"AnimalActionRef116"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef39","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-03-21T20:00:00.000+0000","animalos__Description__c":"Observation review overdue. Historical overdue seed data for Ginger."},{"attributes":{"referenceId":"AnimalActionRef117"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef39","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-11T09:00:00.000+0000","animalos__Description__c":"Upcoming weigh-in to monitor condition. Upcoming seed data for Ginger.","animalos__Weight_KG__c":3.4},{"attributes":{"referenceId":"AnimalActionRef118"},"RecordType":{"DeveloperName":"Exercise"},"animalos__Animal__c":"@AnimalRef40","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-03-21T18:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-03-21T18:20:00.000+0000","animalos__Description__c":"Completed exercise session. Historical seed data for Baxter (Returns).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef119"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef40","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-03-23T17:00:00.000+0000","animalos__Description__c":"Follow-up weigh-in pending. Historical overdue seed data for Baxter.","animalos__Weight_KG__c":22.5},{"attributes":{"referenceId":"AnimalActionRef120"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef40","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-12T10:00:00.000+0000","animalos__Description__c":"Upcoming welfare observation. Upcoming seed data for Baxter."},{"attributes":{"referenceId":"AnimalActionRef121"},"RecordType":{"DeveloperName":"Nutrition"},"animalos__Animal__c":"@AnimalRef41","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-03-23T19:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-03-23T19:20:00.000+0000","animalos__Description__c":"Completed nutrition check. Historical seed data for Mochi (Owner Surrender).","animalos__Time_Of_Day__c":"Breakfast"}]}');

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

// Seed mock data into an org — part 8 of 12.
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

Integer partNumber = 8;
Integer totalParts = 12;

List<String> groupTypes = new List<String>();
List<String> groupJson = new List<String>();

// schemas/JobActivities.json (10 records)
groupTypes.add('animalos__Job_Activity__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"JobActivityRef1"},"animalos__Job__c":"@JobRef1","animalos__Subject__c":"Initial review for 00365308","animalos__Type_of_Work__c":"Inspection","animalos__Job_Classification__c":"Routine","animalos__Start_Date_Time__c":"2026-03-28T09:20:00.000+0000","animalos__End_Date_Time__c":"2026-03-28T10:35:00.000+0000","animalos__Due_Date__c":"2026-03-30T08:20:00.000+0000","animalos__Description__c":"<p>Seeded activity for job 00365308: Animal Welfare - Other - Cat x1.</p>","animalos__Direction__c":"Document findings and update the case record with the next recommended step."},{"attributes":{"referenceId":"JobActivityRef2"},"animalos__Job__c":"@JobRef2","animalos__Subject__c":"Initial review for 00365310","animalos__Type_of_Work__c":"Inspection","animalos__Job_Classification__c":"High Vigilance","animalos__Start_Date_Time__c":"2026-03-29T09:40:00.000+0000","animalos__End_Date_Time__c":"2026-03-29T10:55:00.000+0000","animalos__Due_Date__c":"2026-03-31T08:40:00.000+0000","animalos__Description__c":"<p>Seeded activity for job 00365310: Animal Welfare - Food & Water, Dead - Cattle x10.</p>","animalos__Direction__c":"Document findings and update the case record with the next recommended step."},{"attributes":{"referenceId":"JobActivityRef3"},"animalos__Job__c":"@JobRef3","animalos__Subject__c":"Initial review for 00365311","animalos__Type_of_Work__c":"Other","animalos__Job_Classification__c":"Routine","animalos__Start_Date_Time__c":"2026-03-30T10:00:00.000+0000","animalos__End_Date_Time__c":"2026-03-30T11:15:00.000+0000","animalos__Due_Date__c":"2026-04-01T09:00:00.000+0000","animalos__Description__c":"<p>Seeded activity for job 00365311: Proactive Job Animal Welfare - Breeder - Cat x1,Dog x1.</p>","animalos__Direction__c":"Document findings and update the case record with the next recommended step."},{"attributes":{"referenceId":"JobActivityRef4"},"animalos__Job__c":"@JobRef4","animalos__Subject__c":"Initial review for 00365313","animalos__Type_of_Work__c":"Inspection","animalos__Job_Classification__c":"High Vigilance","animalos__Start_Date_Time__c":"2026-03-31T10:20:00.000+0000","animalos__End_Date_Time__c":"2026-03-31T11:35:00.000+0000","animalos__Due_Date__c":"2026-04-02T09:20:00.000+0000","animalos__Description__c":"<p>Seeded activity for job 00365313: Animal Welfare - Food & Water, Unattended 24hrs - Cat x1.</p>","animalos__Direction__c":"Document findings and update the case record with the next recommended step."},{"attributes":{"referenceId":"JobActivityRef5"},"animalos__Job__c":"@JobRef5","animalos__Subject__c":"Initial review for 00365314","animalos__Type_of_Work__c":"Inspection","animalos__Job_Classification__c":"High Vigilance","animalos__Start_Date_Time__c":"2026-04-01T10:40:00.000+0000","animalos__End_Date_Time__c":"2026-04-01T11:55:00.000+0000","animalos__Due_Date__c":"2026-04-03T09:40:00.000+0000","animalos__Description__c":"<p>Seeded activity for job 00365314: Animal Welfare - Food & Water - Dog x4.</p>","animalos__Direction__c":"Document findings and update the case record with the next recommended step."},{"attributes":{"referenceId":"JobActivityRef6"},"animalos__Job__c":"@JobRef6","animalos__Subject__c":"Initial review for 00365315","animalos__Type_of_Work__c":"Inspection","animalos__Job_Classification__c":"High Vigilance","animalos__Start_Date_Time__c":"2026-04-02T11:00:00.000+0000","animalos__End_Date_Time__c":"2026-04-02T12:15:00.000+0000","animalos__Due_Date__c":"2026-04-04T10:00:00.000+0000","animalos__Description__c":"<p>Seeded activity for job 00365315: Animal Welfare - Dead, Ill Treatment - Dog x1.</p>","animalos__Direction__c":"Document findings and update the case record with the next recommended step."},{"attributes":{"referenceId":"JobActivityRef7"},"animalos__Job__c":"@JobRef7","animalos__Subject__c":"Initial review for 00365316","animalos__Type_of_Work__c":"Inspection","animalos__Job_Classification__c":"High Vigilance","animalos__Start_Date_Time__c":"2026-04-03T11:20:00.000+0000","animalos__End_Date_Time__c":"2026-04-03T12:35:00.000+0000","animalos__Due_Date__c":"2026-04-05T10:20:00.000+0000","animalos__Description__c":"<p>Seeded activity for job 00365316: Animal Welfare - Locked In Car - Dog x1.</p>","animalos__Direction__c":"Document findings and update the case record with the next recommended step."},{"attributes":{"referenceId":"JobActivityRef8"},"animalos__Job__c":"@JobRef8","animalos__Subject__c":"Initial review for 00365317","animalos__Type_of_Work__c":"Inspection","animalos__Job_Classification__c":"High Vigilance","animalos__Start_Date_Time__c":"2026-04-04T11:40:00.000+0000","animalos__End_Date_Time__c":"2026-04-04T12:55:00.000+0000","animalos__Due_Date__c":"2026-04-06T10:40:00.000+0000","animalos__Description__c":"<p>Seeded activity for job 00365317: Animal Welfare - Abandoned - Cat x2.</p>","animalos__Direction__c":"Document findings and update the case record with the next recommended step."},{"attributes":{"referenceId":"JobActivityRef9"},"animalos__Job__c":"@JobRef9","animalos__Subject__c":"Initial review for 00365318","animalos__Type_of_Work__c":"Inspection","animalos__Job_Classification__c":"High Vigilance","animalos__Start_Date_Time__c":"2026-04-05T12:00:00.000+0000","animalos__End_Date_Time__c":"2026-04-05T13:15:00.000+0000","animalos__Due_Date__c":"2026-04-07T11:00:00.000+0000","animalos__Description__c":"<p>Seeded activity for job 00365318: Animal Welfare - Shelter Inadequate, Food & Water - Rabbit x6.</p>","animalos__Direction__c":"Document findings and update the case record with the next recommended step."},{"attributes":{"referenceId":"JobActivityRef10"},"animalos__Job__c":"@JobRef10","animalos__Subject__c":"Initial review for 00365319","animalos__Type_of_Work__c":"Other","animalos__Job_Classification__c":"Routine","animalos__Start_Date_Time__c":"2026-04-06T12:20:00.000+0000","animalos__End_Date_Time__c":"2026-04-06T13:35:00.000+0000","animalos__Due_Date__c":"2026-04-08T11:20:00.000+0000","animalos__Description__c":"<p>Seeded activity for job 00365319: Proactive Job Animal Welfare - Kennel Inspection - Dog x12.</p>","animalos__Direction__c":"Document findings and update the case record with the next recommended step."}]}');

// schemas/JobStatusTrackings.json (10 records)
groupTypes.add('animalos__Job_Status_Tracking__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"JobStatusTrackingRef1"},"animalos__Job__c":"@JobRef1","animalos__Status__c":"Assigned","animalos__Start_Date_Time__c":"2026-03-28T08:20:00.000+0000"},{"attributes":{"referenceId":"JobStatusTrackingRef2"},"animalos__Job__c":"@JobRef2","animalos__Status__c":"Assigned","animalos__Start_Date_Time__c":"2026-03-29T08:40:00.000+0000"},{"attributes":{"referenceId":"JobStatusTrackingRef3"},"animalos__Job__c":"@JobRef3","animalos__Status__c":"New","animalos__Start_Date_Time__c":"2026-03-30T09:00:00.000+0000"},{"attributes":{"referenceId":"JobStatusTrackingRef4"},"animalos__Job__c":"@JobRef4","animalos__Status__c":"Attended","animalos__Start_Date_Time__c":"2026-03-31T09:20:00.000+0000"},{"attributes":{"referenceId":"JobStatusTrackingRef5"},"animalos__Job__c":"@JobRef5","animalos__Status__c":"Assigned","animalos__Start_Date_Time__c":"2026-04-01T09:40:00.000+0000"},{"attributes":{"referenceId":"JobStatusTrackingRef6"},"animalos__Job__c":"@JobRef6","animalos__Status__c":"Awaiting Recheck","animalos__Start_Date_Time__c":"2026-04-02T10:00:00.000+0000"},{"attributes":{"referenceId":"JobStatusTrackingRef7"},"animalos__Job__c":"@JobRef7","animalos__Status__c":"Assigned","animalos__Start_Date_Time__c":"2026-04-03T10:20:00.000+0000"},{"attributes":{"referenceId":"JobStatusTrackingRef8"},"animalos__Job__c":"@JobRef8","animalos__Status__c":"Awaiting Further Information","animalos__Start_Date_Time__c":"2026-04-04T10:40:00.000+0000"},{"attributes":{"referenceId":"JobStatusTrackingRef9"},"animalos__Job__c":"@JobRef9","animalos__Status__c":"Assigned","animalos__Start_Date_Time__c":"2026-04-05T11:00:00.000+0000"},{"attributes":{"referenceId":"JobStatusTrackingRef10"},"animalos__Job__c":"@JobRef10","animalos__Status__c":"Finalised","animalos__Start_Date_Time__c":"2026-04-06T11:20:00.000+0000"}]}');

// schemas/JobRoles.json (10 records)
groupTypes.add('animalos__Job_Role__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"JobRoleRef1"},"animalos__Job__c":"@JobRef1","animalos__Role__c":"Animal Officer","animalos__Start_Date__c":"2026-03-28"},{"attributes":{"referenceId":"JobRoleRef2"},"animalos__Job__c":"@JobRef2","animalos__Role__c":"Case Worker","animalos__Start_Date__c":"2026-03-29"},{"attributes":{"referenceId":"JobRoleRef3"},"animalos__Job__c":"@JobRef3","animalos__Role__c":"Animal Officer","animalos__Start_Date__c":"2026-03-30"},{"attributes":{"referenceId":"JobRoleRef4"},"animalos__Job__c":"@JobRef4","animalos__Role__c":"Case Worker","animalos__Start_Date__c":"2026-03-31"},{"attributes":{"referenceId":"JobRoleRef5"},"animalos__Job__c":"@JobRef5","animalos__Role__c":"Animal Officer","animalos__Start_Date__c":"2026-04-01"},{"attributes":{"referenceId":"JobRoleRef6"},"animalos__Job__c":"@JobRef6","animalos__Role__c":"Case Worker","animalos__Start_Date__c":"2026-04-02"},{"attributes":{"referenceId":"JobRoleRef7"},"animalos__Job__c":"@JobRef7","animalos__Role__c":"Animal Officer","animalos__Start_Date__c":"2026-04-03"},{"attributes":{"referenceId":"JobRoleRef8"},"animalos__Job__c":"@JobRef8","animalos__Role__c":"Case Worker","animalos__Start_Date__c":"2026-04-04"},{"attributes":{"referenceId":"JobRoleRef9"},"animalos__Job__c":"@JobRef9","animalos__Role__c":"Animal Officer","animalos__Start_Date__c":"2026-04-05"},{"attributes":{"referenceId":"JobRoleRef10"},"animalos__Job__c":"@JobRef10","animalos__Role__c":"Case Worker","animalos__Start_Date__c":"2026-04-06"}]}');

// schemas/JobNotes.json (10 records)
groupTypes.add('animalos__Job_Note__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"JobNoteRef1"},"animalos__Job__c":"@JobRef1","animalos__Client__c":"@ContactRef1","animalos__Subject__c":"Case note for 00365308","animalos__Flag__c":"Information","animalos__Type_Of_Interaction__c":"Inbound Phone Call","animalos__Interaction_Date_Time__c":"2026-03-28T08:30:00.000+0000","animalos__Content__c":"<p>Seeded note for job 00365308. Summary: Animal Welfare - Other - Cat x1.</p>"},{"attributes":{"referenceId":"JobNoteRef2"},"animalos__Job__c":"@JobRef2","animalos__Client__c":"@ContactRef2","animalos__Subject__c":"Case note for 00365310","animalos__Flag__c":"Warning","animalos__Type_Of_Interaction__c":"Email","animalos__Interaction_Date_Time__c":"2026-03-29T08:50:00.000+0000","animalos__Content__c":"<p>Seeded note for job 00365310. Summary: Animal Welfare - Food & Water, Dead - Cattle x10.</p>"},{"attributes":{"referenceId":"JobNoteRef3"},"animalos__Job__c":"@JobRef3","animalos__Client__c":"@ContactRef3","animalos__Subject__c":"Case note for 00365311","animalos__Flag__c":"Information","animalos__Type_Of_Interaction__c":"Inbound Phone Call","animalos__Interaction_Date_Time__c":"2026-03-30T09:10:00.000+0000","animalos__Content__c":"<p>Seeded note for job 00365311. Summary: Proactive Job Animal Welfare - Breeder - Cat x1,Dog x1.</p>"},{"attributes":{"referenceId":"JobNoteRef4"},"animalos__Job__c":"@JobRef4","animalos__Client__c":"@ContactRef1","animalos__Subject__c":"Case note for 00365313","animalos__Flag__c":"Warning","animalos__Type_Of_Interaction__c":"Email","animalos__Interaction_Date_Time__c":"2026-03-31T09:30:00.000+0000","animalos__Content__c":"<p>Seeded note for job 00365313. Summary: Animal Welfare - Food & Water, Unattended 24hrs - Cat x1.</p>"},{"attributes":{"referenceId":"JobNoteRef5"},"animalos__Job__c":"@JobRef5","animalos__Client__c":"@ContactRef2","animalos__Subject__c":"Case note for 00365314","animalos__Flag__c":"Warning","animalos__Type_Of_Interaction__c":"Inbound Phone Call","animalos__Interaction_Date_Time__c":"2026-04-01T09:50:00.000+0000","animalos__Content__c":"<p>Seeded note for job 00365314. Summary: Animal Welfare - Food & Water - Dog x4.</p>"},{"attributes":{"referenceId":"JobNoteRef6"},"animalos__Job__c":"@JobRef6","animalos__Client__c":"@ContactRef3","animalos__Subject__c":"Case note for 00365315","animalos__Flag__c":"Warning","animalos__Type_Of_Interaction__c":"Email","animalos__Interaction_Date_Time__c":"2026-04-02T10:10:00.000+0000","animalos__Content__c":"<p>Seeded note for job 00365315. Summary: Animal Welfare - Dead, Ill Treatment - Dog x1.</p>"},{"attributes":{"referenceId":"JobNoteRef7"},"animalos__Job__c":"@JobRef7","animalos__Client__c":"@ContactRef1","animalos__Subject__c":"Case note for 00365316","animalos__Flag__c":"Warning","animalos__Type_Of_Interaction__c":"Inbound Phone Call","animalos__Interaction_Date_Time__c":"2026-04-03T10:30:00.000+0000","animalos__Content__c":"<p>Seeded note for job 00365316. Summary: Animal Welfare - Locked In Car - Dog x1.</p>"},{"attributes":{"referenceId":"JobNoteRef8"},"animalos__Job__c":"@JobRef8","animalos__Client__c":"@ContactRef2","animalos__Subject__c":"Case note for 00365317","animalos__Flag__c":"Warning","animalos__Type_Of_Interaction__c":"Email","animalos__Interaction_Date_Time__c":"2026-04-04T10:50:00.000+0000","animalos__Content__c":"<p>Seeded note for job 00365317. Summary: Animal Welfare - Abandoned - Cat x2.</p>"},{"attributes":{"referenceId":"JobNoteRef9"},"animalos__Job__c":"@JobRef9","animalos__Client__c":"@ContactRef3","animalos__Subject__c":"Case note for 00365318","animalos__Flag__c":"Warning","animalos__Type_Of_Interaction__c":"Inbound Phone Call","animalos__Interaction_Date_Time__c":"2026-04-05T11:10:00.000+0000","animalos__Content__c":"<p>Seeded note for job 00365318. Summary: Animal Welfare - Shelter Inadequate, Food & Water - Rabbit x6.</p>"},{"attributes":{"referenceId":"JobNoteRef10"},"animalos__Job__c":"@JobRef10","animalos__Client__c":"@ContactRef1","animalos__Subject__c":"Case note for 00365319","animalos__Flag__c":"Information","animalos__Type_Of_Interaction__c":"Email","animalos__Interaction_Date_Time__c":"2026-04-06T11:30:00.000+0000","animalos__Content__c":"<p>Seeded note for job 00365319. Summary: Proactive Job Animal Welfare - Kennel Inspection - Dog x12.</p>"}]}');

// schemas/AnimalNotes.json (5 records)
groupTypes.add('animalos__Animal_Note__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"NoteRef1"},"RecordType":{"DeveloperName":"Animal_Note"},"animalos__Animal__c":"@AnimalRef1","animalos__Type__c":"Animal Care","animalos__Flag__c":"Information","animalos__Content__c":"Max is friendly with children and other dogs. Walks well on leash. Knows basic commands (sit, stay, shake). Would suit an active family.","animalos__Interaction_Date_Time__c":"2026-01-20T14:00:00.000+0000"},{"attributes":{"referenceId":"NoteRef2"},"RecordType":{"DeveloperName":"Animal_Note"},"animalos__Animal__c":"@AnimalRef2","animalos__Type__c":"Behaviour General","animalos__Flag__c":"Warning","animalos__Content__c":"Bella is nervous around loud noises and sudden movements. Requires a calm, quiet environment during her stray hold assessment period. Shows signs of previous neglect.","animalos__Interaction_Date_Time__c":"2026-03-29T09:30:00.000+0000"},{"attributes":{"referenceId":"NoteRef3"},"RecordType":{"DeveloperName":"Animal_Note"},"animalos__Animal__c":"@AnimalRef7","animalos__Type__c":"Behaviour Rehabilitation and Training","animalos__Flag__c":"Warning","animalos__Content__c":"Rocky displays leash reactivity towards other dogs. Currently on a desensitisation program with the behaviour team. Only experienced handlers should walk him. Progress is steady - reduced lunging distance from 5m to 2m.","animalos__Interaction_Date_Time__c":"2026-03-20T11:00:00.000+0000"},{"attributes":{"referenceId":"NoteRef4"},"RecordType":{"DeveloperName":"Block_Note"},"animalos__Block__c":"@BlockRef1","animalos__Type__c":"Block/Row","animalos__Flag__c":"Information","animalos__Content__c":"Deep clean of all kennels completed. New enrichment toys distributed. Water bowls replaced with anti-tip models.","animalos__Interaction_Date_Time__c":"2026-04-01T08:00:00.000+0000"},{"attributes":{"referenceId":"NoteRef5"},"RecordType":{"DeveloperName":"Animal_Note"},"animalos__Animal__c":"@AnimalRef8","animalos__Type__c":"Veterinary","animalos__Flag__c":"Critical","animalos__Content__c":"Whiskers diagnosed with mild upper respiratory infection on intake. Started on antibiotics. Must be isolated from other cats until cleared by vet. Recheck scheduled for 2026-04-10.","animalos__Interaction_Date_Time__c":"2026-03-02T15:00:00.000+0000"}]}');

// schemas/AnimalActions.json (11 records)
groupTypes.add('animalos__Animal_Action__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"AnimalActionRef1"},"RecordType":{"DeveloperName":"Exercise"},"animalos__Animal__c":"@AnimalRef1","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-01-11T18:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-01-11T18:20:00.000+0000","animalos__Description__c":"Completed exercise session. Historical seed data for Max (Owner Surrender).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef2"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef1","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-01-13T17:00:00.000+0000","animalos__Description__c":"Follow-up weigh-in pending. Historical overdue seed data for Max.","animalos__Weight_KG__c":30.5},{"attributes":{"referenceId":"AnimalActionRef3"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef1","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-09T10:00:00.000+0000","animalos__Description__c":"Upcoming welfare observation. Upcoming seed data for Max."},{"attributes":{"referenceId":"AnimalActionRef4"},"RecordType":{"DeveloperName":"Exercise"},"animalos__Animal__c":"@AnimalRef2","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-03-29T23:30:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-03-29T23:50:00.000+0000","animalos__Description__c":"Completed exercise session. Historical seed data for Bella (Stray).","animalos__Time_Of_Day__c":"Breakfast"},{"attributes":{"referenceId":"AnimalActionRef5"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef2","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-03-31T22:30:00.000+0000","animalos__Description__c":"Follow-up weigh-in pending. Historical overdue seed data for Bella.","animalos__Weight_KG__c":28.0},{"attributes":{"referenceId":"AnimalActionRef6"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef2","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-10T11:00:00.000+0000","animalos__Description__c":"Upcoming welfare observation. Upcoming seed data for Bella."},{"attributes":{"referenceId":"AnimalActionRef7"},"RecordType":{"DeveloperName":"Enrichment"},"animalos__Animal__c":"@AnimalRef3","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-02-06T19:15:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-02-06T19:35:00.000+0000","animalos__Description__c":"Completed enrichment activity. Historical seed data for Luna (Owner Surrender)."},{"attributes":{"referenceId":"AnimalActionRef8"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef3","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-02-08T18:15:00.000+0000","animalos__Description__c":"Observation review overdue. Historical overdue seed data for Luna."},{"attributes":{"referenceId":"AnimalActionRef9"},"RecordType":{"DeveloperName":"Weigh_In"},"animalos__Animal__c":"@AnimalRef3","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-05-11T09:00:00.000+0000","animalos__Description__c":"Upcoming weigh-in to monitor condition. Upcoming seed data for Luna.","animalos__Weight_KG__c":4.2},{"attributes":{"referenceId":"AnimalActionRef10"},"RecordType":{"DeveloperName":"Enrichment"},"animalos__Animal__c":"@AnimalRef4","animalos__Action_Status__c":"Given","animalos__Date_Time_of_Action__c":"2026-01-21T20:00:00.000+0000","animalos__Date_Time_Action_Completed__c":"2026-01-21T20:20:00.000+0000","animalos__Description__c":"Completed enrichment activity. Historical seed data for Milo (Stray)."},{"attributes":{"referenceId":"AnimalActionRef11"},"RecordType":{"DeveloperName":"Daily_Observation"},"animalos__Animal__c":"@AnimalRef4","animalos__Action_Status__c":"Scheduled","animalos__Date_Time_of_Action__c":"2026-01-23T19:00:00.000+0000","animalos__Description__c":"Observation review overdue. Historical overdue seed data for Milo."}]}');

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

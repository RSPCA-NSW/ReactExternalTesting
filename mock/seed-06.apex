// Seed mock data into an org — part 6 of 12.
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

Integer partNumber = 6;
Integer totalParts = 12;

List<String> groupTypes = new List<String>();
List<String> groupJson = new List<String>();

// schemas/Referrals.json (34 records)
groupTypes.add('animalos__Referral__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"ReferralRef5"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Kiwi, a bird, entering care under shelter ID 053 0005.","animalos__Date_Collected__c":"2026-03-15","animalos__Scheduled_Date_Time__c":"2026-03-15T08:45:00.000+0000","animalos__Entry_Site__c":"@SiteRef2","animalos__Job__c":"@JobRef5","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef6"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Pepper, a rabbit, entering care under shelter ID 053 0006.","animalos__Date_Collected__c":"2026-02-28","animalos__Scheduled_Date_Time__c":"2026-02-28T13:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef2","animalos__Job__c":"@JobRef6","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef7"},"RecordType":{"DeveloperName":"Inbound_Return"},"animalos__Animal_Source__c":"Returns","animalos__Stage__c":"Completed","animalos__Priority__c":"Low","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound return referral for Rocky, a dog, re-entering care under shelter ID 053 0007.","animalos__Date_Collected__c":"2026-02-10","animalos__Scheduled_Date_Time__c":"2026-02-10T09:30:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef7","animalos__Contact__c":"@ContactRef2"},{"attributes":{"referenceId":"ReferralRef8"},"RecordType":{"DeveloperName":"Inbound_Stray"},"animalos__Animal_Source__c":"Stray","animalos__Stage__c":"Completed","animalos__Priority__c":"High","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound stray referral for Whiskers, a cat, entering care under shelter ID 053 0008.","animalos__Date_Collected__c":"2026-03-01","animalos__Scheduled_Date_Time__c":"2026-03-01T10:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef8","animalos__Contact__c":"@ContactRef1"},{"attributes":{"referenceId":"ReferralRef9"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Daisy, a dog, entering care under shelter ID 053 0009.","animalos__Date_Collected__c":"2026-01-17","animalos__Scheduled_Date_Time__c":"2026-01-17T10:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef9","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef10"},"RecordType":{"DeveloperName":"Inbound_Stray"},"animalos__Animal_Source__c":"Stray","animalos__Stage__c":"Completed","animalos__Priority__c":"High","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound stray referral for Charlie, a dog, entering care under shelter ID 053 0010.","animalos__Date_Collected__c":"2026-01-19","animalos__Scheduled_Date_Time__c":"2026-01-19T11:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef10","animalos__Contact__c":"@ContactRef1"},{"attributes":{"referenceId":"ReferralRef11"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Coco, a cat, entering care under shelter ID 053 0011.","animalos__Date_Collected__c":"2026-01-21","animalos__Scheduled_Date_Time__c":"2026-01-21T12:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef1","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef12"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Archie, a cat, entering care under shelter ID 053 0012.","animalos__Date_Collected__c":"2026-01-23","animalos__Scheduled_Date_Time__c":"2026-01-23T09:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef2","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef13"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Hazel, a bird, entering care under shelter ID 053 0013.","animalos__Date_Collected__c":"2026-01-25","animalos__Scheduled_Date_Time__c":"2026-01-25T10:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef2","animalos__Job__c":"@JobRef3","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef14"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Ollie, a rabbit, entering care under shelter ID 053 0014.","animalos__Date_Collected__c":"2026-01-27","animalos__Scheduled_Date_Time__c":"2026-01-27T11:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef2","animalos__Job__c":"@JobRef4","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef15"},"RecordType":{"DeveloperName":"Inbound_Return"},"animalos__Animal_Source__c":"Returns","animalos__Stage__c":"Completed","animalos__Priority__c":"Low","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound return referral for Ruby, a dog, re-entering care under shelter ID 053 0015.","animalos__Date_Collected__c":"2026-01-29","animalos__Scheduled_Date_Time__c":"2026-01-29T12:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef5","animalos__Contact__c":"@ContactRef2"},{"attributes":{"referenceId":"ReferralRef16"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Toby, a dog, entering care under shelter ID 053 0016.","animalos__Date_Collected__c":"2026-01-31","animalos__Scheduled_Date_Time__c":"2026-01-31T09:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef6","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef17"},"RecordType":{"DeveloperName":"Inbound_Stray"},"animalos__Animal_Source__c":"Stray","animalos__Stage__c":"Completed","animalos__Priority__c":"High","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound stray referral for Nala, a cat, entering care under shelter ID 053 0017.","animalos__Date_Collected__c":"2026-02-02","animalos__Scheduled_Date_Time__c":"2026-02-02T10:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef7","animalos__Contact__c":"@ContactRef1"},{"attributes":{"referenceId":"ReferralRef18"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Jasper, a cat, entering care under shelter ID 053 0018.","animalos__Date_Collected__c":"2026-02-04","animalos__Scheduled_Date_Time__c":"2026-02-04T11:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef8","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef19"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Poppy, a dog, entering care under shelter ID 053 0019.","animalos__Date_Collected__c":"2026-02-06","animalos__Scheduled_Date_Time__c":"2026-02-06T12:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef9","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef20"},"RecordType":{"DeveloperName":"Inbound_Stray"},"animalos__Animal_Source__c":"Stray","animalos__Stage__c":"Completed","animalos__Priority__c":"High","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound stray referral for Leo, a dog, entering care under shelter ID 053 0020.","animalos__Date_Collected__c":"2026-02-08","animalos__Scheduled_Date_Time__c":"2026-02-08T09:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef10","animalos__Contact__c":"@ContactRef1"},{"attributes":{"referenceId":"ReferralRef21"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Willow, a cat, entering care under shelter ID 053 0021.","animalos__Date_Collected__c":"2026-02-10","animalos__Scheduled_Date_Time__c":"2026-02-10T10:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef1","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef22"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Finn, a dog, entering care under shelter ID 053 0022.","animalos__Date_Collected__c":"2026-02-12","animalos__Scheduled_Date_Time__c":"2026-02-12T11:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef2","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef23"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Rosie, a rabbit, entering care under shelter ID 053 0023.","animalos__Date_Collected__c":"2026-02-14","animalos__Scheduled_Date_Time__c":"2026-02-14T12:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef2","animalos__Job__c":"@JobRef3","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef24"},"RecordType":{"DeveloperName":"Inbound_Return"},"animalos__Animal_Source__c":"Returns","animalos__Stage__c":"Completed","animalos__Priority__c":"Low","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound return referral for Scout, a dog, re-entering care under shelter ID 053 0024.","animalos__Date_Collected__c":"2026-02-16","animalos__Scheduled_Date_Time__c":"2026-02-16T09:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef4","animalos__Contact__c":"@ContactRef2"},{"attributes":{"referenceId":"ReferralRef25"},"RecordType":{"DeveloperName":"Inbound_Stray"},"animalos__Animal_Source__c":"Stray","animalos__Stage__c":"Completed","animalos__Priority__c":"High","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound stray referral for Cleo, a cat, entering care under shelter ID 053 0025.","animalos__Date_Collected__c":"2026-02-18","animalos__Scheduled_Date_Time__c":"2026-02-18T10:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef5","animalos__Contact__c":"@ContactRef1"},{"attributes":{"referenceId":"ReferralRef26"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Bruno, a dog, entering care under shelter ID 053 0026.","animalos__Date_Collected__c":"2026-02-20","animalos__Scheduled_Date_Time__c":"2026-02-20T11:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef6","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef27"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Maisie, a cat, entering care under shelter ID 053 0027.","animalos__Date_Collected__c":"2026-02-22","animalos__Scheduled_Date_Time__c":"2026-02-22T12:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef7","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef28"},"RecordType":{"DeveloperName":"Inbound_Stray"},"animalos__Animal_Source__c":"Stray","animalos__Stage__c":"Completed","animalos__Priority__c":"High","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound stray referral for Oscar, a dog, entering care under shelter ID 053 0028.","animalos__Date_Collected__c":"2026-02-24","animalos__Scheduled_Date_Time__c":"2026-02-24T09:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef8","animalos__Contact__c":"@ContactRef1"},{"attributes":{"referenceId":"ReferralRef29"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Bonnie, a bird, entering care under shelter ID 053 0029.","animalos__Date_Collected__c":"2026-02-26","animalos__Scheduled_Date_Time__c":"2026-02-26T10:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef2","animalos__Job__c":"@JobRef9","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef30"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Teddy, a rabbit, entering care under shelter ID 053 0030.","animalos__Date_Collected__c":"2026-02-28","animalos__Scheduled_Date_Time__c":"2026-02-28T11:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef2","animalos__Job__c":"@JobRef10","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef31"},"RecordType":{"DeveloperName":"Inbound_Return"},"animalos__Animal_Source__c":"Returns","animalos__Stage__c":"Completed","animalos__Priority__c":"Low","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound return referral for Maple, a dog, re-entering care under shelter ID 053 0031.","animalos__Date_Collected__c":"2026-03-02","animalos__Scheduled_Date_Time__c":"2026-03-02T12:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef1","animalos__Contact__c":"@ContactRef2"},{"attributes":{"referenceId":"ReferralRef32"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Gus, a dog, entering care under shelter ID 053 0032.","animalos__Date_Collected__c":"2026-03-04","animalos__Scheduled_Date_Time__c":"2026-03-04T09:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef2","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef33"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Millie, a cat, entering care under shelter ID 053 0033.","animalos__Date_Collected__c":"2026-03-06","animalos__Scheduled_Date_Time__c":"2026-03-06T10:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef3","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef34"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Winston, a dog, entering care under shelter ID 053 0034.","animalos__Date_Collected__c":"2026-03-08","animalos__Scheduled_Date_Time__c":"2026-03-08T11:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef4","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef35"},"RecordType":{"DeveloperName":"Inbound_Stray"},"animalos__Animal_Source__c":"Stray","animalos__Stage__c":"Completed","animalos__Priority__c":"High","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound stray referral for Frankie, a cat, entering care under shelter ID 053 0035.","animalos__Date_Collected__c":"2026-03-10","animalos__Scheduled_Date_Time__c":"2026-03-10T12:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef5","animalos__Contact__c":"@ContactRef1"},{"attributes":{"referenceId":"ReferralRef36"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Olive, a cat, entering care under shelter ID 053 0036.","animalos__Date_Collected__c":"2026-03-12","animalos__Scheduled_Date_Time__c":"2026-03-12T09:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef6","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef37"},"RecordType":{"DeveloperName":"Inbound_Stray"},"animalos__Animal_Source__c":"Stray","animalos__Stage__c":"Completed","animalos__Priority__c":"High","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound stray referral for Harvey, a dog, entering care under shelter ID 053 0037.","animalos__Date_Collected__c":"2026-03-14","animalos__Scheduled_Date_Time__c":"2026-03-14T10:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef7","animalos__Contact__c":"@ContactRef1"},{"attributes":{"referenceId":"ReferralRef38"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Ziggy, a bird, entering care under shelter ID 053 0038.","animalos__Date_Collected__c":"2026-03-16","animalos__Scheduled_Date_Time__c":"2026-03-16T11:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef2","animalos__Job__c":"@JobRef8","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"}]}');

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

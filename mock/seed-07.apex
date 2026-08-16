// Seed mock data into an org — part 7 of 12.
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

Integer partNumber = 7;
Integer totalParts = 12;

List<String> groupTypes = new List<String>();
List<String> groupJson = new List<String>();

// schemas/Referrals.json (12 records)
groupTypes.add('animalos__Referral__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"ReferralRef39"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Ginger, a cat, entering care under shelter ID 053 0039.","animalos__Date_Collected__c":"2026-03-18","animalos__Scheduled_Date_Time__c":"2026-03-18T12:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef9","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef40"},"RecordType":{"DeveloperName":"Inbound_Return"},"animalos__Animal_Source__c":"Returns","animalos__Stage__c":"Completed","animalos__Priority__c":"Low","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound return referral for Baxter, a dog, re-entering care under shelter ID 053 0040.","animalos__Date_Collected__c":"2026-03-20","animalos__Scheduled_Date_Time__c":"2026-03-20T09:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef10","animalos__Contact__c":"@ContactRef2"},{"attributes":{"referenceId":"ReferralRef41"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Mochi, a rabbit, entering care under shelter ID 053 0041.","animalos__Date_Collected__c":"2026-03-22","animalos__Scheduled_Date_Time__c":"2026-03-22T10:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef2","animalos__Job__c":"@JobRef1","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef42"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Marley, a dog, entering care under shelter ID 053 0042.","animalos__Date_Collected__c":"2026-03-24","animalos__Scheduled_Date_Time__c":"2026-03-24T11:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef2","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef43"},"RecordType":{"DeveloperName":"Inbound_Stray"},"animalos__Animal_Source__c":"Stray","animalos__Stage__c":"Completed","animalos__Priority__c":"High","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound stray referral for Piper, a cat, entering care under shelter ID 053 0043.","animalos__Date_Collected__c":"2026-03-26","animalos__Scheduled_Date_Time__c":"2026-03-26T12:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef3","animalos__Contact__c":"@ContactRef1"},{"attributes":{"referenceId":"ReferralRef44"},"RecordType":{"DeveloperName":"Inbound_Stray"},"animalos__Animal_Source__c":"Stray","animalos__Stage__c":"Completed","animalos__Priority__c":"High","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound stray referral for Murphy, a dog, entering care under shelter ID 053 0044.","animalos__Date_Collected__c":"2026-03-28","animalos__Scheduled_Date_Time__c":"2026-03-28T09:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef4","animalos__Contact__c":"@ContactRef1"},{"attributes":{"referenceId":"ReferralRef45"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Sunny, a bird, entering care under shelter ID 053 0045.","animalos__Date_Collected__c":"2026-03-30","animalos__Scheduled_Date_Time__c":"2026-03-30T10:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef2","animalos__Job__c":"@JobRef5","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef46"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Lulu, a cat, entering care under shelter ID 053 0046.","animalos__Date_Collected__c":"2026-04-01","animalos__Scheduled_Date_Time__c":"2026-04-01T11:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef6","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef47"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Chester, a dog, entering care under shelter ID 053 0047.","animalos__Date_Collected__c":"2026-04-03","animalos__Scheduled_Date_Time__c":"2026-04-03T12:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef7","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef48"},"RecordType":{"DeveloperName":"Inbound_Return"},"animalos__Animal_Source__c":"Returns","animalos__Stage__c":"Completed","animalos__Priority__c":"Low","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound return referral for Blue, a dog, re-entering care under shelter ID 053 0048.","animalos__Date_Collected__c":"2026-04-05","animalos__Scheduled_Date_Time__c":"2026-04-05T09:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef8","animalos__Contact__c":"@ContactRef2"},{"attributes":{"referenceId":"ReferralRef49"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Phoebe, a cat, entering care under shelter ID 053 0049.","animalos__Date_Collected__c":"2026-04-07","animalos__Scheduled_Date_Time__c":"2026-04-07T10:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef1","animalos__Job__c":"@JobRef9","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"},{"attributes":{"referenceId":"ReferralRef50"},"RecordType":{"DeveloperName":"Inbound_Surrender"},"animalos__Animal_Source__c":"Owner Surrender","animalos__Stage__c":"Completed","animalos__Priority__c":"Medium","animalos__Result__c":"Approved","animalos__Referral_Description__c":"Inbound surrender referral for Remy, a rabbit, entering care under shelter ID 053 0050.","animalos__Date_Collected__c":"2026-04-09","animalos__Scheduled_Date_Time__c":"2026-04-09T11:00:00.000+0000","animalos__Entry_Site__c":"@SiteRef2","animalos__Job__c":"@JobRef10","animalos__Contact__c":"@ContactRef2","animalos__Referral_Organisation__c":"@AccountRef3"}]}');

// schemas/AnimalReferrals.json (50 records)
groupTypes.add('animalos__Animal_Referral__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"AnimalReferralRef1"},"animalos__Animal__c":"@AnimalRef1","animalos__Referral__c":"@ReferralRef1","animalos__Job__c":"@JobRef1","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef1","animalos__Unit__c":"@UnitRef1"},{"attributes":{"referenceId":"AnimalReferralRef2"},"animalos__Animal__c":"@AnimalRef2","animalos__Referral__c":"@ReferralRef2","animalos__Job__c":"@JobRef2","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef1","animalos__Unit__c":"@UnitRef2"},{"attributes":{"referenceId":"AnimalReferralRef3"},"animalos__Animal__c":"@AnimalRef3","animalos__Referral__c":"@ReferralRef3","animalos__Job__c":"@JobRef3","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef2","animalos__Unit__c":"@UnitRef3"},{"attributes":{"referenceId":"AnimalReferralRef4"},"animalos__Animal__c":"@AnimalRef4","animalos__Referral__c":"@ReferralRef4","animalos__Job__c":"@JobRef4","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef2","animalos__Unit__c":"@UnitRef4"},{"attributes":{"referenceId":"AnimalReferralRef5"},"animalos__Animal__c":"@AnimalRef5","animalos__Referral__c":"@ReferralRef5","animalos__Job__c":"@JobRef5","animalos__Site__c":"@SiteRef2","animalos__Block__c":"@BlockRef3","animalos__Unit__c":"@UnitRef5"},{"attributes":{"referenceId":"AnimalReferralRef6"},"animalos__Animal__c":"@AnimalRef6","animalos__Referral__c":"@ReferralRef6","animalos__Job__c":"@JobRef6","animalos__Site__c":"@SiteRef2","animalos__Block__c":"@BlockRef3","animalos__Unit__c":"@UnitRef5"},{"attributes":{"referenceId":"AnimalReferralRef7"},"animalos__Animal__c":"@AnimalRef7","animalos__Referral__c":"@ReferralRef7","animalos__Job__c":"@JobRef7","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef1","animalos__Unit__c":"@UnitRef1"},{"attributes":{"referenceId":"AnimalReferralRef8"},"animalos__Animal__c":"@AnimalRef8","animalos__Referral__c":"@ReferralRef8","animalos__Job__c":"@JobRef8","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef2","animalos__Unit__c":"@UnitRef4"},{"attributes":{"referenceId":"AnimalReferralRef9"},"animalos__Animal__c":"@AnimalRef9","animalos__Referral__c":"@ReferralRef9","animalos__Job__c":"@JobRef9","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef1","animalos__Unit__c":"@UnitRef2"},{"attributes":{"referenceId":"AnimalReferralRef10"},"animalos__Animal__c":"@AnimalRef10","animalos__Referral__c":"@ReferralRef10","animalos__Job__c":"@JobRef10","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef1","animalos__Unit__c":"@UnitRef1"},{"attributes":{"referenceId":"AnimalReferralRef11"},"animalos__Animal__c":"@AnimalRef11","animalos__Referral__c":"@ReferralRef11","animalos__Job__c":"@JobRef1","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef2","animalos__Unit__c":"@UnitRef4"},{"attributes":{"referenceId":"AnimalReferralRef12"},"animalos__Animal__c":"@AnimalRef12","animalos__Referral__c":"@ReferralRef12","animalos__Job__c":"@JobRef2","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef2","animalos__Unit__c":"@UnitRef3"},{"attributes":{"referenceId":"AnimalReferralRef13"},"animalos__Animal__c":"@AnimalRef13","animalos__Referral__c":"@ReferralRef13","animalos__Job__c":"@JobRef3","animalos__Site__c":"@SiteRef2","animalos__Block__c":"@BlockRef3","animalos__Unit__c":"@UnitRef5"},{"attributes":{"referenceId":"AnimalReferralRef14"},"animalos__Animal__c":"@AnimalRef14","animalos__Referral__c":"@ReferralRef14","animalos__Job__c":"@JobRef4","animalos__Site__c":"@SiteRef2","animalos__Block__c":"@BlockRef3","animalos__Unit__c":"@UnitRef5"},{"attributes":{"referenceId":"AnimalReferralRef15"},"animalos__Animal__c":"@AnimalRef15","animalos__Referral__c":"@ReferralRef15","animalos__Job__c":"@JobRef5","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef1","animalos__Unit__c":"@UnitRef2"},{"attributes":{"referenceId":"AnimalReferralRef16"},"animalos__Animal__c":"@AnimalRef16","animalos__Referral__c":"@ReferralRef16","animalos__Job__c":"@JobRef6","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef1","animalos__Unit__c":"@UnitRef1"},{"attributes":{"referenceId":"AnimalReferralRef17"},"animalos__Animal__c":"@AnimalRef17","animalos__Referral__c":"@ReferralRef17","animalos__Job__c":"@JobRef7","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef2","animalos__Unit__c":"@UnitRef4"},{"attributes":{"referenceId":"AnimalReferralRef18"},"animalos__Animal__c":"@AnimalRef18","animalos__Referral__c":"@ReferralRef18","animalos__Job__c":"@JobRef8","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef2","animalos__Unit__c":"@UnitRef3"},{"attributes":{"referenceId":"AnimalReferralRef19"},"animalos__Animal__c":"@AnimalRef19","animalos__Referral__c":"@ReferralRef19","animalos__Job__c":"@JobRef9","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef1","animalos__Unit__c":"@UnitRef2"},{"attributes":{"referenceId":"AnimalReferralRef20"},"animalos__Animal__c":"@AnimalRef20","animalos__Referral__c":"@ReferralRef20","animalos__Job__c":"@JobRef10","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef1","animalos__Unit__c":"@UnitRef1"},{"attributes":{"referenceId":"AnimalReferralRef21"},"animalos__Animal__c":"@AnimalRef21","animalos__Referral__c":"@ReferralRef21","animalos__Job__c":"@JobRef1","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef2","animalos__Unit__c":"@UnitRef4"},{"attributes":{"referenceId":"AnimalReferralRef22"},"animalos__Animal__c":"@AnimalRef22","animalos__Referral__c":"@ReferralRef22","animalos__Job__c":"@JobRef2","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef1","animalos__Unit__c":"@UnitRef1"},{"attributes":{"referenceId":"AnimalReferralRef23"},"animalos__Animal__c":"@AnimalRef23","animalos__Referral__c":"@ReferralRef23","animalos__Job__c":"@JobRef3","animalos__Site__c":"@SiteRef2","animalos__Block__c":"@BlockRef3","animalos__Unit__c":"@UnitRef5"},{"attributes":{"referenceId":"AnimalReferralRef24"},"animalos__Animal__c":"@AnimalRef24","animalos__Referral__c":"@ReferralRef24","animalos__Job__c":"@JobRef4","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef1","animalos__Unit__c":"@UnitRef1"},{"attributes":{"referenceId":"AnimalReferralRef25"},"animalos__Animal__c":"@AnimalRef25","animalos__Referral__c":"@ReferralRef25","animalos__Job__c":"@JobRef5","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef2","animalos__Unit__c":"@UnitRef4"},{"attributes":{"referenceId":"AnimalReferralRef26"},"animalos__Animal__c":"@AnimalRef26","animalos__Referral__c":"@ReferralRef26","animalos__Job__c":"@JobRef6","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef1","animalos__Unit__c":"@UnitRef1"},{"attributes":{"referenceId":"AnimalReferralRef27"},"animalos__Animal__c":"@AnimalRef27","animalos__Referral__c":"@ReferralRef27","animalos__Job__c":"@JobRef7","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef2","animalos__Unit__c":"@UnitRef4"},{"attributes":{"referenceId":"AnimalReferralRef28"},"animalos__Animal__c":"@AnimalRef28","animalos__Referral__c":"@ReferralRef28","animalos__Job__c":"@JobRef8","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef1","animalos__Unit__c":"@UnitRef1"},{"attributes":{"referenceId":"AnimalReferralRef29"},"animalos__Animal__c":"@AnimalRef29","animalos__Referral__c":"@ReferralRef29","animalos__Job__c":"@JobRef9","animalos__Site__c":"@SiteRef2","animalos__Block__c":"@BlockRef3","animalos__Unit__c":"@UnitRef5"},{"attributes":{"referenceId":"AnimalReferralRef30"},"animalos__Animal__c":"@AnimalRef30","animalos__Referral__c":"@ReferralRef30","animalos__Job__c":"@JobRef10","animalos__Site__c":"@SiteRef2","animalos__Block__c":"@BlockRef3","animalos__Unit__c":"@UnitRef5"},{"attributes":{"referenceId":"AnimalReferralRef31"},"animalos__Animal__c":"@AnimalRef31","animalos__Referral__c":"@ReferralRef31","animalos__Job__c":"@JobRef1","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef1","animalos__Unit__c":"@UnitRef2"},{"attributes":{"referenceId":"AnimalReferralRef32"},"animalos__Animal__c":"@AnimalRef32","animalos__Referral__c":"@ReferralRef32","animalos__Job__c":"@JobRef2","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef1","animalos__Unit__c":"@UnitRef1"},{"attributes":{"referenceId":"AnimalReferralRef33"},"animalos__Animal__c":"@AnimalRef33","animalos__Referral__c":"@ReferralRef33","animalos__Job__c":"@JobRef3","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef2","animalos__Unit__c":"@UnitRef4"},{"attributes":{"referenceId":"AnimalReferralRef34"},"animalos__Animal__c":"@AnimalRef34","animalos__Referral__c":"@ReferralRef34","animalos__Job__c":"@JobRef4","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef1","animalos__Unit__c":"@UnitRef1"},{"attributes":{"referenceId":"AnimalReferralRef35"},"animalos__Animal__c":"@AnimalRef35","animalos__Referral__c":"@ReferralRef35","animalos__Job__c":"@JobRef5","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef2","animalos__Unit__c":"@UnitRef4"},{"attributes":{"referenceId":"AnimalReferralRef36"},"animalos__Animal__c":"@AnimalRef36","animalos__Referral__c":"@ReferralRef36","animalos__Job__c":"@JobRef6","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef2","animalos__Unit__c":"@UnitRef3"},{"attributes":{"referenceId":"AnimalReferralRef37"},"animalos__Animal__c":"@AnimalRef37","animalos__Referral__c":"@ReferralRef37","animalos__Job__c":"@JobRef7","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef1","animalos__Unit__c":"@UnitRef2"},{"attributes":{"referenceId":"AnimalReferralRef38"},"animalos__Animal__c":"@AnimalRef38","animalos__Referral__c":"@ReferralRef38","animalos__Job__c":"@JobRef8","animalos__Site__c":"@SiteRef2","animalos__Block__c":"@BlockRef3","animalos__Unit__c":"@UnitRef5"},{"attributes":{"referenceId":"AnimalReferralRef39"},"animalos__Animal__c":"@AnimalRef39","animalos__Referral__c":"@ReferralRef39","animalos__Job__c":"@JobRef9","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef2","animalos__Unit__c":"@UnitRef4"},{"attributes":{"referenceId":"AnimalReferralRef40"},"animalos__Animal__c":"@AnimalRef40","animalos__Referral__c":"@ReferralRef40","animalos__Job__c":"@JobRef10","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef1","animalos__Unit__c":"@UnitRef1"},{"attributes":{"referenceId":"AnimalReferralRef41"},"animalos__Animal__c":"@AnimalRef41","animalos__Referral__c":"@ReferralRef41","animalos__Job__c":"@JobRef1","animalos__Site__c":"@SiteRef2","animalos__Block__c":"@BlockRef3","animalos__Unit__c":"@UnitRef5"},{"attributes":{"referenceId":"AnimalReferralRef42"},"animalos__Animal__c":"@AnimalRef42","animalos__Referral__c":"@ReferralRef42","animalos__Job__c":"@JobRef2","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef1","animalos__Unit__c":"@UnitRef1"},{"attributes":{"referenceId":"AnimalReferralRef43"},"animalos__Animal__c":"@AnimalRef43","animalos__Referral__c":"@ReferralRef43","animalos__Job__c":"@JobRef3","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef2","animalos__Unit__c":"@UnitRef4"},{"attributes":{"referenceId":"AnimalReferralRef44"},"animalos__Animal__c":"@AnimalRef44","animalos__Referral__c":"@ReferralRef44","animalos__Job__c":"@JobRef4","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef1","animalos__Unit__c":"@UnitRef1"},{"attributes":{"referenceId":"AnimalReferralRef45"},"animalos__Animal__c":"@AnimalRef45","animalos__Referral__c":"@ReferralRef45","animalos__Job__c":"@JobRef5","animalos__Site__c":"@SiteRef2","animalos__Block__c":"@BlockRef3","animalos__Unit__c":"@UnitRef5"},{"attributes":{"referenceId":"AnimalReferralRef46"},"animalos__Animal__c":"@AnimalRef46","animalos__Referral__c":"@ReferralRef46","animalos__Job__c":"@JobRef6","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef2","animalos__Unit__c":"@UnitRef3"},{"attributes":{"referenceId":"AnimalReferralRef47"},"animalos__Animal__c":"@AnimalRef47","animalos__Referral__c":"@ReferralRef47","animalos__Job__c":"@JobRef7","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef1","animalos__Unit__c":"@UnitRef2"},{"attributes":{"referenceId":"AnimalReferralRef48"},"animalos__Animal__c":"@AnimalRef48","animalos__Referral__c":"@ReferralRef48","animalos__Job__c":"@JobRef8","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef1","animalos__Unit__c":"@UnitRef1"},{"attributes":{"referenceId":"AnimalReferralRef49"},"animalos__Animal__c":"@AnimalRef49","animalos__Referral__c":"@ReferralRef49","animalos__Job__c":"@JobRef9","animalos__Site__c":"@SiteRef1","animalos__Block__c":"@BlockRef2","animalos__Unit__c":"@UnitRef4"},{"attributes":{"referenceId":"AnimalReferralRef50"},"animalos__Animal__c":"@AnimalRef50","animalos__Referral__c":"@ReferralRef50","animalos__Job__c":"@JobRef10","animalos__Site__c":"@SiteRef2","animalos__Block__c":"@BlockRef3","animalos__Unit__c":"@UnitRef5"}]}');

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

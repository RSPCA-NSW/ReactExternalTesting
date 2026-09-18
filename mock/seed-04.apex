// Seed mock data into an org — part 4 of 12.
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

Integer partNumber = 4;
Integer totalParts = 12;

List<String> groupTypes = new List<String>();
List<String> groupJson = new List<String>();

// schemas/Animals.json (20 records)
groupTypes.add('animalos__Animal__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"AnimalRef13"},"animalos__Animal_Name__c":"Hazel","animalos__Type__c":"Bird","animalos__Class__c":"Domestic","animalos__Gender__c":"Female","animalos__Stage__c":"Processing","animalos__Status__c":"Awaiting Vet Exam/Health Check","animalos__Source__c":"Owner Surrender","animalos__Date_of_Birth__c":"2025-04-12","animalos__Incoming_Date__c":"2026-01-25T10:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-01-25","animalos__Age_Entered_Date__c":"2026-01-25","animalos__Estimated_Age__c":0,"animalos__Current_Weight__c":0.036,"animalos__Neutered_Spayed__c":false,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0013","animalos__Microchip_Number__c":"953000000000013","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"Blue","animalos__Primary_Breed__c":"@BreedRef5","animalos__Current_Site__c":"@SiteRef2","animalos__Current_Block__c":"@BlockRef3","animalos__Current_Unit__c":"@UnitRef5"},{"attributes":{"referenceId":"AnimalRef14"},"animalos__Animal_Name__c":"Ollie","animalos__Type__c":"Rabbit","animalos__Class__c":"Small Animal","animalos__Gender__c":"Male","animalos__Stage__c":"Adoption Ready","animalos__Status__c":"Available For Adoption","animalos__Source__c":"Owner Surrender","animalos__Date_of_Birth__c":"2025-07-17","animalos__Incoming_Date__c":"2026-01-27T11:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-01-27","animalos__Age_Entered_Date__c":"2026-01-27","animalos__Estimated_Age__c":1,"animalos__Current_Weight__c":2.1,"animalos__Neutered_Spayed__c":true,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0014","animalos__Microchip_Number__c":"953000000000014","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"Grey","animalos__Primary_Breed__c":"@BreedRef6","animalos__Current_Site__c":"@SiteRef2","animalos__Current_Block__c":"@BlockRef3","animalos__Current_Unit__c":"@UnitRef5"},{"attributes":{"referenceId":"AnimalRef15"},"animalos__Animal_Name__c":"Ruby","animalos__Type__c":"Dog","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Female","animalos__Stage__c":"Under Care","animalos__Status__c":"Under Behaviour Modification","animalos__Source__c":"Returns","animalos__Date_of_Birth__c":"2024-10-22","animalos__Incoming_Date__c":"2026-01-29T12:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-01-29","animalos__Age_Entered_Date__c":"2026-01-29","animalos__Estimated_Age__c":2,"animalos__Current_Weight__c":18.2,"animalos__Neutered_Spayed__c":true,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0015","animalos__Microchip_Number__c":"953000000000015","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"Black","animalos__Primary_Breed__c":"@BreedRef1","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef1","animalos__Current_Unit__c":"@UnitRef2","animalos__Behaviour_Flag_Condition__c":"Requires experienced handling and structured enrichment support."},{"attributes":{"referenceId":"AnimalRef16"},"animalos__Animal_Name__c":"Toby","animalos__Type__c":"Dog","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Male","animalos__Stage__c":"Adoption Ready","animalos__Status__c":"Available For Adoption","animalos__Source__c":"Owner Surrender","animalos__Date_of_Birth__c":"2023-01-27","animalos__Incoming_Date__c":"2026-01-31T09:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-01-31","animalos__Age_Entered_Date__c":"2026-01-31","animalos__Estimated_Age__c":3,"animalos__Current_Weight__c":22.5,"animalos__Neutered_Spayed__c":true,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0016","animalos__Microchip_Number__c":"953000000000016","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"Tan","animalos__Primary_Breed__c":"@BreedRef2","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef1","animalos__Current_Unit__c":"@UnitRef1"},{"attributes":{"referenceId":"AnimalRef17"},"animalos__Animal_Name__c":"Nala","animalos__Type__c":"Cat","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Female","animalos__Stage__c":"Processing","animalos__Status__c":"Awaiting Foster","animalos__Source__c":"Stray","animalos__Date_of_Birth__c":"2024-04-05","animalos__Incoming_Date__c":"2026-02-02T10:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-02-02","animalos__Age_Entered_Date__c":"2026-02-02","animalos__Estimated_Age__c":2,"animalos__Current_Weight__c":4.8,"animalos__Neutered_Spayed__c":true,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0017","animalos__Microchip_Number__c":"953000000000017","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"White","animalos__Primary_Breed__c":"@BreedRef8","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef2","animalos__Current_Unit__c":"@UnitRef4","animalos__Alert_Flag_Condition__c":"Monitor settling behaviour while foster placement is arranged."},{"attributes":{"referenceId":"AnimalRef18"},"animalos__Animal_Name__c":"Jasper","animalos__Type__c":"Cat","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Male","animalos__Stage__c":"Adoption Ready","animalos__Status__c":"Available For Adoption","animalos__Source__c":"Owner Surrender","animalos__Date_of_Birth__c":"2025-07-10","animalos__Incoming_Date__c":"2026-02-04T11:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-02-04","animalos__Age_Entered_Date__c":"2026-02-04","animalos__Estimated_Age__c":1,"animalos__Current_Weight__c":5.0,"animalos__Neutered_Spayed__c":true,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0018","animalos__Microchip_Number__c":"953000000000018","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"Tabby","animalos__Primary_Breed__c":"@BreedRef3","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef2","animalos__Current_Unit__c":"@UnitRef3"},{"attributes":{"referenceId":"AnimalRef19"},"animalos__Animal_Name__c":"Poppy","animalos__Type__c":"Dog","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Female","animalos__Stage__c":"Adoption Ready","animalos__Status__c":"Available For Adoption","animalos__Source__c":"Owner Surrender","animalos__Date_of_Birth__c":"2023-10-15","animalos__Incoming_Date__c":"2026-02-06T12:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-02-06","animalos__Age_Entered_Date__c":"2026-02-06","animalos__Estimated_Age__c":3,"animalos__Current_Weight__c":15.9,"animalos__Neutered_Spayed__c":true,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0019","animalos__Microchip_Number__c":"953000000000019","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"Brindle","animalos__Primary_Breed__c":"@BreedRef2","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef1","animalos__Current_Unit__c":"@UnitRef2"},{"attributes":{"referenceId":"AnimalRef20"},"animalos__Animal_Name__c":"Leo","animalos__Type__c":"Dog","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Male","animalos__Stage__c":"Processing","animalos__Status__c":"Stray Hold","animalos__Source__c":"Stray","animalos__Date_of_Birth__c":"2022-01-20","animalos__Incoming_Date__c":"2026-02-08T09:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-02-08","animalos__Age_Entered_Date__c":"2026-02-08","animalos__Estimated_Age__c":4,"animalos__Current_Weight__c":24.7,"animalos__Neutered_Spayed__c":false,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0020","animalos__Microchip_Number__c":"953000000000020","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"Chocolate","animalos__Primary_Breed__c":"@BreedRef7","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef1","animalos__Current_Unit__c":"@UnitRef1"},{"attributes":{"referenceId":"AnimalRef21"},"animalos__Animal_Name__c":"Willow","animalos__Type__c":"Cat","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Female","animalos__Stage__c":"Under Care","animalos__Status__c":"In Foster","animalos__Source__c":"Owner Surrender","animalos__Date_of_Birth__c":"2024-04-25","animalos__Incoming_Date__c":"2026-02-10T10:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-02-10","animalos__Age_Entered_Date__c":"2026-02-10","animalos__Estimated_Age__c":2,"animalos__Current_Weight__c":3.4,"animalos__Neutered_Spayed__c":true,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0021","animalos__Microchip_Number__c":"953000000000021","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"Grey Tabby","animalos__Primary_Breed__c":"@BreedRef3","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef2","animalos__Current_Unit__c":"@UnitRef4"},{"attributes":{"referenceId":"AnimalRef22"},"animalos__Animal_Name__c":"Finn","animalos__Type__c":"Dog","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Male","animalos__Stage__c":"Adoption Ready","animalos__Status__c":"Available For Adoption","animalos__Source__c":"Owner Surrender","animalos__Date_of_Birth__c":"2023-07-03","animalos__Incoming_Date__c":"2026-02-12T11:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-02-12","animalos__Age_Entered_Date__c":"2026-02-12","animalos__Estimated_Age__c":3,"animalos__Current_Weight__c":22.5,"animalos__Neutered_Spayed__c":true,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0022","animalos__Microchip_Number__c":"953000000000022","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"Tan","animalos__Primary_Breed__c":"@BreedRef2","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef1","animalos__Current_Unit__c":"@UnitRef1"},{"attributes":{"referenceId":"AnimalRef23"},"animalos__Animal_Name__c":"Rosie","animalos__Type__c":"Rabbit","animalos__Class__c":"Small Animal","animalos__Gender__c":"Female","animalos__Stage__c":"Adoption Ready","animalos__Status__c":"Available For Adoption","animalos__Source__c":"Owner Surrender","animalos__Date_of_Birth__c":"2025-10-08","animalos__Incoming_Date__c":"2026-02-14T12:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-02-14","animalos__Age_Entered_Date__c":"2026-02-14","animalos__Estimated_Age__c":1,"animalos__Current_Weight__c":2.1,"animalos__Neutered_Spayed__c":true,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0023","animalos__Microchip_Number__c":"953000000000023","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"Grey","animalos__Primary_Breed__c":"@BreedRef6","animalos__Current_Site__c":"@SiteRef2","animalos__Current_Block__c":"@BlockRef3","animalos__Current_Unit__c":"@UnitRef5"},{"attributes":{"referenceId":"AnimalRef24"},"animalos__Animal_Name__c":"Scout","animalos__Type__c":"Dog","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Male","animalos__Stage__c":"Under Care","animalos__Status__c":"Under Behaviour Modification","animalos__Source__c":"Returns","animalos__Date_of_Birth__c":"2024-01-13","animalos__Incoming_Date__c":"2026-02-16T09:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-02-16","animalos__Age_Entered_Date__c":"2026-02-16","animalos__Estimated_Age__c":2,"animalos__Current_Weight__c":31.4,"animalos__Neutered_Spayed__c":true,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0024","animalos__Microchip_Number__c":"953000000000024","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"Gold","animalos__Primary_Breed__c":"@BreedRef1","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef1","animalos__Current_Unit__c":"@UnitRef1","animalos__Behaviour_Flag_Condition__c":"Requires experienced handling and structured enrichment support."},{"attributes":{"referenceId":"AnimalRef25"},"animalos__Animal_Name__c":"Cleo","animalos__Type__c":"Cat","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Female","animalos__Stage__c":"Processing","animalos__Status__c":"Awaiting Foster","animalos__Source__c":"Stray","animalos__Date_of_Birth__c":"2024-04-18","animalos__Incoming_Date__c":"2026-02-18T10:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-02-18","animalos__Age_Entered_Date__c":"2026-02-18","animalos__Estimated_Age__c":2,"animalos__Current_Weight__c":3.9,"animalos__Neutered_Spayed__c":true,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0025","animalos__Microchip_Number__c":"953000000000025","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"Tortoiseshell","animalos__Primary_Breed__c":"@BreedRef4","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef2","animalos__Current_Unit__c":"@UnitRef4","animalos__Alert_Flag_Condition__c":"Monitor settling behaviour while foster placement is arranged."},{"attributes":{"referenceId":"AnimalRef26"},"animalos__Animal_Name__c":"Bruno","animalos__Type__c":"Dog","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Male","animalos__Stage__c":"Adoption Ready","animalos__Status__c":"Available For Adoption","animalos__Source__c":"Owner Surrender","animalos__Date_of_Birth__c":"2022-07-23","animalos__Incoming_Date__c":"2026-02-20T11:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-02-20","animalos__Age_Entered_Date__c":"2026-02-20","animalos__Estimated_Age__c":4,"animalos__Current_Weight__c":24.7,"animalos__Neutered_Spayed__c":true,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0026","animalos__Microchip_Number__c":"953000000000026","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"Chocolate","animalos__Primary_Breed__c":"@BreedRef7","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef1","animalos__Current_Unit__c":"@UnitRef1"},{"attributes":{"referenceId":"AnimalRef27"},"animalos__Animal_Name__c":"Maisie","animalos__Type__c":"Cat","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Female","animalos__Stage__c":"Adoption Ready","animalos__Status__c":"Available For Adoption","animalos__Source__c":"Owner Surrender","animalos__Date_of_Birth__c":"2024-10-01","animalos__Incoming_Date__c":"2026-02-22T12:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-02-22","animalos__Age_Entered_Date__c":"2026-02-22","animalos__Estimated_Age__c":2,"animalos__Current_Weight__c":3.4,"animalos__Neutered_Spayed__c":true,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0027","animalos__Microchip_Number__c":"953000000000027","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"Grey Tabby","animalos__Primary_Breed__c":"@BreedRef3","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef2","animalos__Current_Unit__c":"@UnitRef4"},{"attributes":{"referenceId":"AnimalRef28"},"animalos__Animal_Name__c":"Oscar","animalos__Type__c":"Dog","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Male","animalos__Stage__c":"Processing","animalos__Status__c":"Stray Hold","animalos__Source__c":"Stray","animalos__Date_of_Birth__c":"2023-01-06","animalos__Incoming_Date__c":"2026-02-24T09:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-02-24","animalos__Age_Entered_Date__c":"2026-02-24","animalos__Estimated_Age__c":3,"animalos__Current_Weight__c":22.5,"animalos__Neutered_Spayed__c":false,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0028","animalos__Microchip_Number__c":"953000000000028","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"Tan","animalos__Primary_Breed__c":"@BreedRef2","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef1","animalos__Current_Unit__c":"@UnitRef1"},{"attributes":{"referenceId":"AnimalRef29"},"animalos__Animal_Name__c":"Bonnie","animalos__Type__c":"Bird","animalos__Class__c":"Domestic","animalos__Gender__c":"Female","animalos__Stage__c":"Processing","animalos__Status__c":"Awaiting Vet Exam/Health Check","animalos__Source__c":"Owner Surrender","animalos__Date_of_Birth__c":"2025-04-11","animalos__Incoming_Date__c":"2026-02-26T10:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-02-26","animalos__Age_Entered_Date__c":"2026-02-26","animalos__Estimated_Age__c":0,"animalos__Current_Weight__c":0.041,"animalos__Neutered_Spayed__c":false,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0029","animalos__Microchip_Number__c":"953000000000029","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"Yellow","animalos__Primary_Breed__c":"@BreedRef5","animalos__Current_Site__c":"@SiteRef2","animalos__Current_Block__c":"@BlockRef3","animalos__Current_Unit__c":"@UnitRef5"},{"attributes":{"referenceId":"AnimalRef30"},"animalos__Animal_Name__c":"Teddy","animalos__Type__c":"Rabbit","animalos__Class__c":"Small Animal","animalos__Gender__c":"Male","animalos__Stage__c":"Adoption Ready","animalos__Status__c":"Available For Adoption","animalos__Source__c":"Owner Surrender","animalos__Date_of_Birth__c":"2025-07-16","animalos__Incoming_Date__c":"2026-02-28T11:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-02-28","animalos__Age_Entered_Date__c":"2026-02-28","animalos__Estimated_Age__c":1,"animalos__Current_Weight__c":1.6,"animalos__Neutered_Spayed__c":true,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0030","animalos__Microchip_Number__c":"953000000000030","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"White","animalos__Primary_Breed__c":"@BreedRef6","animalos__Current_Site__c":"@SiteRef2","animalos__Current_Block__c":"@BlockRef3","animalos__Current_Unit__c":"@UnitRef5"},{"attributes":{"referenceId":"AnimalRef31"},"animalos__Animal_Name__c":"Maple","animalos__Type__c":"Dog","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Female","animalos__Stage__c":"Under Care","animalos__Status__c":"Under Behaviour Modification","animalos__Source__c":"Returns","animalos__Date_of_Birth__c":"2023-10-21","animalos__Incoming_Date__c":"2026-03-02T12:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-03-02","animalos__Age_Entered_Date__c":"2026-03-02","animalos__Estimated_Age__c":3,"animalos__Current_Weight__c":15.9,"animalos__Neutered_Spayed__c":true,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0031","animalos__Microchip_Number__c":"953000000000031","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"Brindle","animalos__Primary_Breed__c":"@BreedRef2","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef1","animalos__Current_Unit__c":"@UnitRef2","animalos__Behaviour_Flag_Condition__c":"Requires experienced handling and structured enrichment support."},{"attributes":{"referenceId":"AnimalRef32"},"animalos__Animal_Name__c":"Gus","animalos__Type__c":"Dog","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Male","animalos__Stage__c":"Adoption Ready","animalos__Status__c":"Available For Adoption","animalos__Source__c":"Owner Surrender","animalos__Date_of_Birth__c":"2022-01-26","animalos__Incoming_Date__c":"2026-03-04T09:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-03-04","animalos__Age_Entered_Date__c":"2026-03-04","animalos__Estimated_Age__c":4,"animalos__Current_Weight__c":24.7,"animalos__Neutered_Spayed__c":true,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0032","animalos__Microchip_Number__c":"953000000000032","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"Chocolate","animalos__Primary_Breed__c":"@BreedRef7","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef1","animalos__Current_Unit__c":"@UnitRef1"}]}');

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

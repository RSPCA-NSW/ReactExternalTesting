// Seed mock data into an org — part 3 of 12.
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

Integer partNumber = 3;
Integer totalParts = 12;

List<String> groupTypes = new List<String>();
List<String> groupJson = new List<String>();

// schemas/Medicines.json (49 records)
groupTypes.add('animalos__Medicine__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"MedicineRef2"},"Name":"easOtic Ear Suspension","animalos__Type__c":"Medicine","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef3"},"Name":"AWAG - Animal Welfare Assessment Grid","animalos__Type__c":"Treatment","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef4"},"Name":"Hylo-Forte Eye Drops 2mg/mL","animalos__Type__c":"Medicine","animalos__Active__c":true,"animalos__Category__c":"Lubricant"},{"attributes":{"referenceId":"MedicineRef5"},"Name":"Ulcershield Oral Paste - Omeprazole 370 mg/g Buffered Paste","animalos__Type__c":"Medicine","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef6"},"Name":"Bute- Phenylbutazone","animalos__Type__c":"Medicine","animalos__Active__c":true,"animalos__Category__c":"AntiInflammatory"},{"attributes":{"referenceId":"MedicineRef7"},"Name":"Flagyl Suspension","animalos__Type__c":"Both","animalos__Active__c":true,"animalos__Category__c":"Antibiotic"},{"attributes":{"referenceId":"MedicineRef8"},"Name":"Clavulox drops (15ml)","animalos__Type__c":"Both","animalos__Active__c":true,"animalos__Category__c":"Antibiotic"},{"attributes":{"referenceId":"MedicineRef9"},"Name":"Pain Index Assessment","animalos__Type__c":"Treatment","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef10"},"Name":"maxidex","animalos__Type__c":"Medicine","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef11"},"Name":"Viscotears","animalos__Type__c":"Both","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef12"},"Name":"Baytril","animalos__Type__c":"Medicine","animalos__Active__c":true,"animalos__Category__c":"Anti-bacterial"},{"attributes":{"referenceId":"MedicineRef13"},"Name":"Chlorasone","animalos__Type__c":"Medicine","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef14"},"Name":"Venlafaxine","animalos__Type__c":"Medicine","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef15"},"Name":"Risperidone","animalos__Type__c":"Medicine","animalos__Active__c":true,"animalos__Category__c":"Neurological Agent"},{"attributes":{"referenceId":"MedicineRef16"},"Name":"Maxolon","animalos__Type__c":"Medicine","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef17"},"Name":"Antinol Canine Rapid","animalos__Type__c":"Both","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef18"},"Name":"Ranvet Canine All Wormer (3-Monthly)","animalos__Type__c":"Treatment","animalos__Active__c":true,"animalos__Category__c":"Anti-parasitic"},{"attributes":{"referenceId":"MedicineRef19"},"Name":"Essential 6","animalos__Type__c":"Both","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef20"},"Name":"Clavulox Tablets","animalos__Type__c":"Both","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef21"},"Name":"Ulcer Shield","animalos__Type__c":"Both","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef22"},"Name":"Iodine Solution","animalos__Type__c":"Treatment","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef23"},"Name":"Macrolone","animalos__Type__c":"Both","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef24"},"Name":"Antinol Feline Rapid","animalos__Type__c":"Both","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef25"},"Name":"Propalin syrup","animalos__Type__c":"Both","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef26"},"Name":"Megaderm","animalos__Type__c":"Both","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef27"},"Name":"Aloveen Oatmeal Shampoo","animalos__Type__c":"Treatment","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef28"},"Name":"Alprazalom","animalos__Type__c":"Both","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef29"},"Name":"Oralfungol","animalos__Type__c":"Medicine","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef30"},"Name":"Paroxetine","animalos__Type__c":"Medicine","animalos__Active__c":true,"animalos__Category__c":"Neurological Agent"},{"attributes":{"referenceId":"MedicineRef31"},"Name":"Pyohex Conditioner","animalos__Type__c":"Treatment","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef32"},"Name":"Acidurin","animalos__Type__c":"Medicine","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef33"},"Name":"Panadol","animalos__Type__c":"Medicine","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef34"},"Name":"Previcox","animalos__Type__c":"Medicine","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef35"},"Name":"Malaseb","animalos__Type__c":"Medicine","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef36"},"Name":"Barazone Condition","animalos__Type__c":"Medicine","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef37"},"Name":"Chlorhex Surgical Scrub","animalos__Type__c":"Medicine","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef38"},"Name":"Betadine Wipe","animalos__Type__c":"Medicine","animalos__Active__c":true,"animalos__Category__c":"Antiseptic"},{"attributes":{"referenceId":"MedicineRef39"},"Name":"Wagg&Purr Spot-On (Puppy & Kitten)","animalos__Type__c":"Treatment","animalos__Active__c":true,"animalos__Category__c":"Anti-parasitic"},{"attributes":{"referenceId":"MedicineRef40"},"Name":"Bravecto Dog Spot-On (6-Monthly)","animalos__Type__c":"Treatment","animalos__Active__c":true,"animalos__Category__c":"Anti-parasitic"},{"attributes":{"referenceId":"MedicineRef41"},"Name":"Bravecto Cat Spot-on (3-Monthly)","animalos__Type__c":"Treatment","animalos__Active__c":true,"animalos__Category__c":"Anti-parasitic"},{"attributes":{"referenceId":"MedicineRef42"},"Name":"Bravecto Dog Chew (3-Monthly)","animalos__Type__c":"Treatment","animalos__Active__c":true,"animalos__Category__c":"Anti-parasitic"},{"attributes":{"referenceId":"MedicineRef43"},"Name":"Milpro Heartworm & Intestinal","animalos__Type__c":"Treatment","animalos__Active__c":true,"animalos__Category__c":"Anti-parasitic"},{"attributes":{"referenceId":"MedicineRef44"},"Name":"Wagg&Purr All Wormer","animalos__Type__c":"Treatment","animalos__Active__c":true,"animalos__Category__c":"Anti-parasitic"},{"attributes":{"referenceId":"MedicineRef45"},"Name":"4Cyte","animalos__Type__c":"Medicine","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef46"},"Name":"Adaptil Collar","animalos__Type__c":"Medicine","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef47"},"Name":"Ear Cleaner","animalos__Type__c":"Medicine","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef48"},"Name":"Tribrissen 80","animalos__Type__c":"Medicine","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef49"},"Name":"Linctol Cough Mixture","animalos__Type__c":"Medicine","animalos__Active__c":true},{"attributes":{"referenceId":"MedicineRef50"},"Name":"Filavac Vaccination","animalos__Type__c":"Treatment","animalos__Active__c":true,"animalos__Category__c":"Vaccination"}]}');

// schemas/Animals.json (12 records)
groupTypes.add('animalos__Animal__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"AnimalRef1"},"animalos__Animal_Name__c":"Max","animalos__Type__c":"Dog","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Male","animalos__Stage__c":"Adoption Ready","animalos__Status__c":"Available For Adoption","animalos__Source__c":"Owner Surrender","animalos__Date_of_Birth__c":"2024-03-15","animalos__Incoming_Date__c":"2026-01-10T09:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-01-25","animalos__Age_Entered_Date__c":"2026-01-10","animalos__Estimated_Age__c":2,"animalos__Current_Weight__c":30.5,"animalos__Adoption_Fee__c":350.0,"animalos__Neutered_Spayed__c":true,"animalos__Neutered_Spayed_Date_Time__c":"2024-09-20T10:00:00.000+0000","animalos__Neutered_Spayed_Source__c":"Previous Owner","animalos__Deceased__c":false,"animalos__Microchip_Number__c":"953000000000001","animalos__Microchip_Source__c":"Previous Owner","animalos__Primary_Colour__c":"Gold","animalos__Secondary_Colour__c":"White","animalos__Primary_Breed__c":"@BreedRef1","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef1","animalos__Current_Unit__c":"@UnitRef1","animalos__Shelter_ID__c":"053 0001"},{"attributes":{"referenceId":"AnimalRef2"},"animalos__Animal_Name__c":"Bella","animalos__Type__c":"Dog","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Female","animalos__Stage__c":"Processing","animalos__Status__c":"Stray Hold","animalos__Source__c":"Stray","animalos__Date_of_Birth__c":"2023-08-20","animalos__Incoming_Date__c":"2026-03-28T14:30:00.000+0000","animalos__Status_Changed_Date__c":"2026-03-28","animalos__Age_Entered_Date__c":"2026-03-28","animalos__Estimated_Age__c":3,"animalos__Current_Weight__c":28.0,"animalos__Neutered_Spayed__c":false,"animalos__Deceased__c":false,"animalos__Primary_Colour__c":"Black","animalos__Secondary_Colour__c":"Tan","animalos__Primary_Breed__c":"@BreedRef2","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef1","animalos__Current_Unit__c":"@UnitRef2","animalos__Shelter_ID__c":"053 0002","animalos__Microchip_Number__c":"953000000000002","animalos__Microchip_Source__c":"Already Microchipped"},{"attributes":{"referenceId":"AnimalRef3"},"animalos__Animal_Name__c":"Luna","animalos__Type__c":"Cat","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Female","animalos__Stage__c":"Adoption Ready","animalos__Status__c":"Available For Adoption","animalos__Source__c":"Owner Surrender","animalos__Date_of_Birth__c":"2025-06-12","animalos__Incoming_Date__c":"2026-02-05T10:15:00.000+0000","animalos__Status_Changed_Date__c":"2026-02-20","animalos__Age_Entered_Date__c":"2026-02-05","animalos__Estimated_Age__c":1,"animalos__Current_Weight__c":4.2,"animalos__Adoption_Fee__c":200.0,"animalos__Neutered_Spayed__c":true,"animalos__Neutered_Spayed_Date_Time__c":"2026-02-12T09:00:00.000+0000","animalos__Neutered_Spayed_Source__c":"Shelter","animalos__Deceased__c":false,"animalos__Microchip_Number__c":"953000000000003","animalos__Microchip_Source__c":"Previous Owner","animalos__Primary_Colour__c":"Grey Tabby","animalos__Primary_Breed__c":"@BreedRef3","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef2","animalos__Current_Unit__c":"@UnitRef3","animalos__Shelter_ID__c":"053 0003"},{"attributes":{"referenceId":"AnimalRef4"},"animalos__Animal_Name__c":"Milo","animalos__Type__c":"Cat","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Male","animalos__Stage__c":"Under Care","animalos__Status__c":"In Foster","animalos__Source__c":"Stray","animalos__Date_of_Birth__c":"2025-01-30","animalos__Incoming_Date__c":"2026-01-20T11:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-02-01","animalos__Age_Entered_Date__c":"2026-01-20","animalos__Estimated_Age__c":1,"animalos__Current_Weight__c":5.1,"animalos__Neutered_Spayed__c":true,"animalos__Neutered_Spayed_Date_Time__c":"2026-01-28T14:00:00.000+0000","animalos__Neutered_Spayed_Source__c":"Shelter","animalos__Deceased__c":false,"animalos__Primary_Colour__c":"White","animalos__Secondary_Colour__c":"Blue Point","animalos__Primary_Breed__c":"@BreedRef4","animalos__Current_Site__c":"@SiteRef1","animalos__Shelter_ID__c":"053 0004","animalos__Microchip_Number__c":"953000000000004","animalos__Microchip_Source__c":"Already Microchipped","animalos__Current_Block__c":"@BlockRef2","animalos__Current_Unit__c":"@UnitRef4"},{"attributes":{"referenceId":"AnimalRef5"},"animalos__Animal_Name__c":"Kiwi","animalos__Type__c":"Bird","animalos__Class__c":"Domestic","animalos__Gender__c":"Female","animalos__Stage__c":"Processing","animalos__Status__c":"Awaiting Vet Exam/Health Check","animalos__Source__c":"Owner Surrender","animalos__Date_of_Birth__c":"2025-09-01","animalos__Incoming_Date__c":"2026-03-15T08:45:00.000+0000","animalos__Status_Changed_Date__c":"2026-03-15","animalos__Age_Entered_Date__c":"2026-03-15","animalos__Estimated_Age__c":1,"animalos__Current_Weight__c":0.035,"animalos__Neutered_Spayed__c":false,"animalos__Deceased__c":false,"animalos__Primary_Colour__c":"Green","animalos__Secondary_Colour__c":"Yellow","animalos__Primary_Breed__c":"@BreedRef5","animalos__Current_Site__c":"@SiteRef2","animalos__Current_Block__c":"@BlockRef3","animalos__Current_Unit__c":"@UnitRef5","animalos__Shelter_ID__c":"053 0005","animalos__Microchip_Number__c":"953000000000005","animalos__Microchip_Source__c":"Shelter"},{"attributes":{"referenceId":"AnimalRef6"},"animalos__Animal_Name__c":"Pepper","animalos__Type__c":"Rabbit","animalos__Class__c":"Small Animal","animalos__Gender__c":"Female","animalos__Stage__c":"Adoption Ready","animalos__Status__c":"Available For Adoption","animalos__Source__c":"Owner Surrender","animalos__Date_of_Birth__c":"2025-11-10","animalos__Incoming_Date__c":"2026-02-28T13:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-03-10","animalos__Age_Entered_Date__c":"2026-02-28","animalos__Estimated_Age__c":0,"animalos__Current_Weight__c":1.8,"animalos__Adoption_Fee__c":80.0,"animalos__Neutered_Spayed__c":true,"animalos__Neutered_Spayed_Date_Time__c":"2026-03-05T11:00:00.000+0000","animalos__Neutered_Spayed_Source__c":"Shelter","animalos__Deceased__c":false,"animalos__Primary_Colour__c":"White","animalos__Secondary_Colour__c":"Brown","animalos__Primary_Breed__c":"@BreedRef6","animalos__Current_Site__c":"@SiteRef2","animalos__Current_Block__c":"@BlockRef3","animalos__Current_Unit__c":"@UnitRef5","animalos__Shelter_ID__c":"053 0006","animalos__Microchip_Number__c":"953000000000006","animalos__Microchip_Source__c":"Shelter"},{"attributes":{"referenceId":"AnimalRef7"},"animalos__Animal_Name__c":"Rocky","animalos__Type__c":"Dog","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Male","animalos__Stage__c":"Under Care","animalos__Status__c":"Under Behaviour Modification","animalos__Sub_Status__c":"Review general behaviour","animalos__Source__c":"Returns","animalos__Date_of_Birth__c":"2022-12-01","animalos__Incoming_Date__c":"2026-02-10T09:30:00.000+0000","animalos__Status_Changed_Date__c":"2026-02-15","animalos__Age_Entered_Date__c":"2026-02-10","animalos__Estimated_Age__c":3,"animalos__Current_Weight__c":18.5,"animalos__Neutered_Spayed__c":true,"animalos__Neutered_Spayed_Date_Time__c":"2023-06-15T10:00:00.000+0000","animalos__Neutered_Spayed_Source__c":"Previous Owner","animalos__Deceased__c":false,"animalos__Microchip_Number__c":"953000000000007","animalos__Microchip_Source__c":"Previous Owner","animalos__Primary_Colour__c":"Brindle","animalos__Primary_Breed__c":"@BreedRef7","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef1","animalos__Current_Unit__c":"@UnitRef1","animalos__Behaviour_Flag_Condition__c":"Leash reactive. Requires experienced handler for walks.","animalos__Shelter_ID__c":"053 0007"},{"attributes":{"referenceId":"AnimalRef8"},"animalos__Animal_Name__c":"Whiskers","animalos__Type__c":"Cat","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Male","animalos__Stage__c":"Processing","animalos__Status__c":"Awaiting Foster","animalos__Source__c":"Stray","animalos__Date_of_Birth__c":"2025-04-22","animalos__Incoming_Date__c":"2026-03-01T10:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-03-05","animalos__Age_Entered_Date__c":"2026-03-01","animalos__Estimated_Age__c":1,"animalos__Current_Weight__c":3.8,"animalos__Neutered_Spayed__c":false,"animalos__Deceased__c":false,"animalos__Primary_Colour__c":"Tabby","animalos__Secondary_Colour__c":"White","animalos__Primary_Breed__c":"@BreedRef8","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef2","animalos__Current_Unit__c":"@UnitRef4","animalos__Alert_Flag_Condition__c":"Upper respiratory infection - isolate from other cats.","animalos__Shelter_ID__c":"053 0008","animalos__Microchip_Number__c":"953000000000008","animalos__Microchip_Source__c":"Shelter"},{"attributes":{"referenceId":"AnimalRef9"},"animalos__Animal_Name__c":"Daisy","animalos__Type__c":"Dog","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Female","animalos__Stage__c":"Adoption Ready","animalos__Status__c":"Available For Adoption","animalos__Source__c":"Owner Surrender","animalos__Date_of_Birth__c":"2024-04-19","animalos__Incoming_Date__c":"2026-01-17T10:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-01-17","animalos__Age_Entered_Date__c":"2026-01-17","animalos__Estimated_Age__c":2,"animalos__Current_Weight__c":18.2,"animalos__Neutered_Spayed__c":true,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0009","animalos__Microchip_Number__c":"953000000000009","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"Black","animalos__Primary_Breed__c":"@BreedRef1","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef1","animalos__Current_Unit__c":"@UnitRef2"},{"attributes":{"referenceId":"AnimalRef10"},"animalos__Animal_Name__c":"Charlie","animalos__Type__c":"Dog","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Male","animalos__Stage__c":"Processing","animalos__Status__c":"Stray Hold","animalos__Source__c":"Stray","animalos__Date_of_Birth__c":"2023-07-24","animalos__Incoming_Date__c":"2026-01-19T11:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-01-19","animalos__Age_Entered_Date__c":"2026-01-19","animalos__Estimated_Age__c":3,"animalos__Current_Weight__c":22.5,"animalos__Neutered_Spayed__c":false,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0010","animalos__Microchip_Number__c":"953000000000010","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"Tan","animalos__Primary_Breed__c":"@BreedRef2","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef1","animalos__Current_Unit__c":"@UnitRef1"},{"attributes":{"referenceId":"AnimalRef11"},"animalos__Animal_Name__c":"Coco","animalos__Type__c":"Cat","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Female","animalos__Stage__c":"Adoption Ready","animalos__Status__c":"Available For Adoption","animalos__Source__c":"Owner Surrender","animalos__Date_of_Birth__c":"2024-10-02","animalos__Incoming_Date__c":"2026-01-21T12:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-01-21","animalos__Age_Entered_Date__c":"2026-01-21","animalos__Estimated_Age__c":2,"animalos__Current_Weight__c":4.8,"animalos__Neutered_Spayed__c":true,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0011","animalos__Microchip_Number__c":"953000000000011","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"White","animalos__Primary_Breed__c":"@BreedRef8","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef2","animalos__Current_Unit__c":"@UnitRef4"},{"attributes":{"referenceId":"AnimalRef12"},"animalos__Animal_Name__c":"Archie","animalos__Type__c":"Cat","animalos__Age_Group__c":"Adult 1 yr - 8 yrs","animalos__Class__c":"Domestic","animalos__Gender__c":"Male","animalos__Stage__c":"Under Care","animalos__Status__c":"In Foster","animalos__Source__c":"Owner Surrender","animalos__Date_of_Birth__c":"2025-01-07","animalos__Incoming_Date__c":"2026-01-23T09:00:00.000+0000","animalos__Status_Changed_Date__c":"2026-01-23","animalos__Age_Entered_Date__c":"2026-01-23","animalos__Estimated_Age__c":1,"animalos__Current_Weight__c":5.0,"animalos__Neutered_Spayed__c":true,"animalos__Deceased__c":false,"animalos__Shelter_ID__c":"053 0012","animalos__Microchip_Number__c":"953000000000012","animalos__Microchip_Source__c":"Already Microchipped","animalos__Primary_Colour__c":"Tabby","animalos__Primary_Breed__c":"@BreedRef3","animalos__Current_Site__c":"@SiteRef1","animalos__Current_Block__c":"@BlockRef2","animalos__Current_Unit__c":"@UnitRef3"}]}');

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

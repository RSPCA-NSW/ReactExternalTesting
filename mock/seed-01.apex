// Seed mock data into an org — part 1 of 12.
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

Integer partNumber = 1;
Integer totalParts = 12;

List<String> groupTypes = new List<String>();
List<String> groupJson = new List<String>();

// schemas/Accounts.json (3 records)
groupTypes.add('Account');
groupJson.add('{"records":[{"attributes":{"referenceId":"AccountRef1"},"Name":"Happy Tails Rescue"},{"attributes":{"referenceId":"AccountRef2"},"Name":"City Animal Control"},{"attributes":{"referenceId":"AccountRef3"},"Name":"Paws & Claws Veterinary Clinic"}]}');

// schemas/Contacts.json (3 records)
groupTypes.add('Contact');
groupJson.add('{"records":[{"attributes":{"referenceId":"ContactRef1"},"LastName":"Smith"},{"attributes":{"referenceId":"ContactRef2"},"LastName":"Johnson"},{"attributes":{"referenceId":"ContactRef3"},"LastName":"Williams"}]}');

// schemas/Breeds.json (8 records)
groupTypes.add('animalos__Breed__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"BreedRef1"},"Name":"Labrador Retriever","animalos__Breed_ID__c":"BRD-001","animalos__Class__c":"Domestic","animalos__Size__c":"Large","animalos__Type__c":"Dog","animalos__Endangered_Status__c":"Not Applicable"},{"attributes":{"referenceId":"BreedRef2"},"Name":"German Shepherd","animalos__Breed_ID__c":"BRD-002","animalos__Class__c":"Domestic","animalos__Size__c":"Large","animalos__Type__c":"Dog","animalos__Endangered_Status__c":"Not Applicable"},{"attributes":{"referenceId":"BreedRef3"},"Name":"Domestic Shorthair","animalos__Breed_ID__c":"BRD-003","animalos__Class__c":"Domestic","animalos__Size__c":"Medium","animalos__Type__c":"Cat","animalos__Endangered_Status__c":"Not Applicable"},{"attributes":{"referenceId":"BreedRef4"},"Name":"Ragdoll","animalos__Breed_ID__c":"BRD-004","animalos__Class__c":"Domestic","animalos__Size__c":"Large","animalos__Type__c":"Cat","animalos__Endangered_Status__c":"Not Applicable"},{"attributes":{"referenceId":"BreedRef5"},"Name":"Budgerigar","animalos__Breed_ID__c":"BRD-005","animalos__Class__c":"Domestic","animalos__Size__c":"Small","animalos__Type__c":"Bird","animalos__Endangered_Status__c":"Least Concern"},{"attributes":{"referenceId":"BreedRef6"},"Name":"Holland Lop","animalos__Breed_ID__c":"BRD-006","animalos__Class__c":"Domestic","animalos__Size__c":"Small","animalos__Type__c":"Rabbit","animalos__Endangered_Status__c":"Not Applicable"},{"attributes":{"referenceId":"BreedRef7"},"Name":"Staffordshire Bull Terrier","animalos__Breed_ID__c":"BRD-007","animalos__Class__c":"Domestic","animalos__Size__c":"Medium","animalos__Type__c":"Dog","animalos__Endangered_Status__c":"Not Applicable"},{"attributes":{"referenceId":"BreedRef8"},"Name":"Domestic Medium Hair","animalos__Breed_ID__c":"BRD-008","animalos__Class__c":"Domestic","animalos__Size__c":"Medium","animalos__Type__c":"Cat","animalos__Endangered_Status__c":"Not Applicable"}]}');

// schemas/Locations-Sites.json (2 records)
groupTypes.add('animalos__Location__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"SiteRef1"},"Name":"Sydney - Yagoona","RecordType":{"DeveloperName":"Site"},"animalos__Capacity__c":80,"animalos__Availability__c":45,"animalos__Adjusted_Capacity__c":80,"animalos__Adjusted_Availability__c":45,"animalos__Unit_Status__c":"Available","animalos__Unavailable_for_Boarding__c":false},{"attributes":{"referenceId":"SiteRef2"},"Name":"Hunter","RecordType":{"DeveloperName":"Site"},"animalos__Capacity__c":40,"animalos__Availability__c":22,"animalos__Adjusted_Capacity__c":40,"animalos__Adjusted_Availability__c":22,"animalos__Unit_Status__c":"Available","animalos__Unavailable_for_Boarding__c":false}]}');

// schemas/Locations-Blocks.json (3 records)
groupTypes.add('animalos__Location__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"BlockRef1"},"Name":"Dog Wing","RecordType":{"DeveloperName":"Block"},"animalos__Parent_Block__c":"@SiteRef1","animalos__Capacity__c":40,"animalos__Availability__c":18,"animalos__Adjusted_Capacity__c":40,"animalos__Adjusted_Availability__c":18,"animalos__Unit_Status__c":"Available","animalos__Unavailable_for_Boarding__c":false},{"attributes":{"referenceId":"BlockRef2"},"Name":"Cat Wing","RecordType":{"DeveloperName":"Block"},"animalos__Parent_Block__c":"@SiteRef1","animalos__Capacity__c":30,"animalos__Availability__c":15,"animalos__Adjusted_Capacity__c":30,"animalos__Adjusted_Availability__c":15,"animalos__Unit_Status__c":"Available","animalos__Unavailable_for_Boarding__c":false},{"attributes":{"referenceId":"BlockRef3"},"Name":"Small Animal Wing","RecordType":{"DeveloperName":"Block"},"animalos__Parent_Block__c":"@SiteRef2","animalos__Capacity__c":20,"animalos__Availability__c":12,"animalos__Adjusted_Capacity__c":20,"animalos__Adjusted_Availability__c":12,"animalos__Unit_Status__c":"Available","animalos__Unavailable_for_Boarding__c":false}]}');

// schemas/Locations-Units.json (5 records)
groupTypes.add('animalos__Location__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"UnitRef1"},"Name":"Dog Kennel 1","RecordType":{"DeveloperName":"Unit"},"animalos__Parent_Block__c":"@BlockRef1","animalos__Capacity__c":4,"animalos__Availability__c":2,"animalos__Adjusted_Capacity__c":4,"animalos__Adjusted_Availability__c":2,"animalos__Unit_Status__c":"Allocated","animalos__Allocation__c":2,"animalos__Unavailable_for_Boarding__c":false},{"attributes":{"referenceId":"UnitRef2"},"Name":"Dog Kennel 2","RecordType":{"DeveloperName":"Unit"},"animalos__Parent_Block__c":"@BlockRef1","animalos__Capacity__c":4,"animalos__Availability__c":3,"animalos__Adjusted_Capacity__c":4,"animalos__Adjusted_Availability__c":3,"animalos__Unit_Status__c":"Allocated","animalos__Allocation__c":1,"animalos__Unavailable_for_Boarding__c":false},{"attributes":{"referenceId":"UnitRef3"},"Name":"Cat Room 1","RecordType":{"DeveloperName":"Unit"},"animalos__Parent_Block__c":"@BlockRef2","animalos__Capacity__c":6,"animalos__Availability__c":5,"animalos__Adjusted_Capacity__c":6,"animalos__Adjusted_Availability__c":5,"animalos__Unit_Status__c":"Allocated","animalos__Allocation__c":1,"animalos__Unavailable_for_Boarding__c":false},{"attributes":{"referenceId":"UnitRef4"},"Name":"Cat Room 2","RecordType":{"DeveloperName":"Unit"},"animalos__Parent_Block__c":"@BlockRef2","animalos__Capacity__c":6,"animalos__Availability__c":4,"animalos__Adjusted_Capacity__c":6,"animalos__Adjusted_Availability__c":4,"animalos__Unit_Status__c":"Allocated","animalos__Allocation__c":2,"animalos__Unavailable_for_Boarding__c":false},{"attributes":{"referenceId":"UnitRef5"},"Name":"Small Animal Room 1","RecordType":{"DeveloperName":"Unit"},"animalos__Parent_Block__c":"@BlockRef3","animalos__Capacity__c":8,"animalos__Availability__c":6,"animalos__Adjusted_Capacity__c":8,"animalos__Adjusted_Availability__c":6,"animalos__Unit_Status__c":"Allocated","animalos__Allocation__c":2,"animalos__Unavailable_for_Boarding__c":false}]}');

// schemas/LocationOfInterests.json (50 records)
groupTypes.add('animalos__Location_Of_Interest__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"LOIRef1"},"Name":"54 Lotus Avenue, Kalkite, NSW 2627 AU","animalos__Reported_Physical_Violence_Summary__c":"<p>Neighbours reported repeated physical intimidation and property damage at this location.</p>","animalos__Children_at_Location__c":"Yes","animalos__Number_of_Residents__c":3},{"attributes":{"referenceId":"LOIRef2"},"Name":"47 Hodge Street, Hurstville, NSW 2220 AU","animalos__Observed_Verbal_Abuse_Summary__c":"<p>Attending officer observed aggressive yelling directed at occupants during site visit.</p>","animalos__POI_Time_at_Location__c":"Afternoons and evenings"},{"attributes":{"referenceId":"LOIRef3"},"Name":"22 Hewitts Road, Young, NSW 2594 AU","animalos__Location_Safety_Concerns__c":"<p>Caller reported suspected substance misuse and erratic behaviour around animals on the property.</p>"},{"attributes":{"referenceId":"LOIRef4"},"Name":"162 Carr Street, Grafton, NSW 2460 AU"},{"attributes":{"referenceId":"LOIRef5"},"Name":"1502 Kaputar Road, Bullawa Creek","animalos__Children_at_Location__c":"No"},{"attributes":{"referenceId":"LOIRef6"},"Name":"1502 Bullawa Creek, NSW 2390 AU","animalos__Observed_Physical_Violence_Summary__c":"<p>Inspector observed threatening physical behaviour between occupants during attendance.</p>"},{"attributes":{"referenceId":"LOIRef7"},"Name":"11/21 Hope Street, Blaxland, NSW 2774 AU","animalos__Reported_Verbal_Abuse_Summary__c":"<p>Multiple callers described escalating verbal abuse and intimidation at the property.</p>"},{"attributes":{"referenceId":"LOIRef8"},"Name":"43A Pandora Street, Greenacre, NSW 2190 AU","animalos__POI_Time_at_Location__c":"Late mornings"},{"attributes":{"referenceId":"LOIRef9"},"Name":"30 Websdale Drive, Dubbo, NSW 2830 AU","animalos__Location_Safety_Concerns__c":"<p>Report indicates a firearm may be stored on site and visible during animal feeding.</p>"},{"attributes":{"referenceId":"LOIRef10"},"Name":"Tweed Heads, NSW 2486 AU","animalos__Children_Details__c":"Two children reportedly visit this location on alternate weekends.","animalos__Children_at_Location__c":"Yes"},{"attributes":{"referenceId":"LOIRef11"},"Name":"87 Old Backwater Road, Narromine, NSW 2821 AU"},{"attributes":{"referenceId":"LOIRef12"},"Name":"1126 Bruxner Way, Tenterfield, NSW 2372 AU"},{"attributes":{"referenceId":"LOIRef13"},"Name":"1/49 College Avenue, Blackbutt, NSW 2529 AU"},{"attributes":{"referenceId":"LOIRef14"},"Name":"75 Wirrinya Road, Forbes, NSW 2871 AU"},{"attributes":{"referenceId":"LOIRef15"},"Name":"Blackwall Road, Woy Woy, NSW 2256 AU"},{"attributes":{"referenceId":"LOIRef16"},"Name":"Kyogle Road, Bray Park, NSW 2484 AU"},{"attributes":{"referenceId":"LOIRef17"},"Name":"61 golf links dr,, Watanobbi, NSW 2259 AU"},{"attributes":{"referenceId":"LOIRef18"},"Name":"7 Hilton Place, Junee, NSW 2663 AU"},{"attributes":{"referenceId":"LOIRef19"},"Name":"1274 Sextonville Road, Dobies Bight, NSW 2470 AU"},{"attributes":{"referenceId":"LOIRef20"},"Name":"3/20-22 Owen Avenue, Wyong, NSW 2259 AU"},{"attributes":{"referenceId":"LOIRef21"},"Name":"400 Clemens Road, Woodlands, NSW 2575 AU"},{"attributes":{"referenceId":"LOIRef22"},"Name":"Clemens Road, Woodlands, NSW 2575 AU"},{"attributes":{"referenceId":"LOIRef23"},"Name":"2a/26 Boeing Avenue, Ballina, NSW 2478 AU"},{"attributes":{"referenceId":"LOIRef24"},"Name":"4A Hallidise Street, Nambucca Heads, NSW 2448 AU"},{"attributes":{"referenceId":"LOIRef25"},"Name":"29 Mungindi Street, Mungindi, NSW 2406 AU"},{"attributes":{"referenceId":"LOIRef26"},"Name":"5 Friends Lane, Young, NSW 2594 AU"},{"attributes":{"referenceId":"LOIRef27"},"Name":"3 Melia Way, South Grafton, NSW 2460 AU"},{"attributes":{"referenceId":"LOIRef28"},"Name":"1/2 Long Street, Strathfield, NSW 2135 AU"},{"attributes":{"referenceId":"LOIRef29"},"Name":"8 Stone Street, Stockton, NSW 2295 AU"},{"attributes":{"referenceId":"LOIRef30"},"Name":"27 Short Street, Wellington, NSW 2820 AU"},{"attributes":{"referenceId":"LOIRef31"},"Name":"5 Ruddocks Road, Lakesland, NSW 2572 AU"},{"attributes":{"referenceId":"LOIRef32"},"Name":"6/45 Churchill Crescent, Rutherford, NSW 2320 AU"},{"attributes":{"referenceId":"LOIRef33"},"Name":"58 Kippax Avenue, Leumeah, NSW 2560 AU"},{"attributes":{"referenceId":"LOIRef34"},"Name":"2513 Getta Getta Road, North Star, NSW 2408 AU"},{"attributes":{"referenceId":"LOIRef35"},"Name":"63 Greendale Road, Wallacia, NSW 2745 AU"},{"attributes":{"referenceId":"LOIRef36"},"Name":"Gullengamble Road, Obley, NSW 2868 AU"},{"attributes":{"referenceId":"LOIRef37"},"Name":"38 Banks Road, Miller, NSW 2168 AU"},{"attributes":{"referenceId":"LOIRef38"},"Name":"187 Top Somerton Road, Attunga"},{"attributes":{"referenceId":"LOIRef39"},"Name":"2/4 Borton Street, Ballina, NSW 2478 AU"},{"attributes":{"referenceId":"LOIRef40"},"Name":"182 Gresford Road, Sedgefield, NSW 2330 AU"},{"attributes":{"referenceId":"LOIRef41"},"Name":"11/44 Minto Road, Minto, NSW 2566 AU"},{"attributes":{"referenceId":"LOIRef42"},"Name":"30A Trevanna Street, Busby, NSW 2168 AU"},{"attributes":{"referenceId":"LOIRef43"},"Name":"3/1-5 Peel Street, Toukley, NSW 2263 AU"},{"attributes":{"referenceId":"LOIRef44"},"Name":"7/66 Marsden Road, Liverpool, NSW 2170 AU"},{"attributes":{"referenceId":"LOIRef45"},"Name":"3 Cheney Road, Parkes, NSW 2870 AU"},{"attributes":{"referenceId":"LOIRef46"},"Name":"3A MacGowan Street, East Maitland, NSW 2323 AU"},{"attributes":{"referenceId":"LOIRef47"},"Name":"60b Oaklands Circuit, Gregory Hills, NSW 2557 AU"},{"attributes":{"referenceId":"LOIRef48"},"Name":"3 Tindale Street, Rylstone, NSW 2849 AU"},{"attributes":{"referenceId":"LOIRef49"},"Name":"1629 Timor Road, Murrurundi, NSW 2338 AU"},{"attributes":{"referenceId":"LOIRef50"},"Name":"105 Links Road, Gunnedah, NSW 2380 AU"}]}');

// schemas/JobBundles.json (2 records)
groupTypes.add('animalos__Job_Bundle__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"JobBundleRef1"},"animalos__Status__c":"In Progress","animalos__Outcome__c":"Enforcement Action","animalos__Start_Date__c":"2026-03-28","animalos__Description__c":"<p>Inspectorate mock bundle used to group seeded job records for scratch org demos.</p>"},{"attributes":{"referenceId":"JobBundleRef2"},"animalos__Status__c":"Pending","animalos__Start_Date__c":"2026-04-02","animalos__Description__c":"<p>Crisis support mock bundle for seeded package demo data.</p>"}]}');

// schemas/Jobs.json (10 records)
groupTypes.add('animalos__Job__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"JobRef1"},"Name":"00365308","RecordType":{"DeveloperName":"Inspectorate"},"animalos__Subject__c":"Animal Welfare - Other - Cat x1","animalos__Codes__c":"Other","animalos__Type__c":"Animal Welfare","animalos__Status__c":"Assigned","animalos__Priority__c":"Routine","animalos__Job_Categorisation__c":"Other","animalos__Job_Bundle__c":"@JobBundleRef1","animalos__Location_Of_Interest__c":"@LOIRef1"},{"attributes":{"referenceId":"JobRef2"},"Name":"00365310","RecordType":{"DeveloperName":"Inspectorate"},"animalos__Subject__c":"Animal Welfare - Food & Water, Dead - Cattle x10","animalos__Codes__c":"Dead;Food & Water","animalos__Type__c":"Animal Welfare","animalos__Status__c":"Assigned","animalos__Priority__c":"Urgent","animalos__Job_Categorisation__c":"Insufficient Food and Water","animalos__Job_Bundle__c":"@JobBundleRef1","animalos__Location_Of_Interest__c":"@LOIRef2"},{"attributes":{"referenceId":"JobRef3"},"Name":"00365311","RecordType":{"DeveloperName":"Inspectorate"},"animalos__Subject__c":"Proactive Job Animal Welfare - Breeder - Cat x1,Dog x1","animalos__Codes__c":"Breeder","animalos__Type__c":"Proactive Job","animalos__Status__c":"New","animalos__Priority__c":"Routine","animalos__Job_Categorisation__c":"Breeder or Pet Shop Inspection","animalos__Job_Bundle__c":"@JobBundleRef1","animalos__Proactive_Type__c":"Breeding Facility - Dogs and Cats","animalos__Location_Of_Interest__c":"@LOIRef3"},{"attributes":{"referenceId":"JobRef4"},"Name":"00365313","RecordType":{"DeveloperName":"Inspectorate"},"animalos__Subject__c":"Animal Welfare - Food & Water, Unattended 24hrs - Cat x1","animalos__Codes__c":"Food & Water;Unattended 24hrs","animalos__Type__c":"Animal Welfare","animalos__Status__c":"Attended","animalos__Priority__c":"ASAP","animalos__Job_Categorisation__c":"Insufficient Food and Water","animalos__Job_Bundle__c":"@JobBundleRef1","animalos__Location_Of_Interest__c":"@LOIRef4"},{"attributes":{"referenceId":"JobRef5"},"Name":"00365314","RecordType":{"DeveloperName":"Inspectorate"},"animalos__Subject__c":"Animal Welfare - Food & Water - Dog x4","animalos__Codes__c":"Food & Water","animalos__Type__c":"Animal Welfare","animalos__Status__c":"Assigned","animalos__Priority__c":"ASAP","animalos__Job_Categorisation__c":"Insufficient Food and Water","animalos__Job_Bundle__c":"@JobBundleRef1","animalos__Location_Of_Interest__c":"@LOIRef5"},{"attributes":{"referenceId":"JobRef6"},"Name":"00365315","RecordType":{"DeveloperName":"Inspectorate"},"animalos__Subject__c":"Animal Welfare - Dead, Ill Treatment - Dog x1","animalos__Codes__c":"Dead;Ill Treatment","animalos__Type__c":"Animal Welfare","animalos__Status__c":"Awaiting Recheck","animalos__Priority__c":"Urgent","animalos__Job_Categorisation__c":"Ill-treatment (direct physical abuse)","animalos__Job_Bundle__c":"@JobBundleRef2","animalos__Location_Of_Interest__c":"@LOIRef6"},{"attributes":{"referenceId":"JobRef7"},"Name":"00365316","RecordType":{"DeveloperName":"Inspectorate"},"animalos__Subject__c":"Animal Welfare - Locked In Car - Dog x1","animalos__Codes__c":"Locked In Car","animalos__Type__c":"Animal Welfare","animalos__Status__c":"Assigned","animalos__Priority__c":"Urgent","animalos__Job_Categorisation__c":"Other","animalos__Job_Bundle__c":"@JobBundleRef2","animalos__Location_Of_Interest__c":"@LOIRef7"},{"attributes":{"referenceId":"JobRef8"},"Name":"00365317","RecordType":{"DeveloperName":"Inspectorate"},"animalos__Subject__c":"Animal Welfare - Abandoned - Cat x2","animalos__Codes__c":"Abandoned","animalos__Type__c":"Animal Welfare","animalos__Status__c":"Awaiting Further Information","animalos__Priority__c":"ASAP","animalos__Job_Categorisation__c":"Abandonment","animalos__Job_Bundle__c":"@JobBundleRef2","animalos__Location_Of_Interest__c":"@LOIRef8"},{"attributes":{"referenceId":"JobRef9"},"Name":"00365318","RecordType":{"DeveloperName":"Inspectorate"},"animalos__Subject__c":"Animal Welfare - Shelter Inadequate, Food & Water - Rabbit x6","animalos__Codes__c":"Shelter Inadequate;Food & Water","animalos__Type__c":"Animal Welfare","animalos__Status__c":"Assigned","animalos__Priority__c":"ASAP","animalos__Job_Categorisation__c":"Insufficient Shelter","animalos__Job_Bundle__c":"@JobBundleRef2","animalos__Location_Of_Interest__c":"@LOIRef9"},{"attributes":{"referenceId":"JobRef10"},"Name":"00365319","RecordType":{"DeveloperName":"Inspectorate"},"animalos__Subject__c":"Proactive Job Animal Welfare - Kennel Inspection - Dog x12","animalos__Codes__c":"Kennel Inspection","animalos__Type__c":"Proactive Job","animalos__Status__c":"Finalised","animalos__Priority__c":"Routine","animalos__Job_Categorisation__c":"Breeder or Pet Shop Inspection","animalos__Job_Bundle__c":"@JobBundleRef2","animalos__Proactive_Type__c":"Boarding Establishments \\u2013 Dogs and Cats","animalos__Location_Of_Interest__c":"@LOIRef10"}]}');

// schemas/JobContacts.json (11 records)
groupTypes.add('animalos__Job_Contact__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"JobContactRef1"},"animalos__Job__c":"@JobRef1","animalos__Contact__c":"@ContactRef1","animalos__Organization__c":"@AccountRef2","animalos__Contact_Type__c":"Informant","animalos__Start_Date__c":"2026-04-01T09:00:00.000+0000"},{"attributes":{"referenceId":"JobContactRef2"},"animalos__Job__c":"@JobRef1","animalos__Contact__c":"@ContactRef2","animalos__Organization__c":"@AccountRef3","animalos__Contact_Type__c":"Person Of Interest","animalos__Start_Date__c":"2026-04-01T09:30:00.000+0000"},{"attributes":{"referenceId":"JobContactRef3"},"animalos__Job__c":"@JobRef2","animalos__Contact__c":"@ContactRef1","animalos__Organization__c":"@AccountRef3","animalos__Contact_Type__c":"Informant","animalos__Start_Date__c":"2026-04-02T09:00:00.000+0000"},{"attributes":{"referenceId":"JobContactRef4"},"animalos__Job__c":"@JobRef2","animalos__Contact__c":"@ContactRef2","animalos__Organization__c":"@AccountRef1","animalos__Contact_Type__c":"Person Of Interest","animalos__Start_Date__c":"2026-04-02T09:30:00.000+0000"},{"attributes":{"referenceId":"JobContactRef5"},"animalos__Job__c":"@JobRef3","animalos__Contact__c":"@ContactRef1","animalos__Organization__c":"@AccountRef1","animalos__Contact_Type__c":"Informant","animalos__Start_Date__c":"2026-04-03T09:00:00.000+0000"},{"attributes":{"referenceId":"JobContactRef6"},"animalos__Job__c":"@JobRef3","animalos__Contact__c":"@ContactRef2","animalos__Organization__c":"@AccountRef2","animalos__Contact_Type__c":"Person Of Interest","animalos__Start_Date__c":"2026-04-03T09:30:00.000+0000"},{"attributes":{"referenceId":"JobContactRef7"},"animalos__Job__c":"@JobRef4","animalos__Contact__c":"@ContactRef1","animalos__Organization__c":"@AccountRef2","animalos__Contact_Type__c":"Informant","animalos__Start_Date__c":"2026-04-04T09:00:00.000+0000"},{"attributes":{"referenceId":"JobContactRef8"},"animalos__Job__c":"@JobRef4","animalos__Contact__c":"@ContactRef2","animalos__Organization__c":"@AccountRef3","animalos__Contact_Type__c":"Person Of Interest","animalos__Start_Date__c":"2026-04-04T09:30:00.000+0000"},{"attributes":{"referenceId":"JobContactRef9"},"animalos__Job__c":"@JobRef5","animalos__Contact__c":"@ContactRef1","animalos__Organization__c":"@AccountRef3","animalos__Contact_Type__c":"Informant","animalos__Start_Date__c":"2026-04-05T09:00:00.000+0000"},{"attributes":{"referenceId":"JobContactRef10"},"animalos__Job__c":"@JobRef5","animalos__Contact__c":"@ContactRef2","animalos__Organization__c":"@AccountRef1","animalos__Contact_Type__c":"Person Of Interest","animalos__Start_Date__c":"2026-04-05T09:30:00.000+0000"},{"attributes":{"referenceId":"JobContactRef11"},"animalos__Job__c":"@JobRef6","animalos__Contact__c":"@ContactRef1","animalos__Organization__c":"@AccountRef1","animalos__Contact_Type__c":"Informant","animalos__Start_Date__c":"2026-04-06T09:00:00.000+0000"}]}');

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

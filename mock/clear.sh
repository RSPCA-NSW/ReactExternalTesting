

set -euo pipefail

: "${SF_TARGET_ORG:?SF_TARGET_ORG is required. Run: cci task run clear --org dev}"

DIR="$(cd "$(dirname "$0")" && pwd)"
TEMP_APEX="$(mktemp "$DIR/clear.XXXXXX.apex")"

cleanup() { rm -f "$TEMP_APEX"; }
trap cleanup EXIT

command -v sf >/dev/null || { echo "ERROR: sf CLI is required" >&2; exit 1; }

cat > "$TEMP_APEX" <<'EOF'
Set<String> seededJobNames = new Set<String>{
    '00365308', '00365310', '00365311', '00365313', '00365314',
    '00365315', '00365316', '00365317', '00365318', '00365319',
    'JOB-INS-0001', 'JOB-CRS-0001'
};
String seededShelterPattern = '053 %';
Set<String> locationOfInterestNames = new Set<String>{
    '54 Lotus Avenue, Kalkite, NSW 2627 AU',
    '47 Hodge Street, Hurstville, NSW 2220 AU',
    '22 Hewitts Road, Young, NSW 2594 AU',
    '162 Carr Street, Grafton, NSW 2460 AU',
    '1502 Kaputar Road, Bullawa Creek',
    '1502 Bullawa Creek, NSW 2390 AU',
    '11/21 Hope Street, Blaxland, NSW 2774 AU',
    '43A Pandora Street, Greenacre, NSW 2190 AU',
    '30 Websdale Drive, Dubbo, NSW 2830 AU',
    'Tweed Heads, NSW 2486 AU',
    '87 Old Backwater Road, Narromine, NSW 2821 AU',
    '1126 Bruxner Way, Tenterfield, NSW 2372 AU',
    '1/49 College Avenue, Blackbutt, NSW 2529 AU',
    '75 Wirrinya Road, Forbes, NSW 2871 AU',
    'Blackwall Road, Woy Woy, NSW 2256 AU',
    'Kyogle Road, Bray Park, NSW 2484 AU',
    '61 golf links dr,, Watanobbi, NSW 2259 AU',
    '7 Hilton Place, Junee, NSW 2663 AU',
    '1274 Sextonville Road, Dobies Bight, NSW 2470 AU',
    '3/20-22 Owen Avenue, Wyong, NSW 2259 AU',
    '400 Clemens Road, Woodlands, NSW 2575 AU',
    'Clemens Road, Woodlands, NSW 2575 AU',
    '2a/26 Boeing Avenue, Ballina, NSW 2478 AU',
    '4A Hallidise Street, Nambucca Heads, NSW 2448 AU',
    '29 Mungindi Street, Mungindi, NSW 2406 AU',
    '5 Friends Lane, Young, NSW 2594 AU',
    '3 Melia Way, South Grafton, NSW 2460 AU',
    '1/2 Long Street, Strathfield, NSW 2135 AU',
    '8 Stone Street, Stockton, NSW 2295 AU',
    '27 Short Street, Wellington, NSW 2820 AU',
    '5 Ruddocks Road, Lakesland, NSW 2572 AU',
    '6/45 Churchill Crescent, Rutherford, NSW 2320 AU',
    '58 Kippax Avenue, Leumeah, NSW 2560 AU',
    '2513 Getta Getta Road, North Star, NSW 2408 AU',
    '63 Greendale Road, Wallacia, NSW 2745 AU',
    'Gullengamble Road, Obley, NSW 2868 AU',
    '38 Banks Road, Miller, NSW 2168 AU',
    '187 Top Somerton Road, Attunga',
    '2/4 Borton Street, Ballina, NSW 2478 AU',
    '182 Gresford Road, Sedgefield, NSW 2330 AU',
    '11/44 Minto Road, Minto, NSW 2566 AU',
    '30A Trevanna Street, Busby, NSW 2168 AU',
    '3/1-5 Peel Street, Toukley, NSW 2263 AU',
    '7/66 Marsden Road, Liverpool, NSW 2170 AU',
    '3 Cheney Road, Parkes, NSW 2870 AU',
    '3A MacGowan Street, East Maitland, NSW 2323 AU',
    '60b Oaklands Circuit, Gregory Hills, NSW 2557 AU',
    '3 Tindale Street, Rylstone, NSW 2849 AU',
    '1629 Timor Road, Murrurundi, NSW 2338 AU',
    '105 Links Road, Gunnedah, NSW 2380 AU'
};
Set<String> breedIds = new Set<String>{
    'BRD-001', 'BRD-002', 'BRD-003', 'BRD-004', 'BRD-005', 'BRD-006', 'BRD-007', 'BRD-008'
};
Set<String> locationNames = new Set<String>{
    'Main Shelter', 'Satellite Centre',
    'Dog Wing', 'Cat Wing', 'Small Animal Wing',
    'Dog Kennel 1', 'Dog Kennel 2', 'Cat Room 1', 'Cat Room 2', 'Small Animal Room 1'
};
Set<String> actionPlanNames = new Set<String>{
    'Standard Enrichment Plan',
    'Standard Exercise Plan',
    'Daily Observation',
    'Standard Interaction',
    'Weigh In - Weekly',
    'Weekly Sanitation Plan',
    'Weigh In - Daily',
    'Weigh In - Every 2 Days',
    'Malaseb Bath Weekly',
    'Malaseb Bath Every 3 Days',
    'Weekly Weigh-In (Pocket Pet)',
    'FAS Observations',
    'Feline Toileting Habits',
    'Weigh In - Monthly',
    'Fortnightly In Care Review',
    'Treatment Default Plan',
    'Nutrition Default Plan',
    'Enrichment Default Plan',
    'Weigh In Default Plan',
    'Weigh In - Every 3 Days'
};
Set<String> medicineNames = new Set<String>{
    'Parvo Test',
    'easOtic Ear Suspension',
    'AWAG - Animal Welfare Assessment Grid',
    'Hylo-Forte Eye Drops 2mg/mL',
    'Ulcershield Oral Paste - Omeprazole 370 mg/g Buffered Paste',
    'Bute- Phenylbutazone',
    'Flagyl Suspension',
    'Clavulox drops (15ml)',
    'Pain Index Assessment',
    'maxidex',
    'Viscotears',
    'Baytril',
    'Chlorasone',
    'Venlafaxine',
    'Risperidone',
    'Maxolon',
    'Antinol Canine Rapid',
    'Ranvet Canine All Wormer (3-Monthly)',
    'Essential 6',
    'Clavulox Tablets',
    'Ulcer Shield',
    'Iodine Solution',
    'Macrolone',
    'Antinol Feline Rapid',
    'Propalin syrup',
    'Megaderm',
    'Aloveen Oatmeal Shampoo',
    'Alprazalom',
    'Oralfungol',
    'Paroxetine',
    'Pyohex Conditioner',
    'Acidurin',
    'Panadol',
    'Previcox',
    'Malaseb',
    'Barazone Condition',
    'Chlorhex Surgical Scrub',
    'Betadine Wipe',
    'Wagg&Purr Spot-On (Puppy & Kitten)',
    'Bravecto Dog Spot-On (6-Monthly)',
    'Bravecto Cat Spot-on (3-Monthly)',
    'Bravecto Dog Chew (3-Monthly)',
    'Milpro Heartworm & Intestinal',
    'Wagg&Purr All Wormer',
    '4Cyte',
    'Adaptil Collar',
    'Ear Cleaner',
    'Tribrissen 80',
    'Linctol Cough Mixture',
    'Filavac Vaccination'
};
Set<Id> contactIds = new Set<Id>();
Set<Id> accountIds = new Set<Id>();
Set<Id> jobIds = new Set<Id>();
Set<Id> jobBundleIds = new Set<Id>();
Set<Id> jobActivityIds = new Set<Id>();
Set<Id> jobContactIds = new Set<Id>();

for (animalos__Job__c record : [
    SELECT Id
    FROM animalos__Job__c
    WHERE Name IN :seededJobNames
       OR animalos__Location_Of_Interest__r.Name IN :locationOfInterestNames
]) {
    jobIds.add(record.Id);
}

for (animalos__Animal_Referral__c record : [
    SELECT animalos__Job__c
    FROM animalos__Animal_Referral__c
    WHERE animalos__Animal__r.animalos__Shelter_ID__c LIKE :seededShelterPattern
      AND animalos__Job__c != null
]) {
    jobIds.add(record.animalos__Job__c);
}

if (!jobIds.isEmpty()) {
    for (animalos__Job__c record : [
        SELECT Id, animalos__Job_Bundle__c
        FROM animalos__Job__c
        WHERE Id IN :jobIds
    ]) {
        if (record.animalos__Job_Bundle__c != null) {
            jobBundleIds.add(record.animalos__Job_Bundle__c);
        }
    }

    for (animalos__Job_Activity__c record : [
        SELECT Id
        FROM animalos__Job_Activity__c
        WHERE animalos__Job__c IN :jobIds
    ]) {
        jobActivityIds.add(record.Id);
    }

    for (animalos__Job_Contact__c record : [
        SELECT Id, animalos__Contact__c, animalos__Organization__c
        FROM animalos__Job_Contact__c
        WHERE animalos__Job__c IN :jobIds
    ]) {
        jobContactIds.add(record.Id);
        if (record.animalos__Contact__c != null) {
            contactIds.add(record.animalos__Contact__c);
        }
        if (record.animalos__Organization__c != null) {
            accountIds.add(record.animalos__Organization__c);
        }
    }

    for (animalos__Referral__c record : [
        SELECT animalos__Contact__c, animalos__Referral_Organisation__c
        FROM animalos__Referral__c
        WHERE animalos__Job__c IN :jobIds
    ]) {
        if (record.animalos__Contact__c != null) {
            contactIds.add(record.animalos__Contact__c);
        }
        if (record.animalos__Referral_Organisation__c != null) {
            accountIds.add(record.animalos__Referral_Organisation__c);
        }
    }
}

if (!jobActivityIds.isEmpty()) {
    delete [SELECT Id FROM animalos__Assigned_Resource__c WHERE animalos__Job_Activity__c IN :jobActivityIds];
    delete [SELECT Id FROM animalos__Job_Activity_Animal__c WHERE animalos__Job_Activity__c IN :jobActivityIds];
}

delete [SELECT Id FROM animalos__Animal_Referral__c WHERE animalos__Animal__r.animalos__Shelter_ID__c LIKE :seededShelterPattern];

if (!jobIds.isEmpty()) {
    delete [SELECT Id FROM animalos__Job_Note__c WHERE animalos__Job__c IN :jobIds];
    delete [SELECT Id FROM animalos__Job_Role__c WHERE animalos__Job__c IN :jobIds];
    delete [SELECT Id FROM animalos__Job_Status_Tracking__c WHERE animalos__Job__c IN :jobIds];
}

if (!jobContactIds.isEmpty()) {
    delete [SELECT Id FROM animalos__Interaction_Caution__c WHERE animalos__Job_Contact__c IN :jobContactIds];
    delete [SELECT Id FROM animalos__Charge_Outcome__c WHERE animalos__Job_Contact__c IN :jobContactIds];
}

if (!jobActivityIds.isEmpty()) {
    delete [SELECT Id FROM animalos__Job_Activity__c WHERE Id IN :jobActivityIds];
}

delete [SELECT Id FROM animalos__Animal_Action__c WHERE animalos__Animal__r.animalos__Shelter_ID__c LIKE :seededShelterPattern];
delete [SELECT Id FROM animalos__Animal_Note__c WHERE animalos__Animal__r.animalos__Shelter_ID__c LIKE :seededShelterPattern];
delete [SELECT Id FROM animalos__Movement__c WHERE animalos__Animal__r.animalos__Shelter_ID__c LIKE :seededShelterPattern];

if (!jobIds.isEmpty()) {
    delete [SELECT Id FROM animalos__Referral__c WHERE animalos__Job__c IN :jobIds];
    delete [SELECT Id FROM animalos__Medicine_Used__c WHERE animalos__Job__c IN :jobIds];
    delete [SELECT Id FROM animalos__Animal_Report__c WHERE animalos__Job__c IN :jobIds];
    delete [SELECT Id FROM animalos__Enforcement_Action__c WHERE animalos__Job__c IN :jobIds];
}

if (!jobContactIds.isEmpty()) {
    delete [SELECT Id FROM animalos__Job_Contact__c WHERE Id IN :jobContactIds];
}

delete [SELECT Id FROM animalos__Animal__c WHERE animalos__Shelter_ID__c LIKE :seededShelterPattern];

if (!jobIds.isEmpty()) {
    delete [SELECT Id FROM animalos__Job__c WHERE Id IN :jobIds];
}

delete [SELECT Id FROM animalos__Location_Of_Interest__c WHERE Name IN :locationOfInterestNames];

if (!jobBundleIds.isEmpty()) {
    delete [SELECT Id FROM animalos__Job_Bundle__c WHERE Id IN :jobBundleIds];
}

delete [SELECT Id FROM animalos__Action_Plan__c WHERE Name IN :actionPlanNames];
delete [SELECT Id FROM animalos__Medicine__c WHERE Name IN :medicineNames];
delete [SELECT Id FROM animalos__Location__c WHERE Name IN :locationNames];
delete [SELECT Id FROM animalos__Breed__c WHERE animalos__Breed_ID__c IN :breedIds];

if (!contactIds.isEmpty()) {
    delete [SELECT Id FROM Contact WHERE Id IN :contactIds];
}

if (!accountIds.isEmpty()) {
    delete [SELECT Id FROM Account WHERE Id IN :accountIds];
}

System.debug('Mock dataset clear complete.');
EOF

echo "Clearing mock dataset from org: $SF_TARGET_ORG ..."
sf apex run --file "$TEMP_APEX" --target-org "$SF_TARGET_ORG"
echo ""
echo "Done! Mock dataset records cleared."

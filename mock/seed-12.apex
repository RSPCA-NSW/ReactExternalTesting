// Seed mock data into an org — part 12 of 12.
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

Integer partNumber = 12;
Integer totalParts = 12;

List<String> groupTypes = new List<String>();
List<String> groupJson = new List<String>();

// schemas/Movements.json (18 records)
groupTypes.add('animalos__Movement__c');
groupJson.add('{"records":[{"attributes":{"referenceId":"MovementRef33"},"animalos__Animal__c":"@AnimalRef33","animalos__Location__c":"@UnitRef4","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-03-06T10:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef34"},"animalos__Animal__c":"@AnimalRef34","animalos__Location__c":"@UnitRef1","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-03-08T11:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef35"},"animalos__Animal__c":"@AnimalRef35","animalos__Location__c":"@UnitRef4","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-03-10T12:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef36"},"animalos__Animal__c":"@AnimalRef36","animalos__Location__c":"@UnitRef3","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-03-12T09:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef37"},"animalos__Animal__c":"@AnimalRef37","animalos__Location__c":"@UnitRef2","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-03-14T10:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef38"},"animalos__Animal__c":"@AnimalRef38","animalos__Location__c":"@UnitRef5","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-03-16T11:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef39"},"animalos__Animal__c":"@AnimalRef39","animalos__Location__c":"@UnitRef4","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-03-18T12:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef40"},"animalos__Animal__c":"@AnimalRef40","animalos__Location__c":"@UnitRef1","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-03-20T09:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef41"},"animalos__Animal__c":"@AnimalRef41","animalos__Location__c":"@UnitRef5","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-03-22T10:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef42"},"animalos__Animal__c":"@AnimalRef42","animalos__Location__c":"@UnitRef1","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-03-24T11:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef43"},"animalos__Animal__c":"@AnimalRef43","animalos__Location__c":"@UnitRef4","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-03-26T12:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef44"},"animalos__Animal__c":"@AnimalRef44","animalos__Location__c":"@UnitRef1","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-03-28T09:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef45"},"animalos__Animal__c":"@AnimalRef45","animalos__Location__c":"@UnitRef5","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-03-30T10:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef46"},"animalos__Animal__c":"@AnimalRef46","animalos__Location__c":"@UnitRef3","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-04-01T11:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef47"},"animalos__Animal__c":"@AnimalRef47","animalos__Location__c":"@UnitRef2","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-04-03T12:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef48"},"animalos__Animal__c":"@AnimalRef48","animalos__Location__c":"@UnitRef1","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-04-05T09:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef49"},"animalos__Animal__c":"@AnimalRef49","animalos__Location__c":"@UnitRef4","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-04-07T10:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"},{"attributes":{"referenceId":"MovementRef50"},"animalos__Animal__c":"@AnimalRef50","animalos__Location__c":"@UnitRef5","animalos__Current__c":true,"animalos__Start_Date_Time__c":"2026-04-09T11:00:00.000+0000","animalos__Movement_Reason__c":"New incoming Animal"}]}');

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

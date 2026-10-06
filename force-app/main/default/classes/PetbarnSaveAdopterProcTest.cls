@IsTest
private class PetbarnSaveAdopterProcTest {

    private static Map<String, Object> validRequest() {
        return new Map<String, Object>{
            'firstName' => 'Jane',
            'lastName'  => 'Adopter',
            'email'     => 'jane@example.com',
            'phone'     => '0412345678',
            'birthdate' => '1990-06-15',
            'street'    => '1 Test St',
            'suburb'    => 'Yagoona',
            'state'     => 'NSW',
            'postcode'  => '2199'
        };
    }

    private static Contact existingContact() {
        Contact c = new Contact(
            FirstName = 'Jane', LastName = 'Adopter', Email = 'jane@example.com', Phone = '0412 345 678',
            Birthdate = Date.newInstance(1990, 6, 15),
            MailingStreet = '1 Test St', MailingCity = 'Yagoona', MailingState = 'NSW',
            MailingPostalCode = '2199'
        );
        insert c;
        return c;
    }

    private static void assertValidationError(Map<String, Object> req, String expectedFragment) {
        try {
            new PetbarnSaveAdopterProc().process(req);
            System.assert(false, 'Expected ValidationException containing: ' + expectedFragment);
        } catch (aos_Structs.ValidationException ex) {
            System.assert(ex.getMessage().contains(expectedFragment), ex.getMessage());
        }
    }

    @IsTest
    static void save_noContactId_createsContactWithFormattedValues() {
        Map<String, Object> req = validRequest();
        req.put('firstName', ' Jane ');
        req.put('email', ' Jane.Adopter@Example.com ');
        req.put('state', 'nsw');

        aos_Response response = new PetbarnSaveAdopterProc().process(req);

        Map<String, Object> result = (Map<String, Object>) response.get('result');
        System.assertEquals('created', result.get('outcome'));

        Contact saved = [
            SELECT FirstName, LastName, Email, Phone, Birthdate,
                MailingStreet, MailingCity, MailingState, MailingPostalCode
            FROM Contact WHERE Id = :(Id) result.get('contactId')
        ];
        System.assertEquals('Jane', saved.FirstName);
        System.assertEquals('Adopter', saved.LastName);
        System.assertEquals('jane.adopter@example.com', saved.Email);
        System.assertEquals('0412 345 678', saved.Phone, 'Mobile should be formatted 04xx xxx xxx');
        System.assertEquals(Date.newInstance(1990, 6, 15), saved.Birthdate);
        System.assertEquals('1 Test St', saved.MailingStreet);
        System.assertEquals('Yagoona', saved.MailingCity);
        System.assertEquals('NSW', saved.MailingState, 'State should be upper-cased');
        System.assertEquals('2199', saved.MailingPostalCode);
    }

    @IsTest
    static void save_existingContact_updatesChangedFields() {
        Contact c = existingContact();

        Map<String, Object> req = validRequest();
        req.put('contactId', c.Id);
        req.put('lastName', 'Adopter-Smith');
        req.put('email', 'new@example.com');
        req.put('phone', '(02) 9876 5432');
        req.put('street', '22 New Rd');
        req.put('suburb', 'Hobart');
        req.put('state', 'TAS');
        req.put('postcode', '7000');

        aos_Response response = new PetbarnSaveAdopterProc().process(req);

        Map<String, Object> result = (Map<String, Object>) response.get('result');
        System.assertEquals('updated', result.get('outcome'));
        System.assertEquals(c.Id, result.get('contactId'));

        Contact saved = [
            SELECT LastName, Email, Phone, MailingStreet, MailingCity, MailingState, MailingPostalCode
            FROM Contact WHERE Id = :c.Id
        ];
        System.assertEquals('Adopter-Smith', saved.LastName);
        System.assertEquals('new@example.com', saved.Email);
        System.assertEquals('02 9876 5432', saved.Phone, 'Landline should be formatted 0x xxxx xxxx');
        System.assertEquals('22 New Rd', saved.MailingStreet);
        System.assertEquals('Hobart', saved.MailingCity);
        System.assertEquals('TAS', saved.MailingState);
        System.assertEquals('7000', saved.MailingPostalCode);
    }

    @IsTest
    static void save_existingContact_noChanges_skipsDml() {
        Contact c = existingContact();

        Map<String, Object> req = validRequest();
        req.put('contactId', c.Id);

        Integer dmlBefore = Limits.getDmlStatements();
        aos_Response response = new PetbarnSaveAdopterProc().process(req);

        Map<String, Object> result = (Map<String, Object>) response.get('result');
        System.assertEquals('unchanged', result.get('outcome'));
        System.assertEquals(c.Id, result.get('contactId'));
        System.assertEquals(dmlBefore, Limits.getDmlStatements(), 'No DML should run when nothing changed');
    }

    @IsTest
    static void save_invalidEmail_throwsValidation() {
        Map<String, Object> req = validRequest();
        req.put('email', 'not-an-email');
        assertValidationError(req, 'email');
        System.assertEquals(0, [SELECT COUNT() FROM Contact WHERE LastName = 'Adopter']);
    }

    @IsTest
    static void save_missingEmailOrPhone_throwsValidation() {
        Map<String, Object> req = validRequest();
        req.put('email', '  ');
        assertValidationError(req, 'email');

        req = validRequest();
        req.remove('phone');
        assertValidationError(req, 'phone');
        System.assertEquals(0, [SELECT COUNT() FROM Contact WHERE LastName = 'Adopter']);
    }

    @IsTest
    static void save_missingSurname_throwsValidation() {
        Map<String, Object> req = validRequest();
        req.put('lastName', '   ');
        assertValidationError(req, 'surname');
    }

    @IsTest
    static void save_missingAddress_throwsValidation() {
        Map<String, Object> req = validRequest();
        req.remove('street');
        assertValidationError(req, 'address');

        req = validRequest();
        req.put('postcode', '');
        assertValidationError(req, 'address');
        System.assertEquals(0, [SELECT COUNT() FROM Contact WHERE LastName = 'Adopter']);
    }

    @IsTest
    static void save_invalidStateOrPostcode_throwsValidation() {
        Map<String, Object> req = validRequest();
        req.put('state', 'New South Wales');
        assertValidationError(req, 'state');

        req = validRequest();
        req.put('postcode', '21999');
        assertValidationError(req, 'Postcode');
    }

    @IsTest
    static void save_under18_throwsValidation() {
        Map<String, Object> req = validRequest();
        // 18th birthday is tomorrow - still 17 today
        req.put('birthdate', String.valueOf(Date.today().addYears(-18).addDays(1)));
        assertValidationError(req, '18 or over');
        System.assertEquals(0, [SELECT COUNT() FROM Contact WHERE LastName = 'Adopter']);
    }

    @IsTest
    static void save_exactly18Today_isAccepted() {
        Map<String, Object> req = validRequest();
        req.put('birthdate', String.valueOf(Date.today().addYears(-18)));
        aos_Response response = new PetbarnSaveAdopterProc().process(req);
        Map<String, Object> result = (Map<String, Object>) response.get('result');
        System.assertEquals('created', result.get('outcome'));
    }

    @IsTest
    static void save_missingOrBadBirthdate_throwsValidation() {
        Map<String, Object> req = validRequest();
        req.remove('birthdate');
        assertValidationError(req, 'date of birth');

        req = validRequest();
        req.put('birthdate', 'not-a-date');
        assertValidationError(req, 'date of birth');

        req = validRequest();
        req.put('birthdate', String.valueOf(Date.today().addDays(1)));
        assertValidationError(req, 'future');
    }

    @IsTest
    static void save_existingContact_birthdateChange_isDetected() {
        Contact c = existingContact();
        Map<String, Object> req = validRequest();
        req.put('contactId', c.Id);
        req.put('birthdate', '1985-01-02');

        aos_Response response = new PetbarnSaveAdopterProc().process(req);
        Map<String, Object> result = (Map<String, Object>) response.get('result');
        System.assertEquals('updated', result.get('outcome'));
        System.assertEquals(Date.newInstance(1985, 1, 2), [SELECT Birthdate FROM Contact WHERE Id = :c.Id].Birthdate);
    }

    @IsTest
    static void save_unusualPhone_storedAsTyped() {
        Map<String, Object> req = validRequest();
        req.put('phone', '+64 21 123 4567');
        aos_Response response = new PetbarnSaveAdopterProc().process(req);
        Map<String, Object> result = (Map<String, Object>) response.get('result');
        Contact saved = [SELECT Phone FROM Contact WHERE Id = :(Id) result.get('contactId')];
        System.assertEquals('+64 21 123 4567', saved.Phone);
    }
}

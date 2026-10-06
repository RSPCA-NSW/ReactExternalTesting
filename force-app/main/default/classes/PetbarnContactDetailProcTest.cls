@IsTest
private class PetbarnContactDetailProcTest {

    @IsTest
    static void process_returnsUnmaskedContactDetails() {
        Contact c = new Contact(
            FirstName = 'Jane', LastName = 'Adopter', Email = 'jane@example.com', Phone = '0412 345 678',
            Birthdate = Date.newInstance(1990, 6, 15),
            MailingStreet = '1 Test St', MailingCity = 'Yagoona', MailingState = 'NSW',
            MailingPostalCode = '2199'
        );
        insert c;

        aos_Response response = new PetbarnContactDetailProc().process(new Map<String, Object>{
            'contactId' => c.Id
        });

        Map<String, Object> result = (Map<String, Object>) response.get('result');
        System.assertEquals(c.Id, result.get('contactId'));
        System.assertEquals('Jane', result.get('firstName'));
        System.assertEquals('Adopter', result.get('lastName'));
        System.assertEquals('jane@example.com', result.get('email'));
        System.assertEquals('0412 345 678', result.get('phone'));
        System.assertEquals('1990-06-15', result.get('birthdate'), 'Birthdate should be returned as yyyy-mm-dd');
        System.assertEquals('1 Test St', result.get('street'));
        System.assertEquals('Yagoona', result.get('suburb'));
        System.assertEquals('NSW', result.get('state'));
        System.assertEquals('2199', result.get('postcode'));
    }

    @IsTest
    static void process_unknownContact_throwsNotFound() {
        Contact c = new Contact(LastName = 'Gone');
        insert c;
        delete c;

        try {
            new PetbarnContactDetailProc().process(new Map<String, Object>{ 'contactId' => c.Id });
            System.assert(false, 'Expected NotFoundException');
        } catch (aos_Structs.NotFoundException ex) {
            System.assertEquals('No Contact found', ex.getMessage());
        }
    }

    @IsTest
    static void process_missingContactId_throws() {
        try {
            new PetbarnContactDetailProc().process(new Map<String, Object>());
            System.assert(false, 'Expected an exception for a missing contactId');
        } catch (Exception ex) {
            System.assert(ex.getMessage().contains('No contact'), ex.getMessage());
        }
    }
}

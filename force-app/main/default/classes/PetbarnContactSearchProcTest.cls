@IsTest
private class PetbarnContactSearchProcTest {

    @IsTest
    static void search_returnsMaskedCandidatesForExactNameMatch() {
        insert new List<Contact>{
            new Contact(FirstName = 'Jane', LastName = 'Adopter', Email = 'janedoe@example.com', Phone = '0412 345 678', MailingCity = 'Yagoona'),
            new Contact(FirstName = 'Jane', LastName = 'Other')
        };

        aos_Response response = new PetbarnContactSearchProc().process(new Map<String, Object>{
            'firstName' => ' Jane ',
            'lastName'  => 'Adopter'
        });

        Map<String, Object> result = (Map<String, Object>) response.get('result');
        List<Object> contacts = (List<Object>) result.get('contacts');

        System.assertEquals(1, contacts.size(), 'Only the exact first + last name match should be returned');
        System.assertEquals(false, result.get('hasMore'));

        PetbarnContactSearchProc.Candidate c = (PetbarnContactSearchProc.Candidate) contacts[0];
        System.assertEquals('Jane', c.firstName);
        System.assertEquals('j*****e@example.com', c.emailHint, 'Email should be masked');
        System.assertEquals('******5678', c.phoneHint, 'Phone should be masked to last four digits');
        System.assertEquals('Yagoona', c.suburb, 'Suburb is shown unmasked to help tell same-name people apart');
    }

    @IsTest
    static void search_capsAtTenAndFlagsMore() {
        List<Contact> contacts = new List<Contact>();
        for (Integer i = 0; i < 12; i++) {
            contacts.add(new Contact(FirstName = 'Sam', LastName = 'Many'));
        }
        insert contacts;

        aos_Response response = new PetbarnContactSearchProc().process(new Map<String, Object>{
            'firstName' => 'Sam',
            'lastName'  => 'Many'
        });

        Map<String, Object> result = (Map<String, Object>) response.get('result');
        System.assertEquals(10, ((List<Object>) result.get('contacts')).size());
        System.assertEquals(true, result.get('hasMore'));
    }

    @IsTest
    static void search_missingSurname_throws() {
        try {
            new PetbarnContactSearchProc().process(new Map<String, Object>{ 'firstName' => 'Jane' });
            System.assert(false, 'Expected an exception for a missing surname');
        } catch (Exception ex) {
            System.assert(ex.getMessage().contains('surname'), ex.getMessage());
        }
    }

    @IsTest
    static void search_normalisesPastedNames() {
        insert new Contact(FirstName = 'Mary Jane', LastName = 'Adopter');

        aos_Response response = new PetbarnContactSearchProc().process(new Map<String, Object>{
            'firstName' => 'Mary  Jane​',
            'lastName'  => ' Adopter '
        });

        Map<String, Object> result = (Map<String, Object>) response.get('result');
        System.assertEquals(1, ((List<Object>) result.get('contacts')).size());
    }

    @IsTest
    static void search_emojiInName_throwsValidation() {
        try {
            new PetbarnContactSearchProc().process(new Map<String, Object>{
                'firstName' => 'Jane 😀',
                'lastName'  => 'Adopter'
            });
            System.assert(false, 'Expected a ValidationException for an emoji in the name');
        } catch (aos_Structs.ValidationException ex) {
            System.assert(ex.getMessage().contains('emoji'), ex.getMessage());
        }
    }

    @IsTest
    static void masking_handlesEdgeCases() {
        System.assertEquals('No email on file', PetbarnContactSearchProc.maskedEmail(null));
        System.assertEquals('No email on file', PetbarnContactSearchProc.maskedEmail('not-an-email'));
        System.assertEquals('**@example.com', PetbarnContactSearchProc.maskedEmail('ab@example.com'));
        System.assertEquals('No phone on file', PetbarnContactSearchProc.maskedPhone(' '));
        System.assertEquals('***', PetbarnContactSearchProc.maskedPhone('123'));
        System.assertEquals('*******5678', PetbarnContactSearchProc.maskedPhone('+61 412 345 678'));
    }
}

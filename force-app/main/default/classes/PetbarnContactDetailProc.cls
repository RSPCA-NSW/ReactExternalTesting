/**
 * Loads the full (unmasked) details of one Contact once store staff have
 * picked a candidate from PetbarnContactSearchProc, so the adopter edit form
 * can be pre-filled.
 */
public without sharing class PetbarnContactDetailProc extends aos_AbstractProcessor {

    public override aos_Response process(aos_Request request) {
        this.request = request == null ? new aos_Request() : request;

        Id contactId = this.request.getRequiredString('contactId', 'No contact was supplied.');
        Contact c = this.getContact(contactId);

        this.response.put('result', new Map<String, Object>{
            'contactId' => c.Id,
            'firstName' => c.FirstName,
            'lastName'  => c.LastName,
            'email'     => c.Email,
            'phone'     => c.Phone,
            'birthdate' => c.Birthdate == null ? null : String.valueOf(c.Birthdate),
            'street'    => c.MailingStreet,
            'suburb'    => c.MailingCity,
            'state'     => c.MailingState,
            'postcode'  => c.MailingPostalCode,
            'country'   => c.MailingCountry
        });
        return this.response;
    }

    private Contact getContact(Id contactId) {
        return (Contact) aos_Utils.arrays.firstOrException(
            [
                SELECT Id, FirstName, LastName, Phone, Email, Birthdate,
                    MailingStreet, MailingCity, MailingState, MailingPostalCode, MailingCountry
                FROM Contact
                WHERE Id = :contactId
            ],
            'No Contact found',
            aos_Structs.NotFoundException.class
        );
    }
}

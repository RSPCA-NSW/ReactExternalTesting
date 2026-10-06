/**
 * Creates or updates the adopter Contact from the Petbarn adoption dialog.
 *
 *  - No contactId  -> insert a new Contact.
 *  - contactId     -> load the Contact, apply any changed fields, update it.
 *                     If nothing changed, no DML runs and outcome = 'unchanged'.
 *
 * Every field is required: name, email, phone, date of birth and a full
 * mailing address all appear on the adoption agreement, and adopters must
 * be 18 or over. MailingCountry is deliberately not written: org automation
 * normalises it to the ISO code (AU) on its own, and writing a different
 * spelling would make every save look like a change.
 *
 * Implements IRollbackable so aos_CommonCtrl wraps the call in a savepoint.
 */
public without sharing class PetbarnSaveAdopterProc extends aos_AbstractProcessor implements aos_Structs.IRollbackable {

    // Loose check: something@something.something. Salesforce validates the
    // Email field properly on save; this just catches obvious typos early.
    private static final String EMAIL_PATTERN = '^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$';
    private static final Integer MIN_ADOPTER_AGE = 18;
    private static final Set<String> AU_STATES = new Set<String>{
        'ACT', 'NSW', 'NT', 'QLD', 'SA', 'TAS', 'VIC', 'WA'
    };

    /** Everything the form submits, already trimmed / normalised. */
    private class Adopter {
        String firstName;
        String lastName;
        String email;
        String phone;
        Date birthdate;
        String street;
        String suburb;
        String state;
        String postcode;
    }

    public override aos_Response process(aos_Request request) {
        this.request = request == null ? new aos_Request() : request;
        this.saveAdopter();
        return this.response;
    }

    private void saveAdopter() {

        // --- read + validate -------------------------------------------
        String contactId = this.request.getString('contactId');
        Adopter adopter = this.readAdopter();

        // --- build ------------------------------------------------------
        Contact contactToCommit;
        String outcome;

        if (String.isBlank(contactId)) {
            contactToCommit = this.buildNewContact(adopter);
            outcome = 'created';
        } else {
            contactToCommit = this.buildUpdatedContact(contactId, adopter);
            outcome = contactToCommit == null ? 'unchanged' : 'updated';
        }

        // --- commit -----------------------------------------------------
        if (contactToCommit != null) {
            aos_UnitOfWork uow = new aos_UnitOfWork(new List<SObjectType>{
                Contact.SObjectType
            });
            uow.registerUpsert(contactToCommit);
            uow.commitWork();
        }

        // --- respond ----------------------------------------------------
        this.response.put('result', new Map<String, Object>{
            'contactId' => contactToCommit != null ? contactToCommit.Id : contactId,
            'outcome'   => outcome
        });
    }

    private Adopter readAdopter() {
        Adopter a = new Adopter();
        a.firstName = this.clean(this.request.getString('firstName'));
        a.lastName  = this.clean(this.request.getString('lastName'));
        a.email     = this.validateEmail(this.request.getString('email'));
        a.phone     = this.formatPhone(this.request.getString('phone'));
        a.birthdate = this.validateBirthdate(this.request.getString('birthdate'));
        a.street    = this.clean(this.request.getString('street'));
        a.suburb    = this.clean(this.request.getString('suburb'));
        a.state     = this.clean(this.request.getString('state'));
        a.postcode  = this.clean(this.request.getString('postcode'));

        if (String.isBlank(a.firstName)) {
            throw new aos_Structs.ValidationException('A first name is required.');
        }
        if (String.isBlank(a.lastName)) {
            throw new aos_Structs.ValidationException('A surname is required.');
        }
        if (String.isBlank(a.street) || String.isBlank(a.suburb)
                || String.isBlank(a.state) || String.isBlank(a.postcode)) {
            throw new aos_Structs.ValidationException(
                'A full address (street, suburb, state and postcode) is required for the adoption agreement.');
        }

        a.state = a.state.toUpperCase();
        if (!AU_STATES.contains(a.state)) {
            throw new aos_Structs.ValidationException('Select a valid Australian state or territory.');
        }
        if (!Pattern.matches('^\\d{4}$', a.postcode)) {
            throw new aos_Structs.ValidationException('Postcode must be four digits.');
        }
        return a;
    }

    private Contact buildNewContact(Adopter a) {
        return new Contact(
            FirstName         = a.firstName,
            LastName          = a.lastName,
            Email             = a.email,
            Phone             = a.phone,
            Birthdate         = a.birthdate,
            MailingStreet     = a.street,
            MailingCity       = a.suburb,
            MailingState      = a.state,
            MailingPostalCode = a.postcode
        );
    }

    /**
     * Returns the Contact with changed fields applied, or null when every
     * submitted value already matches what is stored.
     */
    private Contact buildUpdatedContact(Id contactId, Adopter a) {
        Contact existing = (Contact) aos_Utils.arrays.firstOrException(
            [
                SELECT Id, FirstName, LastName, Email, Phone, Birthdate,
                    MailingStreet, MailingCity, MailingState, MailingPostalCode
                FROM Contact
                WHERE Id = :contactId
            ],
            'No Contact found',
            aos_Structs.NotFoundException.class
        );

        Boolean changed = false;

        if (existing.FirstName         != a.firstName) { existing.FirstName         = a.firstName; changed = true; }
        if (existing.LastName          != a.lastName)  { existing.LastName          = a.lastName;  changed = true; }
        if (existing.Email             != a.email)     { existing.Email             = a.email;     changed = true; }
        if (existing.Phone             != a.phone)     { existing.Phone             = a.phone;     changed = true; }
        if (existing.Birthdate         != a.birthdate) { existing.Birthdate         = a.birthdate; changed = true; }
        if (existing.MailingStreet     != a.street)    { existing.MailingStreet     = a.street;    changed = true; }
        if (existing.MailingCity       != a.suburb)    { existing.MailingCity       = a.suburb;    changed = true; }
        if (existing.MailingState      != a.state)     { existing.MailingState      = a.state;     changed = true; }
        if (existing.MailingPostalCode != a.postcode)  { existing.MailingPostalCode = a.postcode;  changed = true; }

        return changed ? existing : null;
    }

    private String clean(String raw) {
        return String.isBlank(raw) ? null : raw.trim();
    }

    /**
     * Expects yyyy-mm-dd from the date input. Rejects blanks, unparseable
     * values, future dates and anyone under MIN_ADOPTER_AGE as at today.
     */
    private Date validateBirthdate(String raw) {
        if (String.isBlank(raw)) {
            throw new aos_Structs.ValidationException('A date of birth is required for the adoption agreement.');
        }
        Date dob;
        try {
            dob = Date.valueOf(raw.trim());
        } catch (Exception ex) {
            throw new aos_Structs.ValidationException('That date of birth does not look right. Please check and try again.');
        }
        Date today = Date.today();
        if (dob > today) {
            throw new aos_Structs.ValidationException('Date of birth cannot be in the future.');
        }
        if (dob.addYears(MIN_ADOPTER_AGE) > today) {
            throw new aos_Structs.ValidationException(
                'Adopters must be ' + MIN_ADOPTER_AGE + ' or over. This person is under ' + MIN_ADOPTER_AGE + '.');
        }
        return dob;
    }

    private String validateEmail(String rawEmail) {
        if (String.isBlank(rawEmail)) {
            throw new aos_Structs.ValidationException('An email address is required.');
        }
        String email = rawEmail.trim();
        if (!Pattern.matches(EMAIL_PATTERN, email)) {
            throw new aos_Structs.ValidationException('That email address does not look right. Please check and try again.');
        }
        return email.toLowerCase();
    }

    /**
     * Normalises Australian numbers for display consistency:
     *   04xx xxx xxx   mobiles
     *   0x xxxx xxxx   landlines
     * Anything else (international, short, extensions) is stored as typed.
     */
    private String formatPhone(String rawPhone) {
        if (String.isBlank(rawPhone)) {
            throw new aos_Structs.ValidationException('A phone number is required.');
        }
        String trimmed = rawPhone.trim();
        String digits = trimmed.replaceAll('\\D', '');

        if (digits.length() == 10 && digits.startsWith('04')) {
            return digits.substring(0, 4) + ' ' + digits.substring(4, 7) + ' ' + digits.substring(7);
        }
        if (digits.length() == 10 && digits.startsWith('0')) {
            return digits.substring(0, 2) + ' ' + digits.substring(2, 6) + ' ' + digits.substring(6);
        }
        return trimmed;
    }
}

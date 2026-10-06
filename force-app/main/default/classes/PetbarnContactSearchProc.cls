/**
 * Finds existing Contacts by exact first + last name for the Petbarn adopter
 * lookup. Returns at most 10 masked candidates (email / phone hints only) so
 * store staff can confirm which person they are talking to without seeing
 * full contact details before the record is selected.
 */
public without sharing class PetbarnContactSearchProc extends aos_AbstractProcessor {

    private static final Integer PAGE_SIZE = 10;

    public override aos_Response process(aos_Request request) {
        this.request = request == null ? new aos_Request() : request;
        this.search();
        return this.response;
    }

    public class Candidate {
        public Id contactId;
        public String firstName;
        public String lastName;
        public String phoneHint;
        public String emailHint;
        public String suburb;

        public Candidate(Contact c) {
            this.contactId = c.Id;
            this.firstName = c.FirstName;
            this.lastName  = c.LastName;
            this.emailHint = maskedEmail(c.Email);
            this.phoneHint = maskedPhone(c.Phone);
            this.suburb    = c.MailingCity;
        }
    }

    private void search() {
        String first = this.request.getRequiredString('firstName', 'No first name was given').trim();
        String last  = this.request.getRequiredString('lastName', 'No surname was given').trim();

        if (String.isBlank(first) || String.isBlank(last)) {
            throw new aos_Structs.ValidationException('Enter both a first name and a surname.');
        }

        List<Contact> contacts = this.getContacts(first, last);
        Boolean hasMore = contacts.size() > PAGE_SIZE;

        List<Candidate> candidates = new List<Candidate>();
        for (Contact c : contacts) {
            if (candidates.size() == PAGE_SIZE) break;
            candidates.add(new Candidate(c));
        }

        this.response.put('result', new Map<String, Object>{
            'contacts' => candidates,
            'hasMore'  => hasMore
        });
    }

    private List<Contact> getContacts(String first, String last) {
        // LIMIT is one over the page size so we can tell the UI there are more
        // matches without a second COUNT() query.
        Integer queryLimit = PAGE_SIZE + 1;
        return [
            SELECT Id, FirstName, LastName, Email, Phone, MailingCity
            FROM Contact
            WHERE FirstName = :first
            AND LastName = :last
            ORDER BY CreatedDate DESC
            LIMIT :queryLimit
        ];
    }

    /** j***n@example.com - first and last character of the local part only. */
    public static String maskedEmail(String email) {
        if (String.isBlank(email) || !email.contains('@')) {
            return 'No email on file';
        }

        String[] parts = email.split('@', 2);
        String username = parts[0];
        String domain = parts[1];

        if (username.length() <= 2) {
            return '**@' + domain;
        }

        String maskedUser = username.left(1)
            + '*'.repeat(username.length() - 2)
            + username.right(1);
        return maskedUser + '@' + domain;
    }

    /** ******1234 - last four digits only. */
    public static String maskedPhone(String phone) {
        if (String.isBlank(phone)) {
            return 'No phone on file';
        }
        String digits = phone.replaceAll('\\D', '');
        if (digits.length() <= 4) {
            return '*'.repeat(digits.length());
        }
        return '*'.repeat(digits.length() - 4) + digits.right(4);
    }
}

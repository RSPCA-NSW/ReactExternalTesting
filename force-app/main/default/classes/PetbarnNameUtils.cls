/**
 * Shared name cleaning / validation for the Petbarn adopter procs, so the
 * lookup searches on exactly what the save would store.
 */
public class PetbarnNameUtils {

    public static final Integer FIRST_NAME_MAX_LENGTH = Contact.FirstName.getDescribe().getLength();
    public static final Integer LAST_NAME_MAX_LENGTH  = Contact.LastName.getDescribe().getLength();

    /**
     * Strips zero-width characters, turns non-breaking / exotic spaces into
     * plain spaces, then trims and collapses runs of whitespace.
     */
    public static String normaliseName(String name) {
        if (name == null) {
            return null;
        }
        String value = name;
        value = value.replaceAll('[\\u200B\\uFEFF]', '');
        value = value.replaceAll('[\\u00A0\\u2000-\\u200A\\u202F\\u3000]', ' ');
        value = value.normalizeSpace();

        return value;
    }

    /**
     * Throws a ValidationException when the (already normalised) name is
     * blank, too long, or contains control characters or emoji.
     * label is used mid-sentence, so pass it lower case, e.g. 'first name'.
     */
    public static void validateName(String value, Integer maxLength, String label) {

        if (String.isBlank(value)) {
            throw new aos_Structs.ValidationException('A ' + label + ' is required.');
        }

        if (value.length() > maxLength) {
            throw new aos_Structs.ValidationException(
                label.capitalize() + ' must be ' + maxLength + ' characters or fewer.');
        }

        if (Pattern.compile('\\p{Cntrl}').matcher(value).find()) {
            throw new aos_Structs.ValidationException(label.capitalize() + ' contains invalid characters.');
        }

        // Emoji live outside the Basic Multilingual Plane, so they take two
        // UTF-16 units (a surrogate pair) but count as one code point.
        if (value.codePointCount(0, value.length()) != value.length()) {
            throw new aos_Structs.ValidationException(label.capitalize() + ' can\'t contain emoji.');
        }
    }
}

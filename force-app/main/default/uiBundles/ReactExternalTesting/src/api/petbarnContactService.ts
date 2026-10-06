import { fetchProcessor } from '@/api/apexClient';

/** One row from the search results - contact details are masked. */
export type ContactCandidate = {
  contactId: string;
  firstName: string;
  lastName: string;
  emailHint: string;
  phoneHint: string;
  /** Mailing suburb, unmasked, to help tell same-name people apart. */
  suburb: string | null;
};

export type ContactSearchResult = {
  contacts: ContactCandidate[];
  /** True when more than the returned page matched - ask the user to narrow down. */
  hasMore: boolean;
};

/** Full details of a selected contact, used to pre-fill the edit form. */
export type ContactDetail = {
  contactId: string;
  firstName: string | null;
  lastName: string | null;
  email: string | null;
  phone: string | null;
  /** yyyy-mm-dd, or null if not recorded. */
  birthdate: string | null;
  street: string | null;
  suburb: string | null;
  state: string | null;
  postcode: string | null;
  /** Read-only: the org normalises this to the ISO code (AU) itself. */
  country: string | null;
};

/** Every field is required - they all appear on the adoption agreement. */
export type SaveAdopterInput = {
  /** Omit / null to create a new Contact. */
  contactId?: string | null;
  firstName: string;
  lastName: string;
  email: string;
  phone: string;
  /** yyyy-mm-dd. Required; the adopter must be 18 or over. */
  birthdate: string;
  street: string;
  suburb: string;
  state: string;
  postcode: string;
};

export type SaveAdopterOutcome = 'created' | 'updated' | 'unchanged';

export type SaveAdopterResult = {
  contactId: string;
  outcome: SaveAdopterOutcome;
};

/** Exact first + last name match, max 10 masked candidates. */
export async function searchContacts(
  firstName: string,
  lastName: string
): Promise<ContactSearchResult> {
  const envelope = await fetchProcessor<any>('PetbarnContactSearchProc', {
    firstName,
    lastName,
  });
  return envelope.dto.result;
}

/** Unmasked details for one contact the user has picked from the search. */
export async function getContactDetail(contactId: string): Promise<ContactDetail> {
  const envelope = await fetchProcessor<any>('PetbarnContactDetailProc', {
    contactId,
  });
  return envelope.dto.result;
}

/**
 * Creates (no contactId) or updates (contactId) the adopter Contact. The
 * processor formats the phone number and validates the email, so the result
 * may differ slightly from what was typed.
 */
export async function saveAdopter(input: SaveAdopterInput): Promise<SaveAdopterResult> {
  const envelope = await fetchProcessor<any>('PetbarnSaveAdopterProc', {
    contactId: input.contactId ?? null,
    firstName: input.firstName,
    lastName: input.lastName,
    email: input.email,
    phone: input.phone,
    birthdate: input.birthdate,
    street: input.street,
    suburb: input.suburb,
    state: input.state,
    postcode: input.postcode,
  });
  return envelope.dto.result;
}

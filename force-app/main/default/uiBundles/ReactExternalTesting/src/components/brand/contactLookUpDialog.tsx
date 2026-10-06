import { useState } from "react";
import { ChevronRight, UserPlusIcon } from "lucide-react";
import {
    Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle, Button, Input, Label,
    Select, SelectTrigger, SelectValue, SelectContent, SelectItem,
} from "../ui";
import { StatusAlert } from "../alerts/status-alert";
import {
    searchContacts,
    getContactDetail,
    saveAdopter,
    type ContactCandidate,
    type SaveAdopterOutcome,
} from "@/api/petbarnContactService";

type View = 'search' | 'results' | 'edit' | 'success' | 'error';

type AdopterForm = {
    firstName: string;
    lastName: string;
    email: string;
    phone: string;
    birthdate: string;
    street: string;
    suburb: string;
    state: string;
    postcode: string;
};

const EMPTY_FORM: AdopterForm = {
    firstName: '', lastName: '', email: '', phone: '', birthdate: '',
    street: '', suburb: '', state: '', postcode: '',
};

const MIN_ADOPTER_AGE = 18;

function todayAsInputValue(): string {
    const today = new Date();
    const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, '0');
    const day = String(today.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
}

/** Age in whole years as at today for a yyyy-mm-dd string, or null if unparseable. */
function ageFromBirthdate(value: string): number | null {
    const match = /^(\d{4})-(\d{2})-(\d{2})$/.exec(value);
    if (!match) return null;
    const [, y, m, d] = match.map(Number);
    const today = new Date();
    let age = today.getFullYear() - y;
    const beforeBirthday =
        today.getMonth() + 1 < m || (today.getMonth() + 1 === m && today.getDate() < d);
    if (beforeBirthday) age -= 1;
    return age;
}

const AU_STATES = ['ACT', 'NSW', 'NT', 'QLD', 'SA', 'TAS', 'VIC', 'WA'];

const OUTCOME_MESSAGE: Record<SaveAdopterOutcome, string> = {
    created: 'A new contact has been created for this adopter.',
    updated: 'The adopter\'s contact details have been updated.',
    unchanged: 'The adopter\'s details were already up to date.',
};

/**
 * Adopter lookup for the "Adopt Me" action.
 *
 *   search  -> type first + last name
 *   results -> pick a masked candidate, or start a new contact
 *   edit    -> review / correct the details, then save
 *   success -> confirmation, hands the contactId back via onSaved
 */
export function ContactLookUpDialog({ animalId, open, onClose, onSaved }: {
    animalId: string;
    open: boolean;
    onClose: () => void;
    /** Called after a successful save with the adopter's Contact Id. */
    onSaved?: (contactId: string, outcome: SaveAdopterOutcome) => void;
}) {

    const [view, setView] = useState<View>('search');
    const [firstName, setFirstName] = useState('');
    const [lastName, setLastName] = useState('');
    const [candidates, setCandidates] = useState<ContactCandidate[]>([]);
    const [hasMore, setHasMore] = useState(false);
    const [selectedContactId, setSelectedContactId] = useState<string | null>(null);
    const [form, setForm] = useState<AdopterForm>(EMPTY_FORM);
    const [busy, setBusy] = useState(false);
    const [error, setError] = useState<string | null>(null);
    const [outcome, setOutcome] = useState<SaveAdopterOutcome | null>(null);
    const [savedContactId, setSavedContactId] = useState<string | null>(null);

    if (!animalId) return null;

    function stopP(e: React.MouseEvent) {
        e.stopPropagation();
    }

    function updateForm(field: keyof AdopterForm) {
        return (e: React.ChangeEvent<HTMLInputElement>) =>
            setForm(prev => ({ ...prev, [field]: e.target.value }));
    }

    // --- search ---------------------------------------------------------

    async function handleSearch() {
        const first = firstName.trim();
        const last = lastName.trim();
        if (!first || !last) {
            setError('Enter both a first name and a surname.');
            return;
        }

        setBusy(true);
        setError(null);
        try {
            const result = await searchContacts(first, last);
            setCandidates(result.contacts);
            setHasMore(result.hasMore);
            setView('results');
        } catch (e: any) {
            setError(e.message);
        } finally {
            setBusy(false);
        }
    }

    // --- pick a candidate / start new -------------------------------------

    async function handleSelect(candidate: ContactCandidate) {
        setBusy(true);
        setError(null);
        try {
            const detail = await getContactDetail(candidate.contactId);
            setSelectedContactId(detail.contactId);
            setForm({
                firstName: detail.firstName ?? '',
                lastName: detail.lastName ?? '',
                email: detail.email ?? '',
                phone: detail.phone ?? '',
                birthdate: detail.birthdate ?? '',
                street: detail.street ?? '',
                suburb: detail.suburb ?? '',
                state: detail.state ?? '',
                postcode: detail.postcode ?? '',
            });
            setView('edit');
        } catch (e: any) {
            setError(e.message);
        } finally {
            setBusy(false);
        }
    }

    function handleCreateNew() {
        setSelectedContactId(null);
        setForm({ ...EMPTY_FORM, firstName: firstName.trim(), lastName: lastName.trim() });
        setError(null);
        setView('edit');
    }

    function handleBackToSearch() {
        setError(null);
        setView('search');
    }

    // --- save -------------------------------------------------------------

    async function handleSave() {
        if (!form.firstName.trim() || !form.lastName.trim()) {
            setError('First name and surname are required.');
            return;
        }
        if (!form.email.trim()) {
            setError('Email address is required.');
            return;
        }
        if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(form.email.trim())) {
            setError('That email address does not look right.');
            return;
        }
        if (!form.phone.trim()) {
            setError('Phone number is required.');
            return;
        }
        if (!form.birthdate) {
            setError('Date of birth is required.');
            return;
        }
        const age = ageFromBirthdate(form.birthdate);
        if (age === null || age < 0) {
            setError('That date of birth does not look right.');
            return;
        }
        if (age < MIN_ADOPTER_AGE) {
            setError(`Adopters must be ${MIN_ADOPTER_AGE} or over. This person is ${age}.`);
            return;
        }
        if (!form.street.trim() || !form.suburb.trim() || !form.state || !form.postcode.trim()) {
            setError('A full address (street, suburb, state and postcode) is required.');
            return;
        }
        if (!/^\d{4}$/.test(form.postcode.trim())) {
            setError('Postcode must be four digits.');
            return;
        }

        setBusy(true);
        setError(null);
        try {
            const result = await saveAdopter({
                contactId: selectedContactId,
                firstName: form.firstName.trim(),
                lastName: form.lastName.trim(),
                email: form.email.trim(),
                phone: form.phone.trim(),
                birthdate: form.birthdate,
                street: form.street.trim(),
                suburb: form.suburb.trim(),
                state: form.state,
                postcode: form.postcode.trim(),
            });
            setOutcome(result.outcome);
            setSavedContactId(result.contactId);
            setView('success');
            onSaved?.(result.contactId, result.outcome);
        } catch (e: any) {
            setError(e.message);
            setView('error');
        } finally {
            setBusy(false);
        }
    }

    // --- views ------------------------------------------------------------

    let content;

    if (view === 'search') content =
        <div className="grid gap-4" onClick={stopP}>
            <DialogHeader>
                <DialogTitle>Find the adopter</DialogTitle>
                <DialogDescription>Search by the adopter's first name and surname.</DialogDescription>
            </DialogHeader>
            <div className="grid gap-4">
                <div className="flex flex-col gap-2">
                    <Label htmlFor="adopter-first">First name</Label>
                    <Input
                        id="adopter-first"
                        type="text"
                        autoComplete="off"
                        value={firstName}
                        onChange={e => setFirstName(e.target.value)}
                        onKeyDown={e => { if (e.key === 'Enter') handleSearch(); }}
                    />
                </div>
                <div className="flex flex-col gap-2">
                    <Label htmlFor="adopter-last">Surname</Label>
                    <Input
                        id="adopter-last"
                        type="text"
                        autoComplete="off"
                        value={lastName}
                        onChange={e => setLastName(e.target.value)}
                        onKeyDown={e => { if (e.key === 'Enter') handleSearch(); }}
                    />
                </div>
            </div>
            {error && <StatusAlert variant="error">{error}</StatusAlert>}
            <div className="flex justify-end gap-2 pt-2">
                <Button variant="outline" onClick={onClose} disabled={busy}>Cancel</Button>
                <Button onClick={handleSearch} disabled={busy}>{busy ? 'Searching...' : 'Search'}</Button>
            </div>
        </div>

    else if (view === 'results') content =
        <div className="grid gap-4" onClick={stopP}>
            <DialogHeader>
                <DialogTitle>Select the adopter</DialogTitle>
                <DialogDescription>
                    {candidates.length === 0
                        ? `No contacts found for ${firstName.trim()} ${lastName.trim()}.`
                        : 'Confirm with the adopter which contact is theirs, or create a new one.'}
                </DialogDescription>
            </DialogHeader>

            {candidates.length > 0 && (
                <div className="flex flex-col gap-2 max-h-[320px] overflow-y-auto">
                    {candidates.map(c => (
                        <Button
                            key={c.contactId}
                            type="button"
                            variant="outline"
                            disabled={busy}
                            onClick={() => handleSelect(c)}
                            className="h-auto w-full justify-between px-4 py-3 text-left hover:border-primary transition-colors"
                        >
                            <span className="flex flex-col gap-0.5">
                                <span className="font-medium">{c.firstName} {c.lastName}</span>
                                <span className="text-xs font-normal text-muted-foreground">{c.emailHint}</span>
                                <span className="text-xs font-normal text-muted-foreground">{c.phoneHint}</span>
                                <span className="text-xs font-normal text-muted-foreground">{c.suburb ?? 'No address on file'}</span>
                            </span>
                            <ChevronRight className="h-4 w-4 text-muted-foreground" aria-hidden="true" />
                        </Button>
                    ))}
                </div>
            )}

            {hasMore && (
                <StatusAlert variant="info">
                    More than 10 contacts matched. Only the most recent are shown.
                </StatusAlert>
            )}

            <Button
                type="button"
                variant="secondary"
                disabled={busy}
                onClick={handleCreateNew}
                className="h-auto w-full justify-start gap-3 px-4 py-3 text-left hover:border-primary transition-colors"
            >
                <UserPlusIcon aria-hidden="true" />
                <span className="flex flex-col gap-0.5">
                    <span className="font-medium">Create a new contact</span>
                </span>
            </Button>

            {error && <StatusAlert variant="error">{error}</StatusAlert>}
            <div className="flex justify-between gap-2 pt-2">
                <Button variant="ghost" onClick={handleBackToSearch} disabled={busy}>Back</Button>
                <Button variant="outline" onClick={onClose} disabled={busy}>Cancel</Button>
            </div>
        </div>

    else if (view === 'edit') content =
        <div className="grid gap-4" onClick={stopP}>
            <DialogHeader>
                <DialogTitle>{selectedContactId ? 'Confirm adopter details' : 'New adopter'}</DialogTitle>
                <DialogDescription>
                    {selectedContactId
                        ? 'Check the details with the adopter and correct anything that has changed. All fields are required for the adoption agreement.'
                        : 'Enter the adopter\'s contact details. All fields are required for the adoption agreement.'}
                </DialogDescription>
            </DialogHeader>
            <div className="grid gap-4">
                <div className="grid gap-4 sm:grid-cols-2">
                    <div className="flex flex-col gap-2">
                        <Label htmlFor="adopter-edit-first">First name</Label>
                        <Input id="adopter-edit-first" required type="text" value={form.firstName} onChange={updateForm('firstName')} />
                    </div>
                    <div className="flex flex-col gap-2">
                        <Label htmlFor="adopter-edit-last">Surname</Label>
                        <Input id="adopter-edit-last" required type="text" value={form.lastName} onChange={updateForm('lastName')} />
                    </div>
                </div>
                <div className="flex flex-col gap-2">
                    <Label htmlFor="adopter-edit-email">Email</Label>
                    <Input id="adopter-edit-email" required type="email" autoComplete="off" value={form.email} onChange={updateForm('email')} />
                </div>
                <div className="grid gap-4 sm:grid-cols-2">
                    <div className="flex flex-col gap-2">
                        <Label htmlFor="adopter-edit-phone">Phone</Label>
                        <Input id="adopter-edit-phone" required type="tel" autoComplete="off" value={form.phone} onChange={updateForm('phone')} />
                    </div>
                    <div className="flex flex-col gap-2">
                        <Label htmlFor="adopter-edit-dob">Date of birth <span className="font-normal text-muted-foreground">(18+)</span></Label>
                        <Input id="adopter-edit-dob" required type="date" max={todayAsInputValue()} value={form.birthdate} onChange={updateForm('birthdate')} />
                    </div>
                </div>

                <fieldset className="grid gap-4 rounded-lg border border-border bg-muted/30 p-3">
                    <legend className="px-1 text-sm font-medium">Address <span className="font-normal text-muted-foreground"></span></legend>
                    <div className="flex flex-col gap-2">
                        <Label htmlFor="adopter-edit-street">Street</Label>
                        <Input id="adopter-edit-street" required type="text" autoComplete="off" value={form.street} onChange={updateForm('street')} />
                    </div>
                    <div className="grid gap-4 sm:grid-cols-[1fr_auto_auto]">
                        <div className="flex flex-col gap-2">
                            <Label htmlFor="adopter-edit-suburb">Suburb</Label>
                            <Input id="adopter-edit-suburb" required type="text" autoComplete="off" value={form.suburb} onChange={updateForm('suburb')} />
                        </div>
                        <div className="flex flex-col gap-2">
                            <Label htmlFor="adopter-edit-state">State</Label>
                            <Select value={form.state} onValueChange={v => setForm(prev => ({ ...prev, state: v }))}>
                                <SelectTrigger id="adopter-edit-state" aria-required="true" className="w-full sm:w-[100px]">
                                    <SelectValue placeholder="State" />
                                </SelectTrigger>
                                <SelectContent>
                                    {AU_STATES.map(st => <SelectItem key={st} value={st}>{st}</SelectItem>)}
                                </SelectContent>
                            </Select>
                        </div>
                        <div className="flex flex-col gap-2">
                            <Label htmlFor="adopter-edit-postcode">Postcode</Label>
                            <Input id="adopter-edit-postcode" required type="text" inputMode="numeric" maxLength={4} autoComplete="off" className="sm:w-[90px]" value={form.postcode} onChange={updateForm('postcode')} />
                        </div>
                    </div>
                </fieldset>
            </div>
            {error && <StatusAlert variant="error">{error}</StatusAlert>}
            <div className="flex justify-between gap-2 pt-2">
                <Button variant="ghost" onClick={() => { setError(null); setView('results'); }} disabled={busy}>Back</Button>
                <div className="flex gap-2">
                    <Button variant="outline" onClick={onClose} disabled={busy}>Cancel</Button>
                    <Button onClick={handleSave} disabled={busy}>{busy ? 'Saving...' : 'Save'}</Button>
                </div>
            </div>
        </div>

    else if (view === 'error') content =
        <div className="grid gap-4" onClick={stopP}>
            <DialogHeader>
                <DialogTitle>Something went wrong</DialogTitle>
            </DialogHeader>
            <StatusAlert variant="error">{error}</StatusAlert>
            <div className="flex justify-end gap-2 pt-2">
                <Button variant="outline" onClick={() => { setError(null); setView('edit'); }}>Try again</Button>
                <Button onClick={onClose}>Close</Button>
            </div>
        </div>

    else if (view === 'success') content =
        <div className="grid gap-4" onClick={stopP}>
            <DialogHeader>
                <DialogTitle>Adopter saved</DialogTitle>
            </DialogHeader>
            <StatusAlert variant="success">
                {outcome ? OUTCOME_MESSAGE[outcome] : 'The adopter has been saved.'}
            </StatusAlert>
            {savedContactId && (
                <p className="text-xs text-muted-foreground">Contact ID: {savedContactId}</p>
            )}
            <div className="flex justify-end pt-2">
                <Button onClick={onClose}>Done</Button>
            </div>
        </div>

    return (
        <Dialog open={open} onOpenChange={(isOpen) => { if (!isOpen) onClose(); }}>
            <DialogContent className="sm:max-w-[480px]">
                {content}
            </DialogContent>
        </Dialog>
    );
}

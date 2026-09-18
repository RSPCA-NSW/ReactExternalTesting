import { useState } from 'react'
import {
    Dialog, DialogHeader, DialogContent, DialogTitle, DialogDescription, Button, Label, Input,
    Select, SelectTrigger, SelectValue, SelectContent, SelectItem,
} from "../ui"
import { dailyActions } from '@/api/petbarnAnimalActionsService';
import { StatusAlert } from '../alerts/status-alert';
import type { SelectOptions } from '@/api/petbarnStatsService';

/**
 * Key that PetbarnHomeMetaProc's select options arrive under. The framework
 * (aos_Utils.picklists.getFieldKey) camelCases the field API name and appends
 * "Options": Distress_in_Shelter_Score_VAS__c -> distressInShelterScoreVASOptions.
 */
const VAS_OPTIONS_KEY = 'distressInShelterScoreVASOptions';

const OBSERVATIONS = [
    { key: 'eat', label: 'Eat' },
    { key: 'drink', label: 'Drink' },
    { key: 'urine', label: 'Urine' },
];

const FAECES_SCORES = [0, 1, 2, 3, 4, 5, 6, 7];

const MAX_COMMENTS = 255;

/** Shared classes for the comments textarea so it matches the Input primitive. */
const TEXTAREA_CLASS =
    'dark:bg-input/30 border-input focus-visible:border-ring focus-visible:ring-ring/50 w-full min-w-0 rounded-lg border bg-transparent px-2.5 py-2 text-base transition-colors outline-none focus-visible:ring-3 md:text-sm placeholder:text-muted-foreground/70 placeholder:italic resize-none disabled:cursor-not-allowed disabled:opacity-50';

function todayAsInputValue(): string {
    const today = new Date();
    const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, '0');
    const day = String(today.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
}

export function DailyActionsDialog({ open, onClose, animalId, options }: {
    animalId: string,
    open: boolean,
    options: SelectOptions | null;
    onClose: () => void;
}) {

    const [obs, setObs] = useState<Record<string, boolean>>({});
    const [faecesScore, setFaecesScore] = useState<number>(0);
    const [comments, setComments] = useState('');
    const [inputDate, setInputDate] = useState<string>(todayAsInputValue());
    const [saving, setSaving] = useState(false);
    const [error, setError] = useState<string | null>(null);
    const [view, setView] = useState<'actions' | 'success' | 'error'>('actions');
    const [vasScore, setVasScore] = useState<string | null>(null);

    const vasOptions = options?.[VAS_OPTIONS_KEY] ?? [];

    const handleDateChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setInputDate(e.target.value);
    }

    async function handleSubmit() {
        if (!animalId) return;

        const missing = OBSERVATIONS.filter(o => obs[o.key] === undefined);
        if (missing.length > 0) {
            setError(`Please answer: ${missing.map(o => o.label).join(', ')}`);
            return;
        }

        if (faecesScore === null || isNaN(faecesScore)) {
            setError('Invalid faecal score');
            return;
        }

        setSaving(true);
        setError(null);

        try {
            await dailyActions(animalId, {
                urine: obs.urine ? 'Yes' : 'No',
                eat: obs.eat ? 'Yes' : 'No',
                drink: obs.drink ? 'Yes' : 'No',
                faecalScore: faecesScore,
                vasScore,
                loggedAt: inputDate || null,
                comments,
            });
            setView('success');
        } catch (e: any) {
            setError(e.message);
            setView('error');
        } finally {
            setSaving(false);
        }
    }

    let content;
    if (view === 'actions') content =
        <div className="grid gap-5" onClick={e => e.stopPropagation()}>
            <DialogHeader>
                <DialogTitle>Daily Observations</DialogTitle>
                <DialogDescription>Record today's observations for this animal.</DialogDescription>
            </DialogHeader>

            <div className="grid gap-4">
                <fieldset className="grid gap-3 sm:grid-cols-3">
                    <legend className="mb-2 text-sm font-medium">Observed today</legend>
                    {OBSERVATIONS.map(({ key, label }) => (
                        <div key={key} className="flex flex-col gap-2 rounded-lg border border-border bg-muted/30 p-3">
                            <Label id={`${key}-label`} className="text-xs uppercase tracking-wide text-muted-foreground">{label}</Label>
                            <div className="grid grid-cols-2 gap-2" role="radiogroup" aria-labelledby={`${key}-label`}>
                                {[true, false].map((val) => (
                                    <Button
                                        key={String(val)}
                                        type="button"
                                        role="radio"
                                        size="sm"
                                        variant={obs[key] === val ? 'default' : 'outline'}
                                        aria-checked={obs[key] === val}
                                        onClick={() => setObs((prev) => ({ ...prev, [key]: val }))}
                                    >
                                        {val ? 'Yes' : 'No'}
                                    </Button>
                                ))}
                            </div>
                        </div>
                    ))}
                </fieldset>

                <div className="grid gap-4 sm:grid-cols-2">
                    <div className="flex flex-col gap-2">
                        <Label htmlFor="faeces-score">Faecal scoring</Label>
                        <Select
                            value={faecesScore === null ? '' :String(faecesScore)}
                            onValueChange={(v) => setFaecesScore(Number(v))}
                        >
                            <SelectTrigger id="faeces-score" className="w-full">
                                <SelectValue placeholder='0-7' />
                            </SelectTrigger>
                            <SelectContent>
                                {FAECES_SCORES.map((n) => (
                                    <SelectItem key={n} value={String(n)}>{String(n)}</SelectItem>
                                ))}
                            </SelectContent>
                        </Select>
                    </div>

                    <div className="flex flex-col gap-2">
                        <Label htmlFor="obs-date">Date logged</Label>
                        <Input id="obs-date" type="date" onChange={handleDateChange} value={inputDate} />
                    </div>
                </div>

                <div className="flex flex-col gap-2">
                    <Label htmlFor="vas-score">VAS score</Label>
                    <Select
                        value={vasScore ?? ''}
                        onValueChange={(v) => setVasScore(v)}
                        disabled={vasOptions.length === 0}
                    >
                        <SelectTrigger id="vas-score" className="w-full">
                            <SelectValue placeholder={options ? 'Select...' : 'Loading...'} />
                        </SelectTrigger>
                        <SelectContent>
                            {vasOptions.map((o) => (
                                <SelectItem key={o.value} value={o.value}>{o.label}</SelectItem>
                            ))}
                        </SelectContent>
                    </Select>
                </div>

                <div className="flex flex-col gap-2">
                    <div className="flex items-baseline justify-between">
                        <Label htmlFor="obs-comments">Comments</Label>
                        <span className="text-xs text-muted-foreground" aria-live="polite">
                            {comments.length} / {MAX_COMMENTS}
                        </span>
                    </div>
                    <textarea
                        id="obs-comments"
                        className={TEXTAREA_CLASS}
                        rows={4}
                        maxLength={MAX_COMMENTS}
                        placeholder="Anything you noticed — appetite, behaviour, interactions with customers."
                        value={comments}
                        onChange={(e) => setComments(e.target.value)}
                    />
                </div>
            </div>

            {error && <StatusAlert variant="error">{error}</StatusAlert>}

            <div className="flex justify-end gap-2 pt-2">
                <Button variant="outline" onClick={onClose} disabled={saving}>Cancel</Button>
                <Button onClick={handleSubmit} disabled={saving}>
                    {saving ? 'Saving...' : 'Submit'}
                </Button>
            </div>
        </div>

    if (view === 'success') content =
        <div className="grid gap-4">
            <DialogHeader>
                <DialogTitle>Observations saved</DialogTitle>
            </DialogHeader>
            <StatusAlert variant="success">Daily observations have been recorded.</StatusAlert>
            <div className="flex justify-end pt-2">
                <Button onClick={onClose}>Done</Button>
            </div>
        </div>

    if (view === 'error') content =
        <div className="grid gap-4">
            <DialogHeader>
                <DialogTitle>Something went wrong</DialogTitle>
            </DialogHeader>
            <StatusAlert variant="error">{error}</StatusAlert>
        </div>

    return (
        <Dialog open={open} onOpenChange={(isOpen) => { if (!isOpen) onClose(); }}>
            <DialogContent className="sm:max-w-lg">
                {content}
            </DialogContent>
        </Dialog>
    );
}

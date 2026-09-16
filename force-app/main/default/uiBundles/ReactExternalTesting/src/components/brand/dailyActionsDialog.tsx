import { useState } from 'react'
import {
    Dialog, DialogHeader, DialogContent, DialogTitle, Button, Label, Input,
    Select, SelectTrigger, SelectValue, SelectContent, SelectItem,
} from "../ui"
import { dailyActions } from '@/api/petbarnAnimalActionsService';


export function DailyActionsDialog({ open, onClose, animalId }: {
    animalId: string,
    open: boolean,
    onClose: () => void;
}) {

    const OBSERVATIONS = [
        { key: 'eat', label: 'Eat' },
        { key: 'drink', label: 'Drink' },
        { key: 'urine', label: 'Urine' },
    ];

    const FAECES_SCORES = [0, 1, 2, 3, 4, 5, 6, 7];

    const MAX_COMMENTS = 255;
    const [obs, setObs] = useState<Record<string, boolean>>({});
    const [faecesScore, setFaecesScore] = useState<number>(0);
    const [comments, setComments] = useState('');
    const [inputDate, setInputDate] = useState<any>(null);
    const [saving, setSaving] = useState(false);
    const [error, setError] = useState<string | null>(null);
    const [view, setView] = useState<'actions' | 'error'>('actions');

    
    const handleDateChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setInputDate(e.target.value);
    }
    
    
        
    async function handleSubmit(){
        if(!animalId) return null;

        const missing = OBSERVATIONS.filter(o => obs[o.key] === undefined);
        if (missing.length > 0) {
            setError(`please answer: ${missing.map(o => o.label).join(',')}`);
            return;
        }

        if(faecesScore === null || isNaN(faecesScore)){
            setError('Invalid Score');
            return
        }
        
        setSaving(true);
        setError(null);

        try {
            await dailyActions(animalId, 
                {
                urine: obs.urine!,
                eat: obs.eat!,
                drink: obs.drink!,
                faecalScore: faecesScore!,
                loggedAt: inputDate,
                comments: comments!
        });

        } catch (e: any){
            setError(e.message);
            setView('error');
        } finally{
            setSaving(false);
        }

    }

    const today = new Date();
    const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, '0');
    const day = String(today.getDate()).padStart(2, '0');

    const formattedDate = `${year}-${month}-${day}`;

    let content;
    if(view === 'actions') content =
            <DialogHeader onClick={e => {e.stopPropagation}}>
                    <DialogTitle className="mx-auto mb-4 text-base">Daily Observations</DialogTitle>
                

                <div className="grid gap-4">
                    <div className="grid grid-cols-2 gap-3">
                        {OBSERVATIONS.map(({ key, label }) => (
                            <div key={key} className="flex flex-col gap-2 rounded-lg border border-border p-3">
                                <Label id={`${key}-label`} className="text-sm font-semibold">{label}</Label>
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

                        <div className="flex flex-col gap-2 rounded-lg border border-border p-3">
                            <Label htmlFor="faeces-score" className="text-sm font-semibold">Faecal Scoring</Label>
                            <Select
                                value={faecesScore === null ? '' : String(faecesScore)}
                                onValueChange={(v) => setFaecesScore(Number(v))}
                            >
                                <SelectTrigger id="faeces-score" size="sm" className="w-full">
                                    <SelectValue placeholder="Score 0-7" />
                                </SelectTrigger>
                                <SelectContent>
                                    {FAECES_SCORES.map((n) => (
                                        <SelectItem key={n} value={String(n)}>{n}</SelectItem>
                                    ))}
                                </SelectContent>
                            </Select>
                        </div>
                    </div>

                    <div className="grid-gap-4">
                        <div className="grid grid-cols-2 gap-3">
                            <label className="text-sm font-semibold">Date Logged</label>
                            <Input type="date" onChange={handleDateChange} value={formattedDate}></Input>
                        </div>
                    </div>

                    <div className="flex flex-col gap-2">
                        <Label htmlFor="obs-comments" className="text-sm font-semibold">Comments</Label>
                        <textarea
                            id="obs-comments"
                            className="w-full rounded-lg border border-border bg-card px-3 py-2 text-sm shadow-xs outline-none focus-visible:border-ring focus-visible:ring-3 focus-visible:ring-ring/50 resize-none"
                            rows={4}
                            maxLength={MAX_COMMENTS}
                            placeholder="Anything you noticed — appetite, behaviour, interactions with customers."
                            value={comments}
                            onChange={(e) => setComments(e.target.value)}
                        />
                        <div className="text-right text-xs text-muted-foreground" aria-live="polite">
                            {comments.length} / {MAX_COMMENTS}
                        </div>
                    </div>
                    <Button className="hover:border-primary transition-colors" variant="secondary" onClick={handleSubmit} disabled={saving}>{saving ? 'Saving...' : 'Submit'}</Button>
                </div>
            </DialogHeader>

        if(view === 'error')
            content = 
        <DialogHeader>
            <DialogTitle></DialogTitle>
            <div className="mx-auto">
            <StatusAlert variant="error">{error}</StatusAlert>
            </div>
        </DialogHeader>


    return (
        <Dialog open={open} onOpenChange={onClose}>
            <DialogContent className="sm:max-w-[425px]">
                {content}
            </DialogContent>
        </Dialog>
    );


}

import { useState } from "react";
import { Dialog, DialogHeader, DialogContent, DialogTitle, DialogDescription, Button, Label } from "../ui"
import { logWeight } from "@/api/petbarnAnimalActionsService";
import { StatusAlert } from "../alerts/status-alert";
import { Input } from "../ui";



export function LogWeightDialog({ animalId, currentWeight, open, onClose }: {
    animalId: string;
    currentWeight: number | null;
    open: boolean;
    onClose: () => void;
}) {

    const initWeight = currentWeight
    const [view, setView] = useState<'weight' | 'success' | 'error'>('weight');
    const [inputWeight, setInputWeight] = useState<any>(initWeight);
    const [inputDate, setInputDate] = useState<any>(null);
    const [error, setError] = useState<string | null>(null);
    const [saving, setSaving] = useState<boolean>(false)

    function stopP(e: React.MouseEvent){
        e.stopPropagation();
    }

    const handleWeightChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setInputWeight(e.target.value);
    };

    const handleDateChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setInputDate(e.target.value);
    }


    async function handleSubmit() {
        if (!animalId) return null;

        const parsed = parseFloat(inputWeight);

        if (isNaN(parsed) || parsed <= 0) {
            setError('Enter a weight greater than zero.');
            return;
        }

        setSaving(true);
        setError(null);

        try {
            await logWeight(animalId, parsed, inputDate);
            setView('success');
        } catch (e: any) {
            setError(e.message);
            setView('error');
        } finally {
            setSaving(false);
        }
        }


    const today = new Date();
    const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, '0');
    const day = String(today.getDate()).padStart(2, '0');

    const formattedDate = `${year}-${month}-${day}`;




    if(!animalId) return;


    let content;
    if (view === 'weight') content =
        <div className="grid gap-4" onClick={e => {stopP(e)}}>
            <DialogHeader>
                <DialogTitle>Log Weight</DialogTitle>
                <DialogDescription>Record the animal's weight in kilograms.</DialogDescription>
            </DialogHeader>
            <div className="grid gap-4">
                <div className="flex flex-col gap-2">
                    <Label htmlFor="weight-kg">Weight (kg)</Label>
                    <Input id="weight-kg" step="0.01" type="number" value={inputWeight} onChange={handleWeightChange}/>
                </div>
                <div className="flex flex-col gap-2">
                    <Label htmlFor="weight-date">Date given</Label>
                    <Input id="weight-date" type="date" value={formattedDate} onChange={handleDateChange}/>
                </div>
            </div>
            {error && <StatusAlert variant="error">{error}</StatusAlert>}
            <div className="flex justify-end gap-2 pt-2">
                <Button variant="outline" onClick={onClose} disabled={saving}>Cancel</Button>
                <Button onClick={handleSubmit} disabled={saving}>{saving ? 'Saving...' : 'Submit'}</Button>
            </div>
        </div>

    else if(view === 'error') content =
        <div className="grid gap-4">
            <DialogHeader>
                <DialogTitle>Something went wrong</DialogTitle>
            </DialogHeader>
            <StatusAlert variant="error">{error}</StatusAlert>
        </div>

    else if(view ==='success') content =
        <div className="grid gap-4">
            <DialogHeader>
                <DialogTitle>Weight logged</DialogTitle>
            </DialogHeader>
            <StatusAlert variant="success">The weight has been saved.</StatusAlert>
            <div className="flex justify-end pt-2">
                <Button onClick={onClose}>Done</Button>
            </div>
        </div>



    return (
        <Dialog open={open} onOpenChange={(isOpen) => { if (!isOpen) onClose(); }}>
            <DialogContent className="sm:max-w-[425px]">
                {content}
            </DialogContent>
        </Dialog>
    );




}

import { useState } from "react";
import { Dialog, DialogHeader, DialogContent, DialogTitle, Button, Label } from "../ui"
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
    const [view, setView] = useState<'menu' | 'weight' | 'success'| 'error' | 'saving'>('menu');
    const [inputWeight, setInputWeight] = useState<any>(initWeight);
    const [inputDate, setInputDate] = useState<any>(null);
    const [error, setError] = useState<string | null>(null);
    const [saving, setSaving] =useState<boolean>(false)

    function stopP(e: React.MouseEvent){
        e.stopPropagation();
    }
    
    function handleLogWeight(e: React.MouseEvent) {
        stopP(e);
        setView('weight');
    }

    function handleDailyObservations(e: React.MouseEvent) {
        stopP(e);
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
    if (view === 'menu') content =
        <DialogHeader>
            <DialogTitle className="mx-auto mb-4">Animal Actions</DialogTitle>
            <div className="mx-auto grid grid-cols-2">
                <Button
                    onClick={e => handleDailyObservations(e)}
                    className="hover:border-primary transition-colors" variant="default">
                    Daily Actions
                </Button>
                <Button
                    onClick={e => handleLogWeight(e)}
                    className="hover:border-primary transition-colors" variant="secondary">
                    Log Weight
                </Button>
            </div>
        </DialogHeader>
    
    else if (view === 'weight') content =
        <DialogHeader onClick={e => {stopP(e)}}>
            <DialogTitle className="mx-auto mb-4 text-base">Please Log the weight below</DialogTitle>                    
                <div className="grid gap-2 grid-cols-3">
                    <Label className="col-span-1 text-sm font-semibold">Weight (KG): </Label>
                    <Input step="0.01" className="col-span-2"  type="number" value={inputWeight} onChange={handleWeightChange}/>              
                <Label className="col-span-1"> Date Given: </Label>
                <Input className="col-span-2" type="Date" defaultValue={formattedDate} onChange={handleDateChange}/>
                 </div>
                <Button className="hover:border-primary transition-colors" variant="secondary" onClick={handleSubmit} disabled={saving}>{saving ? 'Saving...' : 'Submit'}</Button>
        </DialogHeader>
    
    else if(view === 'error') content =
    <DialogHeader>
        <DialogTitle></DialogTitle>
        <div className="mx-auto">
        <StatusAlert variant="error">{error}</StatusAlert>
        </div>
    </DialogHeader>

    else if(view ==='success') content = 
    <DialogHeader>
        <DialogTitle>
            Succcess!
        </DialogTitle>
    </DialogHeader>



    return (
        <Dialog open={open} onOpenChange={onClose}>
            <DialogContent className="sm:max-w-[425px]">
                {content}
            </DialogContent>
        </Dialog>
    );




}
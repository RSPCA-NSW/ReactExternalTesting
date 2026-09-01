import { useState } from "react";
import { Dialog, DialogHeader, DialogContent, DialogTitle, Button, Label } from "../ui"
import { logWeight } from "@/api/petbarnAnimalActionsService";


export function AnimalActionsDialog({ animalId, open, onClose }: {
    animalId: string;
    open: boolean;
    onClose: () => void;
}) {

    const [view, setView] = useState<'menu' | 'weight'>('menu');
    const [inputWeight, setInputWeight] = useState<any>(0);

    function stopP(e: React.MouseEvent){
        e.stopPropagation();
    }
    
    function handleLogWeight(e: React.MouseEvent) {
        stopP(e);
        setView('weight')

    }

    function handleDailyObservations(e: React.MouseEvent) {
        stopP(e);
    }

    
    const handleWeightChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setInputWeight(e.target.value);
    };
    
    
    function handleSubmit(e: React.MouseEvent){
    logWeight(animalId, inputWeight);
    stopP(e);
    }

    const today = new Date();
    const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, '0'); // Months are 0-based
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
                <div className="grid gap-2 grid-cols-3 flex flex-col gap-2">
                    <Label className="col-span-1 test-sm font-semibold">Weight (KG): </Label>
                    <input name="weight" className="col-span-2 w-full rounded-mb border border-input bg-backround" type="number" value={inputWeight} onChange={handleWeightChange}></input>               
                <Label> Date Given </Label>
                <input type="Date" defaultValue={formattedDate}></input>
                 </div>
                <Button className="hover:border-primary transition-colors" variant="secondary" onClick={e => {handleSubmit(e)}}>Submit</Button>
        </DialogHeader>



    return (
        <Dialog open={open} onOpenChange={onClose}>
            <DialogContent className="sm:max-w-[425px]">
                {content}
            </DialogContent>
        </Dialog>
    );



}
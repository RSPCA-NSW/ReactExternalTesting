import { useState } from "react";
import { Dialog, DialogHeader, DialogContent, DialogTitle, Button, Label } from "../ui"


export function AnimalActionsDialog({ animalId, open, onClose }: {
    animalId: string | null;
    open: boolean;
    onClose: () => void;
}) {

    const [view, setView] = useState<'menu' | 'weight'>('menu');

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

   /* function handleSubmit(e: React.MouseEvent){
        stopP(e);
    } */


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
                    <Label className="col-span-1 test-sm font-semibold">Weight(Kg): </Label>
                    <input className="col-span-2 w-full rounded-mb border border-input bg-backround" type="Number"></input>
                </div>
                <Button className="hover:border-primary transition-colors" variant="secondary">Submit</Button>
        </DialogHeader>



    return (
        <Dialog open={open} onOpenChange={onClose}>
            <DialogContent className="sm:max-w-[425px]">
                {content}
            </DialogContent>
        </Dialog>
    );



}
import { useState } from "react";
import { Dialog, DialogContent, DialogHeader, DialogTitle, Button } from "../ui"
import { LogWeightDialog } from "../brand/logWeightDialog"
import { DailyActionsDialog } from "./dailyActionsDialog";



export function AnimalActionsDialog({ animalId, currentWeight, open, onClose }:
    {
        animalId: string,
        open: boolean,
        currentWeight: number | null;
        onClose: () => void;
    }) {

        const [view, setView] = useState<'menu' | 'dailyActions' | 'weight'>('menu')


        function handleLogWeight(e: React.MouseEvent){
            e.stopPropagation();
            setView('weight');

        }

        function handleDailyActions(e: React.MouseEvent){
            e.stopPropagation();
            setView('dailyActions');
        }

        if (view === 'weight') return (
            <LogWeightDialog
                animalId={animalId}
                currentWeight={currentWeight}
                open={open}
                onClose={() => {!open}} />
        );

        if (view === 'dailyActions') return (
            <DailyActionsDialog
                animalId={animalId}
                open={open}
                onClose={() => {!open}} />
        );


        let content;
        if(view === 'menu') content =

            <DialogHeader>
                <DialogTitle className="mx-auto mb-4">Animal Actions</DialogTitle>
                <div className="mx-auto grid grid-cols-2">
                    <Button
                        onClick={e => handleDailyActions(e)}
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


        return (
            <Dialog open={open} onOpenChange={onClose}>
                <DialogContent className="sm:max-w-[425px]">
                    {content}
                </DialogContent>
            </Dialog>
        );

    }

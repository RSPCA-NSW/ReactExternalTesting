import { useState } from "react";
import { ClipboardListIcon, ScaleIcon } from "lucide-react";
import { Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle, Button } from "../ui"
import { LogWeightDialog } from "../brand/logWeightDialog"
import { DailyActionsDialog } from "./dailyActionsDialog";
import type { SelectOptions } from "@/api/petbarnStatsService";


export function AnimalActionsDialog({ animalId, currentWeight, open, onClose, options }:
    {
        animalId: string,
        open: boolean,
        currentWeight: number | null;
        options: SelectOptions | null;
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
                onClose={onClose} />
        );

        if (view === 'dailyActions') return (
            <DailyActionsDialog
                animalId={animalId}
                open={open}
                options={options}
                onClose={onClose} />
        );


        return (
            <Dialog open={open} onOpenChange={(isOpen) => { if (!isOpen) onClose(); }}>
                <DialogContent className="sm:max-w-[425px]">
                    <DialogHeader>
                        <DialogTitle>Animal Actions</DialogTitle>
                        <DialogDescription>Choose what you would like to record for this animal.</DialogDescription>
                    </DialogHeader>
                    <div className="grid gap-2 sm:grid-cols-2">
                        <Button
                            onClick={e => handleDailyActions(e)}
                            className="h-auto flex-col items-start gap-1 px-4 py-3 text-left hover:border-primary transition-colors" variant="default">
                            <ClipboardListIcon aria-hidden="true" />
                            <span className="font-medium">Daily Actions</span>
                            <span className="text-xs font-normal opacity-80 whitespace-normal">Eat, drink, urine, faecal and VAS scores</span>
                        </Button>
                        <Button
                            onClick={e => handleLogWeight(e)}
                            className="h-auto flex-col items-start gap-1 px-4 py-3 text-left hover:border-primary transition-colors" variant="secondary">
                            <ScaleIcon aria-hidden="true" />
                            <span className="font-medium">Log Weight</span>
                            <span className="text-xs font-normal opacity-80">Record today's weigh-in</span>
                        </Button>
                    </div>
                </DialogContent>
            </Dialog>
        );

    }

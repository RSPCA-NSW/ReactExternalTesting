import { usePetbarnHome } from "@/hooks/usePetbarnHome";
import { CenteredState } from "@/components/CenteredState";
import { PawLoader, MetricCard } from "@/components/brand";
import { Button, Skeleton, Table, TableBody, TableCell, TableHead, TableHeader, TableRow, DialogTrigger, Dialog } from "@/components/ui";
import { useAlerts } from "@/hooks/useAlerts";
import { StatusAlert } from "@/components/alerts/status-alert";
import React from "react";
import { useState } from "react";
import { stripHTML } from "@/lib/utils";
import { ChevronRight, HeartIcon, HomeIcon, PawPrintIcon, ExternalLink } from "lucide-react";
import { Badge } from "@components/ui/badge";
import { usePetbarnStats } from "@/hooks/usePetbarnStats";
import { useUserData } from "@/hooks/useUserData";
import { AnimalActionsDialog } from "@/components/brand/AnimalActionsDialog";




const VARIANT_MAP: Record<string, "success" | "info" | "error"> = {
  error: 'error',
  info: 'info',
  success: 'success',
  warning: 'error'
};



export default function HomePage() {
  const { animals, locations, loading, error } = usePetbarnHome();
  const [expandedId, setExpandedId] = useState<string | null>(null);
  const animalIds = animals.map(e => e.node.Id);
  const { alertsByTarget } = useAlerts(animalIds);
  const locationId = animals.map(l => l.node.animalos__Current_Site__c?.value);
  const { stats, statsLoading, statsError } = usePetbarnStats(locationId);
  const { user, userLoading, userError } = useUserData();
  const [selectedId, setSelectedId] = useState<string | null>(null);

  let storeName = locations[0]?.node?.Name?.value.replace("Petbarn", "")
  
  let userName; 
  if(userLoading) userName = <Skeleton></Skeleton>;
  else if(userError) userName = <StatusAlert variant="error">{userError}</StatusAlert>
  else userName = user?.FirstName?.value
  
  function handleAnimalActions(e: React.MouseEvent, id: string){
    setSelectedId(selectedId === id ? null : id);
    e.stopPropagation();
  }

  
  
  
  
  
  return (
    <div>


      {loading && <CenteredState><PawLoader /></CenteredState>}
      {error &&
        <div>
          <StatusAlert variant="error">{error}</StatusAlert>
        </div>
      }

      {!loading && !error && (
        <div>


            
          <CenteredState>
          <div className="mb-6">
            <div className="flex flex-col gap-2" >
              <h1 className="text-2xl font-semi-bold"> Welcome {userName}! </h1>
              <h1 className="text-sm text-muted-foreground mb-6"> store: {storeName} </h1>
            </div>

            

              <div className="grid gap-4 md:grid-cols-3 mb-6" >
              
                <MetricCard  
                  label="Animals Available"
                  loading={statsLoading}
                  error={statsError}
                  value={stats?.animalCount}
                  tone="green-soft"
                  icon={< HomeIcon />}>
                </MetricCard>
                
                <MetricCard                      
                  label={`Adoptions from ${storeName}`}
                  loading={statsLoading}
                  error={statsError}
                  value={stats?.adoptionCount}
                  tone="green-soft"
                  icon={<HeartIcon/>} >
                </MetricCard>

                <MetricCard
                label="PlaceHolder"
                value="placeholder"
                tone="green-soft"
                icon={< PawPrintIcon />}>
                </MetricCard>

              </div>
                                         
               <div className="max-h-[500px] overflow-y-auto">
              <Table>
                <TableHeader className="sticky top-0 bg-background z-10">
                  <TableRow>
                    <TableHead></TableHead>
                    <TableHead>Name</TableHead>
                    <TableHead>Breed</TableHead>
                    <TableHead>Age</TableHead>
                    <TableHead></TableHead>
                    <TableHead></TableHead>
                  </TableRow>
                </TableHeader>
                <TableBody>
                  {animals.map(edge => {
                    const alerts = alertsByTarget[edge.node.Id] ?? [];
                    return (
                      <React.Fragment key={edge.node.Id}>
                        <TableRow
                          className="cursor-pointer"
                          onClick={() =>
                            setExpandedId(expandedId === edge.node.Id ? null : edge.node.Id)
                          }
                        >

                          <TableCell>
                            <ChevronRight className={`h-4 w-4 transition-duration-200 ${expandedId === edge.node.Id ? 'rotate-90' : ''
                              }`}
                            />
                          </TableCell>
                          <TableCell>{edge.node.animalos__Animal_Name__c?.value}
                          </TableCell>
                          <TableCell>{edge.node.animalos__Primary_Breed_Formula__c?.value}</TableCell>
                          <TableCell>{edge.node.animalos__Calculated_Age__c?.value}</TableCell>
                          <TableCell>
                            <Button 
                            className="hover:border-primary transition-colors"
                              onClick={e => {
                                e.stopPropagation();
                              }}> Adopt Me! {<ExternalLink />}</Button>
                          </TableCell>
                        
                        <TableCell>
                          <Dialog>
                          <DialogTrigger>                            
                            <Button className="hover:border-primary transition-colours" variant="secondary" 
                             onClick={e => handleAnimalActions(e, edge.node.Id)}>
                              Animal Actions
                            </Button>
                            {selectedId && <AnimalActionsDialog animalId={selectedId} open={selectedId !== null} onClose={() => setSelectedId(null)}/>}                         
                          </DialogTrigger>
                          </Dialog>
                        </TableCell>
                        
                        </TableRow>
                        {expandedId === edge.node.Id && (
                          <TableRow className="hover:bg-transparent">
                            <TableCell colSpan={7} className="animate-in fade-in slide-in-from-top-1 duration">
                              <div className="flex flex-col gap-2 items-start p-3">
                                {alerts.length === 0
                                  ? <Badge variant="ghost"> No Alerts Found</Badge>
                                  : alertsByTarget[edge.node.Id]?.map(alert => {
                                    const raw = alert.node?.animalos__Variant__c?.value;
                                    const variant = VARIANT_MAP[raw?.toLowerCase() ?? ''];
                                    return <StatusAlert
                                      variant={variant}
                                      key={alert.node?.Id}>
                                      {stripHTML(alert.node?.animalos__Message_Formatted__c?.value)}
                                    </StatusAlert>
                                  })}
                              </div>
                            </TableCell>
                          </TableRow>
                        )}
                      </React.Fragment>
                    );
                  })}
                </TableBody>
              </Table>
              </div>
            </div>
          </CenteredState>
        </div>





      )}

    </div>
  )
}

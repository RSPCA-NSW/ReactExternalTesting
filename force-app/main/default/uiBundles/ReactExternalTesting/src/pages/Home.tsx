import { usePetbarnHome } from "@/hooks/usePetbarnHome";
import { CenteredState } from "@/components/CenteredState";
import { PawLoader, MetricCard, PageHeader, Section } from "@/components/brand";
import { Button, Card, Skeleton, Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui";
import { useAlerts } from "@/hooks/useAlerts";
import { StatusAlert } from "@/components/alerts/status-alert";
import React from "react";
import { useState } from "react";
import { stripHTML } from "@/lib/utils";
import { ChevronRight, HeartIcon, HomeIcon, PawPrintIcon, ExternalLink } from "lucide-react";
import { Badge } from "@components/ui/badge";
import { usePetbarnStats } from "@/hooks/usePetbarnStats";
import { useUserData } from "@/hooks/useUserData";
import { AnimalActionsDialog } from "@/components/brand/animalActionsDialog";





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
  const { stats, options, statsLoading, statsError } = usePetbarnStats(locationId);
  const { user, userLoading, userError } = useUserData();
  const [selectedId, setSelectedId] = useState<string | null>(null);
  const [currentWeight, setCurrentWeight] = useState<number | null>(null);


  let storeName = locations[0]?.node?.Name?.value.replace("Petbarn", "")

  let userName;
  if (userLoading) userName = <Skeleton className="inline-block h-8 w-32 align-middle" />;
  else if (userError) userName = <StatusAlert variant="error">{userError}</StatusAlert>
  else userName = user?.FirstName?.value

  function handleAnimalActions(e: React.MouseEvent, id: string, weight: number) {
    setSelectedId(selectedId === id ? null : id);
    setCurrentWeight(currentWeight === weight ? null : weight);
    e.stopPropagation();
  }






  return (
    <div className="mx-auto w-full max-w-7xl px-4 py-8 sm:px-6 lg:px-8">


      {loading && <CenteredState><PawLoader /></CenteredState>}
      {error &&
        <div>
          <StatusAlert variant="error">{error}</StatusAlert>
        </div>
      }

      {!loading && !error && (
        <div className="flex flex-col gap-8">

          <PageHeader
            eyebrow={storeName ? `Petbarn ${storeName.trim()}` : 'Petbarn'}
            title={<>Welcome, {userName}</>}
            description="Your animals in store, adoption activity and daily observations at a glance."
          />

          <div className="grid gap-4 md:grid-cols-3">

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
              icon={<HeartIcon />} >
            </MetricCard>

            <MetricCard
              label="PlaceHolder"
              value="placeholder"
              tone="green-soft"
              icon={< PawPrintIcon />}>
            </MetricCard>

          </div>

          <Section
            title="Animals in store"
            description="Select a row to see alerts, or open Animal Actions to log observations and weights."
          >
            <Card className="py-0 gap-0">
              <div className="max-h-[500px] overflow-y-auto">
                <Table>
                  <TableHeader className="sticky top-0 bg-card z-10">
                    <TableRow>
                      <TableHead className="w-8"></TableHead>
                      <TableHead>Name</TableHead>
                      <TableHead>Animal ID</TableHead>
                      <TableHead>Breed</TableHead>
                      <TableHead>Age</TableHead>
                      <TableHead>Primary Colour</TableHead>
                      <TableHead className="text-right" colSpan={2}>
                        <span className="sr-only">Actions</span>
                      </TableHead>
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
                              <ChevronRight className={`h-4 w-4 text-muted-foreground transition-transform duration-200 ${expandedId === edge.node.Id ? 'rotate-90' : ''
                                }`}
                              />
                            </TableCell>
                            <TableCell className="font-medium">{edge.node.animalos__Animal_Name__c?.value}</TableCell>
                            <TableCell className="text-muted-foreground">{edge.node.Name?.value}</TableCell>
                            <TableCell>{edge.node.animalos__Primary_Breed_Formula__c?.value}</TableCell>
                            <TableCell>{edge.node.animalos__Calculated_Age__c?.value}</TableCell>
                            <TableCell>{edge.node.animalos__Primary_Colour__c?.value}</TableCell>
                            <TableCell className="text-right">
                              <Button
                                className="hover:border-primary transition-colors"
                                onClick={e => {
                                  e.stopPropagation();
                                }}> Adopt Me! {<ExternalLink />}</Button>
                            </TableCell>

                            <TableCell className="text-right">
                              <Button className="hover:border-primary transition-colors" variant="secondary"
                                onClick={e => handleAnimalActions(e, edge.node.Id, edge.node.animalos__Current_Weight__c?.value)}>
                                Animal Actions
                              </Button>
                            </TableCell>

                          </TableRow>
                          {expandedId === edge.node.Id && (
                            <TableRow className="hover:bg-transparent bg-muted/30">
                              <TableCell colSpan={8} className="animate-in fade-in slide-in-from-top-1 duration-200">
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
            </Card>
          </Section>

          {selectedId && (
            <AnimalActionsDialog
              options={options}
              key={selectedId}
              animalId={selectedId}
              currentWeight={currentWeight}
              open={selectedId !== null}
              onClose={() => { setSelectedId(null); setCurrentWeight(null) }}
            />
          )}
        </div>





      )}

    </div>
  )
}

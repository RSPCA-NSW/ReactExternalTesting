import { usePetbarnHome } from "@/hooks/usePetbarnHome";
import { CenteredState } from "@/components/CenteredState";
import { PawLoader } from "@/components/brand";
import { Button, Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui";
import { useAlerts } from "@/hooks/useAlerts";



export default function HomePage() {
  const { animals,loading, error } = usePetbarnHome();
  const { animalIds } = animals.map(e => e.node.Id);
  const { alertsByTarget } = useAlerts(animalIds);

  return (
    <div>
      

      {loading && <CenteredState><PawLoader /></CenteredState>}
      {error && <p>{error}</p>}

      {!loading && !error && (
        <CenteredState>
          <div className="max-w-5xl mx-auto p-4">
          <h1 className="text-1xl font-semibold mb-4 text-center">My Animals</h1>
          <Table>
            <TableHeader>
              <TableRow>
                <TableHead>Name</TableHead>
                <TableHead>Breed</TableHead>
                <TableHead>Age</TableHead>
                <TableHead>Adopt</TableHead>
                <TableHead>Alert</TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {animals.map(edge => (
                <TableRow key={edge.node.Id}>
                  <TableCell>{edge.node.animalos__Animal_Name__c?.value}</TableCell>
                  <TableCell>{edge.node.animalos__Primary_Breed_Formula__c?.value}</TableCell>
                  <TableCell>{edge.node.animalos__Calculated_Age__c?.value}</TableCell>
                  <TableCell>
                    <Button className="hover:border-primary transition-colors"> Adopt Me!</Button>
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
          </div>
        </CenteredState>

      )}

    </div>
  )
}

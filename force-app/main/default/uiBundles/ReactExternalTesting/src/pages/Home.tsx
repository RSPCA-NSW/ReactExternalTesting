import { usePetbarnHome } from "@/hooks/usePetbarnHome";
import { CenteredState } from "@/components/CenteredState";
import { PawLoader } from "@/components/brand";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui";
import { Badge } from "@/components/ui";



export default function HomePage() {
  const { animals, loading, error } = usePetbarnHome();

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
                <TableHead>Stage</TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {animals.map(edge => (
                <TableRow key={edge.node.Id}>
                  <TableCell>{edge.node.animalos__Animal_Name__c?.value}</TableCell>
                  <TableCell>{edge.node.animalos__Primary_Breed_Formula__c?.value}</TableCell>
                  <TableCell>
                    <Badge>{edge.node.animalos__Stage__c?.value}</Badge>
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

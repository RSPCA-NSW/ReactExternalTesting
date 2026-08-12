import { usePetbarnHome } from "@/hooks/usePetbarnHome";

export default function HomePage() {
  const { animals, loading, error } = usePetbarnHome();

  if (loading) return <p>Loading…</p>;
  if (error) return <p>Error: {error}</p>;

  return (
    <div>
      <h1>My Animals</h1>
      <pre>{JSON.stringify(animals, null, 2)}</pre>
    </div>
  );
}
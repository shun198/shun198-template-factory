import { StatusCard } from '../components/status-card';

export default function HomePage() {
  return (
    <main className="page">
      <section className="hero">
        <p className="eyebrow">Starter template</p>
        <h1>{process.env.NEXT_PUBLIC_APP_NAME ?? '__PROJECT_NAME__'}</h1>
        <p className="lede">
          A minimal Next.js dashboard baseline with room to grow.
        </p>
      </section>
      <section className="grid">
        <StatusCard title="App Router" value="enabled" />
        <StatusCard title="Testing" value="Vitest + Testing Library" />
        <StatusCard title="Formatting" value="Prettier" />
      </section>
    </main>
  );
}

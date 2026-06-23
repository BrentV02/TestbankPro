-- Voer dit uit in Supabase → SQL Editor → New query → Run

create table sessies (
  id          uuid primary key default gen_random_uuid(),
  motor_nummer text,
  klant        text,
  carbu        text,
  test_type    text default 'Test',
  uitkomst     text default 'Geslaagd',
  opmerkingen  text,
  runs         jsonb default '[]',
  created_at   timestamptz default now()
);

-- Iedereen met de anon key mag lezen en schrijven (persoonlijk gebruik)
alter table sessies enable row level security;
create policy "public access" on sessies for all using (true) with check (true);

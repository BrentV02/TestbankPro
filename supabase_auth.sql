-- Verwijder de oude open policy en vervang door auth-only
drop policy if exists "public access" on sessies;

create policy "alleen ingelogd" on sessies
  for all using (auth.role() = 'authenticated')
  with check (auth.role() = 'authenticated');

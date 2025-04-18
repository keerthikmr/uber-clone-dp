create or replace function ensure_passengers_table_exists()
returns void
language plpgsql
security definer
as $$
begin
  if not exists (select from pg_tables where schemaname = 'public' and tablename = 'passengers') then
    create table public.passengers (
      id uuid default gen_random_uuid() primary key,
      booking_id uuid not null references public.bookings(id) on delete cascade,
      full_name text not null,
      age integer not null,
      gender text not null,
      created_at timestamp with time zone default timezone('utc'::text, now()) not null,
      updated_at timestamp with time zone default timezone('utc'::text, now()) not null
    );

    -- Add indexes
    create index passengers_booking_id_idx on public.passengers(booking_id);

    -- Add RLS policies
    alter table public.passengers enable row level security;

    -- Allow users to view their own passengers
    create policy "Users can view passengers for their bookings"
      on public.passengers for select
      using (
        booking_id in (
          select id from public.bookings where user_id = auth.uid()
        )
      );

    -- Allow users to create passengers
    create policy "Users can create passengers for their bookings"
      on public.passengers for insert
      with check (
        booking_id in (
          select id from public.bookings where user_id = auth.uid()
        )
      );

    -- Allow users to update passengers for their bookings
    create policy "Users can update passengers for their bookings"
      on public.passengers for update
      using (
        booking_id in (
          select id from public.bookings where user_id = auth.uid()
        )
      );

    -- Allow drivers to view passengers for their rides
    create policy "Drivers can view passengers for their rides"
      on public.passengers for select
      using (
        booking_id in (
          select id from public.bookings where driver_id = auth.uid()
        )
      );
  end if;
end;
$$;

select ensure_passengers_table_exists();

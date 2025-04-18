create or replace function ensure_bookings_table_exists()
returns void
language plpgsql
security definer
as $$
begin
  if not exists (select from pg_tables where schemaname = 'public' and tablename = 'bookings') then
    create table public.bookings (
      id uuid default gen_random_uuid() primary key,
      ride_id uuid not null references public.rides(id),
      user_id uuid not null references auth.users(id),
      driver_id uuid not null references auth.users(id),
      from_location text not null,
      to_location text not null,
      start_time timestamp with time zone not null,
      seats_booked integer not null,
      total_price decimal(10,2) not null,
      status text not null default 'pending',
      payment_id text,
      payment_time timestamp with time zone,
      notes text,
      is_paid boolean not null default false,
      created_at timestamp with time zone default timezone('utc'::text, now()) not null,
      updated_at timestamp with time zone default timezone('utc'::text, now()) not null
    );

    -- Add indexes
    create index bookings_ride_id_idx on public.bookings(ride_id);
    create index bookings_user_id_idx on public.bookings(user_id);
    create index bookings_driver_id_idx on public.bookings(driver_id);
    create index bookings_status_idx on public.bookings(status);

    -- Add RLS policies
    alter table public.bookings enable row level security;

    -- Allow users to view their own bookings
    create policy "Users can view their own bookings"
      on public.bookings for select
      using (auth.uid() = user_id);

    -- Allow users to create bookings
    create policy "Users can create bookings"
      on public.bookings for insert
      with check (auth.uid() = user_id);

    -- Allow users to update their own bookings
    create policy "Users can update their own bookings"
      on public.bookings for update
      using (auth.uid() = user_id);

    -- Allow drivers to view bookings for their rides
    create policy "Drivers can view bookings for their rides"
      on public.bookings for select
      using (auth.uid() = driver_id);
  end if;
end;
$$; 
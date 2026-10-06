create extension if not exists "pgcrypto";

create table profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text,
  country text default 'CA',
  created_at timestamptz default now()
);

create table vehicles (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  make text not null,
  model text not null,
  year int,
  plate text,
  odometer_km numeric default 0,
  created_at timestamptz default now()
);

create table transactions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  vehicle_id uuid references vehicles(id) on delete set null,
  type text not null check (type in ('income','expense')),
  category text not null,
  amount numeric(12,2) not null check (amount >= 0),
  description text,
  receipt_url text,
  occurred_on date not null default current_date,
  created_at timestamptz default now()
);

create table mileage (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  vehicle_id uuid references vehicles(id) on delete cascade,
  start_km numeric,
  end_km numeric,
  business_km numeric not null check (business_km >= 0),
  trip_type text default 'business',
  occurred_on date not null default current_date,
  created_at timestamptz default now()
);

create table inventory (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  quantity int not null default 0,
  minimum_quantity int not null default 0,
  unit_cost numeric(12,2) not null default 0,
  created_at timestamptz default now()
);

create table subscriptions (
  user_id uuid primary key references auth.users(id) on delete cascade,
  entitlement text not null default 'free',
  status text not null default 'inactive',
  product_id text,
  expires_at timestamptz,
  updated_at timestamptz default now()
);

alter table profiles enable row level security;
alter table vehicles enable row level security;
alter table transactions enable row level security;
alter table mileage enable row level security;
alter table inventory enable row level security;
alter table subscriptions enable row level security;

create policy "own profile" on profiles for all using (auth.uid() = id) with check (auth.uid() = id);
create policy "own vehicles" on vehicles for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "own transactions" on transactions for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "own mileage" on mileage for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "own inventory" on inventory for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "read own subscription" on subscriptions for select using (auth.uid() = user_id);

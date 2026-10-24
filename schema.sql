-- Galumbra Supreme starter schema for Supabase
-- Run in Supabase Dashboard > SQL Editor. Review before production.
create extension if not exists pgcrypto;

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  username text unique,
  display_name text not null default 'New member',
  bio text not null default '',
  avatar_url text,
  country text,
  phone text,
  street text,
  city text,
  region text,
  postal_code text,
  preferred_currency text not null default 'NGN',
  id_type text,
  id_country text,
  created_at timestamptz not null default now()
);

create table if not exists public.posts (
  id uuid primary key default gen_random_uuid(),
  author_id uuid not null references public.profiles(id) on delete cascade,
  body text not null check (char_length(body) between 1 and 5000),
  created_at timestamptz not null default now()
);

create table if not exists public.plan_requests (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  tier_level integer not null check (tier_level between 0 and 1000),
  amount_ngn numeric(14,2) not null check (amount_ngn between 0 and 1300000),
  display_currency text not null default 'USD',
  display_amount numeric(16,2),
  status text not null default 'pending' check (status in ('pending','approved','rejected','cancelled')),
  created_at timestamptz not null default now()
);

alter table public.profiles enable row level security;
alter table public.posts enable row level security;
alter table public.plan_requests enable row level security;

create policy "Profiles are viewable by signed-in users" on public.profiles
for select to authenticated using (true);
create policy "Members can create their own profile" on public.profiles
for insert to authenticated with check (auth.uid() = id);
create policy "Members can update their own profile" on public.profiles
for update to authenticated using (auth.uid() = id) with check (auth.uid() = id);

create policy "Signed-in members can read posts" on public.posts
for select to authenticated using (true);
create policy "Members can publish as themselves" on public.posts
for insert to authenticated with check (auth.uid() = author_id);
create policy "Authors can delete their own posts" on public.posts
for delete to authenticated using (auth.uid() = author_id);

create policy "Members can see their own plan requests" on public.plan_requests
for select to authenticated using (auth.uid() = user_id);
create policy "Members can request their own plan" on public.plan_requests
for insert to authenticated with check (auth.uid() = user_id);

-- A production admin approval workflow must use a trusted server/Edge Function.
-- Never let a browser client approve its own payment or change plan status.

-- For a database created from an earlier version, migrate profiles by adding the new columns.
-- Do not store raw NIN/passport/government ID numbers in public.profiles.
-- If you already created an earlier schema, back up your database and migrate the old amount_usd column to amount_ngn before deploying this version. Do not blindly rerun CREATE TABLE statements as a migration.

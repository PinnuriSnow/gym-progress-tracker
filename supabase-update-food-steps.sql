-- Run this in Supabase SQL Editor to add Food Diary and Steps support
-- Existing attendance, weights and workouts columns/data are preserved.
alter table public.gym_tracker_data
  add column if not exists foods jsonb not null default '[]'::jsonb,
  add column if not exists steps jsonb not null default '[]'::jsonb;

-- Optional verification:
select column_name, data_type
from information_schema.columns
where table_schema = 'public'
  and table_name = 'gym_tracker_data'
order by ordinal_position;

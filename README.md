# Gym Progress Tracker — updated Android PWA

## What's new
- Refreshed dark navy/teal mobile dashboard with bottom navigation.
- Food Diary: add food under Breakfast, Lunch, Snacks or Dinner; record quantity, calories, protein, carbs and fats; daily totals are calculated automatically.
- Steps: manually enter daily step count from Samsung Health, with optional distance and notes. One entry per date; saving again for the same date updates it.
- Food and step records are stored locally and included in JSON backup/restore and Supabase sync.

## Important: update your existing Supabase table before deploying
Your existing project already has `attendance`, `weights` and `workouts`. Do not drop or recreate that table. In Supabase → SQL Editor, run the included `supabase-update-food-steps.sql`. It adds `foods` and `steps` columns with empty-array defaults and preserves all existing records.

## Deploy update
1. Export a backup from the currently working app (Insights → Export backup) before replacing anything.
2. Extract this ZIP.
3. Upload the contents of the `gym-tracker-pwa` folder to the existing Netlify site/repository, replacing the old app files. Keep your existing Supabase project URL and publishable key; the app stores these in the browser's local storage, not in config.js.
4. Open the deployed app while online. The service worker cache has been versioned to v2 so the new app shell should replace the old cached version.
5. Open Insights and confirm the existing attendance, workout and weight records are still present.
6. Add a test food item and a test step count, then use Sync now. Verify the `foods` and `steps` columns in Supabase.

## Food entry guidance
Nutrition values are entered manually. Use the same units and serving quantities as your diet plan or food label. Totals are the sum of the values you enter. The app does not automatically identify food or calculate nutrition from a food name.

The sample diet image provided with the project lists a daily total of 2,408.5 kcal, 106.6 g protein, 341.5 g carbohydrates and 74.4 g fats. Those are the values shown in that reference plan, not a personalized target.

## Existing features retained
Attendance calendar, workout logging, weight history, monthly attendance/workout insights, local-first storage, offline app shell, backup export/import and Supabase email/password authentication.

## Security
Never put a Supabase service-role key in this frontend. Use only the public anon/publishable key. Existing row-level security restricts each authenticated user to their own row.

## Data note
This starter uses one JSONB row per account and last-write-wins sync. Avoid editing on multiple devices while both are offline. Export backups regularly. It does not guarantee background sync while the app is closed.

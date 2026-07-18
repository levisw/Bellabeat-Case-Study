# Phase 3: Process

## Tool Choice

**R**, using the `tidyverse`, `lubridate`, and `janitor` packages. Chosen for its strength in combining data cleaning and visualization.

## Data Cleaning

See [`analysis/03-clean-data.R`](../analysis/03-clean-data.R) for the full code.

- Removed 3 duplicate rows from `sleepDay`.
- Converted `ActivityDate`, `SleepDay`, `ActivityHour`, and the weight log's `Date` field to proper date types, and renamed the daily activity/sleep date columns to a shared `Date` field so they could be joined.
- Added a `Weekday` column to daily activity.
- Flagged 77 rows in `dailyActivity` where `TotalSteps = 0` as likely non-wear days rather than real zero-activity days, using a new `LikelyNonWearDay` column.
- Dropped the `Fat` column from `weightLogInfo` as only 2 of 67 rows had a value.
- Joined daily activity and sleep data on `Id` + `Date` to create `activity_sleep_combined.csv`.

## Output

Cleaned files exported to `data/cleaned/`:

| File | Description |
|---|---|
| `daily_activity_clean.csv` | Daily activity, with `Weekday` and `LikelyNonWearDay` added |
| `sleep_day_clean.csv` | Sleep data, deduplicated |
| `hourly_steps_clean.csv` | Hourly step counts, datetime formatted |
| `hourly_intensities_clean.csv` | Hourly activity intensity, datetime formatted |
| `weight_log_clean.csv` | Weight log, `Fat` column removed |
| `activity_sleep_combined.csv` | Daily activity + sleep, joined on Id + Date |
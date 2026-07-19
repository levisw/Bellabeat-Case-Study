# Decision Log

Running log of key judgment calls made throughout the Bellabeat case study.

## Prepare Phase

- **Dataset export folder:** The Kaggle download contains two export folders (11-day and 31-day windows). Chose to use only the **4.12.16–5.12.16 (31-day) folder** as the primary dataset. It's more complete and covers a longer window. Did not merge the two folders, to avoid overlapping/duplicate records for users who appear in both.
- **Files carried forward:** Selected `dailyActivity`, `sleepDay`, `hourlySteps`, `hourlyIntensities`, and `weightLogInfo` as the working files for this analysis. Excluded minute-level files and `heartrate_seconds`.
- **Weight data caveat:** `weightLogInfo.csv` has only 8 unique users and is thus too sparse for use. Kept in the repo for reference.

## Process Phase

- **Tool:** R, chosen for combined cleaning + visualization.
- **Non-wear days:** 77 of 940 daily activity rows have `TotalSteps = 0`. Rather than deleting these, flagged them with a `LikelyNonWearDay` column so they can be excluded from activity-level averages in Analyze.
- **Weight data `Fat` column:** Dropped as only 2 of 67 rows had a value, making it unusable.
- **Combined table:** Built `activity_sleep_combined.csv` via inner join on daily activity + sleep, since the business questions need days where both were logged.

## Analyze Phase

- **Product selection:** Applied the analysis to the Time watch, since the strongest pattern in the data maps directly onto the product that tracks activity, sleep, and stress together.
- **Non-wear day exclusion:** All summary stats in `04-analyze.md` exclude the 77 rows flagged `LikelyNonWearDay`, to avoid zero-step days from non-wear pulling down activity averages.
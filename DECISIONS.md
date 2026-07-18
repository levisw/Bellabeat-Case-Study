# Decision Log

Running log of key judgment calls made throughout the Bellabeat case study, for transparency and quick reference.

## Prepare Phase

- **Dataset export folder:** The Kaggle download contains two export folders (11-day and 31-day windows). Chose to use only the **4.12.16–5.12.16 (31-day) folder** as the primary dataset — it's more complete (includes `sleepDay.csv`, which the 11-day folder lacks) and covers a longer window. Did not merge the two folders, to avoid overlapping/duplicate records for users who appear in both.
- **Files carried forward:** Selected `dailyActivity`, `sleepDay`, `hourlySteps`, `hourlyIntensities`, and `weightLogInfo` as the working files for this analysis. Excluded minute-level files (steps/calories/intensities/METs) and `heartrate_seconds` — these add granularity beyond what's needed to answer the business questions and would substantially increase processing complexity for limited added insight.
- **Weight data caveat:** `weightLogInfo.csv` has only 8 unique users — too sparse for standalone conclusions. Kept in the repo for reference/limitations discussion, but will not be a primary basis for recommendations.

## Process Phase

- **Tool:** R, chosen for combined cleaning + visualization.
- **Non-wear days:** 77 of 940 daily activity rows have `TotalSteps = 0`. Rather than deleting these, flagged them with a `LikelyNonWearDay` column so they can be excluded from activity-level averages in Analyze.
- **Weight data `Fat` column:** Dropped as only 2 of 67 rows had a value, making it unusable.
- **Combined table:** Built `activity_sleep_combined.csv` via inner join on daily activity + sleep, since the business questions need days where both were logged. This intentionally drops to 410 rows / 24 users, smaller than the full 940-row activity dataset — documented in `03-process.md` so this shrink isn't mistaken for a data loss error.

## Analyze Phase

*(To be added — including final choice of which Bellabeat product to apply insights to.)*
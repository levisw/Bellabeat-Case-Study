# Phase 2: Prepare

## Data Source

[FitBit Fitness Tracker Data](https://www.kaggle.com/datasets/arashnic/fitbit) — made available on Kaggle (CC0: Public Domain) via Mobius, originally generated through a distributed survey on Amazon Mechanical Turk.

## How the Data Is Organized

The download contains two separate export folders, split by date range:

| Folder | Date Range | Days |
|---|---|---|
| `mturkfitbit_export_3.12.16-4.11.16` | Mar 12 – Apr 12, 2016 | 11 days |
| `mturkfitbit_export_4.12.16-5.12.16` | Apr 12 – May 12, 2016 | 31 days |

**Decision:** This analysis uses the **4.12.16–5.12.16 (31-day) folder** as the primary dataset. It covers a longer time window and includes `sleepDay.csv`. The 11-day folder was reviewed but excluded to avoid incomplete records, and because merging the two would create duplicate date ranges for shared users. (See `DECISIONS.md`.)

## Data Quality Checks

- **Duplicates:** None found in `dailyActivity.csv`. 3 exact duplicate rows found in `sleepDay.csv`, to be removed in the Process phase.
- **Nulls:** None found in `dailyActivity.csv`.
- **Date format issue:** `SleepDay` is stored as a full datetime string with an identical `12:00:00 AM` timestamp on every row and will be converted to a clean date type during Process.
- **User ID consistency:** All 33 users in `dailyActivity` appear in `hourlySteps` and `hourlyIntensities`. Only 24 of the 33 users have any sleep log data. Only 8 users have weight log data.

## ROCCC Assessment

| Criteria | Assessment |
|---|---|
| **Reliable** | Low-moderate. Sample size is small and self-selected via Amazon Mechanical Turk thus is not a randomized or representative sample. |
| **Original** | Third-party. Data was collected by Fitabase from consenting Mechanical Turk participants, not collected directly by Bellabeat or this analysis. |
| **Comprehensive** | Limited. No demographic data is included, which is a gap given Bellabeat specifically markets to women. |
| **Current** | Low. Data was collected in 2016 and smart device usage and user behavior may have shifted since then. |
| **Cited** | Yes. Source and licensing are documented and traceable via Kaggle. |

## Limitations

- The sample size of 33 users is not robust enough to generalize to Bellabeat's full customer base.
- There is no demographic information, preventing confirmation that the sample reflects women specifically.
- Not everyone logged sleep or weight, which limits the sample size for those specific analyses and may bias results toward more engaged users.

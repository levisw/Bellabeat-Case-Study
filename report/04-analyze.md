# Phase 4: Analyze

See [`analysis/04-analyze.R`](../analysis/04-analyze.R) for the full code. All stats below exclude the 77 rows flagged as `LikelyNonWearDay`.

## Activity Patterns

- Median steps per day: 8,053
- Only 7 of 33 users (21%) averaged 10,000+ steps/day.
- Users spend on average 66% of their tracked day sedentary.
- Steps are highest on Tuesdays and Saturdays, lowest on Sundays.
- Activity peaks in the early evening, with a smaller bump around midday.

## Sleep Patterns

- Average sleep duration: 7.0 hours/night
- 44% of nights fall under 7 hours.
- Users spend an average of 39 minutes lying in bed before falling asleep.

## Sedentary Lifestyle and Sleep Relationship

Total steps barely correlate with sleep duration ,r = -0.19, but sedentary minutes have a much stronger negative correlation with sleep r = -0.60. In other words, how much of the day someone spends inactive tracks with worse sleep more than how active they are tracks with better sleep. 

## Product Selection

The patters of sedentary behavior and sleep quality are the strongest signals in this data, so this analysis applies its findings to the Time watch, since it tracks activity, sleep, and stress together.
library(tidyverse)

daily_activity = read_csv("data/cleaned/daily_activity_clean.csv")
activity_sleep = read_csv("data/cleaned/activity_sleep_combined.csv")
hourly_steps = read_csv("data/cleaned/hourly_steps_clean.csv")

# Exclude likely non-wear days from activity-level stats
active = daily_activity %>% filter(!LikelyNonWearDay)

# Summary stats
summary(active$TotalSteps)
summary(active$SedentaryMinutes)
mean(active$SedentaryMinutes) / 1440

# Users who average >= 10k steps/day
user_avg_steps = active %>%
  group_by(Id) %>%
  summarize(avg_steps = mean(TotalSteps))
sum(user_avg_steps$avg_steps >= 10000)
nrow(user_avg_steps)

# Steps by weekday
active %>%
  group_by(Weekday) %>%
  summarize(avg_steps = mean(TotalSteps)) %>%
  arrange(desc(avg_steps))

# Activity by hour
hourly_steps = hourly_steps %>%
  mutate(Hour = hour(ActivityHour))

hourly_steps %>%
  group_by(Hour) %>%
  summarize(avg_steps = mean(StepTotal)) %>%
  arrange(desc(avg_steps))

# Sleep duration
activity_sleep = activity_sleep %>%
  filter(!LikelyNonWearDay) %>%
  mutate(AwakeInBedMinutes = TotalTimeInBed - TotalMinutesAsleep)

mean(activity_sleep$TotalMinutesAsleep)
mean(activity_sleep$TotalMinutesAsleep) / 60
mean(activity_sleep$AwakeInBedMinutes)
mean(activity_sleep$TotalMinutesAsleep < 420)

# Steps vs sleep
cor(activity_sleep$TotalSteps, activity_sleep$TotalMinutesAsleep)
# Sedentary minutes vs sleep
cor(activity_sleep$SedentaryMinutes, activity_sleep$TotalMinutesAsleep)

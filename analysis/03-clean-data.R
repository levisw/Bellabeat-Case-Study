library(tidyverse)
library(lubridate)
library(janitor)

# Load raw data 
daily_activity = read_csv("data/raw/dailyActivity.csv")
sleep_day = read_csv("data/raw/sleepDay.csv")
hourly_steps = read_csv("data/raw/hourlySteps.csv")
hourly_intens = read_csv("data/raw/hourlyIntensities.csv")
weight_log = read_csv("data/raw/weightLogInfo.csv")

# Initial checks
glimpse(daily_activity)
n_distinct(daily_activity$Id)

glimpse(sleep_day)
n_distinct(sleep_day$Id)

sum(duplicated(daily_activity))
sum(duplicated(sleep_day))

colSums(is.na(daily_activity))
colSums(is.na(sleep_day))
colSums(is.na(weight_log))

# Remove duplicates
sleep_day = sleep_day %>%
  distinct()

# Fix date formatting
daily_activity = daily_activity %>%
  mutate(ActivityDate = mdy(ActivityDate)) %>%
  rename(Date = ActivityDate)

sleep_day = sleep_day %>%
  mutate(SleepDay = mdy_hms(SleepDay) %>% as_date()) %>%
  rename(Date = SleepDay)

hourly_steps = hourly_steps %>%
  mutate(ActivityHour = mdy_hms(ActivityHour))

hourly_intens = hourly_intens %>%
  mutate(ActivityHour = mdy_hms(ActivityHour))

weight_log = weight_log %>%
  mutate(Date = mdy_hms(Date))

# Add a weekday column 
daily_activity = daily_activity %>%
  mutate(Weekday = wday(Date, label = TRUE, abbr = FALSE))

# Flag likely non-wear days
# TotalSteps == 0 for a full day is more likely a non-wear day 
daily_activity = daily_activity %>%
  mutate(LikelyNonWearDay = TotalSteps == 0)

sum(daily_activity$LikelyNonWearDay)

# Drop the Fat column from weight_log
weight_log = weight_log %>%
  select(-Fat)

# Create a combined activity + sleep table
activity_sleep_combined = daily_activity %>%
  inner_join(sleep_day, by = c("Id", "Date"))

n_distinct(activity_sleep_combined$Id)
nrow(activity_sleep_combined)

# Export cleaned files
write_csv(daily_activity, "data/cleaned/daily_activity_clean.csv")
write_csv(sleep_day, "data/cleaned/sleep_day_clean.csv")
write_csv(hourly_steps, "data/cleaned/hourly_steps_clean.csv")
write_csv(hourly_intens, "data/cleaned/hourly_intensities_clean.csv")
write_csv(weight_log, "data/cleaned/weight_log_clean.csv")
write_csv(activity_sleep_combined, "data/cleaned/activity_sleep_combined.csv")

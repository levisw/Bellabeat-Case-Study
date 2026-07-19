library(tidyverse)

daily_activity = read_csv("data/cleaned/daily_activity_clean.csv")
activity_sleep = read_csv("data/cleaned/activity_sleep_combined.csv")
hourly_steps = read_csv("data/cleaned/hourly_steps_clean.csv")

# Creating a theme 
TEAL = "#2E7D6B"
TEAL_LIGHT = "#A9C9C0"
ROSE = "#C97B84"
CHARCOAL = "#3A3A3A"

theme_bellabeat = theme_minimal(base_family = "sans") +
  theme(
    plot.title = element_text(face = "bold", color = CHARCOAL, size = 14),
    axis.title = element_text(color = CHARCOAL),
    axis.text = element_text(color = CHARCOAL),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank()
  )

active = daily_activity %>% filter(!LikelyNonWearDay)
activity_sleep_active = activity_sleep %>% filter(!LikelyNonWearDay)

# Avg steps by weekday
weekday_order = c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")

wk = active %>%
  mutate(Weekday = factor(Weekday, levels = weekday_order)) %>%
  group_by(Weekday) %>%
  summarize(avg_steps = mean(TotalSteps)) %>%
  mutate(highlight = Weekday %in% c("Tuesday", "Saturday"))

p1 = ggplot(wk, aes(x = Weekday, y = avg_steps, fill = highlight)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = scales::comma(round(avg_steps))), vjust = -0.6, size = 3.2) +
  geom_hline(yintercept = 10000, color = ROSE, linetype = "dashed", linewidth = 0.6) +
  annotate("text", x = 6.7, y = 10400, label = "10,000-step benchmark",
           color = ROSE, size = 3.2, hjust = 1) +
  scale_fill_manual(values = c("FALSE" = TEAL_LIGHT, "TRUE" = TEAL), guide = "none") +
  scale_y_continuous(limits = c(0, max(wk$avg_steps) * 1.25), labels = scales::comma) +
  labs(title = "Average Daily Steps by Weekday", x = NULL, y = "Average steps") +
  theme_bellabeat +
  theme(axis.text.x = element_text(angle = 20, hjust = 1))

ggsave("visuals/steps_by_weekday.png", p1, width = 8, height = 5, dpi = 150)

# Sedentary minutes vs sleep duration
sleep_df = activity_sleep_active %>%
  mutate(SleepHours = TotalMinutesAsleep / 60)

r_val = cor(sleep_df$SedentaryMinutes, sleep_df$SleepHours)

p2 = ggplot(sleep_df, aes(x = SedentaryMinutes, y = SleepHours)) +
  geom_point(alpha = 0.5, color = TEAL, size = 2) +
  geom_smooth(method = "lm", se = FALSE, color = ROSE, linewidth = 1) +
  annotate("text", x = min(sleep_df$SedentaryMinutes), y = min(sleep_df$SleepHours) + 0.5,
           label = paste0("r = ", round(r_val, 2)),
           color = CHARCOAL, fontface = "bold", size = 4, hjust = 0) +
  labs(title = "More Sedentary Time Tracks With Less Sleep",
       x = "Sedentary minutes per day", y = "Hours of sleep") +
  theme_bellabeat

ggsave("visuals/sedentary_vs_sleep.png", p2, width = 8, height = 5.5, dpi = 150)

# Steps by hour of day
hourly = hourly_steps %>%
  mutate(Hour = hour(ActivityHour)) %>%
  group_by(Hour) %>%
  summarize(avg_steps = mean(StepTotal))

peak = hourly %>% filter(avg_steps == max(avg_steps))

p3 = ggplot(hourly, aes(x = Hour, y = avg_steps)) +
  geom_area(fill = TEAL, alpha = 0.25) +
  geom_line(color = TEAL, linewidth = 1.1) +
  geom_point(data = peak, color = ROSE, size = 3) +
  geom_text(data = peak, aes(label = paste0("Peak: ", Hour, ":00")),
            color = ROSE, fontface = "bold", size = 3.5, vjust = -1.2, hjust = 0.3) +
  scale_x_continuous(breaks = seq(0, 22, 2)) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15))) +
  labs(title = "Average Steps by Hour of Day", x = "Hour of day", y = "Average steps") +
  theme_bellabeat

ggsave("visuals/steps_by_hour.png", p3, width = 9, height = 5, dpi = 150)
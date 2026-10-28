# Scan Cricsheet men's T20Is for: the 2nd India-NZ T20I (24 Oct 2026, complete?)
# and the recent India v West Indies T20I series (dates, completeness).
suppressMessages({ library(cricketdata); library(dplyr) })

bbb <- fetch_cricsheet(type = "bbb", gender = "male", competition = "t20s")

summ <- bbb %>%
  group_by(match_id, start_date, venue) %>%
  summarise(teams = paste(sort(unique(c(batting_team, bowling_team))), collapse = " v "),
            innings = n_distinct(innings),
            balls = n(), .groups = "drop")

cat("=== India v New Zealand, Oct 2026 ===\n")
print(summ %>% filter(grepl("India", teams) & grepl("New Zealand", teams),
                      as.Date(start_date) >= as.Date("2026-10-20")) %>%
        arrange(start_date) %>% as.data.frame())

cat("\n=== India v West Indies, most recent ===\n")
print(summ %>% filter(grepl("India", teams) & grepl("West Indies", teams)) %>%
        arrange(desc(start_date)) %>% head(8) %>% as.data.frame())

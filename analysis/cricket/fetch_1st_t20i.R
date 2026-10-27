# Fetch the 1st T20I (India tour of NZ, 22 Oct 2026, Christchurch) from Cricsheet
# via cricketdata, filter to that match, validate completeness, and save.
suppressMessages({ library(cricketdata); library(dplyr); library(readr) })

DATA_DIR <- "analysis/cricket/data"
dir.create(DATA_DIR, showWarnings = FALSE, recursive = TRUE)

cat("Fetching men's T20I ball-by-ball from Cricsheet (large download)...\n")
bbb <- fetch_cricsheet(type = "bbb", gender = "male", competition = "t20s")
cat("Total T20I deliveries fetched:", nrow(bbb), "\n")
cat("Columns:\n"); print(colnames(bbb))

# Identify the 22 Oct 2026 NZ v India match
m <- bbb %>%
  filter(as.Date(start_date) == as.Date("2026-10-22"),
         grepl("India", paste(batting_team, bowling_team)),
         grepl("New Zealand", paste(batting_team, bowling_team)))

cat("\nMatch id(s) found:", paste(unique(m$match_id), collapse = ", "), "\n")
cat("Venue:", paste(unique(m$venue), collapse = "; "), "\n")
cat("Deliveries in match:", nrow(m), "\n")

# Per-innings summary to confirm BOTH innings are present
summ <- m %>%
  group_by(innings, batting_team) %>%
  summarise(balls = n(),
            runs_off_bat = sum(runs_off_bat, na.rm = TRUE),
            extras = sum(extras, na.rm = TRUE),
            total = runs_off_bat + extras,
            wickets = sum(!is.na(wicket_type) & wicket_type != ""),
            last_over = max(over, na.rm = TRUE),
            .groups = "drop")
cat("\n=== Per-innings summary ===\n")
print(as.data.frame(summ))

write_csv(m, file.path(DATA_DIR, "ind_nz_1st_t20i_cricsheet.csv"))
cat("\nSaved:", file.path(DATA_DIR, "ind_nz_1st_t20i_cricsheet.csv"), "\n")

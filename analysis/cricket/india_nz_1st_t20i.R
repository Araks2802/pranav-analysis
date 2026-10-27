# =============================================================================
# India vs New Zealand, 1st T20I — Hagley Oval, Christchurch — 22 October 2026
# Featured article analysis. FULL ball-by-ball from Cricsheet (both innings).
#
# Result: NZ 225/4 (20); India 230/6 (19.4) — India won by 4 wkts, 2 balls left.
#
# DATA: Cricsheet ball-by-ball via the cricketdata package (CC BY-SA 4.0).
# Unlike the 3rd T20I, this match is COMPLETE in Cricsheet — both innings, every
# delivery — so the chase worm, partnerships, phase and bowling analysis are all
# computed from real deliveries, then reconciled against the published scorecard.
# Run analysis/cricket/fetch_1st_t20i.R first to create the source CSV.
# =============================================================================

suppressMessages({
  library(dplyr); library(tidyr); library(readr); library(ggplot2)
})
source("analysis/cricket/_helpers.R")

DATA_DIR <- "analysis/cricket/data"
SRC <- file.path(DATA_DIR, "ind_nz_1st_t20i_cricsheet.csv")
if (!file.exists(SRC)) stop("Run analysis/cricket/fetch_1st_t20i.R first to fetch the match.")

m <- read_csv(SRC, show_col_types = FALSE) %>%
  mutate(
    is_wide  = !is.na(wides) & wides > 0,
    is_nb    = !is.na(noballs) & noballs > 0,
    is_legal = !is_wide & !is_nb,
    charged  = runs_off_bat + ifelse(is.na(wides), 0, wides) + ifelse(is.na(noballs), 0, noballs),
    is_wkt   = !is.na(wicket_type) & wicket_type != "",
    is_four  = runs_off_bat == 4,
    is_six   = runs_off_bat == 6
  )

# -----------------------------------------------------------------------------
# VALIDATION against the verified scorecard
# -----------------------------------------------------------------------------
cat("\n==== VALIDATION (vs published scorecard) ====\n")
nz <- m %>% filter(innings == 1)
ind <- m %>% filter(innings == 2)

nz_total  <- sum(nz$runs_off_bat) + sum(nz$extras)
ind_total <- sum(ind$runs_off_bat) + sum(ind$extras)
check("NZ total = 225",  nz_total == 225,  paste("got", nz_total))
check("India total = 230", ind_total == 230, paste("got", ind_total))
check("NZ wickets = 4",   sum(nz$is_wkt) == 4,  paste("got", sum(nz$is_wkt)))
check("India wickets = 6", sum(ind$is_wkt) == 6, paste("got", sum(ind$is_wkt)))
check("NZ legal balls = 120", sum(nz$is_legal) == 120, paste("got", sum(nz$is_legal)))
check("India legal balls = 118 (19.4 ov)", sum(ind$is_legal) == 118, paste("got", sum(ind$is_legal)))
check("Target recorded = 226", 226 %in% ind$target, "target col")

# -----------------------------------------------------------------------------
# DERIVED TABLES
# -----------------------------------------------------------------------------
# Batting cards
bat_card <- function(d) {
  d %>% group_by(striker) %>%
    summarise(runs = sum(runs_off_bat),
              balls = sum(is_legal),
              fours = sum(is_four), sixes = sum(is_six),
              .groups = "drop") %>%
    mutate(sr = round(runs / balls * 100, 1),
           boundary_runs = fours * 4 + sixes * 6,
           boundary_pct = round(boundary_runs / runs * 100, 1)) %>%
    arrange(desc(runs))
}
nz_bat  <- bat_card(nz)
ind_bat <- bat_card(ind)

# Bowling cards (runs charged incl. wides/no-balls; run-outs not credited)
bowl_card <- function(d) {
  d %>% group_by(bowler) %>%
    summarise(balls = sum(is_legal), runs = sum(charged),
              wkts = sum(is_wkt & wicket_type != "run out"), .groups = "drop") %>%
    mutate(overs = balls / 6, econ = round(runs / (balls / 6), 2)) %>%
    arrange(desc(runs))
}
ind_bowl <- bowl_card(nz)    # India bowled in innings 1
nz_bowl  <- bowl_card(ind)   # NZ bowled in innings 2

# Cumulative worm per innings (by legal-ball count for a smooth real worm)
worm <- m %>% arrange(innings, over, ball) %>%
  group_by(innings) %>%
  mutate(cum_runs = cumsum(runs_off_bat + extras),
         ball_no = row_number(),
         legal_no = cumsum(is_legal),
         over_dec = (legal_no - 1) %/% 6 + ((legal_no - 1) %% 6) / 6) %>%
  ungroup()

# Fall of wickets with score & over
fow <- m %>% filter(is_wkt) %>% arrange(innings, over, ball) %>%
  group_by(innings) %>%
  mutate(team_runs_at = NA) %>% ungroup()
# compute runs at each wicket from worm
fow <- worm %>% filter(is_wkt) %>%
  transmute(innings, batting_team, player_dismissed,
            over_num = over + ball/10, score_at = cum_runs)

# Phase scoring (powerplay 1-6, middle 7-15, death 16-20) per innings
phase <- m %>%
  mutate(phase = case_when(over < 6 ~ "Powerplay (1-6)",
                           over < 15 ~ "Middle (7-15)",
                           TRUE ~ "Death (16-20)"),
         phase = factor(phase, levels = c("Powerplay (1-6)","Middle (7-15)","Death (16-20)"))) %>%
  group_by(innings, batting_team, phase) %>%
  summarise(runs = sum(runs_off_bat + extras), balls = sum(is_legal),
            wkts = sum(is_wkt), .groups = "drop") %>%
  mutate(rr = round(runs / (balls / 6), 2))

cat("\n==== KEY NUMBERS ====\n")
cat("NZ RR:", round(225/20,2), "| India RR:", round(230/(118/6),2), "\n")
cat("India won with", 120 - 118, "balls to spare, chasing 226.\n")
print(as.data.frame(phase))

# Save processed tables
write_csv(nz_bat,  file.path(DATA_DIR, "t1_nz_batting.csv"))
write_csv(ind_bat, file.path(DATA_DIR, "t1_india_batting.csv"))
write_csv(ind_bowl, file.path(DATA_DIR, "t1_india_bowling.csv"))
write_csv(nz_bowl,  file.path(DATA_DIR, "t1_nz_bowling.csv"))
write_csv(phase,    file.path(DATA_DIR, "t1_phase.csv"))
write_csv(fow,      file.path(DATA_DIR, "t1_fall_of_wickets.csv"))

# -----------------------------------------------------------------------------
# CHARTS
# -----------------------------------------------------------------------------
cat("\n==== GENERATING FIGURES (1st T20I) ====\n")

# --- Chart 1: The real chase worm, both innings ------------------------------
w1 <- worm %>% filter(innings == 1) %>% transmute(over_dec, cum_runs, side = "New Zealand 225/4")
w2 <- worm %>% filter(innings == 2) %>% transmute(over_dec, cum_runs, side = "India 230/6")
worm_plot <- bind_rows(w1, w2)
fow_lab <- fow %>% mutate(side = ifelse(innings == 1, "New Zealand 225/4", "India 230/6"))

p1 <- ggplot(worm_plot, aes(over_dec, cum_runs, colour = side)) +
  geom_hline(yintercept = 225, colour = brand$red, linetype = "33", linewidth = 0.5) +
  annotate("text", x = 0.3, y = 233, label = "NZ 225 — India's target: 226",
           colour = brand$red, hjust = 0, size = 3.6) +
  geom_line(linewidth = 1.25) +
  geom_point(data = fow_lab, aes(over_num, score_at, colour = side), shape = 4, size = 3, stroke = 1.3) +
  scale_colour_manual(values = c("India 230/6" = col_india, "New Zealand 225/4" = col_nz), name = NULL) +
  scale_x_continuous(limits = c(0, 20), breaks = seq(0, 20, 4)) +
  scale_y_continuous(limits = c(0, 245), breaks = seq(0, 240, 60)) +
  labs(title = "Two heavyweight innings, decided by two balls",
       subtitle = "Real ball-by-ball worms. Crosses mark wickets. India overhauled 226 with 2 balls to spare.",
       x = "Overs", y = "Cumulative runs",
       caption = "Source: Cricsheet ball-by-ball (CC BY-SA 4.0). India v New Zealand, 1st T20I, Christchurch, 22 Oct 2026.") +
  theme_editorial()
save_fig(p1, "t1_01_chase_worm", width = 9, height = 5.2)

# --- Chart 2: Phase scoring, side by side ------------------------------------
phase2 <- phase %>%
  mutate(team = ifelse(innings == 1, "New Zealand", "India"))
p2 <- ggplot(phase2, aes(phase, rr, fill = team)) +
  geom_col(position = position_dodge(width = 0.7), width = 0.62) +
  geom_text(aes(label = sprintf("%.1f", rr)),
            position = position_dodge(width = 0.7), vjust = -0.3,
            colour = brand$ink, size = 3.6) +
  scale_fill_manual(values = c("India" = col_india, "New Zealand" = col_nz), name = NULL) +
  scale_y_continuous(limits = c(0, 16.5), expand = expansion(mult = c(0, 0.1))) +
  labs(title = "India front-loaded the chase, then survived a wobble",
       subtitle = "Run rate by phase. India's 82-run powerplay did the work; NZ clawed back through the middle.",
       x = NULL, y = "Runs per over",
       caption = "Source: Cricsheet ball-by-ball. 1st T20I, 22 Oct 2026.") +
  theme_editorial()
save_fig(p2, "t1_02_phase", width = 8.6, height = 5)

# --- Chart 3: NZ bowling figures (India's chase) -----------------------------
nzb <- nz_bowl %>% mutate(bowler = factor(bowler, levels = rev(bowler)),
                          lbl = sprintf("%.0f ov · %d/%d", overs, wkts, runs))
p3 <- ggplot(nzb, aes(runs, bowler)) +
  geom_col(aes(fill = wkts > 0), width = 0.66) +
  geom_text(aes(label = lbl), hjust = -0.08, colour = brand$ink, size = 3.5) +
  scale_fill_manual(values = c("FALSE" = brand$muted, "TRUE" = col_nz),
                    labels = c("No wicket","Took wicket(s)"), name = NULL) +
  scale_x_continuous(limits = c(0, 70), expand = expansion(mult = c(0, 0.08))) +
  labs(title = "New Zealand's attack couldn't contain the chase",
       subtitle = "Runs conceded in India's innings, with overs and wickets shown.",
       x = "Runs conceded", y = NULL,
       caption = "Henry went at 15.5; only Bracewell and Santner held the rate. Source: Cricsheet. 1st T20I, 22 Oct 2026.") +
  theme_editorial() + theme(legend.position = "top")
save_fig(p3, "t1_03_nz_bowling", width = 9, height = 5)

# --- Chart 4: Top scorers' boundary vs running -------------------------------
top <- bind_rows(
  nz_bat %>% slice_max(runs, n = 2) %>% mutate(team = "NZ"),
  ind_bat %>% slice_max(runs, n = 2) %>% mutate(team = "IND")
) %>%
  transmute(player = striker, runs, boundary_runs, other = runs - boundary_runs, balls, team) %>%
  pivot_longer(c(boundary_runs, other), names_to = "type", values_to = "r") %>%
  mutate(type = recode(type, boundary_runs = "From boundaries", other = "Running / other"),
         player = factor(player, levels = rev(unique(player))))
p4 <- ggplot(top, aes(r, player, fill = type)) +
  geom_col(width = 0.66) +
  scale_fill_manual(values = c("From boundaries" = col_india, "Running / other" = brand$muted), name = NULL) +
  scale_x_continuous(expand = expansion(mult = c(0, 0.06))) +
  labs(title = "The match's big hands, and how they were made",
       subtitle = "Phillips and Samson anchored; the boundary share tells you how.",
       x = "Runs", y = NULL,
       caption = "Top two scorers per side. Source: Cricsheet ball-by-ball. 1st T20I, 22 Oct 2026.") +
  theme_editorial() + theme(legend.position = "top")
save_fig(p4, "t1_04_boundary_split", width = 8.6, height = 4.8)

cat("\nAll 1st-T20I figures exported.\n==== DONE ====\n")

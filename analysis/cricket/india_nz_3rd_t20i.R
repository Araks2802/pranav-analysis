# =============================================================================
# India vs New Zealand, 3rd T20I — Hnry Stadium, Wellington — 27 October 2026
# Reproducible analysis for the featured article:
#   "199 in 80 Balls: How India Turned a Chase into a Demolition"
#
# DATA PROVENANCE / INTEGRITY
# ---------------------------------------------------------------------------
# The mandated stack is R + cricketdata + Cricsheet. We checked Cricsheet
# (men's T20Is, competition code "t20s", dataset built 2026-10-25): it holds
# the 1st (2026-10-22) and 2nd (2026-10-24) T20Is of this series but NOT the
# 3rd T20I (27 Oct 2026). So delivery-level (ball-by-ball) data is UNAVAILABLE.
#
# We therefore do NOT fabricate a per-ball dataset. Instead we encode the
# VERIFIED published scorecard (cross-checked across ESPNcricinfo, ICC,
# CricTracker, Indian Express, Times of India, sportsmint) as tidy tables,
# validate the innings totals, and compute only scorecard-level derived
# metrics. Charts that would require per-ball data (a true run worm) are
# built from VERIFIED checkpoints only and labelled as such.
#
# See VERIFIED_DATA.md for every figure and its sources.
# =============================================================================

suppressMessages({
  library(dplyr)
  library(tidyr)
  library(readr)
  library(ggplot2)
})

source("analysis/cricket/_helpers.R")

DATA_DIR <- "analysis/cricket/data"
dir.create(DATA_DIR, showWarnings = FALSE, recursive = TRUE)

# -----------------------------------------------------------------------------
# 1. VERIFIED SCORECARD AS TIDY DATA
# -----------------------------------------------------------------------------

# India batting (the chase: 199/4 in 13.2 overs)
india_bat <- tribble(
  ~batter,                 ~runs, ~balls, ~fours, ~sixes, ~how_out,
  "Vaibhav Sooryavanshi",     45,     19,      4,      2, "c Mitchell b Fisher",
  "Abhishek Sharma",         113,     38,      9,     11, "c Phillips b Jamieson",
  "Sanju Samson",             18,     13,      2,      0, "b Jamieson",
  "Shreyas Iyer",              5,     10,      0,      0, "c Phillips b Santner",
  "Tilak Varma",               1,      1,      0,      0, "not out",
  "Naman Dhir",                4,      1,      1,      0, "not out"
)
india_extras <- tibble(b = 0L, lb = 1L, w = 10L, nb = 2L)   # total 13
INDIA_TOTAL <- 199L; INDIA_WKTS <- 4L; INDIA_BALLS <- 80L   # 13.2 overs = 80 legal balls

# New Zealand batting (198/3 in 20 overs)
nz_bat <- tribble(
  ~batter,          ~runs, ~balls, ~fours, ~sixes, ~how_out,
  "Tim Seifert",        2,      6,      0,      0, "c Axar b Arshdeep",
  "Finn Allen",        40,     25,      0,      5, "c Dhir b Nitish Reddy",
  "Daryl Mitchell",    89,     52,      5,      5, "not out",
  "Glenn Phillips",    17,     14,      3,      0, "c & b Axar",
  "Bevon Jacobs",      39,     23,      4,      1, "not out"
)
nz_extras <- tibble(b = 0L, lb = 7L, w = 4L, nb = 0L)       # total 11
NZ_TOTAL <- 198L; NZ_WKTS <- 3L

# India bowling (vs NZ)
india_bowl <- tribble(
  ~bowler,              ~overs, ~maidens, ~runs, ~wkts,
  "Bhuvneshwar Kumar",     4.0,        0,    40,     0,
  "Arshdeep Singh",        4.0,        0,    33,     1,
  "Prince Yadav",          4.0,        0,    44,     0,
  "Axar Patel",            4.0,        0,    36,     1,
  "Nitish Kumar Reddy",    4.0,        0,    38,     1
)

# New Zealand bowling (vs India)
nz_bowl <- tribble(
  ~bowler,            ~overs, ~maidens, ~runs, ~wkts, ~nb, ~wd,
  "Jacob Duffy",         2.0,        0,    44,     0,   0,   1,
  "Adam Milne",          2.0,        0,    33,     0,   0,   1,
  "Michael Bracewell",   2.0,        0,    36,     0,   0,   1,
  "Kyle Jamieson",       3.2,        0,    45,     2,   0,   0,
  "Matthew Fisher",      1.0,        0,    23,     1,   2,   0,
  "Mitchell Santner",    3.0,        0,    17,     1,   0,   0
)

# India chase checkpoints (VERIFIED only — not per ball)
# 0/0 start; 118/0 at end of powerplay (6.0 ov); 133/1 when Sooryavanshi fell
# (7.1 ov); 199/4 at 13.2 ov. Over expressed in decimal overs for plotting.
chase_checkpoints <- tribble(
  ~over,  ~runs, ~wkts, ~label,
  0.0,       0L,    0L, "Start",
  6.0,     118L,    0L, "Powerplay: 118/0",
  7.1,     133L,    1L, "Sooryavanshi out (45): 133/1",
  13.2,    199L,    4L, "Won, 40 balls to spare: 199/4"
)

# -----------------------------------------------------------------------------
# 2. VALIDATION — reconcile our tables against the published totals
# -----------------------------------------------------------------------------
cat("\n==== VALIDATION ====\n")

india_runs_off_bat <- sum(india_bat$runs)
india_extras_total <- with(india_extras, b + lb + w + nb)
check("India total = runs off bat + extras",
      india_runs_off_bat + india_extras_total == INDIA_TOTAL,
      sprintf("%d + %d = %d (expected %d)", india_runs_off_bat,
              india_extras_total, india_runs_off_bat + india_extras_total, INDIA_TOTAL))
check("India wickets = dismissed batters",
      sum(india_bat$how_out != "not out") == INDIA_WKTS)

nz_runs_off_bat <- sum(nz_bat$runs)
nz_extras_total <- with(nz_extras, b + lb + w + nb)
check("NZ total = runs off bat + extras",
      nz_runs_off_bat + nz_extras_total == NZ_TOTAL,
      sprintf("%d + %d = %d (expected %d)", nz_runs_off_bat,
              nz_extras_total, nz_runs_off_bat + nz_extras_total, NZ_TOTAL))
check("NZ wickets = dismissed batters",
      sum(nz_bat$how_out != "not out") == NZ_WKTS)

# Bowling runs should reconcile with opposition runs conceded.
# Runs conceded by a bowling side = opposition total - byes - leg byes
# (b/lb are not charged to bowlers). nb and wd ARE charged to bowlers.
nz_bowl_runs <- sum(nz_bowl$runs)
india_chargeable <- INDIA_TOTAL - india_extras$b - india_extras$lb
check("NZ bowlers' runs = India total minus byes/leg-byes",
      nz_bowl_runs == india_chargeable,
      sprintf("%d vs %d", nz_bowl_runs, india_chargeable))

india_bowl_runs <- sum(india_bowl$runs)
nz_chargeable <- NZ_TOTAL - nz_extras$b - nz_extras$lb
check("India bowlers' runs = NZ total minus byes/leg-byes",
      india_bowl_runs == nz_chargeable,
      sprintf("%d vs %d", india_bowl_runs, nz_chargeable))

check("NZ bowlers' wickets = India wickets lost",
      sum(nz_bowl$wkts) == INDIA_WKTS)
check("India bowlers' wickets = NZ wickets lost",
      sum(india_bowl$wkts) == NZ_WKTS)

# -----------------------------------------------------------------------------
# 3. DERIVED METRICS (scorecard-level, all safe to compute)
# -----------------------------------------------------------------------------
cat("\n==== DERIVED METRICS ====\n")

india_bat <- india_bat %>%
  mutate(
    sr            = round(runs / balls * 100, 2),
    boundary_runs = fours * 4 + sixes * 6,
    other_runs    = runs - boundary_runs,
    boundary_pct  = round(boundary_runs / runs * 100, 1)
  )
nz_bat <- nz_bat %>%
  mutate(
    sr            = round(runs / balls * 100, 2),
    boundary_runs = fours * 4 + sixes * 6,
    other_runs    = runs - boundary_runs,
    boundary_pct  = round(boundary_runs / runs * 100, 1)
  )

india_bowl <- india_bowl %>% mutate(econ = round(runs / overs, 2))
nz_bowl    <- nz_bowl    %>% mutate(econ = round(runs / overs, 2))

india_rr <- round(INDIA_TOTAL / (INDIA_BALLS / 6), 2)   # 199 / 13.333 overs
nz_rr    <- round(NZ_TOTAL / 20, 2)
req_rr   <- round(INDIA_TOTAL / 20, 2)                  # target run rate over 20
balls_remaining <- 120L - INDIA_BALLS

cat(sprintf("India run rate: %.2f | NZ run rate: %.2f | required rate (full 20): %.2f\n",
            india_rr, nz_rr, req_rr))
cat(sprintf("Balls remaining when target reached: %d\n", balls_remaining))

# Abhishek focus
abhi <- india_bat %>% filter(batter == "Abhishek Sharma")
cat(sprintf("Abhishek: %d off %d (SR %.1f); boundary runs %d of %d (%.1f%%); %d from running/other\n",
            abhi$runs, abhi$balls, abhi$sr, abhi$boundary_runs, abhi$runs,
            abhi$boundary_pct, abhi$other_runs))

# Opening partnership (verified narrative: 133 off 43 balls)
opening_stand_runs  <- 133L
opening_stand_balls <- 43L
cat(sprintf("Opening stand: %d off %d balls (%.1f%% of the %d target)\n",
            opening_stand_runs, opening_stand_balls,
            round(opening_stand_runs / INDIA_TOTAL * 100, 1), INDIA_TOTAL))

# Mitchell share of NZ
mitch <- nz_bat %>% filter(batter == "Daryl Mitchell")
cat(sprintf("Mitchell 89*: %.1f%% of NZ's 198 total; %.1f%% of runs off the bat (%d)\n",
            round(mitch$runs / NZ_TOTAL * 100, 1),
            round(mitch$runs / nz_runs_off_bat * 100, 1), nz_runs_off_bat))

# -----------------------------------------------------------------------------
# 4. WRITE PROCESSED DATA
# -----------------------------------------------------------------------------
write_csv(india_bat,  file.path(DATA_DIR, "india_batting.csv"))
write_csv(nz_bat,     file.path(DATA_DIR, "nz_batting.csv"))
write_csv(india_bowl, file.path(DATA_DIR, "india_bowling.csv"))
write_csv(nz_bowl,    file.path(DATA_DIR, "nz_bowling.csv"))
write_csv(chase_checkpoints, file.path(DATA_DIR, "chase_checkpoints.csv"))

summary_tbl <- tibble(
  metric = c("India total", "India run rate", "NZ total", "NZ run rate",
             "Target run rate (20 ov)", "Balls remaining", "Opening stand",
             "Abhishek boundary %", "Mitchell % of NZ total"),
  value  = c("199/4 (13.2)", india_rr, "198/3 (20)", nz_rr,
             req_rr, balls_remaining, "133 off 43",
             paste0(abhi$boundary_pct, "%"),
             paste0(round(mitch$runs / NZ_TOTAL * 100, 1), "%"))
)
write_csv(summary_tbl, file.path(DATA_DIR, "match_summary.csv"))
cat("\nProcessed CSVs written to", DATA_DIR, "\n")

# -----------------------------------------------------------------------------
# 5. CHARTS (publication quality, dark editorial theme)
# -----------------------------------------------------------------------------
cat("\n==== GENERATING FIGURES ====\n")

# --- Chart 1: Chase progression (VERIFIED checkpoints only) ------------------
cp <- chase_checkpoints
# par line: a target run rate reference (199 across 20 overs)
par_line <- tibble(over = c(0, 20), runs = c(0, INDIA_TOTAL))

p1 <- ggplot() +
  geom_line(data = par_line, aes(over, runs),
            colour = brand$muted, linetype = "22", linewidth = 0.7) +
  geom_hline(yintercept = INDIA_TOTAL, colour = brand$red,
             linetype = "33", linewidth = 0.6) +
  annotate("text", x = 1.2, y = INDIA_TOTAL + 7, label = "Target: 199",
           colour = brand$red, hjust = 0, size = 4) +
  annotate("text", x = 15.3, y = 150, label = "Target run rate\n(9.95/over)",
           colour = brand$muted, hjust = 0, size = 3.3, lineheight = 0.95) +
  geom_line(data = cp, aes(over, runs), colour = col_india, linewidth = 1.3) +
  geom_point(data = cp, aes(over, runs), colour = col_india, size = 3.2) +
  geom_text(data = cp[-1, ], aes(over, runs, label = label),
            colour = brand$ink, hjust = c(0.1, -0.03, 1.02),
            vjust = c(1.9, -1.1, 1.9), size = 3.4) +
  scale_x_continuous(limits = c(0, 20), breaks = seq(0, 20, 4),
                     expand = expansion(mult = c(0.01, 0.02))) +
  scale_y_continuous(limits = c(0, 215), breaks = seq(0, 200, 50)) +
  labs(title = "India's chase, checkpoint by checkpoint",
       subtitle = "Verified milestones vs the target rate — India finished with 40 balls unused.",
       x = "Overs", y = "Runs",
       caption = "Reconstruction from verified scorecard checkpoints (powerplay, 1st-wicket fall, final score) — not ball-by-ball.\nSource: ESPNcricinfo / CricTracker. India v New Zealand, 3rd T20I, Wellington, 27 Oct 2026.") +
  theme_editorial()
save_fig(p1, "01_chase_progression", width = 8.5, height = 5)

# --- Chart 2: Opening explosion — first-wicket stand vs the rest -------------
stand_df <- tibble(
  segment = factor(c("Opening stand (Sooryavanshi + Abhishek)", "Rest of India's innings"),
                   levels = c("Opening stand (Sooryavanshi + Abhishek)", "Rest of India's innings")),
  runs    = c(opening_stand_runs, INDIA_TOTAL - opening_stand_runs),
  balls   = c(opening_stand_balls, INDIA_BALLS - opening_stand_balls)
) %>% mutate(rr = round(runs / (balls / 6), 1),
             lbl = sprintf("%d runs\n%d balls · %.1f/over", runs, balls, rr))

p2 <- ggplot(stand_df, aes(x = segment, y = runs, fill = segment)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = lbl), vjust = -0.25, colour = brand$ink,
            size = 3.8, lineheight = 0.95) +
  scale_fill_manual(values = c(col_india, brand$muted), guide = "none") +
  scale_y_continuous(limits = c(0, 150), expand = expansion(mult = c(0, 0.12))) +
  labs(title = "The game was won in 43 balls",
       subtitle = "India's opening pair put on 133 of the 199 needed before the first wicket fell.",
       x = NULL, y = "Runs",
       caption = "Source: ESPNcricinfo match report. India v New Zealand, 3rd T20I, 27 Oct 2026.") +
  theme_editorial() +
  theme(axis.text.x = element_text(size = 11, colour = brand$ink))
save_fig(p2, "02_opening_stand", width = 8, height = 5)

# --- Chart 3: Abhishek's scoring breakdown -----------------------------------
abhi_break <- tibble(
  source = factor(c("Sixes (11)", "Fours (9)", "Running / other"),
                  levels = c("Running / other", "Fours (9)", "Sixes (11)")),
  runs   = c(abhi$sixes * 6, abhi$fours * 4, abhi$other_runs)
)
p3 <- ggplot(abhi_break, aes(x = runs, y = source, fill = source)) +
  geom_col(width = 0.62) +
  geom_text(aes(label = runs), hjust = -0.25, colour = brand$ink, size = 4.3) +
  scale_fill_manual(values = c("Sixes (11)" = col_india,
                               "Fours (9)" = brand$lime_d,
                               "Running / other" = brand$muted), guide = "none") +
  scale_x_continuous(limits = c(0, 76), expand = expansion(mult = c(0, 0.08))) +
  labs(title = "113 off 38 — and almost all of it in boundaries",
       subtitle = "90% of Abhishek Sharma's runs came from fours and sixes. He ran just 11.",
       x = "Runs", y = NULL,
       caption = "9 fours, 11 sixes = 102 boundary runs of 113. Source: ESPNcricinfo scorecard, 3rd T20I, 27 Oct 2026.") +
  theme_editorial()
save_fig(p3, "03_abhishek_breakdown", width = 8, height = 4.6)

# --- Chart 4: Scoring rate — India vs NZ -------------------------------------
rr_df <- tibble(
  innings = factor(c("New Zealand\n198/3 (20 ov)", "India\n199/4 (13.2 ov)"),
                   levels = c("New Zealand\n198/3 (20 ov)", "India\n199/4 (13.2 ov)")),
  rr = c(nz_rr, india_rr),
  team = c("NZ", "IND")
)
p4 <- ggplot(rr_df, aes(x = innings, y = rr, fill = team)) +
  geom_col(width = 0.55) +
  geom_text(aes(label = sprintf("%.2f", rr)), vjust = -0.3,
            colour = brand$ink, size = 4.6) +
  scale_fill_manual(values = c("IND" = col_india, "NZ" = col_nz), guide = "none") +
  scale_y_continuous(limits = c(0, 16.5), expand = expansion(mult = c(0, 0.1))) +
  labs(title = "Same runs, two-thirds of the time",
       subtitle = "Both sides passed 198. India simply did it five-and-a-bit overs quicker.",
       x = NULL, y = "Runs per over",
       caption = "Run rate = total runs / overs faced. Source: ESPNcricinfo, 3rd T20I, 27 Oct 2026.") +
  theme_editorial() +
  theme(axis.text.x = element_text(size = 11, colour = brand$ink, lineheight = 0.95))
save_fig(p4, "04_scoring_rate", width = 7.6, height = 5)

# --- Chart 5: NZ bowling figures (runs + wickets + overs visible) ------------
nzb <- nz_bowl %>%
  mutate(bowler = factor(bowler, levels = rev(bowler)),
         lbl = sprintf("%g ov · %d/%d", overs, wkts, runs))
p5 <- ggplot(nzb, aes(x = runs, y = bowler)) +
  geom_col(aes(fill = wkts > 0), width = 0.66) +
  geom_text(aes(label = lbl), hjust = -0.08, colour = brand$ink, size = 3.6) +
  scale_fill_manual(values = c("FALSE" = brand$muted, "TRUE" = col_india),
                    labels = c("No wicket", "Took wicket(s)"), name = NULL) +
  scale_x_continuous(limits = c(0, 56), expand = expansion(mult = c(0, 0.1))) +
  labs(title = "Nowhere to hide for New Zealand's attack",
       subtitle = "Runs conceded, with overs and wickets shown so short spells are read fairly.",
       x = "Runs conceded", y = NULL,
       caption = "Fisher bowled 1 over, Jamieson 3.2 — judge accordingly.\nSource: ESPNcricinfo scorecard, 3rd T20I, 27 Oct 2026.") +
  theme_editorial() +
  theme(legend.position = "top")
save_fig(p5, "05_nz_bowling", width = 9, height = 5.2)

cat("\nAll figures exported to analysis/cricket/figures/\n")
cat("\n==== DONE ====\n")

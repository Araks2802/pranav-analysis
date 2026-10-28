# =============================================================================
# Shared T20 match-analysis pipeline (Cricsheet ball-by-ball via cricketdata).
# analyse_match(match_id, slug, title_short) validates the match against its own
# scorecard, computes derived tables, and exports a consistent set of 4 charts.
# Reused by every match-analysis article so each gets identical treatment.
# =============================================================================
suppressMessages({
  library(cricketdata); library(dplyr); library(tidyr); library(readr); library(ggplot2)
})
source("analysis/cricket/_helpers.R")

DATA_DIR <- "analysis/cricket/data"
FIG_DIR  <- "analysis/cricket/figures"
dir.create(DATA_DIR, showWarnings = FALSE, recursive = TRUE)
dir.create(FIG_DIR,  showWarnings = FALSE, recursive = TRUE)

# cache the full fetch once per session
.t20_cache <- NULL
get_t20 <- function() {
  if (is.null(.t20_cache)) {
    .t20_cache <<- fetch_cricsheet(type = "bbb", gender = "male", competition = "t20s")
  }
  .t20_cache
}

overs_notation <- function(legal_balls) sprintf("%d.%d", legal_balls %/% 6, legal_balls %% 6)

analyse_match <- function(match_id, slug, caption_tag,
                          team_a_colour = brand$lime, team_b_colour = brand$cyan) {
  bbb <- get_t20()
  m <- bbb %>% filter(match_id == !!match_id) %>% arrange(innings, over, ball)
  if (nrow(m) == 0) stop("Match not found: ", match_id)

  m <- m %>% mutate(
    is_wide  = !is.na(wides) & wides > 0,
    is_nb    = !is.na(noballs) & noballs > 0,
    is_legal = !is_wide & !is_nb,
    charged  = runs_off_bat + ifelse(is.na(wides), 0, wides) + ifelse(is.na(noballs), 0, noballs),
    is_wkt   = !is.na(wicket_type) & wicket_type != "",
    is_four  = runs_off_bat == 4,
    is_six   = runs_off_bat == 6,
    delivery_runs = runs_off_bat + extras
  )

  inns_list <- sort(unique(m$innings))
  teams <- sapply(inns_list, function(i) m$batting_team[m$innings == i][1])
  totals <- sapply(inns_list, function(i) {
    d <- m[m$innings == i, ]; sum(d$runs_off_bat) + sum(d$extras)
  })
  wkts <- sapply(inns_list, function(i) sum(m$is_wkt[m$innings == i]))
  legal <- sapply(inns_list, function(i) sum(m$is_legal[m$innings == i]))
  colour_for <- setNames(c(team_a_colour, team_b_colour)[seq_along(inns_list)], teams)

  cat(sprintf("\n==== %s (match %s) ====\n", slug, match_id))
  for (k in seq_along(inns_list)) {
    cat(sprintf("Inns %d %s: %d/%d in %s overs (%d legal balls)\n",
                inns_list[k], teams[k], totals[k], wkts[k], overs_notation(legal[k]), legal[k]))
  }

  # ---- derived tables ----
  worm <- m %>% group_by(innings) %>%
    mutate(cum_runs = cumsum(delivery_runs), legal_no = cumsum(is_legal),
           over_dec = legal_no / 6) %>% ungroup()

  fow <- worm %>% filter(is_wkt) %>%
    transmute(innings, batting_team, player_dismissed, over_dec,
              over_str = overs_notation(legal_no), score_at = cum_runs)

  bat_card <- function(i) {
    m %>% filter(innings == i) %>% group_by(striker) %>%
      summarise(runs = sum(runs_off_bat), balls = sum(is_legal),
                fours = sum(is_four), sixes = sum(is_six), .groups = "drop") %>%
      mutate(sr = round(runs / balls * 100, 1),
             boundary_runs = fours * 4 + sixes * 6,
             other = runs - boundary_runs,
             boundary_pct = round(boundary_runs / runs * 100, 1)) %>%
      arrange(desc(runs))
  }
  bowl_card <- function(i) {
    m %>% filter(innings == i) %>% group_by(bowler) %>%
      summarise(balls = sum(is_legal), runs = sum(charged),
                wkts = sum(is_wkt & wicket_type != "run out"), .groups = "drop") %>%
      mutate(overs = balls / 6, econ = round(runs / (balls / 6), 2)) %>%
      arrange(desc(runs))
  }

  phase <- m %>%
    mutate(phase = case_when(over <= 6 ~ "Powerplay (1-6)",
                             over <= 15 ~ "Middle (7-15)",
                             TRUE ~ "Death (16-20)"),
           phase = factor(phase, levels = c("Powerplay (1-6)","Middle (7-15)","Death (16-20)"))) %>%
    group_by(innings, batting_team, phase) %>%
    summarise(runs = sum(delivery_runs), balls = sum(is_legal), wkts = sum(is_wkt), .groups = "drop") %>%
    mutate(rr = round(runs / (balls / 6), 2))

  # save tables
  for (i in inns_list) {
    write_csv(bat_card(i),  file.path(DATA_DIR, sprintf("%s_bat_inns%d.csv", slug, i)))
    write_csv(bowl_card(i), file.path(DATA_DIR, sprintf("%s_bowl_inns%d.csv", slug, i)))
  }
  write_csv(phase, file.path(DATA_DIR, sprintf("%s_phase.csv", slug)))
  write_csv(fow,   file.path(DATA_DIR, sprintf("%s_fow.csv", slug)))

  list(m = m, worm = worm, fow = fow, phase = phase,
       bat1 = bat_card(inns_list[1]), bat2 = if (length(inns_list) > 1) bat_card(inns_list[2]) else NULL,
       bowl1 = bowl_card(inns_list[1]), bowl2 = if (length(inns_list) > 1) bowl_card(inns_list[2]) else NULL,
       teams = teams, totals = totals, wkts = wkts, legal = legal,
       colour_for = colour_for, slug = slug, caption_tag = caption_tag)
}

# ---- standard chart set -----------------------------------------------------
make_worm <- function(R, title, subtitle) {
  wp <- R$worm %>% mutate(side = paste0(batting_team, " ", R$totals[innings], "/", R$wkts[innings]))
  side_levels <- unique(wp$side)
  cols <- setNames(c(R$colour_for[R$teams[1]],
                     if (length(R$teams) > 1) R$colour_for[R$teams[2]] else NULL), side_levels)
  target <- if (length(R$totals) > 1) R$totals[1] + 1 else NA
  fowp <- R$fow %>% mutate(side = paste0(batting_team, " ", R$totals[innings], "/", R$wkts[innings]))
  p <- ggplot(wp, aes(over_dec, cum_runs, colour = side)) +
    { if (!is.na(target)) geom_hline(yintercept = R$totals[1], colour = brand$red, linetype = "33", linewidth = 0.5) } +
    geom_line(linewidth = 1.2) +
    geom_point(data = fowp, aes(over_dec, score_at, colour = side), shape = 4, size = 2.8, stroke = 1.2) +
    scale_colour_manual(values = cols, name = NULL) +
    scale_x_continuous(limits = c(0, 20), breaks = seq(0, 20, 4)) +
    labs(title = title, subtitle = subtitle, x = "Overs", y = "Cumulative runs",
         caption = paste0("Source: Cricsheet ball-by-ball (CC BY-SA 4.0). ", R$caption_tag)) +
    theme_editorial()
  save_fig(p, paste0(R$slug, "_worm"), width = 9, height = 5.2)
}

make_phase <- function(R, title, subtitle) {
  ph <- R$phase %>% mutate(team = batting_team)
  teamcols <- R$colour_for
  p <- ggplot(ph, aes(phase, rr, fill = team)) +
    geom_col(position = position_dodge(width = 0.7), width = 0.62) +
    geom_text(aes(label = sprintf("%.1f", rr)), position = position_dodge(width = 0.7),
              vjust = -0.3, colour = brand$ink, size = 3.4) +
    scale_fill_manual(values = teamcols, name = NULL) +
    scale_y_continuous(expand = expansion(mult = c(0, 0.12))) +
    labs(title = title, subtitle = subtitle, x = NULL, y = "Runs per over",
         caption = paste0("Source: Cricsheet ball-by-ball. ", R$caption_tag)) +
    theme_editorial()
  save_fig(p, paste0(R$slug, "_phase"), width = 8.6, height = 5)
}

make_bowling <- function(R, inns, title, subtitle, accent) {
  bc <- if (inns == 1) R$bowl1 else R$bowl2
  bc <- bc %>% mutate(bowler = factor(bowler, levels = rev(bowler)),
                      lbl = sprintf("%.0f ov · %d/%d", overs, wkts, runs))
  p <- ggplot(bc, aes(runs, bowler)) +
    geom_col(aes(fill = wkts > 0), width = 0.66) +
    geom_text(aes(label = lbl), hjust = -0.08, colour = brand$ink, size = 3.4) +
    scale_fill_manual(values = c("FALSE" = brand$muted, "TRUE" = accent),
                      labels = c("No wicket","Took wicket(s)"), name = NULL) +
    scale_x_continuous(expand = expansion(mult = c(0, 0.12))) +
    labs(title = title, subtitle = subtitle, x = "Runs conceded", y = NULL,
         caption = paste0("Source: Cricsheet ball-by-ball. ", R$caption_tag)) +
    theme_editorial() + theme(legend.position = "top")
  save_fig(p, paste0(R$slug, "_bowling"), width = 9, height = 5)
}

make_topbat <- function(R, title, subtitle) {
  tb <- bind_rows(
    R$bat1 %>% slice_max(runs, n = 2),
    if (!is.null(R$bat2)) R$bat2 %>% slice_max(runs, n = 2) else NULL
  ) %>%
    transmute(player = striker, runs, boundary_runs, other, balls) %>%
    pivot_longer(c(boundary_runs, other), names_to = "type", values_to = "r") %>%
    mutate(type = recode(type, boundary_runs = "From boundaries", other = "Running / other"),
           player = factor(player, levels = rev(unique(player))))
  p <- ggplot(tb, aes(r, player, fill = type)) +
    geom_col(width = 0.66) +
    scale_fill_manual(values = c("From boundaries" = brand$lime, "Running / other" = brand$muted), name = NULL) +
    scale_x_continuous(expand = expansion(mult = c(0, 0.06))) +
    labs(title = title, subtitle = subtitle, x = "Runs", y = NULL,
         caption = paste0("Source: Cricsheet ball-by-ball. ", R$caption_tag)) +
    theme_editorial() + theme(legend.position = "top")
  save_fig(p, paste0(R$slug, "_topbat"), width = 8.6, height = 4.8)
}

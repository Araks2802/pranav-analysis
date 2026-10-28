# Generate the standard chart set for every match analysis on the site.
source("analysis/cricket/_match_pipeline.R")

# India colour lime, opponent cyan. For WI-batting-first matches the worm still
# colours by team via colour_for.
jobs <- list(
  list(id="1539433", slug="indnz_2nd_t20i",
       tag="India v New Zealand, 2nd T20I, Christchurch, 24 Oct 2026."),
  list(id="1529230", slug="indwi_1st_t20i",
       tag="India v West Indies, 1st T20I, Lucknow, 6 Oct 2026."),
  list(id="1529231", slug="indwi_2nd_t20i",
       tag="India v West Indies, 2nd T20I, Ranchi, 9 Oct 2026."),
  list(id="1529232", slug="indwi_3rd_t20i",
       tag="India v West Indies, 3rd T20I, Indore, 11 Oct 2026."),
  list(id="1529233", slug="indwi_4th_t20i",
       tag="India v West Indies, 4th T20I, Hyderabad, 14 Oct 2026.")
)

for (j in jobs) {
  bbb <- get_t20()
  first_team <- (bbb %>% filter(match_id==j$id, innings==1) %>% head(1))$batting_team
  if (identical(first_team, "India")) { ca <- brand$lime; cb <- brand$cyan }
  else { ca <- brand$cyan; cb <- brand$lime }
  R <- analyse_match(j$id, j$slug, j$tag, team_a_colour=ca, team_b_colour=cb)

  t1 <- R$teams[1]; t2 <- R$teams[2]
  s1 <- sprintf("%s %d/%d", t1, R$totals[1], R$wkts[1])
  s2 <- sprintf("%s %d/%d", t2, R$totals[2], R$wkts[2])
  chased <- R$totals[2] > R$totals[1]  # did the chasing side win

  make_worm(R,
    title = "The chase, ball by ball",
    subtitle = sprintf("%s set %d; %s replied with %d. Crosses mark wickets.",
                       t1, R$totals[1], t2, R$totals[2]))
  make_phase(R,
    title = "Where the match turned: run rate by phase",
    subtitle = "Powerplay, middle and death scoring for both sides.")
  # bowling chart = the side that bowled second (defended/attacked the chase)
  make_bowling(R, inns = 2,
    title = sprintf("%s's bowling in the chase", t1),
    subtitle = "Runs conceded, with overs and wickets shown.",
    accent = R$colour_for[[t1]])
  make_topbat(R,
    title = "The biggest hands, and how they were built",
    subtitle = "Top two scorers per side: boundary runs versus runs from running.")

  assign(paste0("R_", j$slug), R, envir=.GlobalEnv)
}

cat("\nAll matches processed; charts exported to", FIG_DIR, "\n")

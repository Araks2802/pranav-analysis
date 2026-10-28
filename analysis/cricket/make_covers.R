# Branded "scorecard hero" cover graphics for match-analysis articles.
# Not a chart — a designed header card (teams, result, venue, headline stat).
# Distinctive, on-brand, and no image-licensing risk.
suppressMessages({ library(ggplot2) })
source("analysis/cricket/_helpers.R")

COVER_DIR <- "analysis/cricket/figures"

make_cover <- function(slug, comp_label, team_left, score_left,
                       team_right, score_right, result, venue_date,
                       hero_stat, hero_label, accent = brand$lime) {
  # layout on a 1200x675 (16:9) canvas using normalised coords
  df_bg <- data.frame(x = 0, y = 0)
  p <- ggplot(df_bg, aes(x, y)) +
    xlim(0, 100) + ylim(0, 56.25) +
    # competition label
    annotate("text", x = 5, y = 52, label = toupper(comp_label), hjust = 0,
             colour = accent, size = 4.4, fontface = "bold", family = "sans") +
    # teams + scores
    annotate("text", x = 5, y = 42, label = team_left, hjust = 0,
             colour = brand$ink, size = 9, fontface = "bold") +
    annotate("text", x = 5, y = 34.5, label = score_left, hjust = 0,
             colour = brand$muted, size = 6) +
    annotate("text", x = 5, y = 25, label = "v", hjust = 0,
             colour = brand$muted, size = 5, fontface = "italic") +
    annotate("text", x = 5, y = 17.5, label = team_right, hjust = 0,
             colour = brand$ink, size = 9, fontface = "bold") +
    annotate("text", x = 5, y = 10, label = score_right, hjust = 0,
             colour = brand$muted, size = 6) +
    # result strip
    annotate("text", x = 5, y = 3.2, label = result, hjust = 0,
             colour = accent, size = 5, fontface = "bold") +
    # hero stat block (right)
    annotate("text", x = 95, y = 40, label = hero_stat, hjust = 1,
             colour = accent, size = 22, fontface = "bold") +
    annotate("text", x = 95, y = 26, label = hero_label, hjust = 1,
             colour = brand$ink, size = 5) +
    annotate("text", x = 95, y = 6, label = venue_date, hjust = 1,
             colour = brand$muted, size = 3.8) +
    # thin accent rule under competition label
    annotate("segment", x = 5, xend = 42, y = 48.5, yend = 48.5,
             colour = accent, linewidth = 0.8) +
    theme_void() +
    theme(plot.background = element_rect(fill = brand$navy, colour = NA),
          panel.background = element_rect(fill = brand$navy, colour = NA),
          plot.margin = margin(0, 0, 0, 0))

  path <- file.path(COVER_DIR, paste0(slug, "_cover.png"))
  ggsave(path, p, width = 12, height = 6.75, dpi = 110, bg = brand$navy)
  message("cover: ", path)
}

# ---- one call per match -----------------------------------------------------
make_cover("indnz_1st_t20i", "India v New Zealand · 1st T20I",
           "NEW ZEALAND", "225/4 (20)", "INDIA", "230/6 (19.4)",
           "India won by 4 wickets", "Hagley Oval, Christchurch · 22 Oct 2026",
           "2", "balls to spare", accent = brand$lime)

make_cover("indnz_2nd_t20i", "India v New Zealand · 2nd T20I",
           "NEW ZEALAND", "180/5 (20)", "INDIA", "181/6 (19.5)",
           "India won by 4 wickets", "Hagley Oval, Christchurch · 24 Oct 2026",
           "51", "Tilak Varma, off 25", accent = brand$lime)

make_cover("indwi_1st_t20i", "India v West Indies · 1st T20I",
           "WEST INDIES", "171 (19.1)", "INDIA", "172/2 (14.4)",
           "India won by 8 wickets", "Ekana Stadium, Lucknow · 6 Oct 2026",
           "102", "Shreyas Iyer, off 42", accent = brand$lime)

make_cover("indwi_2nd_t20i", "India v West Indies · 2nd T20I",
           "INDIA", "249/5 (20)", "WEST INDIES", "252/4 (18.3)",
           "West Indies won by 6 wickets", "JSCA Stadium, Ranchi · 9 Oct 2026",
           "102", "Shai Hope, off 45", accent = brand$cyan)

make_cover("indwi_3rd_t20i", "India v West Indies · 3rd T20I",
           "INDIA", "223 (20)", "WEST INDIES", "209/7 (20)",
           "India won by 14 runs", "Holkar Stadium, Indore · 11 Oct 2026",
           "69", "Abhishek Sharma, off 30", accent = brand$lime)

make_cover("indwi_4th_t20i", "India v West Indies · 4th T20I",
           "WEST INDIES", "247/3 (20)", "INDIA", "223 (19.3)",
           "West Indies won by 24 runs", "Rajiv Gandhi Stadium, Hyderabad · 14 Oct 2026",
           "102", "Shai Hope's 2nd ton", accent = brand$cyan)

cat("\nAll covers generated.\n")

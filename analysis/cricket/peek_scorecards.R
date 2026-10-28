source("analysis/cricket/_match_pipeline.R")
ids <- c("1539433",  # 2nd IND-NZ
         "1529230","1529231","1529232","1529233")  # IND-WI 1-4
bbb <- get_t20()
for (id in ids) {
  m <- bbb %>% filter(match_id == id) %>% arrange(innings, over, ball) %>%
    mutate(is_wide=!is.na(wides)&wides>0, is_nb=!is.na(noballs)&noballs>0, is_legal=!is_wide&!is_nb,
           is_wkt=!is.na(wicket_type)&wicket_type!="")
  cat("\n===== match", id, "|", as.character(m$start_date[1]), "|", m$venue[1], "=====\n")
  for (i in sort(unique(m$innings))) {
    d <- m %>% filter(innings==i)
    tot <- sum(d$runs_off_bat)+sum(d$extras); wk <- sum(d$is_wkt); lb <- sum(d$is_legal)
    cat(sprintf("Inns %d %s: %d/%d (%s ov)\n", i, d$batting_team[1], tot, wk, sprintf("%d.%d", lb%/%6, lb%%6)))
    top <- d %>% group_by(striker) %>% summarise(r=sum(runs_off_bat), b=sum(is_legal), .groups="drop") %>%
      arrange(desc(r)) %>% head(3)
    cat("   top: ", paste(sprintf("%s %d(%d)", top$striker, top$r, top$b), collapse=", "), "\n")
  }
  cat("   target recorded:", paste(unique(m$target[!is.na(m$target)]), collapse=","), "\n")
}

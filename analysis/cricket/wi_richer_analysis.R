# =============================================================================
# Richer India v West Indies analysis using the t20_bbb dataset, which carries
# line, length, shot type, bowler style/kind and a control (false-shot) flag.
# One tailored chart angle per match so the four pieces don't repeat themselves.
# All four WI matches are complete in t20_bbb (both innings, line/length on
# every ball) and totals reconcile with the scorecard.
# =============================================================================
suppressMessages({ library(dplyr); library(tidyr); library(readr); library(ggplot2); library(forcats) })
source("analysis/cricket/_helpers.R")

FIG <- "analysis/cricket/figures"
SRC <- "t20_bbb (1).csv"

ids <- c("1529230","1529231","1529232","1529233")
# Load only the WI-match rows (streaming filter via readr with col selection)
cols <- cols_only(
  p_match = col_character(), inns = col_integer(), bat = col_character(),
  team_bat = col_character(), bowl = col_character(), team_bowl = col_character(),
  over = col_integer(), score = col_double(), batruns = col_double(),
  out = col_character(), wide = col_double(), noball = col_double(),
  line = col_character(), length = col_character(), shot = col_character(),
  control = col_double(), bowl_kind = col_character(), bowl_style = col_character()
)
cat("Loading t20_bbb (filtering to WI matches)...\n")
all <- read_csv(SRC, col_types = cols,
                progress = FALSE)
m <- all %>% filter(p_match %in% ids)
rm(all); gc()
cat("WI-match rows:", nrow(m), "\n")

m <- m %>% mutate(
  is_wide = !is.na(wide) & wide > 0,
  is_legal = (is.na(wide) | wide == 0) & (is.na(noball) | noball == 0),
  br = ifelse(is.na(batruns), 0, batruns),
  length = factor(length, levels = c("YORKER","FULL_TOSS","FULL","GOOD_LENGTH",
                                      "SHORT_OF_A_GOOD_LENGTH","SHORT")),
  length_lab = recode(length, YORKER="Yorker", FULL_TOSS="Full toss", FULL="Full",
                      GOOD_LENGTH="Good length", SHORT_OF_A_GOOD_LENGTH="Back of a length",
                      SHORT="Short"),
  kind = recode(bowl_kind, `pace bowler`="Pace", `spin bowler`="Spin")
)

len_levels <- c("Yorker","Full toss","Full","Good length","Back of a length","Short")

# ---------- 1. LUCKNOW: where India's bowlers won it — runs & wickets by length
m1 <- m %>% filter(p_match=="1529230", team_bat=="West Indies")
len1 <- m1 %>% filter(!is.na(length)) %>% group_by(length_lab) %>%
  summarise(runs=sum(score), balls=sum(is_legal),
            wkts=sum(out %in% c("True","TRUE","true")), .groups="drop") %>%
  mutate(econ=round(runs/(balls/6),1),
         length_lab=factor(length_lab, levels=len_levels))
p1 <- ggplot(len1, aes(length_lab, econ, fill=wkts>0)) +
  geom_col(width=0.68) +
  geom_text(aes(label=sprintf("%.1f rpo · %dw", econ, wkts)), vjust=-0.3,
            colour=brand$ink, size=3.3) +
  scale_fill_manual(values=c(`FALSE`=brand$muted, `TRUE`=brand$lime),
                    labels=c("No wicket","Wicket(s)"), name=NULL) +
  scale_y_continuous(expand=expansion(mult=c(0,0.14))) +
  labs(title="India's wickets came full; the punishment came short",
       subtitle="West Indies' economy by length. India's full and good-length balls took the wickets cheaply.",
       x=NULL, y="Runs per over conceded",
       caption="Source: ball-by-ball with length data. India v West Indies, 1st T20I, Lucknow, 6 Oct 2026.") +
  theme_editorial() + theme(legend.position="top", axis.text.x=element_text(angle=15, hjust=1))
save_fig(p1, "indwi_1st_length", width=9, height=5.2)

# ---------- 2. RANCHI: control% (false-shot rate) by over-phase, both chases
m2 <- m %>% filter(p_match=="1529231", !is.na(control))
ctrl2 <- m2 %>%
  mutate(phase=case_when(over<=6~"Powerplay", over<=15~"Middle", TRUE~"Death"),
         phase=factor(phase, levels=c("Powerplay","Middle","Death"))) %>%
  group_by(team_bat, phase) %>%
  summarise(control_pct=round(mean(control)*100,0), .groups="drop")
p2 <- ggplot(ctrl2, aes(phase, control_pct, fill=team_bat)) +
  geom_col(position=position_dodge(width=0.7), width=0.6) +
  geom_text(aes(label=paste0(control_pct,"%")), position=position_dodge(width=0.7),
            vjust=-0.3, colour=brand$ink, size=3.4) +
  scale_fill_manual(values=c("India"=brand$lime, "West Indies"=brand$cyan), name=NULL) +
  scale_y_continuous(limits=c(0,105), expand=expansion(mult=c(0,0.05))) +
  labs(title="Who was more in control at Ranchi?",
       subtitle="Share of balls the batter met cleanly (no false shot), by phase.",
       x=NULL, y="Balls in control (%)",
       caption="Source: ball-by-ball with shot-control data. 2nd T20I, Ranchi, 9 Oct 2026.") +
  theme_editorial() + theme(legend.position="top")
save_fig(p2, "indwi_2nd_control", width=8.6, height=5)

# ---------- 3. INDORE: pace vs spin — economy & wickets, both innings
m3 <- m %>% filter(p_match=="1529232")
ps3 <- m3 %>% group_by(team_bowl, kind) %>%
  summarise(runs=sum(score), balls=sum(is_legal),
            wkts=sum(out %in% c("True","TRUE","true")), .groups="drop") %>%
  filter(balls>0) %>% mutate(econ=round(runs/(balls/6),1),
         who=paste0(team_bowl, " ", kind))
p3 <- ggplot(ps3, aes(x=econ, y=fct_reorder(who, econ), fill=kind)) +
  geom_col(width=0.64) +
  geom_text(aes(label=sprintf("%.1f rpo · %dw", econ, wkts)), hjust=-0.06,
            colour=brand$ink, size=3.3) +
  scale_fill_manual(values=c("Pace"=brand$cyan, "Spin"=brand$gold), name=NULL) +
  scale_x_continuous(expand=expansion(mult=c(0,0.16))) +
  labs(title="Indore was a spin story",
       subtitle="Economy and wickets by pace vs spin for each side. Spin set the terms on a used surface.",
       x="Runs per over", y=NULL,
       caption="Source: ball-by-ball with bowler-type data. 3rd T20I, Indore, 11 Oct 2026.") +
  theme_editorial() + theme(legend.position="top")
save_fig(p3, "indwi_3rd_pacespin", width=9, height=5)

# ---------- 4. HYDERABAD: Shai Hope's scoring by length (his 2nd ton)
m4 <- m %>% filter(p_match=="1529233", bat=="Shai Hope", !is.na(length))
hope <- m4 %>% group_by(length_lab) %>%
  summarise(runs=sum(br), balls=sum(is_legal), .groups="drop") %>%
  mutate(sr=round(runs/balls*100,0), length_lab=factor(length_lab, levels=len_levels)) %>%
  filter(!is.na(length_lab))
p4 <- ggplot(hope, aes(length_lab, runs)) +
  geom_col(fill=brand$cyan, width=0.68) +
  geom_text(aes(label=sprintf("%d off %d (SR %d)", runs, balls, sr)), vjust=-0.3,
            colour=brand$ink, size=3.2) +
  scale_y_continuous(expand=expansion(mult=c(0,0.14))) +
  labs(title="Shai Hope punished length — everywhere",
       subtitle="Runs (and strike rate) by delivery length in Hope's 102. India found no safe length to bowl.",
       x=NULL, y="Runs scored",
       caption="Source: ball-by-ball with length data. 4th T20I, Hyderabad, 14 Oct 2026.") +
  theme_editorial() + theme(axis.text.x=element_text(angle=15, hjust=1))
save_fig(p4, "indwi_4th_hope_length", width=9, height=5.2)

cat("\nRicher WI charts generated.\n")

---
title: "Shai Hope Post-Series Report: What He Did to Us, and What We Change Next Time"
slug: "shai-hope-post-series-report-ind-wi"
description: "An India analyst's post-series report on Shai Hope: 261 runs off 137 balls, why our spinners leaked runs, what held him back, and the plan for next time."
standfirst: "Shai Hope made 261 off 137 balls against us, with two unbeaten hundreds. Written as India's team analyst, this report covers what he did, why it worked, where our plans held, and what we change next time."
date: 2026-11-02
category: "Data Stories"
tags: ["T20I", "India", "West Indies", "Shai Hope", "post-series report", "player analysis"]
cover: "/images/hope_cover_newsmill.jpg"
cover_alt: "Shai Hope plays a shot on the off side against India, with the wicketkeeper crouched behind the stumps. Photo: News Mill"
author: "Pranav Arakkal"
featured: false
# MEDIUM URL PLACEHOLDER: after publishing on Medium, paste the URL here,
# e.g. medium: "https://medium.com/@arakkal.pranav/...". This adds the
# "Read this on Medium" link in the article footer. Then delete the
# "Also on Medium" placeholder paragraph at the bottom of the body.
medium: ""
methodology: >-
  Built in Python from ball-by-ball T20 data carrying bowler type, length, line
  and wagon-wheel zone. Series sample: 4 innings, 137 legal balls (T20I 5 in
  Bengaluru was a no result and Hope did not bat). "Usual" record: all his T20s
  from 1 Jan 2024 to 18 Sep 2026 with the series matches removed (136 innings,
  2,999 balls). Every match Hope batted in was checked for completeness. Samples
  under 10 balls are flagged as small.
sources:
  - label: "Ball-by-ball T20 data with line, length, bowler-type and wagon-zone detail"
  - label: "Cover photo: News Mill"
related:
  - "hope-rutherford-ranchi-ind-wi-2nd"
  - "hope-double-hyderabad-ind-wi-4th"
---

*Cover photo: News Mill.*

<div class="stat-row">
  <div class="stat-callout"><div class="stat-value">261 (137)</div><div class="stat-label">Runs off balls in 4 innings, two of them unbeaten hundreds</div></div>
  <div class="stat-callout"><div class="stat-value">190.5</div><div class="stat-label">Series strike rate, against 130.1 in his usual T20 record since 2024</div></div>
  <div class="stat-callout"><div class="stat-value">2</div><div class="stat-label">Dismissals, both off good-length balls outside off</div></div>
</div>

## 1. Executive summary

Shai Hope batted four times against us in this series. He made 261 runs off 137 balls. His strike rate was 190.5 (runs per 100 balls faced) and his average was 130.5 (runs per dismissal). We got him out twice. Two of his innings were unbeaten hundreds, and West Indies won both of those games. We won the two games where we dismissed him. The series finished 2–2, and the Bengaluru game was a no result.

On a ball-for-ball basis he was much more dangerous than his usual record. Since January 2024, outside this series, he strikes at 130.1 over 2,999 balls. Against us he scored about 60 more runs per 100 balls.

Our four main takeaways:

- **Our spinners gave him too many full balls.** Half the spin deliveries he faced were full, and he scored at 281.5 off them.
- **Good length outside off was the one plan that held.** Both dismissals came from it, and he scored at only 126 off good-length balls across the series.
- **Arshdeep Singh contained him.** Hope made 28 off Arshdeep's 26 balls (strike rate 107.7) and Arshdeep bowled him once.
- **He hit straight.** Only 8.8% of his runs came square of the wicket or behind it, so we can set the field for that.

One caveat sits over the whole report. 137 balls is a small sample. Some of these findings are fairly firm and some are only suggestive. Section 8 explains which is which.

<figure class="chart-figure">
  <img src="/charts/cricket/hope_series_dashboard.png" alt="Shai Hope series dashboard: headline numbers, usual-record comparison, wagon wheels, strike rate by length, India bowlers, phase and bowling-style splits, and innings by innings">
  <figcaption>The full series dashboard. The top row compares the series (137 balls) with his usual T20 record since 2024, with the series matches removed (2,999 balls).
  <span class="chart-source">Ball-by-ball data · West Indies in India T20I Series, 6–17 Oct 2026.</span></figcaption>
</figure>

## 2. Series context

Here is how his innings went, match by match:

- **T20I 1, Lucknow (6 Oct). India won.** West Indies batted first and were all out for 171 in 19.1 overs. Hope made 52 off 37 balls (6 fours, 2 sixes) before Naman Dhir had him caught in the 12th over. We chased 172 for the loss of two wickets in 14.4 overs.
- **T20I 2, Ranchi (9 Oct). West Indies won.** We made 249/5 and still lost. Hope made 102* off 45 balls (6 fours, 9 sixes) and West Indies reached 252/4 in 18.3 overs.
- **T20I 3, Indore (11 Oct). India won.** We made 223 all out. Arshdeep bowled Hope for 5 off 5 balls in the 2nd over, and West Indies finished on 209/7.
- **T20I 4, Hyderabad (14 Oct). West Indies won.** Hope made 102* off 50 balls (4 fours, 9 sixes) in a total of 247/3. We were held to 223/9 and lost by 24 runs.
- **T20I 5, Bengaluru (17 Oct). No result.** We were 118/5 after 7.4 overs when play stopped. West Indies never batted, so Hope did not bat.

The pattern is simple. When he got through, West Indies won. When we got him out, we won. That does not mean one batter decides every game. But it is a fair summary of how much this series depended on him.

## 3. How he scored

**The overall shift.** His usual T20 record since 2024 is that of a steady top-order anchor. Against us he played like a hitter. A few measures show the change:

- **Strike rate:** 190.5 in the series against 130.1 usually.
- **Boundary rate** (share of balls hit for four or six): 27.0% against 15.5%.
- **Dot-ball rate** (share of balls he scored nothing off): 28.5% against 35.6%.
- **Balls per dismissal** (how long he lasted on average before getting out): 68.5 against 27.0.

He hit 20 sixes and 17 fours. That means 188 of his 261 runs, about 72%, came from boundaries. We never really kept him quiet and then forced a mistake. He scored freely and seldom got out.

**By phase.** We use the standard T20 phases: powerplay (overs 1–6), middle (7–15) and death (16–20). His strike rate went up in all three.

- **Powerplay:** 157 off 56 balls, against 131 usually (1,248 balls). His powerplay dot-ball rate was 44.6%, almost the same as his usual 43.7%. So we did build some pressure early.
- **Middle overs:** 192 off 60 balls, against 127 usually (1,511 balls). This is where we lost control. His dot-ball rate dropped to 20.0%, against 29.5% usually.
- **Death:** 276 off 21 balls, against 148 usually (240 balls). This is the biggest jump, but it comes from only 21 balls.

<figure class="chart-figure">
  <img src="/charts/cricket/hope_series_phase_styles.png" alt="Strike rate by phase, series versus usual, and a table of Hope's numbers against each bowling style in the series">
  <figcaption>Strike rate by phase (left) and by bowling style (right). Ball counts are in brackets. The death-overs bar is based on only 21 balls. † marks samples under 10 balls.
  <span class="chart-source">Ball-by-ball data · West Indies in India T20I Series, 6–17 Oct 2026.</span></figcaption>
</figure>

**Pace versus spin.** Spin is where the gap was widest. Hope struck at 218.2 against our spinners (55 balls). His usual strike rate against spin is 125.1 (1,413 balls). Against our seamers he struck at 172.0 (82 balls), against 134.3 usually (1,570 balls). He was faster than usual against both, but against spin his strike rate rose by more than 90 runs per 100 balls.

That runs against his record. Spin, and slow left-arm in particular, is usually the way to slow him down. Section 4 looks at why it failed here.

## 4. Where our spinners went wrong

**Too full.** 27 of the 55 spin balls Hope faced were full (49%). He scored 76 runs off those 27 balls, a strike rate of 281.5. When our spinners hit a good length, it went 22 balls for 25 runs (strike rate 113.6), which is below his usual rate against spin. Only six spin balls were short of a good length, and they went for 19 runs. That is too few balls to read much into, though the cost is clear.

The point here is simple. The trouble was not spin itself. It was spin bowled full. Full balls let him reach the pitch and hit down the ground, and with no fielder back straight that is where most of his runs went (Section 6).

**Axar Patel.** Hope scored 59 off Axar's 28 balls (strike rate 210.7), including 6 sixes, and Axar did not dismiss him. We did not plan for that. In his usual record Hope strikes at 111.3 against slow left-arm orthodox (566 balls), one of his slowest rates against any style. Against Axar himself, before this series, it was 115.4, but that comes from only 13 balls. On paper Axar was our best match-up. In practice he was the bowler Hope scored most off.

**The other spinners.** Kuldeep Yadav went for 35 off 15 balls (strike rate 233.3, 3 sixes). Naman Dhir went for 26 off 12 balls (216.7), but he also took the first-match wicket. These samples are small. Each one is consistent with the wider pattern, but none would stand as evidence alone.

<figure class="chart-figure">
  <img src="/charts/cricket/hope_series_length_bowlers.png" alt="Hope's strike rate by delivery length, dismissals by length, and every India bowler's balls, runs and strike rate against him">
  <figcaption>Left: strike rate by length (balls in brackets). Middle: both dismissals came off good-length balls. Right: each India bowler's figures against Hope. † marks fewer than 10 balls.
  <span class="chart-source">Ball-by-ball data · West Indies in India T20I Series, 6–17 Oct 2026.</span></figcaption>
</figure>

## 5. What worked

**Good length outside off.** Both dismissals came from the same kind of delivery: a good-length ball outside off stump. In Lucknow Naman Dhir (off-spin) had him caught at 11.4 overs. In Indore Arshdeep bowled him at 1.5 overs. Across the series Hope scored at 126 off 43 good-length balls, against 251 off 49 full balls. Of the six length categories, good length was the cheapest for us except the yorker, and he faced only 3 yorkers.

The line by itself made almost no difference. He struck at 189.0 off balls outside off (73 balls) and 187.1 off balls at the stumps (62 balls). The length is what mattered.

**Arshdeep Singh.** Arshdeep was the one bowler Hope never got on top of. He made 28 off Arshdeep's 26 balls (strike rate 107.7) with 10 dots, 4 fours and no sixes, and Arshdeep bowled him for 5 in Indore. This was not a one-off. Hope's usual strike rate against left-arm medium-fast is 111.3 (106 balls), so Arshdeep's figures match a long-standing weakness rather than a lucky series.

**Mayank Yadav** was our next most economical bowler: 45 runs off 28 balls (strike rate 160.7) with 11 dots, the most of any of our bowlers. That is still well above Hope's usual rate, but it held him back more than most.

## 6. Scoring zones: he played straight

A wagon wheel shows where each scoring shot went. Here it shows something we can plan for. Only 23 of his 261 series runs (8.8%) came square of the wicket or behind it, in the fine leg, square leg, point and third man areas. In his usual record that share is 24.1%. Long-on and long-off together gave him 43.3% of his series runs, against 29.1% usually.

In short, he did not need the angles. He waited for the full ball and hit it back past the bowler. Usually about a quarter of his runs come from the square and fine areas. Against us he barely used them.

<figure class="chart-figure">
  <img src="/charts/cricket/hope_series_wagon_wheels.png" alt="Three wagon wheels: Hope in the series, his usual record against pace and his usual record against spin, with runs per zone marked">
  <figcaption>Where his runs went. Left: this series (137 balls). Centre and right: his usual record against pace (1,570 balls) and spin (1,413 balls). The numbers are runs per zone. Off side is on the left for a right-hander.
  <span class="chart-source">Ball-by-ball data · West Indies in India T20I Series, 6–17 Oct 2026.</span></figcaption>
</figure>

## 7. Recommendations for the next time we meet him

1. **Spinners: hit a good length and stay there.** This is the clearest change we can make. Full spin went for 281.5 and good-length spin for 113.6. We should take some risk of being cut or pulled off a slightly shorter ball, because it costs less than being driven.
2. **Protect the straight boundaries.** With 43.3% of his series runs going to long-on and long-off, a fielder back at long-on or long-off (or both against spin) is worth more than a deep square or a fine leg. Behind square, his series output was small.
3. **Rethink the Axar match-up.** Axar's earlier record against him (13 balls) looked good on paper but did not hold. If Axar bowls to him, the field and length have to change. Pitching up into the strike zone cannot be the default.
4. **Open with Arshdeep at him.** Arshdeep holding him to 107.7 matches his long-term record against left-arm medium-fast. Using Arshdeep early, at good length outside off, is our best route to an early wicket.
5. **Seamers: fewer full tosses.** Our seamers gave him 15 full tosses (18.3% of their balls to him), and he scored at 186.7 off them. Every one of those is a free hit for a batter in this form.
6. **Treat the death-overs number as a warning, not a plan.** 276 off 21 balls is alarming. But the sample is too small to build a specific death plan on. Our aim should be to keep him from still being in at the death at all.

## 8. Data and method note

**Source.** Every number comes from a ball-by-ball T20 dataset, filtered to the West Indies in India T20I Series 2026/27 (6–17 October 2026, five matches). Each delivery is tagged with bowler type, length, line and wagon-wheel zone. Before the analysis we checked every match in which Hope batted: both innings are present, the ball-by-ball runs add up to the innings totals, a winner is recorded, and Hope's own ball rows match his final runs and balls faced. We also checked that the data is for Shai Hope and not Kyle Hope.

**Sample sizes.** The series is 4 innings and 137 legal balls (wides are not counted as balls faced). His usual record covers all his T20s from 1 January 2024 to 18 September 2026: 136 innings and 2,999 balls across the CPL (32.3% of balls), T20Is (29.4%), ILT20 (14.1%), SA20 (6.8%), PSL and IPL (4.1% each), GSL (3.9%), BBL (3.0%) and BPL (2.3%).

**The series is left out of the baseline.** None of the five series matches are counted in his usual record, so the series is compared with everything else he did, not with a figure that already includes it.

**The no result.** The fifth match in Bengaluru stopped with India on 118/5 after 7.4 overs. West Indies never batted and Hope did not bat. The dataset does not say why play stopped, so we treat it only as a no result.

**What is firm and what is only suggestive.** The series is under 5% of the size of his usual record, so every comparison here comes with wide uncertainty.

- *Reasonably firm:* that he scored much faster than usual overall (137 balls against 2,999, with a 60-point gap in strike rate), and that he scored straight rather than square (based on all 261 runs).
- *Suggestive:* the spin-length finding (27 full balls against 22 good-length balls), the Axar result (28 balls), and Arshdeep's control (26 balls), although Arshdeep's result does fit 106 balls of earlier evidence against that bowling style.
- *Too small to act on alone:* the death-overs strike rate (21 balls), Shivam Dube (7 balls, 21 runs), short-of-length spin (6 balls) and his yorker record (3 balls). The point about good length and dismissals rests on just two wickets. It fits his scoring rate by length, but two dismissals do not make a pattern.

This is a scouting report on four innings, not a full profile of the player. The plans above are where we would start next time. We would update them as soon as he faces us again.

---

**Also on Medium:** [MEDIUM LINK PLACEHOLDER: paste the Medium URL here after publishing](#medium-link-placeholder)

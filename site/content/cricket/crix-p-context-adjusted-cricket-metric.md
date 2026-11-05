---
title: "CRIX-P: Grading Cricketers on More Than the Scoreboard"
slug: "crix-p-context-adjusted-cricket-metric"
description: "My MSc dissertation built CRIX-P, a context-adjusted performance metric for women's T20 cricket. It judges a run by when it was scored and a wicket by when it fell, not just the tally. It tracked team wins at R-squared 0.73, and it earned a distinction."
standfirst: "Batting average and strike rate treat every run the same, whether it's scored in a tense final over or a dead rubber. For my master's dissertation I tried to fix that. The result is CRIX-P, and it scored a distinction."
date: 2026-10-17
category: "Data Stories"
tags: ["WPL", "T20", "women's cricket", "metric", "sabermetrics", "dissertation", "CRIX-P"]
cover: "/images/crixp_cover.jpg"
cover_alt: "Title graphic reading CRIX-P in large bold type, with the subtitle Cricket Runs Impact IndeX, a context-adjusted performance metric for women's T20 cricket, and three stat chips: R-squared 0.73 vs team win percentage, 0 to 100 percentile score, 4 WPL seasons plus 5 of T20I"
author: "Pranav Arakkal"
featured: true
medium: ""
methodology: >-
  CRIX-P was built in R for my MSc Sports Analytics dissertation (Loughborough
  University, 2026, graded 73, distinction). It was built on 20,642 WPL
  deliveries across four seasons (2022/23 to 2025/26) and 68,658 Women's T20I
  deliveries across the top 10 nations and five seasons. Two components are
  computed on every ball: a context-adjusted run value from a Duckworth-Lewis-
  style resource model (DL-Pro) fitted for the project, empirical-Bayes shrunk
  into a per-ball "quality"; and win probability added (WPA). The two are
  standardised within season and role, orthogonalised so shared signal isn't
  double-counted, and converted to a 0-100 percentile. A reliability label
  (Low/Medium/High) is reported alongside the score, never folded into it.
  Validated with a five-pillar framework (validity, reliability, repeatability,
  correlation with winning, actionability). Figures and exact numbers are from
  the submitted dissertation; see the limitations section for the honest
  caveats.
sources:
  - label: "Efron & Morris (1975) — empirical-Bayes / Stein's estimator"
  - label: "Duckworth & Lewis (2004); Stern (2016) — resource-based run expectancy"
  - label: "FanGraphs sabermetrics library — WPA, leverage, WAR"
related:
  - "sooryavanshi-regression-to-mean"
  - "shai-hope-post-series-report-ind-wi"
---
Here's a question traditional cricket stats can't answer. Two batters both score 30. One does it chasing 180 with the game on the line; the other does it when the match is already won. The scorecard says they did the same thing. Your eyes say they didn't.

Batting average, strike rate, bowling economy, these numbers treat every run and every wicket as equal, no matter when it happened or how hard the pitch was playing. They were built for a slower era of the game. In T20, where one over can swing a match more than a whole session of a Test, that's a real blind spot.

So for my master's dissertation I tried to build something that sees the context. It's called **CRIX-P** (Cricket Runs Impact IndeX), and it grades batters and bowlers in women's T20 cricket on what their actions were actually worth, given the situation they happened in. It earned a distinction, and this is the plain-English tour of how it works and what it found.

## The borrowed idea: ask what a run is worth

Cricket has been slow to do this, but baseball has been at it for forty years. The sabermetrics crowd stopped counting raw hits and started asking: how much did this one action change the team's expected runs, or its chance of winning? That's the lens I borrowed.

CRIX-P rests on one number, computed for every single ball: **how many runs did this delivery add to, or take away from, the batting team's expected final total, given the exact match situation?** A dot ball in the last over of a tight chase and a dot ball in the 3rd over of an easy one are not the same event, and this number knows it.

To get "expected final total" I needed a model of how many runs a team should score from any position. Cricket already has one hiding in plain sight: the Duckworth-Lewis method, the thing that resets targets in rain-hit matches. It's built on exactly the right idea, that a team's scoring potential depends on the balls and wickets it has left. I fitted my own version (I called it DL-Pro) with one twist that matters: a per-match "scoring environment" dial.

## A six isn't always worth six

That dial is the heart of the whole thing. It stretches the model to fit a flat, high-scoring ground and squeezes it for a slow, difficult one. Which means the same shot can be worth different amounts.

That sounds obvious when you say it out loud, but no traditional stat does it. A six is six runs in the book whether it's launched on a belter or scrapped out on a minefield. In CRIX-P, the six on the tougher pitch is worth more, because runs were harder to come by. Same logic in reverse for bowlers: a dot ball is worth more when runs are flowing freely around it.

Wickets get the same treatment, and this is where it gets fun. A wicket isn't "a wicket." Early on, with lots of overs left, losing one is expensive, it wipes out a big chunk of expected runs. In the last over, when the innings is nearly done anyway, it barely costs anything.

The model puts real numbers on that: in the WPL data, an early wicket cost about **12 runs** of expected total, and that fell to **under 3 runs** by the final overs. A bowling average treats all of those as one wicket. CRIX-P treats a top-order scalp in the 4th over as the far bigger deal it actually is.

## Being good versus being decisive

Run value tells you how *well* someone played. It doesn't quite tell you how much they *mattered*. A brilliant cameo in a game that's already lost is high quality but low impact.

So I added a second number: **win probability added**, again lifted from baseball. For every ball, how much did the batting team's chance of winning go up or down? A single in the last over of a tied chase can be worth a mountain of win probability; the same single in a rout is worth almost nothing. This is how CRIX-P rewards players who show up in the moments that decide matches.

Two numbers, then: **quality** (how good, per ball, in context) and **WPA** (how much it moved real games). They measure genuinely different things, which is the point.

## Don't get fooled by small samples

There's a trap here. A tail-ender who faces 3 balls and smashes two sixes has a gaudy per-ball average, but it tells you almost nothing, it's mostly luck. If you ranked players on raw rates, the leaderboard would be a parade of tiny-sample flukes.

The fix is a classic statistical tool called empirical-Bayes shrinkage (the same idea Efron and Morris made famous in the 1970s). In plain terms: if a player has lots of data, trust their own number; if they have barely any, pull their number back toward the average for their role. The less evidence, the harder the pull. So that 3-ball hero gets dragged back to earth, while a player who sustained a high rate over a full season keeps it.

I also judge batters only against their own kind. An opener facing the new ball with 40 balls ahead of her is doing a different job from a finisher who walks in with 10 balls left. CRIX-P compares top order to top order, finishers to finishers, so nobody is measured against a job they weren't asked to do.

## Rolling it into one number

The last step is putting quality and WPA together into a single 0-to-100 score, where 50 is dead average for your role and season and 90 means top-10%, like a percentile on a test.

One subtlety I'm a little proud of: good players tend to rack up win probability *because* they're good, so quality and WPA overlap. If you just add them you count that shared skill twice. So I strip out the part of WPA that quality already explains, and keep only the extra, the impact a player had *beyond* what their raw skill would predict. A merely good player gets full credit for being good; a player who also turned up in the big moments gets a bonus on top.

And next to every score sits a **reliability label**, Low, Medium or High, based purely on how much data it rests on. Two players can both score 85: one off a full season, one off the bare minimum. CRIX-P shows you the score *and* how much to trust it, instead of pretending they're equally solid.

## Does it actually work?

A clever formula proves nothing on its own. So I put CRIX-P through a five-part gauntlet, and reported the bits that failed as loudly as the bits that passed.

**It's not just re-labelling old stats.** CRIX-P correlates with strike rate and economy, as it should, but only loosely (around 0.6). If it correlated near-perfectly, it would be adding nothing. The gap is the new information.

**It tracks winning, strongly.** Add up a team's CRIX-P and line it against how often that team actually won: an R-squared of **0.73** in the WPL, beating a traditional strike-rate-and-economy model (0.63). In the international data it hit 0.90. For a player metric, tracking team success that tightly is about the best face-check you can ask for.

**It passes the eye test.** The players the metric crowns are the players the sport already crowns. Across four WPL seasons, the official Player-of-the-Series winners all landed near the very top of their groups: Nat Sciver-Brunt 1st, Sophie Devine 1st, Hayley Matthews 2nd. If your fancy metric had those names buried in mid-table, you'd know something was broken.

**But it's noisy, and I say so.** Split a season's data in half at random and the two halves only agree modestly (reliability around 0.3). T20 seasons are short, a handful of big deliveries move a score a lot, and bowling is especially jumpy year to year. CRIX-P catches real signal, but with real noise on top. That's exactly why the reliability label exists, and why I pitch this as a flashlight for finding players worth a closer look, not a final verdict.

## The player it found: Orla Prendergast

My favourite result isn't a number, it's a name. Orla Prendergast, an Ireland all-rounder, was nowhere near the top of the 2024 run-scoring or wicket charts. On the traditional leaderboards she's easy to miss.

On CRIX-P, she came out at the **top for both batting and bowling.** Why? Because her contributions came in moments that mattered, including 80 off 51 and two wickets in Ireland's first ever T20I win over England. A context-aware metric sees the value in that. A run tally doesn't.

That's the whole pitch for CRIX-P in one player: it surfaces the people whose real influence hides behind modest-looking totals. In women's cricket especially, where analytical coverage is thin and talent can go unseen, a tool that points a scout toward "look harder at her" feels genuinely useful.

## Where it falls short

I'd rather be honest than oversell, so, the limitations:

- **It doesn't know who you played against.** A match-winning knock versus England counts the same as one versus a minnow. Opposition strength is the big missing piece.
- **Run-outs are miscredited.** The bowler gets the full value of a run-out, even though it's really a fielding and running event. The data to split that credit properly doesn't exist, so I flagged it rather than fudged it.
- **Four seasons is not many.** The WPL is new. The long-term reliability and next-season predictions rest on small samples, so treat them as suggestive, not settled.
- **Shrinkage can undersell the greats.** Pulling everyone toward the average also tugs the genuinely exceptional back a touch. It's a deliberate trade for stability, but it means CRIX-P can be a little conservative about the very best.

None of these sink the idea. They're the map of where it goes next: opposition adjustment, more seasons, better credit-sharing.

## The point

Baseball's analytics revolution didn't happen because someone found more stats. It happened because people started asking better questions of the stats they had. Cricket is arriving at that same moment, and the women's game, still early in its data journey, is a wide-open place to do it.

CRIX-P is one attempt to move cricket evaluation past counting events toward understanding what they were worth. It's not the finished article, and I've tried to be clear about that. But it works well enough to track winning, surface hidden contributors, and, apparently, earn a distinction. I'll take it.

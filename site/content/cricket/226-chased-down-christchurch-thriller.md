---
title: "Two Balls to Spare: Inside India's Record Chase in Christchurch"
slug: "226-chased-down-christchurch-thriller"
description: "New Zealand made 225. India chased it down with two balls left. A full ball-by-ball look at how the first T20I was won — and why it was closer than the powerplay suggested."
standfirst: "Glenn Phillips' 82 took New Zealand to 225. It wasn't enough. But the scoreboard's four-wicket margin hides a chase that nearly came apart in the middle overs."
date: 2026-10-22
category: "Match Analysis"
tags: ["T20I", "India", "New Zealand", "run chase", "Sanju Samson", "Glenn Phillips"]
cover: "/charts/cricket/t1_01_chase_worm.png"
cover_alt: "Ball-by-ball worm chart of both innings showing India's chase staying just ahead of New Zealand's pace to the target line"
author: "Pranav Arakkal"
featured: true
methodology: >-
  This analysis uses complete ball-by-ball data for the match from the Cricsheet
  archive, retrieved in R with the cricketdata package. Both innings are present
  in full, so the worm, phase breakdown, bowling figures and boundary splits are
  computed from the actual deliveries — not reconstructed from a scorecard. Every
  figure was reconciled against the published scorecard in R with hard
  assertions: innings totals (runs off bat plus extras), wickets, legal balls
  (120 for New Zealand, 118 for India's 19.4 overs) and the recorded target of
  226 all check out. Charts and calculations are reproducible from
  analysis/cricket/india_nz_1st_t20i.R (with fetch_1st_t20i.R to pull the data).
sources:
  - label: "Cricsheet ball-by-ball archive (CC BY-SA 4.0) — men's T20Is, match 1539432"
    url: "https://cricsheet.org/"
  - label: "ESPNcricinfo — full scorecard, NZ v India 1st T20I"
    url: "https://www.espn.com/cricket/series/24469/scorecard/1539432/new-zealand-vs-india-1st-t20i-24469"
  - label: "ESPNcricinfo — match report"
    url: "https://www.espn.in/cricket/series/24469/report/1539432/new-zealand-vs-india-1st-t20i-24469"
  - label: "CricTracker — NZ v IND 1st T20I full scorecard"
    url: "https://www.crictracker.com/live-scores/nz-vs-ind-1st-t20i-india-tour-of-new-zealand-22-oct-2026/full-scorecard/"
related: []
---

A total of 225 is supposed to be safe. Not "probably win" safe — *bank it and go home* safe. In the history of men's T20 internationals, a side making 225 batting first wins almost every time. New Zealand made exactly that at Hagley Oval, powered by Glenn Phillips' unbeaten 82 off 40, and still lost with two balls to spare.

That's the headline, and it undersells the drama. Because for all that India's four-wicket win looks comfortable in a results table, the ball-by-ball record shows a chase that was built in a blistering six overs, nearly thrown away in the middle, and finished on nerves. Here's how it actually unfolded.

## The worm that never panicked

The cleanest way to see a chase is to watch both innings climb together. Because this match is complete in the ball-by-ball record, we can plot the real thing — every delivery, with wickets marked.

<figure class="chart-figure">
  <img src="/charts/cricket/t1_01_chase_worm.png" alt="Ball-by-ball cumulative run worms for both innings; India's line stays above New Zealand's throughout and crosses the 226 target with two balls left">
  <figcaption>India's line (lime) sits above New Zealand's (cyan) from the second over and never dips below it. The crosses are wickets.
  <span class="chart-source">Cricsheet ball-by-ball · 1st T20I, Christchurch, 22 Oct 2026.</span></figcaption>
</figure>

Notice how India stayed *ahead of New Zealand's own pace* for essentially the entire innings. That's the quiet tell of a well-managed chase: they were never actually behind the equation the Black Caps had set, even when wickets were tumbling. The margin looks slim on the graph because both sides were scoring at better than eleven an over — but India kept their nose in front from over two to the finish.

## 225 that felt like a par score

Start with New Zealand, because their innings is the reason this was a contest at all. Glenn Phillips' 82 not out off 40 balls was the anchor and the accelerator in one — a strike rate north of 200 that still counted as the *responsible* innings around him. Finn Allen's 45 off 24 gave them the platform, and Bevon Jacobs' 31 off 16 kept the back end moving.

<div class="stat-row">
  <div class="stat-callout"><div class="stat-value">225/4</div><div class="stat-label">New Zealand's total — a score that wins the vast majority of T20Is</div></div>
  <div class="stat-callout"><div class="stat-value">82*</div><div class="stat-label">Glenn Phillips off 40 balls, at a strike rate of 205</div></div>
  <div class="stat-callout"><div class="stat-value">13.0</div><div class="stat-label">New Zealand's death-overs run rate (overs 16-20) — they finished hard</div></div>
</div>

New Zealand did exactly what a side batting first should do on a flat one: they front-loaded nothing and saved their fastest scoring for last, lifting from under ten an over in the powerplay to thirteen at the death. On most nights, 225 with that late surge is a winning script.

## How India actually won it: the first six overs

India's answer was to make the powerplay the whole argument. They were **82 without loss after six overs** — scoring at 16.4 an over while New Zealand had managed 49 in the same phase. That 33-run head start was, in effect, the match.

<figure class="chart-figure">
  <img src="/charts/cricket/t1_02_phase.png" alt="Bar chart of run rate by phase for both teams; India's powerplay rate of 16.4 towers over every other bar">
  <figcaption>India's powerplay rate towers over everything else in the match. They banked the game early, then had to hang on.
  <span class="chart-source">Cricsheet ball-by-ball · 1st T20I, 22 Oct 2026.</span></figcaption>
</figure>

Abhishek Sharma set it alight with 29 off 12, and the openers raced to 93 before the first wicket. Here's the honest wrinkle, though: that phase chart also shows where New Zealand nearly got back in. India's middle overs (7-15) slowed to 9.33 an over — *below* New Zealand's rate in the same phase — and that's not a coincidence of tempo. It's where the wickets came.

## The wobble the scoreboard hides

Between overs 6.5 and 11.3, India lost four wickets for 29 runs: Abhishek, Samson's early partners, and a middle order suddenly staring at a required rate creeping back up. A chase that looked won at 93 for 0 was 122 for 4 inside five overs. This is the part a "won by 4 wickets" line erases completely.

What saved it was Sanju Samson. His 67 off 33 was the innings that held the chase together through the wobble — not the flashiest hand on the card, but the one that mattered most, absorbing the pressure while the required rate ticked and then reopening the throttle. Then Naman Dhir's 42 not out off 15 at the death turned a nervy finish into a two-ball win.

<figure class="chart-figure">
  <img src="/charts/cricket/t1_04_boundary_split.png" alt="Horizontal bars splitting the top scorers' runs into boundary runs and runs from running">
  <figcaption>How the big hands were built. Phillips and Samson both leaned heavily on boundaries; Samson's 84% boundary share underlines how he kept the rate up without taking risks between the wickets.
  <span class="chart-source">Cricsheet ball-by-ball · 1st T20I, 22 Oct 2026.</span></figcaption>
</figure>

## New Zealand's bowling: no pressure valve

If India's batting is one half of the explanation, New Zealand's inability to apply the brakes is the other. On a night when 225 should have been defendable, their attack never found a spell to squeeze India when the middle-order wickets gave them an opening.

<figure class="chart-figure">
  <img src="/charts/cricket/t1_03_nz_bowling.png" alt="Horizontal bar chart of New Zealand bowlers' runs conceded in India's innings, with overs and wickets labelled">
  <figcaption>Runs conceded in India's chase, with overs and wickets shown. Bracewell and Santner did the containing; the quicks were expensive.
  <span class="chart-source">Cricsheet ball-by-ball · 1st T20I, 22 Oct 2026.</span></figcaption>
</figure>

Matt Henry's figures — conceding at over fifteen an over — are the ones that hurt, because they came in a phase when New Zealand badly needed control. Their spin pair, Michael Bracewell (2 for 37) and Mitchell Santner (2 for 39), actually did the hard work, taking four wickets between them at under ten an over and creating exactly the wobble that nearly won the game. The problem was that the overs around them leaked, and in a chase of 226 there is no room for an expensive spell.

That's the fairer reading than "New Zealand bowled badly." Two bowlers did their job well enough to make a 225-target genuinely competitive. The match turned on the fact that India's powerplay had already stolen a march the Black Caps' seamers couldn't claw all the way back.

## The verdict

So who won this — India's batting, or New Zealand's bowling? The data points firmly at the first innings of India's reply. The powerplay was the match: 82 for 0 against 49 for 1 is a lead you rarely surrender, even through a four-wicket wobble. New Zealand's spinners dragged it back to a genuine contest and very nearly all the way; their quicks couldn't finish the job.

For New Zealand, the uncomfortable truth is that 225 and a brilliant Phillips hundred-in-all-but-name still lost, because India's top order treats a big target as a sprint to be won in the first six overs rather than a marathon to be managed over twenty. For India, the takeaway is subtler than the scoreline: they won going away up front, then had to dig in. Two balls to spare isn't a thrashing. It's a reminder that even a record chase can get interesting if you let the middle overs drift.

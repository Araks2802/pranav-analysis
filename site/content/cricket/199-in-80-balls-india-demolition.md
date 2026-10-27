---
title: "199 in 80 Balls: How India Turned a Chase into a Demolition"
slug: "199-in-80-balls-india-demolition"
description: "India chased 199 in 13.2 overs against New Zealand in Wellington. A scorecard-level look at why the chase was less a contest than a dismantling."
standfirst: "New Zealand posted 198 and lost by six wickets with 40 balls to spare. The story of the night isn't the target — it's the 43 balls in which India made it irrelevant."
date: 2026-10-27
category: "Match Analysis"
tags: ["T20I", "India", "New Zealand", "Abhishek Sharma", "chase", "powerplay"]
cover: "/charts/cricket/01_chase_progression.png"
cover_alt: "Line chart of India's chase showing runs climbing past the 199 target well inside 20 overs"
author: "Pranav Arakkal"
featured: true
methodology: >-
  This is a scorecard-level analysis. India's 3rd T20I of 27 October 2026 is not
  yet in the Cricsheet ball-by-ball archive (men's T20Is, dataset built 2026-10-25,
  which contains the 1st and 2nd T20Is of this series but not the 3rd), so no
  delivery-level data was available at the time of writing. Every figure below is
  taken from the published scorecard and match reports, cross-checked across
  ESPNcricinfo, the ICC, CricTracker and Indian Express, and reconciled in R
  (batter runs plus extras equal each innings total; bowlers' runs equal the
  opposition total minus byes and leg-byes; wickets reconcile both ways). The
  chase-progression figures use only verified checkpoints — the powerplay score,
  the first-wicket fall and the final total — and are labelled as such, not a
  fabricated ball-by-ball worm. Charts and calculations are reproducible from
  analysis/cricket/india_nz_3rd_t20i.R.
sources:
  - label: "ESPNcricinfo — full scorecard, NZ v India 3rd T20I (match 1539434)"
    url: "https://www.espn.com/cricket/series/24469/scorecard/1539434/new-zealand-vs-india-3rd-t20i-24469"
  - label: "ESPNcricinfo — India's T20 batting keeps finding new levels (S. Monga)"
    url: "https://www.espn.com/cricket/story/_/id/50297465/"
  - label: "ICC — India race to a historic chase to seal the series in Wellington"
    url: "https://www.icc-cricket.com/news/india-race-to-a-historic-chase-to-seal-t20i-series-in-wellington"
  - label: "CricTracker — NZ v IND 3rd T20I full scorecard"
    url: "https://www.crictracker.com/live-scores/nz-vs-ind-3rd-t20i-india-tour-of-new-zealand-27-oct-2026/full-scorecard/"
  - label: "Cricsheet (ball-by-ball archive, CC BY-SA 4.0). The 3rd T20I was not yet included as of the 2026-10-25 build."
    url: "https://cricsheet.org/"
related:
  - "rodri-rice-euro-2024-progressions"
---

Targets in T20 cricket are supposed to create pressure. You set 198, you ask the chasing side to keep up with a run rate near ten an over for the full twenty, and you wait for the moment the maths starts to bite. New Zealand did their half of that deal in Wellington. India never let the maths get a word in.

By the time Naman Dhir clipped his first ball to the boundary to finish it, India were 199 for 4 in 13.2 overs — the target knocked off with **40 balls to spare**. New Zealand had made a thoroughly respectable 198 for 3, built around Daryl Mitchell's unbeaten 89. It didn't come close to being enough, and the reasons why are unusually clear once you lay the numbers out.

## The chase, in four checkpoints

Because the ball-by-ball data for this match isn't public yet, I can't draw you a true run worm. But the scorecard gives four honest, verifiable checkpoints, and they tell the story on their own. India were 118 without loss at the end of the powerplay. They were 133 for 1 when the first wicket fell in the eighth over. They were home at 13.2.

<div class="interactive-chart">
  <h4>India's chase · verified checkpoints</h4>
  <p class="ic-sub">Runs against the target run rate. Hover is not needed — the whole point is the gap.</p>
  <canvas id="chase-canvas" data-target="199" data-points='[{"over":0,"runs":0},{"over":6,"runs":118,"label":"Powerplay 118/0"},{"over":7.1,"runs":133,"label":"1st wkt: 133/1"},{"over":13.2,"runs":199,"label":"Won 199/4"}]' role="img" aria-label="India's chase climbs well above the required run rate throughout, reaching 199 in 13.2 overs."></canvas>
  <span class="chart-source">Reconstruction from verified checkpoints (powerplay, first-wicket fall, final score), not ball-by-ball. Source: ESPNcricinfo / CricTracker.</span>
</div>

The dashed line is the rate New Zealand's total actually demanded: 199 off 20 overs, a shade under ten an over. India's line sits above it from the very first over and never looks back. The static version of the same picture makes the margin plain — the green line finishes against the ceiling with a third of the innings unused.

<figure class="chart-figure">
  <img src="/charts/cricket/01_chase_progression.png" alt="Line chart showing India's cumulative runs reaching the 199 target in 13.2 overs, well above the required run rate line">
  <figcaption>India cleared the target run rate inside the first over and stayed clear.
  <span class="chart-source">Verified scorecard checkpoints · ESPNcricinfo / CricTracker · 3rd T20I, Wellington, 27 Oct 2026.</span></figcaption>
</figure>

<div class="stat-row">
  <div class="stat-callout"><div class="stat-value">14.92</div><div class="stat-label">India's run rate across 13.2 overs — against a required rate of 9.95</div></div>
  <div class="stat-callout"><div class="stat-value">40</div><div class="stat-label">Balls unused when the winning run was struck</div></div>
  <div class="stat-callout"><div class="stat-value">118/0</div><div class="stat-label">India's powerplay score — the engine of the whole chase</div></div>
</div>

## The game was won in 43 balls

Here is the single most important number of the night. India's opening pair, Abhishek Sharma and 15-year-old Vaibhav Sooryavanshi, put on **133 off 43 balls** before Sooryavanshi fell. That partnership alone was two-thirds of the entire target. By the time New Zealand took a wicket, the chase was effectively over; what followed was admin.

<figure class="chart-figure">
  <img src="/charts/cricket/02_opening_stand.png" alt="Bar chart comparing the 133-run opening stand off 43 balls with the remaining 66 runs India needed">
  <figcaption>The opening stand did the damage. Everything after it was cleanup.
  <span class="chart-source">ESPNcricinfo match report · 3rd T20I, 27 Oct 2026.</span></figcaption>
</figure>

Sooryavanshi set the tone by taking 26 off Jacob Duffy's opening over, and his 45 came from just 19 balls. That is the part that makes this chase genuinely unusual rather than merely very good: it wasn't one player going berserk while a partner held an end. Both openers attacked, which meant New Zealand had no pressure valve to turn — no settled batter to tie down while the aggressor took risks. The 118 India put on in the powerplay is, on the reports from the ground, the highest powerplay score in men's T20Is between Full Member nations.

## Abhishek Sharma: 113, almost all of it over the rope

Abhishek's hundred was the headline act, and the shape of it is as striking as the size. He reached fifty in 15 balls and a hundred in 35, finishing with 113 off 38. Of those 113 runs, **102 came in boundaries** — nine fours and eleven sixes. He ran a grand total of eleven.

<figure class="chart-figure">
  <img src="/charts/cricket/03_abhishek_breakdown.png" alt="Horizontal bar chart of Abhishek Sharma's runs: 66 from sixes, 36 from fours, 11 from running">
  <figcaption>90% of Abhishek's innings came from fours and sixes. Running was an afterthought.
  <span class="chart-source">ESPNcricinfo scorecard · 3rd T20I, 27 Oct 2026.</span></figcaption>
</figure>

A 90% boundary share is the statistical fingerprint of an innings that never bothered with accumulation. That's a descriptive fact, not a claim about how he hit — I don't have shot-by-shot or ball-tracking data for this match, so I'm not going to tell you where the ball went or what length he preferred. What the numbers can say is that his strike rate of 297 wasn't built on clever strike rotation; it was built on clearing the ropes at a rate of a six every three or four balls and treating fielders as scenery.

## New Zealand's bowlers had nowhere to hide

It's tempting to look at an economy of fifteen an over and conclude the bowling was simply bad. The honest version is more uncomfortable for New Zealand: there was no spell, from anyone, that created even a passage of control.

<figure class="chart-figure">
  <img src="/charts/cricket/05_nz_bowling.png" alt="Horizontal bar chart of New Zealand bowlers' runs conceded, with overs and wickets labelled">
  <figcaption>Runs conceded, with overs and wickets shown so a one-over cameo isn't judged like a full spell.
  <span class="chart-source">ESPNcricinfo scorecard · 3rd T20I, 27 Oct 2026.</span></figcaption>
</figure>

Two caveats keep this fair. First, overs matter: Matthew Fisher's figures of 1 for 23 came in a single over, and Kyle Jamieson's 2 for 45 in 3.2 — the same chart would mislead you if it didn't show that. Second, Mitchell Santner was the one bright spot, conceding just 17 in three overs at under six an over on a night when the next-best economy was 13.5. One captain bowling a controlled spell while everyone around him leaked is not a bowling-unit failure so much as a batting performance that removed the margin for anything less than perfect.

## Was 198 ever enough?

This is where New Zealand deserve a fairer hearing than the scoreboard gives them. Their 198 for 3 was not a poor total. On the night, both teams cleared 198 — the difference was time, not runs.

<figure class="chart-figure">
  <img src="/charts/cricket/04_scoring_rate.png" alt="Bar chart comparing New Zealand's 9.90 run rate over 20 overs with India's 14.92 over 13.2 overs">
  <figcaption>Same destination, wildly different speed. India scored at roughly one and a half times New Zealand's rate.
  <span class="chart-source">ESPNcricinfo · 3rd T20I, 27 Oct 2026.</span></figcaption>
</figure>

Daryl Mitchell's 89 not out was the spine of the innings — 44.9% of the team total, and close to half of New Zealand's runs off the bat. Finn Allen's 40 off 25 gave them a platform and Bevon Jacobs' unbeaten 39 off 23 pushed them towards 200. In nineteen games out of twenty, 198 wins you the match. The problem wasn't the total; it was that India produced the twentieth game.

So where does that leave the verdict? It's tempting to pick a villain — the bowling attack, the flat pitch, the dew. The more defensible reading is that this was a batting performance that would have beaten almost any total New Zealand could realistically have posted. When your opening pair scores 133 in 43 balls, the first-innings score becomes a detail. New Zealand didn't lose this because they bowled badly, though they bowled badly. They lost it because India batted in a way that made the contest hypothetical from the second over.

## The takeaway

Strip away the records and the takeaway is simple and a little unsettling for opponents: India have found a top order that treats a near-200 target as a formality to be cleared at a canter, not a chase to be managed. The powerplay was the match. The partnership was the match. By the time anyone looked up at the required rate, it had already been buried under the first forty-three balls.

198 is a good score. On this evidence, against this India, it may also be an irrelevant one.

---

*A note on the data: the delivery-level file for this match wasn't publicly available when this was written, so there's no true ball-by-ball worm here — the chase chart uses verified checkpoints only. If and when the match lands in the Cricsheet archive, the analysis script behind this piece will regenerate every chart from the raw deliveries. The full method and sources are below.*

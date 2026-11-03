---
title: "Leg Side or Nothing: Daryl Mitchell vs India"
slug: "daryl-mitchell-leg-side-vs-india"
description: "Daryl Mitchell scored 81.8% of his runs on the leg side against India, against 63.7% usually, and only 5 runs through point. India weren't feeding his pads. He dragged the off-stump ball across anyway."
standfirst: "Mitchell always leans leg side. Against India he went all in: 144 of his 176 runs came on the on side. Here's where they went, what India bowled, and the one bowler who had the answer."
date: 2026-11-02
category: "Data Stories"
tags: ["T20I", "India", "New Zealand", "Daryl Mitchell", "wagon wheel", "player analysis"]
cover: "/images/mitchell_cover.jpg"
cover_alt: "Daryl Mitchell, in New Zealand's black and teal T20 kit and a black helmet, follows through on a pull shot with the ball in the air beside him, the stumps to one side and a blurred crowd behind"
author: "Pranav Arakkal"
featured: false
medium: ""
methodology: >-
  Built in Python from ball-by-ball T20 data carrying bowler type, length, line
  and wagon-wheel zone. Series sample: the India in New Zealand T20I Series,
  22 Oct to 1 Nov 2026 (5 innings, 101 legal balls, 176 runs). "Usual" record:
  all his T20s from 1 Jan 2024 to 15 Sep 2026 with the series matches removed
  (83 innings, 1,448 balls). Every series match was checked for completeness.
  Leg and off shares use runs with a wagon zone. Samples under 10 balls are
  flagged as small.
sources:
  - label: "Ball-by-ball T20 data with line, length, bowler-type and wagon-zone detail"
related:
  - "shai-hope-post-series-report-ind-wi"
  - "sooryavanshi-regression-to-mean"
---
I was watching an R Ashwin video where he talked about how leg-side heavy Daryl Mitchell is, so I went to the data. Turns out "leg-side heavy" undersells it. Against India this series, Mitchell scored **81.8%** of his runs on the leg side. That's 144 of his 176 runs. Through point, the whole series, he managed 5.

So I wanted to know three things. Is this just who he is? Did India make it easy for him? And what should the plan look like next time?

<div class="stat-row">
  <div class="stat-callout"><div class="stat-value">81.8%</div><div class="stat-label">Of his series runs on the leg side (144 of 176), against 63.7% usually</div></div>
  <div class="stat-callout"><div class="stat-value">176 (101)</div><div class="stat-label">Runs off balls in 5 innings, strike rate 174.3</div></div>
  <div class="stat-callout"><div class="stat-value">5</div><div class="stat-label">Runs through point all series, 2.8% of his runs</div></div>
</div>

Quick note before we start: the data here is T20s only, so this is about the T20I series and his T20 record, nothing else.

<figure class="chart-figure">
  <img src="/charts/cricket/mitchell_dashboard_v2.png" alt="Daryl Mitchell series dashboard: headline numbers, leg-side share against every five-innings window of his usual record, leg versus off share, wagon wheels, runs by zone, strike rate by length, India bowlers, line and length against other teams, dismissals and innings by innings">
  <figcaption>The full series dashboard. "Usual" is his T20 record since 2024 with the series matches removed (1,448 balls).
  <span class="chart-source">Ball-by-ball data · India in New Zealand T20I Series, 22 Oct – 1 Nov 2026.</span></figcaption>
</figure>

## He always leans leg side

First, the fair bit. Mitchell is a leg-side player anyway. Across all his T20s since January 2024 (1,448 balls, with this series taken out), **63.7%** of his runs come on the leg side. Against pace it's 60.8%. Against spin it's 68.0%. So if you'd guessed "he likes the on side", you'd be right before a ball was bowled.

## Then this series went way further

81.8% isn't just a bit above 63.7%. It's off his chart. I took every run of five innings in a row from his usual record, 79 of them, which is the same size as this series. His leg-side share in those windows usually sits somewhere between about 57% and 72%. The highest any of them ever got was **79.0%**. This series beat every single one.

<figure class="chart-figure">
  <img src="/charts/cricket/mitchell_leg_side_share.png" alt="Left: stacked bars of leg-side versus off-side share of runs for the series and his usual record, overall and against pace and spin. Right: histogram of his leg-side share across 79 five-innings windows of his usual record, with the series at 81.8% to the right of the usual maximum of 79.0%">
  <figcaption>Left: leg vs off share of runs, series against usual (balls in brackets). Right: every five-innings stretch of his usual record. The series (orange) sits beyond the highest one.
  <span class="chart-source">Ball-by-ball data · India in New Zealand T20I Series, 22 Oct – 1 Nov 2026.</span></figcaption>
</figure>

So where did the runs go? Straight-ish, on the leg side. Long-on gave him **31.8%** of his runs, up from 22.8% usually. Mid-wicket gave him **28.4%**, up from 21.5%. Meanwhile the off side in front of square basically closed for business. Long-off dropped from 15.4% to 6.2%. Cover went from 7.5% to **2.3%** (4 runs). Point went from 7.4% to **2.8%** (5 runs). The fine areas, third man and fine leg, were about normal.

<figure class="chart-figure">
  <img src="/charts/cricket/mitchell_wagon_wheels.png" alt="Three wagon wheels viewed from behind the batter, leg side on the left: Mitchell in the series against India, his usual record against pace, and his usual record against spin, with runs per zone marked">
  <figcaption>Where his runs went. Left: this series (101 balls). Centre and right: his usual record against pace (804 balls) and spin (644 balls). Numbers are runs per zone. Viewed from behind the batter, so for a right-hander like Mitchell the leg side is on the left.
  <span class="chart-source">Ball-by-ball data · India in New Zealand T20I Series, 22 Oct – 1 Nov 2026.</span></figcaption>
</figure>

<figure class="chart-figure">
  <img src="/charts/cricket/mitchell_runs_by_position.png" alt="Grouped bar chart of Mitchell's share of runs by fielding position, series versus usual: long-on 31.8 versus 22.8, mid-wicket 28.4 versus 21.5, long-off 6.2 versus 15.4, cover 2.3 versus 7.5, point 2.8 versus 7.4">
  <figcaption>Share of runs by fielding position. Orange is the series (176 runs), grey is his usual record (1,741 runs with a zone).
  <span class="chart-source">Ball-by-ball data · India in New Zealand T20I Series, 22 Oct – 1 Nov 2026.</span></figcaption>
</figure>

## Were India feeding his pads?

This was my first guess. If a leg-side player scores everything on the leg side, surely the bowlers kept bowling at his legs? Nope. India bowled **62.4%** of their balls to him outside off stump. Other teams bowl him 59.8% outside off. India in earlier T20s against him? 64.1%. On line alone, India's plan was pretty much everyone's plan.

## He dragged the off-stump ball across

Here's the bit I love. India bowled outside off, and Mitchell just hit it to the leg side anyway. Of his runs off balls outside off, **75.9%** went leg side (82 of 108 runs). Against other teams that number is 47.5%. And he wasn't scratching around doing it either: his strike rate off those balls was **171.4**, against 130.3 normally.

<figure class="chart-figure">
  <img src="/charts/cricket/mitchell_line_offstump.png" alt="Three bar charts comparing India this series, India in earlier T20s and all other teams: share of balls bowled outside off (62.4, 64.1, 59.8 percent), share of runs off those balls hit to the leg side (75.9, 51.6, 47.5 percent) and his strike rate off those balls (171.4, 186.0, 130.3)">
  <figcaption>Left: India's line was normal. Middle and right: what he did with the balls outside off. Tracked balls in brackets.
  <span class="chart-source">Ball-by-ball data · India in New Zealand T20I Series, 22 Oct – 1 Nov 2026.</span></figcaption>
</figure>

So if the line was fine, what wasn't? The length. Other teams bowl him a good length on **44.6%** of balls. India managed **25.7%**. India also served up **13 full tosses** in 101 balls (12.9%, against 3.5% from everyone else), and more balls just short of a good length (25.7% against 18.7%). He loved all of it: a strike rate of 185 on good length and 188 on short of a good length in this series. Normally those are two of his quietest lengths, 126 on good length (544 balls) and 123 just short of it (226 balls). India bowled too few good-length balls, and the ones they did bowl, he got after.

<figure class="chart-figure">
  <img src="/charts/cricket/mitchell_length_bowlers.png" alt="Left: length mix from India this series versus other teams, with good length at 25.7 versus 44.6 percent and full tosses at 12.9 versus 3.5 percent. Right: each India bowler's balls, runs, strike rate and leg-side share against Mitchell">
  <figcaption>Left: how often each length was bowled, India this series vs other teams. Right: every India bowler against him. † marks fewer than 10 balls.
  <span class="chart-source">Ball-by-ball data · India in New Zealand T20I Series, 22 Oct – 1 Nov 2026.</span></figcaption>
</figure>

## Arshdeep had the answer

One bowler kept him quiet, and he did it outside off. **Arshdeep Singh** bowled him 24 balls for 27 runs (strike rate 112.5), with 12 dots and a wicket. Only 59.3% of the runs off Arshdeep went leg side. And off Arshdeep's 10 balls outside off, Mitchell scored 5. Five!

Everyone else got hit. Prince Yadav went for 49 off 20 balls (strike rate 245), with 91.8% of it on the leg side. Nitish Kumar Reddy bowled 82% of his balls outside off and still saw 96.6% of the runs go leg side (17 balls, strike rate 171). Mayank Yadav went at 282 off 11 balls, though he did get a wicket.

Spin was a little cheaper: 27 runs off 19 balls (strike rate 142.1). That's only 19 balls though, and Varun Chakravarthy bowled just 5 of them, so I wouldn't read much into it.

How he got out:

- **Christchurch:** Arshdeep, short on the stumps, caught for 28 off 19.
- **Christchurch again:** Bhuvneshwar Kumar, good length on the stumps, caught for 6 off 5.
- **Wellington:** not out, 89 off 52.
- **Auckland:** Mayank Yadav, yorker, lbw for 24 off 9.
- **Hamilton:** Varun Chakravarthy, full outside off, caught for 29 off 16.

## So what's the plan next time?

If I were setting the plan, here's where I'd start:

1. **Bowl the Arshdeep ball.** Outside off, good length, and keep doing it. Good length is one of his slowest-scoring lengths in his usual record (strike rate 126), and other teams bowl it on 44.6% of balls. India got there on 25.7%.
2. **Cut out the freebies.** 13 full tosses in 101 balls is a lot of gifts for a guy this happy to swing through the on side.
3. **Guard the on side, straight.** Long-on and mid-wicket took 60% of his runs between them. If the ball's outside off and he's still going there, put the boundary riders there and make him beat you through cover and point, where he got 9 runs all series.
4. **Don't overthink spin yet.** 19 balls isn't enough to call it either way.

He's a leg-side player who, for one series, became a leg-side-only player. That's not a weakness exactly. He still scored 176 at 174.3. But it's a very clear map of where the runs are coming from, and next time India have no excuse not to use it.

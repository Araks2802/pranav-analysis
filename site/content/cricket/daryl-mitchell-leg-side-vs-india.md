---
title: "Leg Side or Nothing: Daryl Mitchell vs India"
slug: "daryl-mitchell-leg-side-vs-india"
description: "Daryl Mitchell scored 81.8% of his runs on the leg side against India, against 63.7% usually, and only 5 runs through point. India weren't feeding his pads. He dragged the off-stump ball across anyway."
standfirst: "Mitchell always leans leg side. Against India he went all in: 144 of his 176 runs came on the on side. Here's where they went, what India bowled, the one bowler who had the answer, and whether the really wide ball was the trick India missed."
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
  flagged as small. The wide-ball section splits the data's "outside off" into
  plain and wide, and compares him with every other batter's tracked balls in
  T20s since 1 Jan 2024 (365,796 balls from 1,614 batters, with Mitchell and
  the series matches removed). The ranking among batters uses the 302 with at
  least 250 tracked balls and 15 wide-line balls. Called wides come from the
  data's wide flag, and cost is runs per legal ball, so a wide counts as a free
  run on a ball that has to be bowled again. The bowler-arm split uses pace bowlers only
  (left-arm: LF, LFM, LMF, LM; right-arm: RF, RFM, RMF, RM) on plain outside-off
  balls, against every other right-handed batter since 1 Jan 2024.
sources:
  - label: "Ball-by-ball T20 data (line, length, bowler type and wagon zones) by Himanish Ganjoo"
related:
  - "shai-hope-post-series-report-ind-wi"
  - "sooryavanshi-regression-to-mean"
---
I was watching an R Ashwin video where he talked about how leg-side heavy Daryl Mitchell is, so I went to the data. Turns out "leg-side heavy" undersells it. Against India this series, Mitchell scored **81.8%** of his runs on the leg side. That's 144 of his 176 runs. Through point, the whole series, he managed 5.

So I wanted to know three things. Is this just who he is? Did India make it easy for him? And what actually worked against him?

<div class="stat-row">
  <div class="stat-callout"><div class="stat-value">81.8%</div><div class="stat-label">Of his series runs on the leg side (144 of 176), against 63.7% usually</div></div>
  <div class="stat-callout"><div class="stat-value">176 (101)</div><div class="stat-label">Runs off balls in 5 innings, strike rate 174.3</div></div>
  <div class="stat-callout"><div class="stat-value">5</div><div class="stat-label">Runs through point all series, 2.8% of his runs</div></div>
</div>

Quick note before we start: the data here is T20s only, so this is about the T20I series and his T20 record, nothing else.

<figure class="chart-figure">
  <img src="/charts/cricket/mitchell_dashboard_v3.png" alt="Daryl Mitchell series dashboard: headline numbers, leg-side share against every five-innings window of his usual record, leg versus off share, wagon wheels, runs by zone, strike rate by length, India bowlers, line and length against other teams, dismissals, the wide-outside-off panels (strike rate by line against the average batter, cost per legal ball including wides, a wagon wheel and a sample table) and innings by innings">
  <figcaption>The full series dashboard, now with the wide-ball panels near the bottom. "Usual" is his T20 record since 2024 with the series matches removed (1,448 balls).
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

This was my first guess. If a leg-side player scores everything on the leg side, surely the bowlers kept bowling at his legs? Nope. India bowled **62.4%** of their balls to him outside off stump. (That includes the really wide ones. More on those in a bit.) Other teams bowl him 59.8% outside off. India in earlier T20s against him? 64.1%. On line alone, India's plan was pretty much everyone's plan.

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

**Why him, though?** My best guess is the angle. Arshdeep is the one left-arm quick in this attack. (Axar is a left-arm spinner, but Bhuvneshwar, Mayank, Nitish and Prince all bowl right-arm.) A left-armer bowling to a right-hander angles the ball away from him. So a just-outside-off ball is already heading away, and to send it leg side Mitchell has to hit against the angle. From a right-armer the same ball is coming in at his body, so he can use the angle and drag it across the line over mid-wicket.

The data backs that up, and it isn't a one-series thing. On plain outside-off balls (not the really wide ones), Mitchell sends **53.9%** of his runs leg side against right-arm pace in his usual record, and only **33.3%** against left-arm pace. Every other right-hander in the data shows the same gap: **47.9%** against right-arm pace and **29.0%** against left-arm pace, across about 81,000 balls. On the stumps line the gap mostly disappears (85.4% against right-arm, 81.4% against left-arm), which fits an angle story, because the angle only matters when the ball is outside off.

<figure class="chart-figure">
  <img src="/charts/cricket/mitchell_left_arm_angle.png" alt="Bar chart of the share of runs hit to the leg side off just-outside-off balls, by bowler arm. Against left-arm pace: Mitchell's usual record 33%, every other right-hander 29%, Mitchell this series 0% (8 balls, all Arshdeep). Against right-arm pace: Mitchell's usual record 54%, every other right-hander 48%, Mitchell this series 83% (37 balls)">
  <figcaption>Leg-side share of runs off plain outside-off balls. Left-arm quicks push the ball away from a right-hander and the leg-side share drops, for Mitchell and for everyone else. White whiskers are the 95% range for his usual record. † marks fewer than 10 balls.
  <span class="chart-source">Ball-by-ball data · T20s since 1 Jan 2024 (Mitchell's usual record and every other right-handed batter) and the India in New Zealand T20I Series, 22 Oct – 1 Nov 2026.</span></figcaption>
</figure>

The series fits it even more starkly. Arshdeep's 8 plain outside-off balls went for 5 runs, none of them leg side. The right-armers' 37 balls on that line went for 84 runs, 83.3% of them leg side (Bhuvneshwar 91%, Nitish 96%, Prince 82%, Mayank 69%). Add his two wide-line balls, which also went for nothing, and that's the 10 balls and 5 runs from above.

Two honest caveats. The angle is my explanation: the data has no release point or movement in it, only where the runs went. And Mitchell's own left-arm sample is 78 balls (52 scoring shots), so his 33% could plausibly sit anywhere from about 19% to 50%. The league-wide gap, over 13,560 left-arm balls, is the sturdy part.

How he got out:

- **Christchurch:** Arshdeep, short on the stumps, caught for 28 off 19.
- **Christchurch again:** Bhuvneshwar Kumar, good length on the stumps, caught for 6 off 5.
- **Wellington:** not out, 89 off 52.
- **Auckland:** Mayank Yadav, yorker, lbw for 24 off 9.
- **Hamilton:** Varun Chakravarthy, full outside off, caught for 29 off 16.

## Wait, there are two kinds of "outside off"

Everything above lumps two lines together. The data actually splits "outside off" into plain outside off and a properly **wide** line, the kind that's a few inches from being called a wide. It's worth pulling apart, because a wide ball is the one delivery where a leg-side player can't just walk across and swing.

<figure class="chart-figure">
  <img src="/charts/cricket/mitchell_wide_line.png" alt="Left: bar chart of strike rate by line (wide outside off, outside off, stumps or leg) for the series, his usual record and the average T20 batter. On the wide line Mitchell's usual strike rate is 129 against 162 for the average batter, while on plain outside off the two are level at 135 and 134. Right: leg-side share of runs by line, series and usual: 22% on the wide line, 51% on plain outside off and 85% on the stumps and leg line">
  <figcaption>Left: strike rate by line. The wide ball is his slowest line and the average batter's fastest. Right: where his runs went. Only 22% of his runs off the wide ball go leg side.
  <span class="chart-source">Ball-by-ball data · his usual T20 record since 2024 (series removed) vs 1,614 other batters.</span></figcaption>
</figure>

In his usual record the wide ball is his **slowest** line, though only a little slower than plain outside off: a strike rate of **128.6** off 77 balls, against 134.6 on plain outside off and 147.9 on the stumps or down leg. And it's where the leg side stops. Only **22%** of his runs off the wide ball go leg side, against 51% off plain outside off and 85% on the stumps line.

What makes it interesting is everyone else. Across 366,000 balls from 1,614 other batters in T20s since 2024, the wide ball is the *easiest* line to score off, with a strike rate of **161.5** against 134 on plain outside off. The average batter hits a boundary off about one wide ball in four. Mitchell manages roughly one in six. So on plain outside off he's bang on average (135 against 134), and on the wide ball he's about 20% below the typical batter.

To put him in context I gave every batter an index: strike rate on the wide ball divided by their own normal strike rate. The typical batter scores **21% faster** on the wide ball than they normally do. Mitchell scores **8% slower**. Of the 302 other batters with enough balls to compare, **90%** do better on it, relative to their own game, than he does.

<figure class="chart-figure">
  <img src="/charts/cricket/mitchell_wide_batters.png" alt="Scatter plot of 302 T20 batters. The x-axis is the share of a batter's runs on the leg side, the y-axis is strike rate on the wide-outside-off line divided by the batter's own strike rate. A weak downward trend line (correlation -0.11) runs through the cloud, and Daryl Mitchell is marked as a star at 0.92 below the dotted line at 1.0, with a plausible range from 0.68 to 1.17">
  <figcaption>Each dot is another batter. Above the dotted line, the wide ball makes them quicker than usual; below it, slower. Mitchell's range is wide because it's only 77 balls.
  <span class="chart-source">Ball-by-ball data · T20s since 1 Jan 2024, Mitchell and the series removed.</span></figcaption>
</figure>

You might think this is just what happens to leg-side players. It doesn't seem to be. Across those 302 batters, how leg-side-heavy someone is barely predicts how they handle the wide ball (correlation -0.11). The most leg-side third still score 17% faster on it than usual, and the least leg-side third score 24% faster. Mitchell sits below all three groups' averages, though his plausible range (0.68 to 1.17) only just reaches the top of the most leg-side group.

**How sure am I?** Less than I'd like. It's 77 balls. The gap to the average batter is just under two standard errors, which makes it a strong hint, not proof. It's entirely possible he's an average batter who had a quiet stretch against this one ball.

## Is it a plan, though?

Three things get in the way.

<figure class="chart-figure">
  <img src="/charts/cricket/mitchell_wide_catch.png" alt="Left: stacked bars of runs per legal ball for each line against Mitchell, split into runs off the bat and free runs from wides. The wide-outside-off line costs 1.44 runs per legal ball, plain outside off 1.35 and stumps or leg 1.54, with the average batter marked at 1.80, 1.35 and 1.40. Right: strike rate on the wide line and on plain outside off against pace and spin, with the average batter's wide-line strike rate for comparison">
  <figcaption>Left: runs per legal ball including wides. Against Mitchell the wide line (1.44) is not cheaper than plain outside off (1.35), though it would cost far more against the average batter (1.80). Right: pace against spin on the wide line.
  <span class="chart-source">Ball-by-ball data · his usual T20 record since 2024 (series removed) vs 1,614 other batters.</span></figcaption>
</figure>

**1. Wides.** Bowl that wide and some will be called wides, which are free runs on a ball you have to bowl again. **13.5%** of the deliveries Mitchell saw on this line were called wides (12 of 89), against 0.7% on plain outside off. Count them, and a ball on the wide line costs **1.44** runs per legal ball against Mitchell, versus **1.35** for plain outside off. So it isn't cheaper than just bowling outside off. (Against the average batter it's 1.80 versus 1.35, so for most bowlers it's a disaster. Mitchell just takes the sting out of it.)

**2. Pace vs Spin.** Against pace the wide ball goes at: 147.7 off 44 balls, level with the 142.8 he manages off plain outside off. Against spin it's 103.0 off 33 balls, with three dismissals, against 7 in 254 balls on plain outside off. All four of his dismissals on this line came off full balls, all caught, all while going big (two slog sweeps and two drives). Three of them were against spinners: Abrar Ahmed, Harmeet Singh and Adil Rashid. The fourth was Shivam Dube. That's four wickets in 31 full wide balls!

**3. India barely tried it anyway.** Only 6 of their 101 tracked balls were on the wide line (5.9%), the same share every other team bowls at him (5.8%). In their earlier T20s against him it was 11.5% (9 of 78 balls). Three bowlers used it (Mayank Yadav three times, Arshdeep Singh twice, Nitish Kumar Reddy once), and he scored 5 off the six, with the data marking five of those six shots as not in control. Which is lovely, and also six balls. Axar and Varun bowled 19 balls at him in the series and none were on this line.

So, a trick India missed? Maybe a narrow one: a spinner, full, wide of off stump, as a surprise ball to tempt the big shot. Not a general plan, because the wides eat the saving.

He's a leg-side player who, for one series, became a leg-side-only player. That's not a weakness exactly. He still scored 176 at 174.3. But it's a very clear map of where the runs are coming from.

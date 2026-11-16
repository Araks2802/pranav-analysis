---
title: "Who Delivers When It Matters? Rating IPL and T20I Players Under Pressure"
slug: "who-delivers-when-it-matters"
description: "A ball-by-ball look at 185,567 IPL and T20I deliveries to find who adds the most when the match is on the line. Heinrich Klaasen and Sunil Narine lead, but the bigger finding is how hard 'clutch' is to measure."
standfirst: "Everyone has a name for the player who delivers when it counts. We tried to put a number on it, and found that being good under pressure and rising under pressure are two different things."
date: 2026-11-16
category: "Data Stories"
tags: ["IPL", "T20I", "pressure", "clutch", "win probability", "leverage", "Rajasthan Royals", "Python"]
cover: "/charts/cricket/rr_cover.png"
cover_alt: "Title card reading Who delivers when it matters, with three figures: 185,567 balls analysed, 14.5 percent pressure balls, and an 80 20 split between Pressure Impact and clutch"
author: "Pranav Arakkal"
featured: false
methodology: >-
  Built in Python on ball-by-ball data for 777 usable IPL and men's T20I matches from 2022 to 2026
  (185,567 balls). Every ball gets a win probability from an expected-runs curve, and a leverage
  score from how much each possible outcome would move that probability. A pressure ball is one
  with leverage of 1.4 or more, about one ball in seven. Each ball is scored in runs against an
  average player in the same innings, phase and leverage band, and the players' averages are
  shrunk towards the group by empirical Bayes so small samples cannot top the list. Players need
  300 balls and 75 pressure balls to be rated (96 batters and 102 bowlers qualify). Clutch
  is the standard baseball formula, win probability added scaled by average leverage minus the
  same total with each ball divided by its own leverage, using balls with leverage of 0.5 or
  more. The final score is 80 percent Pressure Impact and 20 percent clutch.
sources:
  - label: "Ball-by-ball data, IPL and men's T20Is, 2022 to 2026"
    url: "https://cricsheet.org/"
related:
  - "sooryavanshi-regression-to-mean"
  - "crix-p-context-adjusted-cricket-metric"
---
Every dressing room has one. The player who somehow gets the big runs, the big wicket, the big over when the match is on the line. Fans argue about who it is. Franchises pay for it. And almost nobody can say how they would actually measure it.

So we tried. Say you wanted to know two things: **who performs well under pressure, and who rises under pressure in terms of their own performance.** It is a subtle difference, and it turns out to matter a lot.

I built this for the Rajasthan Royals' SupeRR Selector challenge, which asks for exactly that: two top-10 lists, one for batters and one for bowlers. This is the whole thing, step by step, in plain English. If you would rather explore than read, there is also an [interactive version of the ratings](https://rr-pressure-app-zezjfmcjxy9aumvwetkzpn.streamlit.app/) where you can look up any player, switch between the IPL and T20Is, and filter by season.

## First, what counts as pressure?

You can't measure pressure by feel, so we measured it by what a ball can do to the match. For every ball in 777 IPL and T20I matches, we worked out the batting side's chance of winning, then asked a second question *before the ball was bowled*: if this ball goes for a wicket, a dot, a single, a four or a six, how far does that chance move?

Average those swings and you get what I call **leverage**. An average ball is 1.0. A ball that can swing the match three times as much is a 3.

Here is a real one. Mumbai defending 167 against Bengaluru, May 2026. Bengaluru are 151 for 7 and need 16 off 8 balls when Bumrah bowls to Romario Shepherd. Their chance of winning is about 48%. A dot ball drops it to 32%. That ball's leverage is as high as our scale goes.

<figure class="chart-figure">
  <img src="/charts/cricket/rr_over_leverage.png" alt="Line chart of average leverage by over: flat near 1 for the first innings, rising steeply towards the last overs of a chase">
  <figcaption>A quick sense-check. In the first innings there is no target, so no ball matters much more than another. In a chase, the closer the finish, the more every ball matters. A sensible pressure measure should look exactly like this.
  <span class="chart-source">Ball-by-ball data, IPL and men's T20Is, 2022 to 2026.</span></figcaption>
</figure>

We split leverage into three bands: **low (0.5 to 0.85), medium (0.85 to 1.4) and high (1.4 and above)**. A **pressure ball** is a high-leverage ball. That is about one ball in seven, and almost all of them come in the middle and end of a chase.

## Two ways to be good under pressure

This is the part that surprised me. There are two different questions hiding inside "who is clutch", and they give different answers.

**Pressure Impact** asks how good a player is *compared with an average player* when the pressure is on. We score every ball in runs (the runs scored plus how the ball changed the runs we expect the innings to produce), compare it with what an average player gets in the same situation, and average it over his pressure balls. For a batter that is **extra runs per 100 pressure balls**; for a bowler it is **runs saved**.

**Clutch** asks whether he does better under pressure *than he usually does*. It is the standard baseball clutch score, so it compares a player with himself.

Those are not the same thing. A player who is elite in every situation has nothing to rise to, so his clutch score sits near zero while his Pressure Impact is huge.

<figure class="chart-figure">
  <img src="/charts/cricket/rr_sky_klaasen_rinku.png" alt="Grouped bar chart of strike rate on ordinary versus pressure balls for Suryakumar Yadav, Heinrich Klaasen and Rinku Singh, with their Pressure Impact and clutch scores underneath">
  <figcaption>Suryakumar Yadav bats at about the same speed whether or not the pressure is on: elite everywhere, so a very high Pressure Impact but a clutch score near zero. Klaasen and Rinku Singh both step up under pressure.
  <span class="chart-source">Ball-by-ball data, 2022 to 2026.</span></figcaption>
</figure>

<div class="stat-row">
  <div class="stat-callout"><div class="stat-value">+29.9</div><div class="stat-label">Suryakumar Yadav's Pressure Impact: extra runs per 100 pressure balls</div></div>
  <div class="stat-callout"><div class="stat-value">-0.30</div><div class="stat-label">His clutch score: no gap between his best and his usual</div></div>
  <div class="stat-callout"><div class="stat-value">+1.16</div><div class="stat-label">Rinku Singh's clutch score: he lifts under pressure</div></div>
</div>

Jasprit Bumrah is the same story. He is 2nd among bowlers on Pressure Impact, and 62th of 101 on clutch (-0.21). Nobody thinks he is a poor performer in big moments. It just means he is as good in the quiet overs as he is in the loud ones.

## Putting them together

If you want the player who is genuinely best when the match is on the line, Pressure Impact is the better guide. Clutch still tells us something, so I kept it, but only as 20% of the final score because it is far noisier. The **combined score** is 80% Pressure Impact and 20% clutch, scaled so that 50 is the average rated player.

One more safeguard: luck. A player with 75 pressure balls and a hot streak looks brilliant for no reason. So every number is pulled back towards the average in proportion to how little data stands behind it. David Warner, for example, scores +37 runs per 100 on his raw pressure balls, but only has 75 of them, so his final rating settles at +24.0. Players need at least 300 balls and 75 pressure balls to be rated at all, which leaves 96 batters and 102 bowlers.

## The top 10

<figure class="chart-figure">
  <img src="/charts/cricket/rr_top10_batters.png" alt="Horizontal bar chart of the ten batters with the highest combined pressure score">
  <figcaption>Heinrich Klaasen, Tim David, Suryakumar Yadav lead the batters. The gaps between the top few are small, so treat the top three as a cluster, not a strict order.
  <span class="chart-source">Ball-by-ball data, 2022 to 2026.</span></figcaption>
</figure>

<figure class="chart-figure">
  <img src="/charts/cricket/rr_top10_bowlers.png" alt="Horizontal bar chart of the ten bowlers with the highest combined pressure score">
  <figcaption>Sunil Narine, Rashid Khan, Jasprit Bumrah lead the bowlers. Bumrah's clutch score holds him back a little, but his Pressure Impact is among the best.
  <span class="chart-source">Ball-by-ball data, 2022 to 2026.</span></figcaption>
</figure>

The chart below puts every rated player on one picture. Up means better than an average player when it matters. Right means better than his own usual level. The top-right corner is where the two ideas agree.

<figure class="chart-figure">
  <img src="/charts/cricket/rr_quadrants.png" alt="Two scatter charts of Pressure Impact against clutch score for batters and bowlers, split into four quadrants named Rise and deliver, Good, Rise but below average, and Struggle when it counts">
  <figcaption>Most of the top 10 sit in the "Good" and "Rise and deliver" quadrants. Players on the right side of the line are the ones who get better when it matters; players on the left are already as good as they will be.
  <span class="chart-source">Ball-by-ball data, 2022 to 2026.</span></figcaption>
</figure>


Want to check a name that is not in the top 10? Every rated player, with their Pressure Impact, clutch, win probability added and numbers at each pressure level, is in the [interactive app](https://rr-pressure-app-zezjfmcjxy9aumvwetkzpn.streamlit.app/).

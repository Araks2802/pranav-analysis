---
title: "Vaibhav Sooryavanshi: What to Expect in 2027?"
slug: "sooryavanshi-regression-to-mean"
description: "A 15-year-old struck at 223 across his 2026 T20s. Hot streaks rarely repeat, so where does his 2027 land? Probably nearer 177. Still elite, just a bit more human."
standfirst: "Everyone loves a hot streak, and nobody wants it to end. Here's why the wildest top-order T20 season on record probably won't repeat, and why that's no knock on the kid."
date: 2026-10-20
category: "Data Stories"
tags: ["T20", "IPL", "T20I", "Vaibhav Sooryavanshi", "regression to the mean", "forecasting", "R"]
cover: "/images/vaibhav_cover.jpg"
cover_alt: "Vaibhav Sooryavanshi in a pink and navy Rajasthan Royals kit raises his bat in one hand and his pink helmet in the other, celebrating in front of a blurred pink crowd"
author: "Pranav Arakkal"
featured: false
methodology: >-
  Built in R from Cricsheet ball-by-ball data via the cricketdata package. We
  took every batter's season in the IPL and men's T20Is from 2020 onward, as
  long as they faced at least 60 balls that year, and paired it with the same
  batter's next season (1,634 pairs from 735 batters). Two simple straight-line
  models then predict next season's strike rate and average from this season's
  strike rate, average, boundary rate, dot-ball rate, balls faced and innings.
  We kept the models simple on purpose, so it's easy to see what pushes the
  forecast up or down. Sooryavanshi's 2026 numbers go in, and his 2027
  forecast comes out. He sits right at the edge of the data, so treat it as a
  best guess with plenty of room either way, not a prediction that he'll
  struggle.
sources:
  - label: "Cricsheet ball-by-ball via the cricketdata R package (CC BY-SA 4.0)"
    url: "https://cricsheet.org/"
related:
  - "padikkal-rcb-powerplay-transformation"
  - "shai-hope-post-series-report-ind-wi"
---

Every sport has a hot streak story. The striker who can't stop scoring. The batter who hits everything, where every ball seems to find the middle of the bat. The season where it all just clicks. And every time, fans and teams do the same thing: they assume it'll carry on. This is who they are now. Book it in. It rarely works out that way. Not because the player was a fraud, but because a hot streak is part skill and part everything going right at once, and that second part doesn't usually stick around.

Which brings us to Vaibhav Sooryavanshi, the latest and most extreme example you'll find.

## The season everyone's talking about

Across his 2026 T20s, the IPL and T20Is for India together, a 15-year-old produced the most extreme top-order T20 season anyone has on record: a strike rate of **223** at an average of **42.6**, from 1,022 runs off 459 balls in 24 innings to 20 October.

Quick translation. Strike rate is runs per 100 balls, so he scored 223 runs for every 100 balls he faced. Average is runs per dismissal, so he made 42.6 runs every time he got out. Usually you pick one: score fast and get out a lot, or hang around and score slowly. He did both, at a level no top-order batter on record has.

And to be clear, this wasn't luck in the sense of being undeserved. He earned every run. But if you priced his next season off these numbers, you'd be walking straight into the hot-streak trap.

So will it repeat? Almost certainly not. The fun part is we can show why, and roughly where it lands instead, without ever saying he's going to get worse. Two things get mixed up in a season like this: how fast he scored (the rate) and how good he actually is (the skill). They're heading in opposite directions. The rate almost has to come down. The skill, for a teenager, is probably still going up. Both can be true at once.

## What history says

Rather than guess, we can look at what happened to everyone else. Take every batter's season since 2020 in the IPL and men's T20Is, and check what they did the next season. That's 1,634 pairs of seasons from 735 batters, plenty to see a real pattern. Draw a straight line through them, then read off where Sooryavanshi's 2027 should land based on his 2026.

<figure class="chart-figure">
  <img src="/charts/cricket/sooryavanshi_sr_scatter.png" alt="Scatter plot: each dot is a batter's strike rate this season versus the next; the real-trend line is much flatter than the dashed repeat line, and Sooryavanshi's 2026 value is pulled down to a 2027 forecast of 177">
  <figcaption>Each grey dot is one batter's season paired with their next. The dashed line is "this season repeats"; the blue line is what actually happens — far flatter. The red arrow shows Sooryavanshi's 2026 strike rate of 223 pulled down to a 2027 forecast near 177.
  <span class="chart-source">Cricsheet via cricketdata.</span></figcaption>
</figure>

Compare the blue line with the dashed one. Dashed is "same again next year". Blue is what really happens, and it's much flatter. That gap is regression to the mean, which is a fancy way of saying extreme seasons drift back towards normal. The hotter the season, the bigger the drop. Sooryavanshi's 223 sits way out in the empty top-right corner, right where that pull is strongest.

<div class="stat-row">
  <div class="stat-callout"><div class="stat-value">223 → 177</div><div class="stat-label">2026 strike rate to 2027 forecast — still elite, far below face value</div></div>
  <div class="stat-callout"><div class="stat-value">42.6 → 34</div><div class="stat-label">Average: 2026 to the 2027 forecast</div></div>
  <div class="stat-callout"><div class="stat-value">1,634</div><div class="stat-label">Season-to-season pairs the model learns from</div></div>
</div>

## Why a drop isn't a downgrade

Here's the thing. A strike rate of 177 would be a career-best season for almost anyone else. The model isn't saying he falls back to the league norm of around 135. It's saying he lands at about 177, which is still outstanding. The forecast is that high because it allows for a teenager who's still getting better. What fades is the purple patch, not the talent.

Two things drive the drop, and neither of them is "he's not that good":

- **Hot streaks cool off.** His boundary rate was near 38%. That's a run of form that just doesn't come round that often. Boundary rate is the jumpiest number in batting, and usually the first one to settle down.
- **Bowlers catch up.** Teams will now plan for him specifically: hard lengths, pace off the ball. That squeezes the huge returns a 15-year-old gets the first time the world sees him.

## Can we trust it?

The nice part is that the answer doesn't hang on one method. This approach lands at about 177. A completely different one, which looks at rolling windows of recent form, got to about 170. When two different methods land that close, you can take the number seriously. The trend line says the same thing the chart shows: hot seasons cool off.

The honest caveat. Sooryavanshi is right at the edge of the data, so the range of likely outcomes is wide, roughly 150–200 on strike rate. The average forecast is even shakier, because averages bounce around more from year to year than strike rates do. Treat it as a best guess, not a promise.

## The bottom line

If a market, a selector or a headline treats ~220 as his new normal, that's a misread. The sensible expectation for 2027 is a strike rate around 177 and an average near 34, with plenty of wiggle room either way. Still one of the most exciting young batters in the world. Just not, in cold numbers, quite the one his 2026 made him look.

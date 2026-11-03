---
title: "My 2024 T20 World Cup XI, Picked by the Numbers"
slug: "t20-world-cup-2024-best-xi"
description: "I built a Tableau dashboard to pick a 2024 T20 World Cup XI role by role. Eleven players from six countries, a batting average of 36.07 at a strike rate of 150.1, and an attack that bowled a dot ball half the time."
standfirst: "Everyone has a World Cup XI and everyone is sure theirs is right. Mine came out of a dashboard with rules, so at least I can show my working."
date: 2026-02-02
category: "Data Stories"
tags: ["T20", "T20I", "T20 World Cup", "team selection", "Best XI", "Tableau"]
cover: "/charts/cricket/wc2024_header.jpg"
cover_alt: "India's squad and staff, in blue and orange kits with winners' medals, celebrate around the T20 World Cup trophy in front of a stand with a Final banner"
author: "Pranav Arakkal"
featured: false
medium: "https://medium.com/@arakkal.pranav/data-driven-best-xi-2024-t20-world-cup-656b251e831e"
methodology: >-
  The XI was picked in my Tableau Public dashboard, built from the batting and
  bowling scorecards of the 2024 men's T20 World Cup. Players are sorted into
  four roles (openers, middle-order batters, all-rounders and bowlers) and
  shortlisted with role-specific rules, for example openers need a batting
  average of 35 or more. The team numbers are the dashboard's combined figures
  for all eleven players. The extra player figures in this piece (runs,
  wickets, economy and leaderboard places) were counted from T20 ball-by-ball
  data for the same tournament. Their runs, balls and
  wickets match the dashboard's own totals.
sources:
  - label: "Interactive Best XI dashboard (Tableau Public)"
    url: "https://public.tableau.com/views/T20WC_17687689843110/Final11"
  - label: "Originally published on Medium"
    url: "https://medium.com/@arakkal.pranav/data-driven-best-xi-2024-t20-world-cup-656b251e831e"
related:
  - "sooryavanshi-regression-to-mean"
  - "middle-overs-seamer-underappreciated-role"
  - "shai-hope-post-series-report-ind-wi"
---

Picking a World Cup XI is the most fun argument in cricket. Everyone has one. Nobody agrees. And most of them are built on vibes: who looked good on telly, who had the big night in the final, who you just like.

With the 2026 T20 World Cup coming up, I went back to the 2024 one and tried it a different way. No gut feel. Rules first, then picks. I built a Tableau dashboard that lets you pick your own Best XI role by role, and it tells you how the whole team adds up as you go.

So here's my XI, and here's how I got there.

<figure class="chart-figure">
  <img src="/charts/cricket/wc2024_dashboard.png" alt="Screenshot of a Tableau dashboard titled T20 World Cup 2024, on its Final 11 tab. A team performance bar shows a batting average of 36.07, batting strike rate 150.1, 4.650 balls per boundary, economy 6.61, bowling average 12.87, bowling strike rate 11.68 and dot ball rate 50.90 percent for 11 selected players. Below, a player table lists Rohit Sharma, Travis Head, Nicholas Pooran, Aaron Jones and Harry Brook with their batting averages and strike rates, next to a checklist of player names">
  <figcaption>The Final 11 tab of my dashboard. The bar at the top is the whole XI added together. The table shows the first five picks; scroll it in the live version to see the rest.
  <span class="chart-source">My Tableau Public dashboard, 2024 men's T20 World Cup.</span></figcaption>
</figure>

You can [build your own XI in the live dashboard](https://public.tableau.com/views/T20WC_17687689843110/Final11). Fair warning, it's a bit addictive.

## Rules before names

Real selectors don't start with eleven names and work backwards. They start with a shortlist. So the dashboard does the same.

Every player goes into one of four roles: openers, middle-order batters, all-rounders and bowlers. Each role has its own entry rules. Openers, for example, need a batting average of at least 35. Average is just runs per dismissal, so that's 35 runs every time they get out. The other roles get checked on the numbers that matter for their job.

That way the pool only has people who did their role well and did it more than once. One big knock doesn't get you in.

## The XI

**The openers: Rohit Sharma and Travis Head.** Easy start. Rohit averaged 36.7 at a strike rate of 156.7, which means 156.7 runs for every 100 balls. Head was even better: 42.5 at 158.4, with a boundary every 3.9 balls. Only Rahmanullah Gurbaz made more runs in the whole tournament than these two. Rohit was second with 257, Head third with 255.

**The engine room: Nicholas Pooran, Aaron Jones and Harry Brook.** Pooran keeps wicket and averaged 38.0 at 146.2. Jones is the pick that makes people look twice. He's from the USA, and he averaged 40.5 at 135.0. That's the lowest strike rate of my five specialist batters, but he cleared the opener bar of 35 with plenty to spare, and that kind of consistency is what the shortlist is built to find. Brook is the silly one. He averaged 72.5 at 157.6, because he made 145 runs and only got out twice.

**The all-rounders: Marcus Stoinis, Hardik Pandya and Axar Patel.** This is where the XI gets its balance. Stoinis hit 169 runs at a strike rate of 164.1 and took 10 wickets. Hardik made 144 runs at 151.6 and took 11 wickets. Axar chipped in 92 runs and 9 wickets with his left-arm spin. Three players, two jobs each.

**The bowlers: Jasprit Bumrah, Fazalhaq Farooqi and Rashid Khan.** Bumrah took 15 wickets at an economy of 4.18, so just over four runs an over. Of the 24 bowlers who sent down at least 20 overs, nobody else went under 5.4. Farooqi took 17 wickets, tied with Arshdeep Singh for the most in the tournament. Rashid added 14 wickets at 6.17 an over.

That's eleven players from six countries: four from India, two each from Australia and Afghanistan, and one each from West Indies, the USA and England.

## Why the team numbers matter more

Here's the bit I like most. As you tick players in, the dashboard updates the team's numbers. So the question stops being "who's the best player?" and becomes "does this lot actually work together?"

In T20, that's a big deal. Two teams full of good players can play very differently if their roles overlap, if they run short of bowling, or if they all score in the same phase of the innings. Six openers is a great list and a terrible team.

So how does my XI add up?

<div class="stat-row">
  <div class="stat-callout"><div class="stat-value">36.07 at 150.1</div><div class="stat-label">Batting average and strike rate of the whole XI</div></div>
  <div class="stat-callout"><div class="stat-value">6.61</div><div class="stat-label">Runs an over the XI's bowlers went for</div></div>
  <div class="stat-callout"><div class="stat-value">50.90%</div><div class="stat-label">Share of the XI's balls that were dot balls</div></div>
</div>

With the bat, the team averages 36.07 at a strike rate of 150.1 and finds a boundary every 4.650 balls. With the ball, it gives away 6.61 an over, takes a wicket for every 12.87 runs and every 11.68 balls, which is about one wicket every two overs. And half the balls this attack bowled were dots. In a T20 World Cup, that's a team I'd back. Quick caveat: these are tournament totals, so a player who played more games counts for more.

## Your turn

That's the whole point of the dashboard. It doesn't hand you the answer. It gives you the rules and shows you the trade-offs, then lets you make the call.

Don't fancy Aaron Jones? Swap him out and watch what happens to the numbers. Pick your XI, see the impact, and then tell me why yours is better.

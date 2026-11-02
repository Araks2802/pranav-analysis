---
title: "Devdutt Padikkal 2.0: From Slow Starter to RCB's Powerplay Weapon"
slug: "padikkal-rcb-powerplay-transformation"
description: "Back at RCB, Devdutt Padikkal's strike rate has jumped from 123 to 162 and his first five balls from 88 to 155. The data on how he became a powerplay weapon, and the one weakness left."
standfirst: "He used to play himself in. Now he scores at 155 from ball one. Padikkal's second RCB spell is a different batter by the numbers, and the powerplay is where it shows."
date: 2026-06-05
category: "Data Stories"
tags: ["IPL", "RCB", "Devdutt Padikkal", "powerplay", "player analysis", "R"]
# Cover photo: drop the file at site/static/images/devdutt_cover.jpg and
# rebuild. Until it exists, build.py falls back to cover_fallback below.
cover: "/images/devdutt_cover.jpg"
cover_alt: "Devdutt Padikkal batting for Royal Challengers Bengaluru"
cover_fallback: "/images/padikkal_medium_header.jpg"
cover_fallback_alt: "Devdutt Padikkal, in RCB kit and a gold helmet, raises his bat to the crowd"
author: "Pranav Arakkal"
featured: false
medium: "https://medium.com/@arakkal.pranav/the-quiet-revolution-how-devdutt-padikkal-became-rcbs-most-underrated-weapon-1c46cf07d68b"
methodology: >-
  Built in R (tidyverse and ggplot2) from Cricsheet ball-by-ball IPL records via
  the cricketdata package. Era 1 = IPL 2020–2024 (RCB, Rajasthan Royals, Lucknow
  Super Giants). Era 2 = IPL 2025–2026 (Royal Challengers Bengaluru).
sources:
  - label: "Cricsheet ball-by-ball via the cricketdata R package (CC BY-SA 4.0)"
    url: "https://cricsheet.org/"
  - label: "Originally published on Medium"
    url: "https://medium.com/@arakkal.pranav/the-quiet-revolution-how-devdutt-padikkal-became-rcbs-most-underrated-weapon-1c46cf07d68b"
related:
  - "sooryavanshi-regression-to-mean"
  - "shai-hope-post-series-report-ind-wi"
---

Devdutt Padikkal. He is, by the numbers, a fundamentally different and better batter than the one who spent three years bouncing between franchises. But in an RCB lineup full of big names, his transformation has gone largely unexamined.

Here's the full story of what changed — and why it matters more than the scorecard suggests.

## The backstory: why the journeyman years matter

Padikkal burst onto the IPL scene with RCB in 2020 looking like the next great Indian white-ball opener. Left-handed, technically polished, composed beyond his years. He scored 473 runs in his debut season and looked like the real thing.

Then came the drift. He was traded to Rajasthan Royals, then picked up by Lucknow Super Giants. Neither stint produced the returns his talent suggested. The numbers were decent, not dominant. Analysts started asking whether he was a batter who needed a specific role, a specific environment, a specific kind of confidence around him.

He came back to RCB in 2025. What happened next is what this data is about.

## The headline numbers

<figure class="chart-figure">
  <img src="/charts/cricket/padikkal_headline.png" alt="Career-at-a-glance dashboard comparing Era 1 (2020–24, RCB/RR/LSG: 64 innings, 1,266 balls, 1,559 runs, strike rate 123.1, dot ball 38.2%, boundary runs 59.8%) with Era 2 (2025–26, RCB: 25 innings, 439 balls, 711 runs, strike rate 162.0, dot ball 31.0%, boundary runs 72.0%)">
  <figcaption>Era 1 against Era 2, side by side. For six rate and four rate, lower is better.
  <span class="chart-source">Cricsheet IPL ball-by-ball via cricketdata.</span></figcaption>
</figure>

Across 64 innings from 2020–24 (Era 1), Padikkal scored 1,559 runs off 1,266 balls at a strike rate of **123.1**. His dot ball percentage sat at **38.2%**. Boundary runs accounted for **59.8%** of his total. He hit a six every **30.1 balls**.

In 25 innings across 2025–26 (Era 2), the numbers look like a different batter. Strike rate: **162.0**. Dot ball %: **31.0%**. Boundary run %: **72.0%**. A six every **11.6 balls**.

That six rate improvement — from one every 30 balls to one every 11.6 — is not incremental. That is a big change in how he approaches an innings.

## Powerplay impact

<figure class="chart-figure">
  <img src="/charts/cricket/padikkal_powerplay_sr.png" alt="Bar chart of strike rate by phase: powerplay 122.9 to 169.2, middle overs 121.1 to 156.5, death 139 to 160, Era 1 to Era 2">
  <figcaption>Strike rate by phase. The biggest jump is in the powerplay.
  <span class="chart-source">Cricsheet IPL ball-by-ball via cricketdata.</span></figcaption>
</figure>

<figure class="chart-figure">
  <img src="/charts/cricket/padikkal_powerplay_dots.png" alt="Bar chart of dot ball percentage by phase: powerplay 45.1% to 37.8%, middle overs 31.5% to 25.1%, death 31.7% to 40%, Era 1 to Era 2">
  <figcaption>Dot ball % by phase. Fewer dots in the powerplay and middle overs.
  <span class="chart-source">Cricsheet IPL ball-by-ball via cricketdata.</span></figcaption>
</figure>

Here is a stat worth sitting with: 65% of IPL matches are won by the team that scores more runs in the powerplay. The team that wins overs 1–6 wins the game nearly two-thirds of the time.

Which is exactly why what Padikkal has done in those first six overs matters so much more than his overall numbers suggest.

His powerplay strike rate went from 122.9 to 169.2. His dot ball percentage in overs 1–6 fell from 45.1% to 37.8%. An opener who arrives at the crease and scores at 169 in the powerplay, while consuming fewer dot balls, is not just batting well. He is systematically winning RCB the phase that decides matches.

The downstream effects of that are easy to underestimate. When Padikkal finishes the powerplay having scored at 169, Kohli and Patidar walk in against bowlers who are already behind. The game has already shifted. The pressure is already somewhere else. That is what a truly transformed batsman does — he doesn't just score his own runs, he changes the conditions in which everyone else scores theirs.

Everything in this story builds on that foundation.

## The number that tells the whole story: first 5 balls

<figure class="chart-figure">
  <img src="/charts/cricket/padikkal_first_five_balls.png" alt="Bar chart of strike rate by stage of innings: balls 1–5 rose from 88.3 to 155.5, balls 6–20 from 138.5 to 164.5, balls 20 and beyond from 126.7 to 164, Era 1 to Era 2">
  <figcaption>Is he going harder earlier? Strike rate in balls 1–5, 6–20 and 20+ of his innings.
  <span class="chart-source">Cricsheet IPL ball-by-ball via cricketdata.</span></figcaption>
</figure>

Of everything in this dataset, one number stands out above all else.

In Era 1, Padikkal's strike rate across the first 5 balls of his innings was **88.3**. He was, by definition, giving himself time. Playing himself in. Waiting to be invited into the game. In T20 cricket, a strike rate below 100 in your first five balls as an opener is a tax — you're gifting the opposition dot balls in the powerplay when the fielding restrictions are at their most generous.

In Era 2, that number is **155.5**.

That is a 67-point jump in the settling-in window. He is not swinging blindly — his dismissal patterns haven't spiked. He is simply making different decisions about which balls are scorable and converting them immediately. The "getting my eye in" phase has been abolished.

For context: his strike rate in balls 6–20 moved from 138.5 to 164.5, and in balls 20+ from 126.7 to 164. The improvement is real across the innings. But the first-five-ball transformation is the foundation of everything else.

## The off-spin problem — and why it's still the one watchable weakness

<figure class="chart-figure">
  <img src="/charts/cricket/padikkal_bowling_type_sr.png" alt="Bar chart of strike rate by bowler type, Era 1 to Era 2: off spin 97.1 to 120, left-arm spin 140.8 to 131.9, leg spin 122.3 to 150.7, right-arm pace 119.6 to 174.4, left-arm pace 136.9 to 180.4">
  <figcaption>Strike rate by bowler type. Off spin is still his lowest in both eras.
  <span class="chart-source">Cricsheet IPL ball-by-ball via cricketdata.</span></figcaption>
</figure>

<figure class="chart-figure">
  <img src="/charts/cricket/padikkal_bowling_type_sixes.png" alt="Bar chart of balls per six by bowler type, Era 1 to Era 2: left-arm pace 19.5 to 7.3, left-arm spin 17.1 to 18, leg spin 41.2 to 11.5, off spin 52.5 to no sixes, right-arm pace 36.5 to 10.8">
  <figcaption>Balls per six by bowler type (lower is better). No sixes off off-spin in Era 2.
  <span class="chart-source">Cricsheet IPL ball-by-ball via cricketdata.</span></figcaption>
</figure>

Against most bowling types, Padikkal has improved his strike rate. But against pace bowling, he has become genuinely destructive. Against left-arm pace: from 136.9 to **180.4**. Against right-arm pace: from 119.6 to **174.4**.

But for off spin, the number tells a different story: from 97.1 to **120**. Better — yes, meaningfully so. But still his lowest strike rate against any bowling type in both eras. And the six rate against off spin in Era 2? Zero. He has not hit a single six off an off-break bowler in 2025–26.

For a left-hander, this is the classic matchup problem. Right-arm off-spinners bowling into the rough outside off stump, targeting the stumps with straight ones, varying their pace through the crease — it's a well-worn plan against left-handers and it still, at least partially, works against Padikkal.

The left-arm spin data is interesting: his SR actually dropped slightly from 140.8 to 131.9 between eras, though the sample is smaller. This might suggest that as he's become more aggressive overall, specific bowler types who angle into his body are finding ways to challenge him differently.

## The boundary rate

<figure class="chart-figure">
  <img src="/charts/cricket/padikkal_boundary_rate.png" alt="Bar chart of balls per boundary by bowler type, Era 1 to Era 2: left-arm pace 4.9 to 3.4, left-arm spin 6 to 5.5, leg spin 8.2 to 5.8, off spin 9.5 to 6.7, right-arm pace 5.5 to 3.4">
  <figcaption>Balls per boundary by bowler type (lower is better).
  <span class="chart-source">Cricsheet IPL ball-by-ball via cricketdata.</span></figcaption>
</figure>

The six rate tells one story. The boundary rate — fours and sixes combined — tells an even more complete one.

Against left-arm pace, Padikkal is now hitting a boundary every 3.4 balls. In Era 1 that number was 4.9. Against right-arm pace: 5.5 down to 3.4. Think about what that means for a captain trying to bowl at him with pace: roughly once every three deliveries, the boundary is being found.

Against leg spin the improvement is dramatic: a boundary every 8.2 balls in Era 1, down to every 5.8 in Era 2. He has clearly worked on his sweep and slog-sweep options against wrist spin and it shows.

Although some improvement is seen, he still averages 7 balls per boundary against off spin. A matchup opposition captains could look at.

## The credit he doesn't get

In a team with Virat Kohli, Rajat Patidar, Tim David and other stars the run-scoring tends to be attributed upward. Kohli makes 70, the headline writes itself. Padikkal makes 45 off 28, it's often described as "support."

But here's what 45 off 28 from a batsman like Padikkal does: it means the first six overs end with RCB at 70 rather than 52. It means the bowlers have already been put on the back foot. It means Kohli and Patidar enter a game they can dictate, rather than one that needs rescuing.

Padikkal in Era 2 is not a support act. He is, by strike rate and intent, the batter who sets the tone.

## The verdict

The numbers are unambiguous. A 39-point SR jump. Dot ball rate down 7 points. Six rate cut by nearly two-thirds. Strike rate against pace approaching 175+. An innings approach that starts at 155 SR from ball one.

Devdutt Padikkal in 2025–26 is not the same player who left RCB. He came back having figured something out — about himself, about T20 cricket, about what it means to be at the top and utilise the powerplay.

The names above him in the order will get the tributes. But quietly, methodically, and with data to back it up, Padikkal has become one of the most transformed batters in this IPL era.

The quiet revolution is complete.

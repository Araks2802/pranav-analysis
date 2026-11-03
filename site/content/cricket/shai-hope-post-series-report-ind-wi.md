---
title: "Hope to Win"
slug: "shai-hope-post-series-report-ind-wi"
description: "Shai Hope took 261 runs off 137 balls from India, with two unbeaten hundreds. How a steady opener turned into a hitter, why India's spinners got hit so hard, and the one plan that actually worked."
standfirst: "Two unbeaten hundreds, 261 runs off 137 balls, and a batter who normally plays it steady suddenly hitting like a finisher. Here's how Shai Hope's series in India happened, in plain numbers."
date: 2026-10-28
category: "Data Stories"
tags: ["T20I", "India", "West Indies", "Shai Hope", "post-series report", "player analysis"]
cover: "/images/hope_cover_newsmill.jpg"
cover_alt: "Shai Hope plays a shot on the off side against India, with the wicketkeeper crouched behind the stumps. Photo: News Mill"
author: "Pranav Arakkal"
featured: false
# MEDIUM URL PLACEHOLDER: after publishing on Medium, paste the URL here,
# e.g. medium: "https://medium.com/@arakkal.pranav/...". This adds the
# "Read this on Medium" link in the article footer.
medium: ""
methodology: >-
  Built in Python from ball-by-ball T20 data carrying bowler type, length, line
  and wagon-wheel zone. Series sample: 4 innings, 137 legal balls (T20I 5 in
  Bengaluru was a no result and Hope did not bat). "Usual" record: all his T20s
  from 1 Jan 2024 to 18 Sep 2026 with the series matches removed (136 innings,
  2,999 balls). Every match Hope batted in was checked for completeness. Samples
  under 10 balls are flagged as small.
sources:
  - label: "Ball-by-ball T20 data (line, length, bowler type and wagon zones) by Himanish Ganjoo"
  - label: "Cover photo: News Mill"
related:
  - "sooryavanshi-regression-to-mean"
  - "padikkal-rcb-powerplay-transformation"
---

*Cover photo: News Mill.*

<div class="stat-row">
  <div class="stat-callout"><div class="stat-value">261 (137)</div><div class="stat-label">Runs off balls in 4 innings, two of them unbeaten hundreds</div></div>
  <div class="stat-callout"><div class="stat-value">190.5</div><div class="stat-label">Series strike rate, against 130.1 in his usual T20 record since 2024</div></div>
  <div class="stat-callout"><div class="stat-value">2</div><div class="stat-label">Dismissals, both off good-length balls outside off</div></div>
</div>

Some series belong to one player. This one belonged to Shai Hope. He batted four times against India and made 261 runs off 137 balls. Two of those innings were unbeaten hundreds. India got him out just twice.

## The short version

Quick translation of the headline numbers. Strike rate is runs per 100 balls, and his was 190.5. Average is runs per dismissal. He made 261 runs and got out only twice, so that's 130.5 runs for every wicket India took. That's a silly number.

The results follow him around. West Indies won both games where he got a hundred. India won the two games where they got him out. The series finished 2–2, and the Bengaluru game was a no result.

And this wasn't normal Hope. Since January 2024, leaving this series out, he strikes at 130.1 over 2,999 balls. Against India he scored about 60 more runs per 100 balls. Same guy, very different batter.

Now, the fair point before anyone makes it. India is a batting paradise right now. Since 2024, teams batting first in T20Is in India have averaged about 190. Everywhere else it's about 164. More than one in three first innings in India go past 200. Elsewhere it's about one in six. And this series was flat even by Indian standards. The first innings averaged 222.5, and three of the four went past 200.

So yes, big totals were normal here, and everyone's numbers look a bit shiny. But a flat pitch helps everyone a little. It doesn't explain one batter scoring 60 more runs per 100 balls than he usually does. And it definitely doesn't explain spin, the thing that usually slows him down, becoming the bowling he scored fastest off.

Four things stand out:

- **India's spinners kept pitching it up.** Half the spin balls he faced were full, and he scored at 281.5 off them.
- **Good length outside off was the one thing that worked.** Both his dismissals came from it, and he scored at only 126 off good-length balls across the series.
- **Arshdeep Singh had his number.** Hope made 28 off Arshdeep's 26 balls (strike rate 107.7), and Arshdeep bowled him once.
- **He hit it straight.** Only 8.8% of his runs came square of the wicket or behind it.

One honest caveat. 137 balls is a small sample. Some of this is fairly solid and some is more of a hint, so I'll give the ball count as I go.

<figure class="chart-figure">
  <img src="/charts/cricket/hope_series_dashboard.png" alt="Shai Hope series dashboard: headline numbers, usual-record comparison, wagon wheels, strike rate by length, India bowlers, phase and bowling-style splits, and innings by innings">
  <figcaption>The full series dashboard. The top row compares the series (137 balls) with his usual T20 record since 2024, with the series matches removed (2,999 balls).
  <span class="chart-source">Ball-by-ball data · West Indies in India T20I Series, 6–17 Oct 2026.</span></figcaption>
</figure>

## How the series went

Here's each game, in order:

- **T20I 1, Lucknow (6 Oct). India won.** West Indies batted first and were all out for 171 in 19.1 overs. Hope made a tidy 52 off 37 balls (6 fours, 2 sixes) before Naman Dhir had him caught in the 12th over. India knocked off 172 for two wickets in 14.4 overs.
- **T20I 2, Ranchi (9 Oct). West Indies won.** India made 249/5 and still lost. Hope smashed 102* off 45 balls (6 fours, 9 sixes) and West Indies got to 252/4 in 18.3 overs. That's the second-highest successful chase in men's T20I history, behind only South Africa's 259 against West Indies in 2023. It's also the biggest T20I chase ever in India, and West Indies' biggest ever.
- **T20I 3, Indore (11 Oct). India won.** India made 223 all out. Arshdeep bowled Hope for 5 off 5 balls in the 2nd over, and West Indies fell short on 209/7.
- **T20I 4, Hyderabad (14 Oct). West Indies won.** Hope did it again: 102* off 50 balls (4 fours, 9 sixes) in a total of 247/3. India were held to 223/9 and lost by 24 runs.
- **T20I 5, Bengaluru (17 Oct). No result.** India were 118/5 after 7.4 overs when play stopped. West Indies never batted, so Hope never got a go.

See the pattern? When Hope got going, West Indies won. When India got him out, India won. One batter doesn't decide every game. But this series came pretty close.

## From anchor to hitter

Normally Hope is the steady type. He holds the top of the innings together and lets others take the big risks. Against India he flipped that and played like a hitter. A few numbers show the change:

- **Strike rate:** 190.5 in the series, against 130.1 usually.
- **Boundary rate** (how often a ball goes for four or six): 27.0%, against 15.5%.
- **Dot-ball rate** (how often he scored nothing off a ball): 28.5%, against 35.6%.
- **Balls per dismissal** (how long he lasted before getting out): 68.5, against 27.0.

He hit 20 sixes and 17 fours. That's 188 of his 261 runs, about 72%, from boundaries alone. India never really tied him down and forced a mistake. He just kept scoring and hardly ever got out.

**Phase by phase.** A T20 innings splits into three parts: the powerplay (overs 1–6), the middle (7–15) and the death (16–20). His strike rate went up in all three.

- **Powerplay:** 157 off 56 balls, against 131 usually (1,248 balls). His dot-ball rate here was 44.6%, almost the same as his usual 43.7%. So India did squeeze him early.
- **Middle overs:** 192 off 60 balls, against 127 usually (1,511 balls). This is where it got away from India. His dot-ball rate fell to 20.0%, against 29.5% usually.
- **Death:** 276 off 21 balls, against 148 usually (240 balls). The biggest jump of the lot. But it's only 21 balls, so don't lean on it too hard.

<figure class="chart-figure">
  <img src="/charts/cricket/hope_series_phase_styles.png" alt="Strike rate by phase, series versus usual, and a table of Hope's numbers against each bowling style in the series">
  <figcaption>Strike rate by phase (left) and by bowling style (right). Ball counts are in brackets. The death-overs bar is based on only 21 balls. † marks samples under 10 balls.
  <span class="chart-source">Ball-by-ball data · West Indies in India T20I Series, 6–17 Oct 2026.</span></figcaption>
</figure>

**Pace versus spin.** This is where it gets interesting. Hope struck at 218.2 against India's spinners (55 balls). His usual rate against spin is 125.1 (1,413 balls). Against the seamers he struck at 172.0 (82 balls), against 134.3 usually (1,570 balls). So he was quicker than usual against both. But against spin he was more than 90 runs per 100 balls quicker.

That's backwards for him. Spin is normally how you slow Hope down, and slow left-arm is one of the styles that usually keeps him quiet. So what went wrong?

## Where India's spinners went wrong

**Too full, too often.** 27 of the 55 spin balls Hope faced were full (49%). He scored 76 off those 27 balls. That's a strike rate of 281.5. When the spinners hit a good length, it was 22 balls for 25 runs (strike rate 113.6). That's actually below his usual rate against spin. Only six spin balls were shorter than a good length, and they went for 19. Too few balls to say much, though they weren't cheap.

So the problem wasn't spin. It was spin pitched up. A full ball let him get to the pitch and hit it back down the ground. With nobody out deep straight, that's exactly where most of his runs went. More on that below.

**Axar Patel.** This one hurt. Hope scored 59 off Axar's 28 balls (strike rate 210.7), with 6 sixes, and Axar never got him out. Nothing in his record said that would happen. Usually Hope strikes at 111.3 against slow left-arm orthodox (566 balls), one of his slowest rates against any style. Against Axar himself, before this series, it was 115.4, but that's from just 13 balls. On paper Axar was India's best match-up. In real life he was the bowler Hope scored most off.

**The other spinners.** Kuldeep Yadav went for 35 off 15 balls (strike rate 233.3, 3 sixes). Naman Dhir went for 26 off 12 balls (216.7), but he did get the wicket in the first game. These are small samples. They fit the bigger picture, but none of them proves much on its own.

<figure class="chart-figure">
  <img src="/charts/cricket/hope_series_length_bowlers.png" alt="Hope's strike rate by delivery length, dismissals by length, and every India bowler's balls, runs and strike rate against him">
  <figcaption>Left: strike rate by length (balls in brackets). Middle: both dismissals came off good-length balls. Right: each India bowler's figures against Hope. † marks fewer than 10 balls.
  <span class="chart-source">Ball-by-ball data · West Indies in India T20I Series, 6–17 Oct 2026.</span></figcaption>
</figure>

## What actually worked

**Good length outside off.** Both of Hope's dismissals came from the same ball: good length, outside off stump. In Lucknow, Naman Dhir (off-spin) had him caught at 11.4 overs. In Indore, Arshdeep bowled him at 1.5 overs. Across the series Hope scored at 126 off 43 good-length balls, against 251 off 49 full balls. Out of the six length types, only the yorker was cheaper than good length, and he faced just 3 of those.

The line barely mattered. He struck at 189.0 off balls outside off (73 balls) and 187.1 off balls at the stumps (62 balls). Basically the same. It was all about length.

**Arshdeep Singh.** Arshdeep was the one bowler Hope never got on top of. Hope made 28 off his 26 balls (strike rate 107.7), with 10 dots, 4 fours and no sixes. And Arshdeep bowled him for 5 in Indore. That's no fluke either. Hope's usual strike rate against left-arm medium-fast is 111.3 (106 balls). So Arshdeep was poking at an old weak spot, not getting lucky.

**Mayank Yadav** was the next cheapest: 45 runs off 28 balls (strike rate 160.7) with 11 dots, the most of any India bowler. Still well above Hope's usual rate. But he held him back better than most.

## He just hit it straight

A wagon wheel shows where each scoring shot went. Hope's tells a pretty clear story. Only 23 of his 261 runs (8.8%) came square of the wicket or behind it, in the fine leg, square leg, point and third man areas. Usually that share is 24.1%. Long-on and long-off together gave him 43.3% of his series runs, against 29.1% usually.

In other words, he didn't bother with the angles. He waited for the full one and hit it back past the bowler. Normally about a quarter of his runs come square or fine. Against India he barely went there.

<figure class="chart-figure">
  <img src="/charts/cricket/hope_series_wagon_wheels.png" alt="Three wagon wheels: Hope in the series, his usual record against pace and his usual record against spin, with runs per zone marked">
  <figcaption>Where his runs went. Left: this series (137 balls). Centre and right: his usual record against pace (1,570 balls) and spin (1,413 balls). The numbers are runs per zone. Viewed from behind the batter, so for a right-hander like Hope the leg side is on the left and the off side on the right.
  <span class="chart-source">Ball-by-ball data · West Indies in India T20I Series, 6–17 Oct 2026.</span></figcaption>
</figure>

## Final word

Credit where it's due. This was an outstanding series. Two unbeaten hundreds in four innings, one of them chasing down 250, in India. Very few visiting batters ever manage that. Flat pitches helped, sure. They don't explain this. He scored 60 runs per 100 balls more than he usually does. And he did it against spin, the thing India usually lean on at home.

For India, Shai Hope now goes to the top of the list of batters to plan for. And it'd be a surprise if the IPL franchises weren't watching too. A wicketkeeper who can open, anchor a 250 chase and still strike at 190 against quality spin in India is exactly the kind of player auction tables are built around. Whoever picks him up next is getting a batter in the form of his life. Whoever bowls to him next has some homework to do.

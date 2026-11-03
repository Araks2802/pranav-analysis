---
title: "The Bargain in the Middle Overs"
slug: "middle-overs-seamer-underappreciated-role"
description: "Seamers now bowl 60% of the balls in the IPL's overs 12 to 16 and 46% in overs 7 to 11. The middle-overs seamer takes wickets almost as often as a death specialist, yet his median IPL price is ₹1.75 crore."
standfirst: "The powerplay gets the start. The death overs get the headlines. The middle overs decide a lot of games, and the seamer bowling them is one of the cheapest buys at the IPL auction."
date: 2026-10-30
category: "Data Stories"
tags: ["T20", "IPL", "IPL auction", "middle overs", "pace bowling", "player roles", "R"]
cover: "/charts/cricket/role_cover_pace.png"
cover_alt: "Line chart of the share of IPL deliveries bowled by seamers from 2018 to 2026. The overs 12 to 16 line ends at 60% and the overs 7 to 11 line climbs to 46%, both their highest points"
author: "Pranav Arakkal"
featured: false
medium: ""
methodology: >-
  Built in R from Cricsheet ball-by-ball data via the cricketdata package, IPL
  only. Pace or spin comes from the bowling styles in cricketdata's player
  list, which covers about 99% of middle-overs balls. Roles use IPL games from
  2024 onward and bowlers with at least 120 balls: 40% or more of their balls
  in the powerplay makes a powerplay bowler, 40% or more at the death makes a
  death bowler, and everyone else is a middle-overs seamer or spinner. A
  handful of bowlers with no pace or spin tag are left out. Prices are each
  player's average IPL price across 2024 to 2026, counting players bought at
  auction or retained by their team, so some are retention fees rather than
  auction bids. Auction names were matched to ball-by-ball
  names on first initial and surname, so a few matches could be wrong.
sources:
  - label: "Cricsheet ball-by-ball via the cricketdata R package (CC BY-SA 4.0)"
    url: "https://cricsheet.org/"
  - label: "IPL auction and retention prices, 2024 to 2026 (Cricbuzz)"
  - label: "Pace share trend first reported by Sai Krishna for Cricbuzz (2023 to 2024)"
related:
  - "sooryavanshi-regression-to-mean"
  - "shai-hope-post-series-report-ind-wi"
---

Ask anyone to name the big jobs in a T20 side and you'll get the same list. The opener who blasts the powerplay. The finisher who hits the last three overs out of the ground. The death bowler with the yorker. Nobody says "the guy who bowls overs 9, 12 and 14". But that's the job I think T20 teams undervalue most: the middle-overs seamer.

The powerplay gets the start. The death overs get the headlines. The middle overs decide whether a good start turns into a match-winning total, or whether the bowling side drags the game back. And more and more, the bowler doing that dragging is a seamer, not a spinner.

<div class="stat-row">
  <div class="stat-callout"><div class="stat-value">48% → 60%</div><div class="stat-label">Pace share of IPL overs 12–16, 2023 to 2026</div></div>
  <div class="stat-callout"><div class="stat-value">27% → 46%</div><div class="stat-label">Pace share of overs 7–11, same years</div></div>
  <div class="stat-callout"><div class="stat-value">₹1.75 cr</div><div class="stat-label">Median IPL price of a middle-overs seamer, 2024–26</div></div>
</div>

## Spin's turf, slowly going to pace

The middle overs used to belong to spin. Field goes back, spinners come on, batters milk singles and wait for the death. That's the T20 script most of us grew up with.

The IPL has been ripping it up. Cricbuzz's Sai Krishna spotted the shift between 2023 and 2024. I reproduced his numbers from the ball-by-ball data and then carried them on through 2026 to see if it stuck.

<figure class="chart-figure">
  <img src="/charts/cricket/role_pace_share.png" alt="Line chart of the share of IPL deliveries bowled by pace, 2018 to 2026. Overs 12 to 16 rise from 48% in 2023 to 60% in 2026. Overs 7 to 11 rise from 27% in 2023 to 46% in 2026">
  <figcaption>Share of IPL deliveries bowled by seamers in each half of the middle overs. Both lines finish at their highest point in 2026.
  <span class="chart-source">Cricsheet via cricketdata.</span></figcaption>
</figure>

It stuck. In overs 12 to 16, seamers bowled 48% of the balls in 2023 and 60% in 2026. The bigger jump is earlier, in overs 7 to 11, spin's real home. Pace went from 27% there to 46%. So in 2026, close to half the balls in that stretch came from a seamer.

It isn't a smooth climb. Overs 12 to 16 were already near 60% in 2024 and dipped to about 51% in 2025 before coming back. But 2026 is the highest for both halves since at least 2018, which is where my chart starts.

Why would teams do this? My read: batters have got very good at lining up spin. Sweeps, reverse sweeps, walking down the track. A seamer banging it into the pitch at pace takes a lot of those options away. I can't prove the "banging it in" part, though. My data has no ball-length tracking, so that bit is a guess. The shift in who bowls is measured. The why is my best explanation.

## Pace costs runs and buys wickets

To be fair to spinners, they're still the tidier option. In the 2026 middle overs (overs 7 to 15 here), seamers went for 8.96 runs an over and spinners for 8.64. Seamers took a wicket every 21.6 balls, spinners every 23.4.

So pace leaks a few more runs and takes wickets a little more often. In a phase where batters are trying to sit in and set up the death, a wicket is worth a lot. Knock one over and the new batter has to start against a seamer, not a spinner.

## Now the fun bit: the auction

Here's where it gets interesting. I sorted every IPL bowler with 120+ balls since 2024 into a role, then matched them to what they cost from 2024 to 2026. That's the auction price, or the retention fee for players their team kept.

<figure class="chart-figure">
  <img src="/charts/cricket/role_price_by_role.png" alt="Bar chart of median IPL price (auction or retention) by bowling role for 2024 to 2026: middle-overs spinner ₹4.90 crore, powerplay bowler ₹4.51 crore, death bowler ₹4.40 crore and middle-overs seamer ₹1.75 crore">
  <figcaption>Median IPL price by bowling role, 2024–26, counting auction buys and retentions. The middle-overs seamer is far cheaper than every other role.
  <span class="chart-source">Cricsheet via cricketdata, matched to IPL auction and retention prices.</span></figcaption>
</figure>

The typical middle-overs seamer cost **₹1.75 crore**. The typical death bowler cost ₹4.40 crore, the powerplay bowler ₹4.51 crore and the middle-overs spinner ₹4.90 crore. That's the cheapest of the four main bowling roles by a distance. Sixteen of the 30 middle-overs seamers I could price cost ₹2 crore or less. Eight of those 16 were uncapped.

Quick word on "median", because it matters here. The median is the price of the bowler in the middle of the list. The average for middle-overs seamers is higher, about ₹4.2 crore, because a couple of all-rounders sit in this group. Cameron Green averaged ₹25.20 crore in my price data and Hardik Pandya ₹16.35 crore. Both are all-rounders, bought for a lot more than their middle-overs bowling. Drop them and you see what a normal middle-overs seamer actually costs, which is where the median comes in.

Now put price next to wickets.

<figure class="chart-figure">
  <img src="/charts/cricket/role_wickets_price.png" alt="Dot chart of bowling roles by median IPL price (auction or retention) and balls per wicket. Middle-overs seamer: a wicket every 18.9 balls at ₹1.75 crore. Death bowler: 18.1 balls at ₹4.40 crore. Powerplay bowler: 20.6 balls at ₹4.51 crore. Middle-overs spinner: 21.8 balls at ₹4.90 crore">
  <figcaption>Higher up means more wickets, further left means cheaper. The middle-overs seamer sits on his own in the cheap, wicket-taking corner.
  <span class="chart-source">IPL 2024–26, bowlers with 120+ balls. Cricsheet via cricketdata, matched to IPL auction and retention prices.</span></figcaption>
</figure>

Across all their IPL overs since 2024, middle-overs seamers took a wicket every 18.9 balls. Death bowlers took one every 18.1, powerplay bowlers every 20.6 and middle-overs spinners every 21.8. So they strike almost as often as the death specialists, for well under half the price. They do go for more runs, about 9.6 an over on average. That's the catch, and it's part of why they come cheap. But wickets at that rate for that money is a deal.

A few names make the point (average IPL price, then IPL wickets since 2024):

- **Eshan Malinga:** ₹1.20 crore, 33 wickets.
- **Prince Yadav:** ₹0.30 crore, 19 wickets.
- **Sakib Hussain:** ₹0.25 crore, 15 wickets.

## Why the auction misses it

Auctions are bidding wars, and bidding wars chase what everyone can see. Openers who win the powerplay, finishers who win the last over, death bowlers with famous yorkers. Those are the clips that go round on match night. Two tidy overs and a wicket in the 11th don't trend.

There's also plenty of supply. India has lots of domestic seamers who can bowl a hard length. When there are loads of something, nobody has to overpay, even if the job is getting more important.

That's my reading, not a proven fact. The numbers show the price gap. They don't show why teams bid the way they do. To make it a firm claim I'd want three more things. A split of bought versus retained players, since some of these prices are retention fees, and teams set those differently from open bidding. A proper value-per-crore model built on runs saved and wickets taken. And ball-length data, to show the hit-the-deck plan is really what's working. Also, with only five death specialists in the sample, that group is small, so I'd treat its numbers loosely.

## The bottom line

Pace has taken over the middle overs, and the role keeps getting bigger. The market hasn't caught up. If I were running an IPL auction table, this is where I'd go shopping. Let everyone else fight over the big names, and pick up two or three seamers who can bowl a hard length in the middle overs at a fraction of the price.

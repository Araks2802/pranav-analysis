---
title: "Cricket Trader — Modelling Value, Roles and Death Bowling in T20"
slug: "cricket-trader"
accent: "lime"
date: 2026-10-26
research_question: "Where is the T20 transfer and selection market inefficient — in which roles, which skills, and which players — and can it be shown with data rather than opinion?"
competition: "IPL and men's T20 internationals"
date_range: "2020–2026 (role/price analysis 2023+)"
dataset: "Cricsheet ball-by-ball via the cricketdata package, joined to IPL auction prices and player-meta bowling styles"
source: "Cricsheet (CC BY-SA 4.0); IPL auction prices; cricketdata player_meta"
tools: ["R", "cricketdata", "dplyr", "tidyr", "ggplot2", "OLS regression", "Bayesian shrinkage"]
repo: ""
app: ""
cover: "/charts/cricket-trader/q3_sr_scatter.png"
cover_alt: "Regression-to-the-mean scatter from the Cricket Trader project"
summary: "A multi-part T20 analytics case study: forecasting a hyped teenager, finding mispriced roles, and scoring death bowlers — each question worked end to end in R."
status: "Completed case study"
---

## What this is

Cricket Trader is a worked set of T20 analytics problems — the kind a recruitment or trading desk actually faces — each taken from question to defensible answer in R. Everything below is built on Cricsheet ball-by-ball data via the `cricketdata` package, joined where needed to auction prices and player-meta bowling styles. The emphasis throughout is on methods that are transparent and conclusions that are honest about their limits. Three of the questions stand out.

## 1. The season that won't repeat: forecasting Vaibhav Sooryavanshi

A 14-year-old struck at **223** at an average of **42.6** in IPL 2026 — the most extreme top-order T20 season on record. The task: forecast his next season and explain it. The approach learns from history rather than guessing — every batter's season since 2020 is paired with their *own next season* (1,634 pairs over 735 batters), and a plain, interpretable OLS line reads Sooryavanshi's 2027 off his 2026.

<figure class="chart-figure">
  <img src="/charts/cricket-trader/q3_sr_scatter.png" alt="Scatter of strike rate this season vs next, with Sooryavanshi's 223 pulled down to a 177 forecast">
  <figcaption>The real season-to-season trend (blue) is far flatter than "this repeats" (dashed). Sooryavanshi's 223 is pulled to a 2027 forecast near 177.
  <span class="chart-source">Cricsheet via cricketdata.</span></figcaption>
</figure>

**Finding:** his strike rate regresses from ~223 to a forecast **~177**, and his average from 42.6 to ~34 — still elite, far below face value. Two independent methods agree (~177 and ~170), so the number is robust. This is regression to the mean, not a bet against the player: the forecast stays well above the league norm precisely because a teenager's true level is still rising. Read the full story: [The Teenager and the Trap](/cricket/sooryavanshi-regression-to-mean/).

## 2. The mispriced role: the middle-overs seamer

Are any T20 roles outdated or underappreciated? Using IPL data from 2023, joined to auction prices, the project classifies players by position and phase and compares what each role *does* with what it *costs*.

<figure class="chart-figure">
  <img src="/charts/cricket-trader/q4c_pace_trend.png" alt="Trend chart showing pace's rising share of the IPL middle overs">
  <figcaption>Pace has quietly taken over the middle overs — teams now bowl hard-length seam in overs 7-15 to attack spin-hitters.
  <span class="chart-source">Cricsheet via cricketdata.</span></figcaption>
</figure>

**Finding:** the **middle-overs seamer** is the clearest market inefficiency. Pace's share of the middle overs is at a record high, yet the role is available cheaply (elite options at a fraction of marquee prices doing the same job). A secondary finding: the cheap, explosive **pinch-hitting opener** is underpriced too — the market still pays for batting average over strike rate. Notably, one honest move was *dropping* an initial hypothesis: powerplay bowlers turned out **not** to be underpriced on 2023+ data, so the claim was cut. The data was allowed to overrule the hunch.

<figure class="chart-figure">
  <img src="/charts/cricket-trader/q4_price_by_role.png" alt="Bar chart of median auction price by role">
  <figcaption>Price by role: the containment and strike-rate roles the modern game rewards are the ones the market underpays.
  <span class="chart-source">Cricsheet + IPL auction prices.</span></figcaption>
</figure>

## 3. Picking a death bowler: the DBSS

The final question is a specialist hire: rank six candidates for a death-overs (16–20) bowling role. The project builds a **Death-Bowling Suitability Score** from five directly-measured death-overs factors — economy, wicket rate, boundary-conceded rate, dot rate and (lightly weighted) batting — each **Bayesian-shrunk** toward the group mean by sample size, so a small sample can't fluke its way up the list.

<figure class="chart-figure">
  <img src="/charts/cricket-trader/q7_dbss_rank.png" alt="Ranked bar chart of the six candidates' Death-Bowling Suitability Scores">
  <figcaption>The DBSS ranking. Lungi Ngidi is the clear pick on the largest, most trustworthy sample; the shrinkage keeps thin samples honest.
  <span class="chart-source">Cricsheet + multi-league T20 data via cricketdata.</span></figcaption>
</figure>

**Finding:** **Lungi Ngidi** is the pick — the only candidate with elite, proven death numbers (best economy and boundary control over by far the largest sample). Gerald Coetzee is the safe second; Dan Worrall ranks on promise not proof (a spectacular wicket rate from just 36 death balls). The method deliberately refuses to measure what the data can't support: with no ball-tracking, yorker execution isn't scored, and a weak match-pressure proxy was dropped rather than dressed up.

## Why it's built this way

Three principles run through all of it: use interpretable models so every coefficient can be explained; shrink small samples so they can't mislead; and state plainly what the data cannot measure (delivery length, pressure, tracking). The result is a set of answers you can argue *with* — because the working is all on show.

## Limitations

- Role/price analysis uses IPL from 2023 and auction prices as a proxy for market value.
- The "hit-the-deck" mechanism behind the middle-overs seam finding is **inferred** from pace share, not measured — there's no delivery-length data.
- Forecasts are projections with real uncertainty, widest for players (like Sooryavanshi) at the edge of the data.

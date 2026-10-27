---
title: "Rodri and Rice at Euro 2024: Two Jobs, One Position"
slug: "rodri-rice-euro-2024-progressions"
description: "A StatsBomb open-data look at how Rodri and Declan Rice moved the ball into the final third on the way to the Euro 2024 final — and why their numbers look so different."
standfirst: "Both anchored a team that reached the final. Both are called holding midfielders. The ball-progression data shows they were doing quite different jobs."
date: 2025-12-17
category: "Player Analysis"
tags: ["Euro 2024", "Rodri", "Declan Rice", "StatsBomb", "progression", "midfield"]
cover: "/charts/football/rice_vs_rodri.png"
cover_alt: "Side-by-side comparison of Rodri and Declan Rice ball progressions into the final third at Euro 2024"
author: "Pranav Arakkal"
featured: true
reading_time: 5
methodology: >-
  Built from StatsBomb's free/open event data for Euro 2024 (competition 55,
  season 282) via statsbombpy, in Python with mplsoccer. A "progression into the
  final third" is defined here as a pass or carry that starts in a player's own
  two-thirds (StatsBomb x below 80 on a 120-long pitch) and ends in the final
  third (x above 80); passes are counted only when completed. This is a
  descriptive map of where each player moved the ball, not a possession-value or
  expected-threat model — no xT or xG figures are claimed. The two players also
  featured in different numbers of matches and minutes, so raw counts describe
  volume, not per-90 rate. Charts are reproduced from the original notebook.
sources:
  - label: "StatsBomb Open Data (free tier), Euro 2024. Used under StatsBomb's open-data terms."
    url: "https://github.com/statsbomb/open-data"
  - label: "Analysis notebook and exported figures (this portfolio's football project)."
    url: ""
related: []
---

Rodri and Declan Rice both reached the Euro 2024 final, both wearing the number that usually means *sit in front of the back four and hold it all together*. The position label is the same. Watch the two of them and the job clearly isn't — and the open-data event record backs up the eye.

This piece uses StatsBomb's free event data to ask one narrow, answerable question: **when each player moved the ball from deeper areas into the final third, how did they do it, and how often?** Not who is better. Not who is more valuable. Just where the ball went when it left their feet.

## Defining the metric

A "progression into the final third" here is any pass or carry that begins in a player's own two-thirds of the pitch and ends in the attacking third. On StatsBomb's 120-unit pitch, that's an event starting below x = 80 and ending above it. Passes are only counted if they were completed. It's a deliberately simple, transparent definition — you can argue for a stricter line, but this one is easy to reproduce and hard to fudge.

<figure class="chart-figure">
  <img src="/charts/football/rice_vs_rodri.png" alt="Comparison graphic of Rodri's and Rice's progressions into the final third at Euro 2024">
  <figcaption>Rodri and Rice, side by side: completed passes and carries that entered the final third across their Euro 2024 campaigns.
  <span class="chart-source">StatsBomb open data, Euro 2024 · built with mplsoccer.</span></figcaption>
</figure>

## Two different shapes

The individual maps are where the contrast shows. Rodri's progressions fan out as passes — short, angled balls threaded from the base of midfield, the ball leaving his feet and travelling into the third while he stays deep. Rice's map carries a heavier share of, well, carries: the ball at his feet as he steps forward through the lines himself before releasing it.

<figure class="chart-figure">
  <img src="/charts/football/rodri_progressions.png" alt="Pitch map of Rodri's passes and carries into the final third at Euro 2024">
  <figcaption>Rodri progresses mostly by passing — distributing into the third from a deep, central base.
  <span class="chart-source">StatsBomb open data, Euro 2024.</span></figcaption>
</figure>

<figure class="chart-figure">
  <img src="/charts/football/rice_progressions.png" alt="Pitch map of Declan Rice's passes and carries into the final third at Euro 2024">
  <figcaption>Rice carries more of the ball forward himself before the final-third entry.
  <span class="chart-source">StatsBomb open data, Euro 2024.</span></figcaption>
</figure>

It fits what their teams asked of them. Spain built through structured, patient possession where the pivot's job is to find the next pass; Rodri's value is in being the man every pattern runs through. England leaned more on Rice's physical ability to drive forward and break a line with the ball, a slightly more box-to-box reading of the role.

## What this does and doesn't tell you

Two honest limitations. First, final-third entry is one lens on a deep midfielder, and arguably not even the most important one — it says nothing about ball recoveries, screening the defence, duels, or the off-ball positioning that is half of what these players are paid for. Second, the two had different match and minute loads across the tournament, so the raw maps describe *volume and shape*, not a like-for-like per-90 rate. Read them as "here is how each player moved the ball forward," not "here is who progressed the ball better."

What the data does establish cleanly is that two players filling the same slot on the team sheet contributed through different mechanisms: one predominantly a passer from deep, the other more willing to carry. That's a useful thing to be able to show with evidence rather than assertion — and it's exactly the kind of question open event data is well suited to answer.

---
title: "Rodri vs Declan Rice — Final-Third Progression at Euro 2024"
slug: "rodri-rice-euro-2024"
accent: "cyan"
date: 2025-12-17
research_question: "How did Rodri and Declan Rice differ in the way they moved the ball into the final third across Euro 2024?"
competition: "UEFA Euro 2024"
date_range: "June–July 2024"
dataset: "StatsBomb free/open event data (competition 55, season 282)"
source: "StatsBomb Open Data"
tools: ["Python", "statsbombpy", "pandas", "mplsoccer", "matplotlib"]
repo: ""
app: ""
cover: "/charts/football/comparison.png"
cover_alt: "Combined comparison figure of Rodri and Rice progressions and touches at Euro 2024"
summary: "A descriptive, reproducible comparison of two holding midfielders' ball progression into the final third using open event data."
status: "Finished exploratory analysis"
---

## Research question

Rodri (Spain) and Declan Rice (England) both anchored midfields that reached the Euro 2024 final. The question this project answers is narrow and verifiable: **how, and how often, did each move the ball from deeper areas into the final third?** It is a comparison of method and volume, not a verdict on quality.

## Method

- **Data:** StatsBomb's free/open event data for Euro 2024, pulled via `statsbombpy` (competition id 55, season id 282).
- **Scope:** Spain's seven matches concatenated for Rodri; England's run for Rice.
- **Metric:** a *final-third progression* = a completed pass **or** a carry that starts below x = 80 and ends above x = 80 on StatsBomb's 120-unit pitch (i.e. begins outside the final third and ends inside it). Incomplete passes are excluded.
- **Visualisation:** per-player pitch maps drawn with `mplsoccer` (passes as arrows, carries as lines), plus a side-by-side comparison.

## Key findings

- The two players progress the ball through **different mechanisms**: Rodri's final-third entries are predominantly *passes* from a deep central base (436 passes at 94% completion); Rice's include a heavier share of *carries* (443), driving the ball forward himself before release.
- Volume vs efficiency: Rice did more in raw terms (536 passes, 443 carries) but across 690 minutes to Rodri's 521 — on a per-90 basis Rodri is the more efficient distributor.
- This matches the stylistic demands of their teams — Spain's structured possession versus England's more direct, line-breaking use of Rice.
- The fuller write-up, including the territory and defensive-profile comparison, is the [featured football article](/football/rodri-rice-euro-2024-progressions/) and the [original on Medium](https://medium.com/@arakkal.pranav/who-ran-euro-2024s-engine-room-rodri-vs-declan-rice-0f61faf3bf20).

<figure class="chart-figure">
  <img src="/charts/football/rodri_touches.png" alt="Rodri touch map at Euro 2024">
  <figcaption>Rodri's touch map — a deep, central operating zone.
  <span class="chart-source">StatsBomb open data, Euro 2024.</span></figcaption>
</figure>

<figure class="chart-figure">
  <img src="/charts/football/rice_touches.png" alt="Declan Rice touch map at Euro 2024">
  <figcaption>Rice's touch map — a wider forward range.
  <span class="chart-source">StatsBomb open data, Euro 2024.</span></figcaption>
</figure>

## Limitations

- Final-third entry is **one** facet of a holding midfielder and omits defensive actions, recoveries and off-ball work.
- The two players featured in different numbers of matches and minutes, so the maps describe **volume and shape**, not a per-90 rate.
- This is a descriptive event-count study, not a possession-value or expected-threat model. No xT or xG figures are claimed.

## Status

A finished exploratory analysis, presented here as a worked example of using open event data to answer a focused tactical question. The write-up as an article lives in the [Football section](/football/rodri-rice-euro-2024-progressions/).

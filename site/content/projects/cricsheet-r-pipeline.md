---
title: "A Reproducible R Pipeline for T20 Match Analysis"
slug: "cricsheet-r-pipeline"
accent: "lime"
date: 2026-10-27
research_question: "Can a single, reusable R workflow take a T20 match from raw data to publication-ready, validated charts?"
competition: "T20 cricket (Cricsheet-supported competitions)"
date_range: "Ongoing"
dataset: "Cricsheet ball-by-ball archive via the cricketdata R package; verified scorecards where a match is not yet archived"
source: "Cricsheet (CC BY-SA 4.0)"
tools: ["R", "cricketdata", "dplyr", "tidyr", "ggplot2", "readr"]
repo: ""
app: ""
cover: "/charts/cricket/t1_01_chase_worm.png"
cover_alt: "Example chart output from the R pipeline: a ball-by-ball chase worm"
summary: "The analytical engine behind the cricket writing — fetch, clean, validate, and chart any supported T20 match reproducibly."
status: "Active"
---

## Research question

Every match article on this site needs the same thing: trustworthy numbers and clean charts, produced the same way each time so they can be checked and updated. This project is the pipeline that delivers that — the reproducible working behind the readable articles.

## Method

The workflow is built in R around the `cricketdata` package, which pulls Cricsheet's ball-by-ball archive directly:

1. **Fetch** — `fetch_cricsheet(type = "bbb", gender = "male", competition = ...)` for a supported competition (the men's T20I code is `t20s`).
2. **Check availability** — confirm the specific match is actually in the archive. Cricsheet rebuilds periodically, so a just-played match may not be present yet. When it isn't, the pipeline falls back to a **verified published scorecard** and computes only scorecard-level metrics — it never fabricates deliveries.
3. **Clean & validate** — reconcile the data against the scorecard: batter runs plus extras must equal the innings total; bowlers' runs must equal the opposition total minus byes and leg-byes; wickets must reconcile both ways. These checks are coded as hard assertions that halt the build on failure.
4. **Compute** — strike rates, boundary breakdowns, run rates, partnership and powerplay checkpoints, bowling distributions.
5. **Chart** — a shared `ggplot2` theme (the site's dark editorial palette) exports consistent PNG figures.

Shared theme, palette, save and validation helpers live in `_helpers.R`, so a new match article reuses the same functions rather than rewriting them.

## Key findings

The first published output is the India–New Zealand 1st T20I of 22 October 2026 (see the [featured article](/cricket/226-chased-down-christchurch-thriller/)). That match is **complete in the Cricsheet archive** — both innings, every delivery — so the pipeline fetched it, reconciled all four innings totals, wickets and legal-ball counts against the published scorecard, and generated a real ball-by-ball worm, phase breakdown and bowling figures. A later match in the same series (the 3rd T20I) was **not yet archived** when first examined, and the pipeline handled that too: it reported the gap and fell back to scorecard-level metrics rather than inventing deliveries. Same workflow, honest about what each match's data can support.

## Limitations

- Coverage depends on Cricsheet. Matches appear after a lag, and some are withheld.
- Scorecard-fallback mode can only produce scorecard-level metrics — no true ball-by-ball worms, phase-by-phase breakdowns or bowler-vs-batter matchups until the deliveries are archived.
- Cricsheet data is community-collected; the validation step guards against transcription slips but cannot certify the source.

## Status

Active and reused across articles. Data source: [Cricsheet](https://cricsheet.org/), licensed CC BY-SA 4.0.

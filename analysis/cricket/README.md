# Cricket analysis

Reproducible R analysis behind the site's cricket articles.

## Files

- `india_nz_3rd_t20i.R` — primary analysis for the India v New Zealand 3rd T20I
  (Wellington, 27 Oct 2026). Encodes the verified scorecard, validates totals,
  computes derived metrics, writes `data/*.csv`, and exports `figures/*.png`.
- `_helpers.R` — shared palette, dark editorial `ggplot2` theme, `save_fig()`
  and the `check()` validation assertion. Reused by future match scripts.
- `VERIFIED_DATA.md` — every figure used in the article, with its source and
  the data-availability finding (see below).
- `data/` — processed CSVs (batting, bowling, checkpoints, summary).
- `figures/` — exported PNG charts.

## Run

```bash
# from the project root
Rscript analysis/cricket/india_nz_3rd_t20i.R
cp analysis/cricket/figures/*.png site/static/charts/cricket/
```

The script halts if any validation assertion fails, so a clean run means the
numbers reconcile against the published scorecard.

## Data source and the availability caveat

The intended source is the [Cricsheet](https://cricsheet.org/) ball-by-ball
archive via the `cricketdata` package (men's T20I competition code `t20s`;
data licensed **CC BY-SA 4.0**). When this article was written the 3rd T20I was
**not yet in the archive** (the 2026-10-25 build held the 1st and 2nd T20Is of
the series but not the 3rd), so there is **no delivery-level data** for it.

Consequently this analysis is scorecard-level: the figures come from verified
published scorecards (ESPNcricinfo and others), reconciled in R. No ball-by-ball
data was fabricated, and charts that would need per-ball data (a true run worm)
are built from verified checkpoints only and labelled as such. When the match
is archived, re-point the script at `fetch_cricsheet(...)` to regenerate every
chart from the raw deliveries.

## Metric definitions

- **Run rate** = total runs / overs faced (overs in decimal, e.g. 13.2 = 13.333).
- **Boundary runs** = fours×4 + sixes×6; **boundary %** = boundary runs / total runs.
- **Bowler runs charged** = opposition total − byes − leg-byes (b/lb are not
  charged to bowlers; wides and no-balls are).
- **Checkpoints** (chase chart) = start, powerplay score, first-wicket fall,
  final total — the only points verifiable without ball-by-ball data.

## Validation performed

Batter runs + extras = innings total (both sides); dismissed batters = wickets;
bowlers' charged runs = opposition total − b − lb (both sides); bowlers' wickets
= opposition wickets lost (both sides). All pass.

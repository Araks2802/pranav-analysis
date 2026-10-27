# Verified football project — Rodri vs Declan Rice, Euro 2024

## Source project location
`/Users/pranav_arakkal/Documents/Portfolio/Statsbomb/`
- `Intro.ipynb` — the primary analysis notebook (Python).
- Existing exported charts (reuse these, re-presented cleanly):
  - `Rice vs Rodri.png` — side-by-side comparison
  - `Rodri Progressions.png`, `Rice Progressions.png` — progression maps on a pitch
  - `Rodri Touches.png`, `Rice Touches.png` — touch maps
  - `Comparision.png` — combined comparison figure
  - `Rodri.webp`, `declan.webp` — player images
- `Statsbomb.xlsx` — supporting data export.

## Verified methodology (from the notebook code)
- Data: **StatsBomb free/open data** via `statsbombpy`, Euro 2024 (`competition_id = 55`, `season_id = 282`).
- Spain's 7 matches concatenated (Croatia, Italy, Albania, Georgia, Germany, France, England) for Rodri; England's run for Rice.
- Metric: **progressions into the final third** = count of Passes AND Carries that START in x < 80 and END in x > 80 (StatsBomb pitch is 120 long, so x=80 is the final-third line). Completed passes only (pass_outcome is NaN).
- Visualised per player with `mplsoccer` (passes as arrows, carries as lines) on a StatsBomb pitch.
- Players: Rodri = "Rodrigo Hernández Cascante" (Spain); Declan Rice (England).

## Honest framing for the article/project page
- This is a **descriptive ball-progression comparison** using open event data, NOT an expected-threat or possession-value model.
- Limitations to state: StatsBomb open data coverage; the two players played different numbers of matches / minutes (Spain reached the final, England the final too in Euro 2024 — but match counts and minutes differ), so compare rates or note raw counts honestly; final-third entry is one lens on a deep-lying midfielder's contribution and omits defensive actions, ball recoveries, and off-ball positioning.
- Do NOT invent xG/xT numbers or any figure not in the notebook. If a specific progression count is quoted, it must be recomputed or read directly from the notebook output / chart. If not recomputed, describe findings qualitatively from the existing charts and clearly label them as from the original analysis.

## Status
Prototype/finished exploratory analysis — publication-ready as a "Data Story / Player Analysis" football piece once re-presented with a clear question, method, findings, limitations. Treat exact counts as "verify against notebook" unless re-run.

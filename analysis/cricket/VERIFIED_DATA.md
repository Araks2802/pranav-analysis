# Verified data — India vs New Zealand, 3rd T20I, Wellington, 27 Oct 2026

## Data-availability finding (CRITICAL — do not fabricate)

- The cricket analysis stack is **R + `cricketdata` + Cricsheet**. R 4.5.3 is installed; `cricketdata`, `dplyr`, `tidyr`, `ggplot2`, `readr`, `lubridate`, `jsonlite` are all available.
- The correct Cricsheet competition code for men's T20 Internationals is **`t20s`** (not `t20is`). `fetch_cricsheet(type="bbb", gender="male", competition="t20s")` works for ball-by-ball.
- NOTE: `fetch_cricsheet(type="match", ...)` currently errors with "Names must be unique" (duplicate `match_id` column) — a parser bug. Read the zip (`https://cricsheet.org/downloads/t20s_male_csv2.zip`) directly if match metadata is needed.
- The Cricsheet men's T20I dataset was last built **2026-10-25**. It contains:
  - 1539432 — New Zealand v India, 2026-10-22 (1st T20I)
  - 1539433 — New Zealand v India, 2026-10-24 (2nd T20I)
  - **It does NOT contain any match dated 2026-10-27.** The 3rd T20I (ESPNcricinfo match id 1539434) is NOT yet in Cricsheet.
- Therefore **ball-by-ball (delivery-level) data for this match is unavailable**. Do NOT manufacture a per-ball dataset. All statistics below come from reliable published scorecards and match reports, cross-checked across ESPNcricinfo, ICC, Indian Express, crictracker, cricketaddictor, Times of India, Economic Times, sportsmint.
- Earlier matches in the series (22 Oct, 24 Oct) ARE in Cricsheet if a verified historical/series comparison is ever wanted — but only use them with explicit, verifiable calculations.

## Result
- New Zealand 198/3 (20 overs). India 199/4 (13.2 overs). **India won by 6 wickets, 40 balls remaining.** Series: India lead 3-0 (5-match series).
- Venue: Hnry Stadium, Wellington. Toss: India (capt. Shreyas Iyer) won, chose to field.
- Player of the Match: Abhishek Sharma.

## New Zealand innings — 198/3 (20 ov), RR 9.90
Batting (R, B, 4s, 6s, SR):
- Tim Seifert (wk)  — c Axar Patel b Arshdeep Singh — 2 (6), 0×4, 0×6, SR 33.33
- Finn Allen — c Naman Dhir b Nitish Kumar Reddy — 40 (25), 0×4, 5×6, SR 160.00
- Daryl Mitchell — not out — 89 (52), 5×4, 5×6, SR 171.15
- Glenn Phillips — c & b Axar Patel — 17 (14), 3×4, 0×6, SR 121.43
- Bevon Jacobs — not out — 39 (23), 4×4, 1×6, SR 169.57
- Extras: 11 (b 0, lb 7, w 4, nb 0)
- DNB: Bracewell, Santner (c), Jamieson, Milne, Duffy, Fisher
- Fall of wickets: 1-4 (Seifert, 1.2), 2-90 (Allen, 8.3), 3-123 (Phillips, 11.6)

India bowling (O, M, R, W, econ):
- Bhuvneshwar Kumar — 4-0-40-0 — econ 10.00
- Arshdeep Singh — 4-0-33-1 — econ 8.25
- Prince Yadav — 4-0-44-0 — econ 11.00
- Axar Patel — 4-0-36-1 — econ 9.00
- Nitish Kumar Reddy — 4-0-38-1 — econ 9.50

## India innings — 199/4 (13.2 ov), RR 14.93
Batting (R, B, 4s, 6s, SR):
- Vaibhav Sooryavanshi — c Daryl Mitchell b Matthew Fisher — 45 (19), 4×4, 2×6, SR 236.84
- Abhishek Sharma — c Glenn Phillips b Kyle Jamieson — 113 (38), 9×4, 11×6, SR 297.37
- Sanju Samson (wk) — b Kyle Jamieson — 18 (13), 2×4, 0×6, SR 138.46  (note: 1 six? crictracker shows 18(13) 2x4 0x6 SR138.46 — use 18 off 13)
- Shreyas Iyer (c) — c Glenn Phillips b Mitchell Santner — 5 (10), 0×4, 0×6, SR 50.00
- Tilak Varma — not out — 1 (1), 0×4, 0×6, SR 100.00
- Naman Dhir — not out — 4 (1), 1×4, 0×6, SR 400.00
- Extras: 13 (b 0, lb 1, w 10, nb 2)
- DNB: Nitish Kumar Reddy, Axar Patel, Bhuvneshwar Kumar, Arshdeep Singh, Prince Yadav

New Zealand bowling (O, M, R, W, nb, wd, econ):
- Jacob Duffy — 2-0-44-0 (1 wd) — econ 22.00
- Adam Milne — 2-0-33-0 (1 wd) — econ 16.50
- Michael Bracewell — 2-0-36-0 (1 wd) — econ 18.00
- Kyle Jamieson — 3.2-0-45-2 — econ 13.50
- Matthew Fisher — 1-0-23-1 (2 nb) — econ 23.00
- Mitchell Santner (c) — 3-0-17-1 — econ 5.67

## Key verified narrative facts (from match reports)
- Opening partnership (Sooryavanshi + Abhishek) = **133 runs off 43 balls** (7.1 overs). This was India's 1st-wicket fall: FoW1 = 133.
- **118/0 in the powerplay** (first 6 overs) — the highest men's T20I powerplay score (between Full Member nations per Indian Express; "top powerplay score in men's T20I history" per sportsmint — attribute carefully; state "highest Full-Member T20I powerplay" as the safe claim and note the record framing varies by source).
- Abhishek: 15-ball fifty; 35-ball hundred; finished 113 off 38 (9 fours, 11 sixes). (One outlet said 39 balls; the authoritative scorecard and majority say 38 — use 38.)
- Sooryavanshi (15 years old) took 26 off Jacob Duffy's first over.
- Samson 18 and Iyer 5 fell late; Naman Dhir sealed it with a four off his first ball, 40 balls remaining.
- Abhishek & Sooryavanshi stand of 133 in 7.1 overs = "second-quickest team hundred in T20Is" and quickest team fifty (ESPNcricinfo / S. Monga). Attribute to ESPNcricinfo; do not overstate.

## India fall of wickets (reconstructed from verified card + reports)
- 1-133 (Sooryavanshi, ~7.1 ov) — out to Fisher
- then Abhishek (113), Samson (18 b Jamieson), Iyer (5) fell; India 199/4 at 13.2
- Exact over for wickets 2–4 not published precisely in sources gathered; chase-progression chart should use the VERIFIED checkpoints only (start 0; powerplay 118/0 at 6.0; partnership break 133/1 at 7.1; final 199/4 at 13.2) and be labelled as scorecard-checkpoint reconstruction, NOT a fabricated per-ball line.

## Derived metrics that ARE safe to compute (scorecard-level)
- Abhishek boundary runs = 9×4 + 11×6 = 36 + 66 = 102 of 113 (90.3% from boundaries); 11 runs from non-boundary scoring; balls faced 38.
- Sooryavanshi boundary runs = 4×4 + 2×6 = 16+12 = 28 of 45 (62.2%); 17 from running/other.
- Team boundary count India: fours = 4+9+2+0+0+1 = 16; sixes = 2+11+0+0+0+0 = 13.
- Required run rate at start = 199/20 = 9.95. India scored at 14.93.
- NZ bowling distribution: Jamieson 45, Duffy 44, Bracewell 36, Milne 33, Fisher 23, Santner 17.
- India bowling distribution vs NZ: Prince Yadav 44, Bhuvneshwar 40, Nitish 38, Axar 36, Arshdeep 33.
- Mitchell 89* was 44.9% of NZ's 198 (off the bat NZ scored 187; 89/187 = 47.6% of runs off the bat).

## DO NOT
- Do not claim shot placement, delivery length, line, or field settings — no ball-level data.
- Do not invent a smooth over-by-over run worm beyond the verified checkpoints.
- Do not fabricate a historical-chase comparison dataset. A verified comparison would need a complete T20I chase dataset with explicit inclusion rules; only the general facts above (record powerplay, 2nd-quickest team hundred per ESPNcricinfo) are safe, cited to their source.

## Sources (cite in article methodology)
- ESPNcricinfo scorecard & report, match 1539434: https://www.espn.com/cricket/series/24469/scorecard/1539434/new-zealand-vs-india-3rd-t20i-24469
- ESPNcricinfo (S. Monga analysis): https://www.espn.com/cricket/story/_/id/50297465/
- ICC: https://www.icc-cricket.com/news/india-race-to-a-historic-chase-to-seal-t20i-series-in-wellington
- Indian Express: https://indianexpress.com/article/sports/cricket/ind-vs-nz-3rd-t20i-live-cricket-score-india-vs-new-zealand-match-wellington-10938471/
- CricTracker scorecard: https://www.crictracker.com/live-scores/nz-vs-ind-3rd-t20i-india-tour-of-new-zealand-27-oct-2026/full-scorecard/
- Cricsheet (data source + licence; attribution required): https://cricsheet.org/ (data licensed CC BY-SA 4.0 — the 3rd T20I not yet included as of 2026-10-25 build)

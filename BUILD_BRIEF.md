# Build brief — Pranav's sports analytics portfolio website

This is a HEAVY, multi-subsystem build. Read this whole file plus the two verified-data files before coding.

## Absolute paths
- Project root (build everything here): `/Users/pranav_arakkal/Documents/Portfolio/Cricket 2.0/Pranav Analysis`
- Verified cricket data & data-availability finding: `analysis/cricket/VERIFIED_DATA.md` (READ THIS — it is the single source of truth for the article's numbers)
- Verified football project facts: `analysis/football/VERIFIED_PROJECT.md`
- Football chart PNGs already staged: `analysis/football/figures/` (rice_vs_rodri.png, rodri_progressions.png, rice_progressions.png, rodri_touches.png, rice_touches.png, comparison.png)
- R 4.5.3 is installed (`Rscript`), with cricketdata, dplyr, tidyr, ggplot2, readr, lubridate, jsonlite.

## What to build
A launch-ready, premium independent sports-analytics publication — NOT a CV template. Two content areas (Cricket, Football) plus Projects, About, Contact.

### Technology (decided)
- **Astro + TypeScript**, content via **MDX content collections** (`src/content/`), one collection per section (cricket, football, projects) with typed frontmatter schemas (title, description, date, category, tags, cover, readingTime auto or manual, sources, author).
- Static output (`output: 'static'`). No running R/Streamlit server needed to view the site.
- Charts: generate **static SVG/PNG from R + ggplot2** for the cricket article (crisp, print-quality, consistent theme) AND add **one or two lightweight interactive charts** (use a small lib such as Chart.js or ECharts via an Astro island / `client:visible`) ONLY where interactivity genuinely helps (e.g. the chase progression). Do not force a dashboard. Every chart must come from verified data.
- Accessibility: semantic HTML, alt text on every image/chart, colour contrast AA, keyboard-navigable nav and filters.
- SEO: per-page `<title>`/meta description/OpenGraph, canonical URLs, sitemap (`@astrojs/sitemap`), RSS for articles, readable slugs (`/cricket/199-in-80-balls-...`).

### Visual identity (decided, make it distinctive — do not copy bighitcricket)
- Dark navy/near-black foundation; off-white reading surface for article bodies; a single restrained energetic accent (lime green `#c6f432`-ish — pick a refined shade). Cricket vs Football get distinct secondary accent markers (e.g. cricket = lime, football = a cool cyan/teal) while sharing the same brand.
- Strong editorial typography: a characterful display/serif or grotesk for headlines, clean sans for body. Use a web-font setup that is fast (self-host or Fontsource).
- Large compelling headlines, clear section labels/kickers, generous controlled spacing, subtle hover/transition only. Avoid rounded-card SaaS look, generic gradients, oversized empty heroes, excessive animation.
- Text wordmark brand (Pranav's name / a personal mark) — NOT a fake company.

### Pages & components
- Top nav: Home, Cricket, Football, Projects, About (+ Contact link). Responsive (desktop/tablet/mobile), accessible.
- **Home**: strong headline on data-driven cricket+football analysis; concise intro to the work (real, no "passionate about sports" filler); a featured article (the T20I piece) with a custom statistical graphic; separate Cricket and Football section previews; selected projects; latest-articles feed; About preview; contact link.
- **Cricket page**: editorial publication layout — prominent featured story + filterable grid. Categories: Match Analysis, Player Analysis, Tactical Analysis, Data Stories, Explainers, Research Projects. Client-side category filter + simple search. Article cards: title, engaging dek, date, category, reading time, cover graphic.
- **Football page**: same standard; categories Player Analysis, Tactical Analysis, Performance Analysis, Recruitment & Scouting, Data Stories. Distinct accent.
- **Projects page**: cards with title, research question, competition/date range, dataset/source, methodology, key findings, visualisations, limitations, tools, repo/app links (only if verifiable — otherwise omit the link, don't fake it).
- **About page**: concise. Present Pranav as an aspiring cricket & football performance analyst with a quantitative background. Base it ONLY on demonstrated work (R-based Cricsheet/IPL cricket analytics incl. ball-by-ball phase analysis; Python/StatsBomb football event analysis). NO invented qualifications, job titles, employers, achievements, testimonials, or affiliations. Contact: provide a mailto + placeholder social links the user can fill in — label them clearly as to-be-filled, do not invent handles.
- **Reusable article template** (layout) giving every article consistent typography, nav, metadata, hero, standfirst, byline (author = Pranav), styled headings, embedded chart components with intro+interpretation, stat-callout component, sources/methodology block, related-articles, back-to-section link.
- Reusable components: `<ChartFigure>` (image/SVG + caption + source), `<StatCallout>`, `<InteractiveChart>` island, article card, category filter, section hero.

## The featured cricket article (write it in full, publication quality)
- Slug under cricket. Working headline: **"199 in 80 Balls: How India Turned a Chase into a Demolition"** (improve if a better original angle emerges).
- ALL numbers come from `analysis/cricket/VERIFIED_DATA.md`. The 3rd T20I is NOT in Cricsheet (confirmed), so this is a scorecard-sourced analysis — state that transparently in methodology. Do NOT fabricate ball-by-ball. Do NOT invent shot placement/length/field. Do NOT invent a historical-chase dataset.
- Write the R analysis script `analysis/cricket/india_nz_3rd_t20i.R` that encodes the verified scorecard as tidy data frames and COMPUTES the derived metrics (boundary runs/%, strike rates, run rates, bowling distribution, Mitchell's share, powerplay/partnership checkpoints), validates innings totals (batter runs + extras == team total; wickets; legal balls where derivable), writes processed CSVs to `analysis/cricket/data/`, and exports 4–6 publication-quality ggplot figures (SVG+PNG, consistent dark-editorial theme matching the site accents) to `analysis/cricket/figures/`. Then copy/export the figures into the Astro `public/` or `src/assets/` for the article.
- Charts to produce (only those the verified data supports):
  1. Chase progression — stepped/annotated line using the VERIFIED checkpoints only (0 → 118/0 at 6.0 → 133/1 at 7.1 → 199/4 at 13.2) vs the 199 target line and the required-rate (9.95) reference line. Label clearly as a scorecard-checkpoint reconstruction, not per-ball. This one may ALSO be the interactive chart.
  2. Opening partnership / powerplay explosion (133 off 43 balls; 118 in powerplay) — e.g. partnership contribution bar or cumulative.
  3. Abhishek scoring breakdown — boundary runs (fours 36, sixes 66) vs running (11); 90.3% from boundaries.
  4. Scoring rate — India 14.93 RR vs NZ 9.90 RR, and/or India's phase rates using verified checkpoints.
  5. NZ bowling figures — horizontal bars of runs conceded with wickets + overs visible (so Fisher's 1 over and Jamieson's 3.2 aren't misread). India's own bowling vs NZ optionally.
  6. (Optional) Only a VERIFIED context stat (record powerplay; 2nd-quickest team hundred per ESPNcricinfo) presented as an annotated callout, not a fabricated distribution.
- Each chart introduced, explained, and interpreted in the narrative. ~1,000–1,400 words. Engaging, confident, witty-but-precise. Avoid cliché openings and "the numbers tell a story". Clearly separate verified fact from interpretation. Balanced on both teams (NZ 198/3 was above the ~165 avg 1st-innings score; Mitchell 89* carried them; India's batting, not just NZ bowling, won it). Methodology + sources block citing the exact URLs in VERIFIED_DATA.md and Cricsheet attribution (CC BY-SA 4.0; note the match itself isn't yet in Cricsheet).

## Football project/article (integrate existing work)
- Create a football Data-Story/Player-Analysis piece AND a Projects entry for **Rodri vs Declan Rice, Euro 2024**, using facts in `analysis/football/VERIFIED_PROJECT.md`. Reuse the staged PNGs (copy into site assets), re-presented cleanly with question / method (StatsBomb open data, Euro 2024, final-third progressions x<80→>80, completed passes + carries) / findings (qualitative from the charts unless a count is re-verified) / limitations / tools. Do NOT invent xG/xT or counts not in the source.

## Publishing workflow + docs
- Make adding an article = add one MDX file with frontmatter. Document in README: local dev (`npm run dev`), build (`npm run build`), how to add an article, add a chart (R → export → reference), add an image + alt text, data attribution, and the R pipeline. Design the R pipeline so future cricket match articles reuse the same data-loading/validation/theme/chart functions (factor shared ggplot theme + validation helpers into e.g. `analysis/cricket/_helpers.R`).

## Deployment
- Configure for a free static host. **Pick Netlify OR Vercel OR GitHub Pages**, add the correct config (e.g. `netlify.toml` / `vercel.json` / GH Actions workflow + `site`/`base` in astro config), and DOCUMENT the deploy steps in the README. DO NOT claim the site is live — it has not been deployed; only provide verified config + instructions. Init a git repo at the project root with a sensible `.gitignore` (node_modules, dist, large raw data, .DS_Store) and make an initial commit.

## QA before you finish (REQUIRED)
- Run the Astro production build (`npm run build`) — it MUST succeed. Fix all errors and functional warnings.
- Run `npm run dev` or `astro preview` to sanity check; verify every nav link, every article page, filters/search, images load with alt text, charts aren't clipped on mobile/desktop.
- Re-run the R script end to end so figures regenerate cleanly and totals validate (print the validation asserts).
- Confirm every published statistic matches VERIFIED_DATA.md / the R output. Remove any placeholder/broken/fake content.
- Report exactly what was verified and what could not be (e.g. no ball-by-ball, so no per-ball worm; site not yet deployed).

## Hard rules
- Trustworthy analysis first: every stat correct and traceable to VERIFIED_DATA.md or the R computation. No fabrication of data, citations, credentials, or a live URL.
- The site must be maintainable and build cleanly. Favour clarity over cleverness.

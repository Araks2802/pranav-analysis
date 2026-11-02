# Pranav Arakkal — Sports Analytics

A personal cricket and football analysis publication: match breakdowns, player
studies, tactical pieces and reproducible data projects. Fast, fully static,
and built around real analytical work.

- **Website:** a static site generated from Markdown by a small Python builder.
- **Analysis:** cricket in R (Cricsheet + `cricketdata`), football in Python
  (StatsBomb open data). Charts are produced by the analysis code and embedded
  as images — the public site never needs a running R or Python server to show
  an article.

---

## Repository layout

```
.
├── site/                      # the website
│   ├── build.py               # static site generator (Python + Jinja2 + Markdown)
│   ├── config.yaml            # title, wordmark, base URL, contact links
│   ├── content/               # all content as Markdown + YAML frontmatter
│   │   ├── cricket/           #   cricket articles
│   │   ├── football/          #   football articles
│   │   └── projects/          #   research projects
│   ├── templates/             # Jinja2 HTML templates (base, article, section, …)
│   └── static/                # css, js, favicon, and chart images (/charts/…)
├── analysis/
│   ├── cricket/               # R pipeline: scripts, data/, figures/
│   │   ├── india_nz_3rd_t20i.R
│   │   ├── _helpers.R         # shared theme, palette, validation, save helpers
│   │   ├── VERIFIED_DATA.md   # the verified numbers + sources for the T20I piece
│   │   ├── data/              # processed CSVs
│   │   └── figures/           # exported PNG charts
│   └── football/              # Rodri vs Rice project notes + figures
├── dist/                      # build output (git-ignored) — deploy this
├── requirements.txt           # Python deps for the builder
├── netlify.toml               # Netlify deploy config
└── .github/workflows/deploy.yml  # GitHub Pages deploy (alternative)
```

---

## Local development

The site builder needs Python with three packages (Jinja2, Markdown, PyYAML).

```bash
# one-time: install the builder's dependencies
pip install -r requirements.txt

# build the site into dist/
python site/build.py

# build AND preview at http://localhost:8000
python site/build.py --serve
```

That's the whole loop: edit a Markdown file, re-run `python site/build.py`,
refresh the browser.

> If you use Anaconda, those three packages are usually already present, so
> `python site/build.py` works without installing anything.

---

## Publishing a new article

1. Create a Markdown file in the right section folder:
   - Cricket: `site/content/cricket/<slug>.md`
   - Football: `site/content/football/<slug>.md`
2. Add frontmatter at the top. Minimum fields:

   ```yaml
   ---
   title: "Your headline"
   slug: "your-url-slug"            # becomes /cricket/your-url-slug/
   description: "One-line summary for cards, search and SEO."
   standfirst: "The opening hook shown under the headline."
   date: 2026-11-01
   category: "Match Analysis"        # must be one of the section's categories
   tags: ["T20I", "India"]
   cover: "/charts/cricket/my-chart.png"   # optional cover image
   cover_alt: "Describe the cover image for screen readers."
   author: "Pranav Arakkal"
   featured: false                   # true = this is the section's lead story
   methodology: "Short note on data and method."
   sources:
     - label: "ESPNcricinfo scorecard"
       url: "https://..."
   related: ["another-slug"]         # optional
   ---
   ```

3. Write the body in Markdown below the closing `---`.
4. Rebuild: `python site/build.py`.

**Categories** per section are defined in `site/build.py` (`SECTIONS`). Use one
of them so the category filter works. Reading time is calculated automatically
from the word count (override with `reading_time: <minutes>` if you must).

Set `draft: true` in frontmatter to keep a file out of the build.

### Adding a chart to an article

Charts are images produced by the analysis code (see below), copied into
`site/static/charts/<section>/`. Embed one with the styled figure component:

```html
<figure class="chart-figure">
  <img src="/charts/cricket/my-chart.png" alt="What the chart shows, for screen readers">
  <figcaption>One sentence introducing and interpreting the chart.
  <span class="chart-source">Source · date.</span></figcaption>
</figure>
```

Always introduce and interpret a chart in the surrounding prose — a chart is
part of the argument, not decoration.

### Statistical callouts

```html
<div class="stat-row">
  <div class="stat-callout"><div class="stat-value">14.92</div><div class="stat-label">Run rate</div></div>
  <!-- up to three per row -->
</div>
```

### A lightweight interactive chart

The featured T20I article includes a dependency-free interactive line chart
drawn on a `<canvas>` by `site/static/main.js`. To reuse it, add a canvas with
`id="chase-canvas"`, a `data-target` and a `data-points` JSON array. For other
chart types, add a small island and extend `main.js`. Prefer a static image
unless interactivity genuinely helps the reader.

### Adding an image

Put the file in `site/static/` (e.g. `site/static/images/foo.jpg`), reference
it as `/images/foo.jpg`, and **always** give it meaningful `alt` text.

---

## The cricket analysis pipeline (R)

All cricket statistics come from R, using the `cricketdata` package against the
[Cricsheet](https://cricsheet.org/) ball-by-ball archive, with a verified
scorecard fallback when a match has not yet been archived.

```bash
# from the project root
Rscript analysis/cricket/india_nz_3rd_t20i.R
```

This validates the data (hard assertions — the run halts if totals don't
reconcile), writes processed CSVs to `analysis/cricket/data/`, and exports the
charts to `analysis/cricket/figures/`. Copy the figures into the site:

```bash
cp analysis/cricket/figures/*.png site/static/charts/cricket/
```

**Reusing the pipeline for a new match.** Copy `india_nz_3rd_t20i.R` as a
template. The shared `ggplot2` theme, colour palette, `save_fig()` and `check()`
validation helper live in `analysis/cricket/_helpers.R`, so a new match script
reuses them. If the match is in Cricsheet, fetch it with
`fetch_cricsheet(type = "bbb", gender = "male", competition = "t20s")`
(the men's T20I code is `t20s`); the column schema includes `striker`,
`runs_off_bat`, `extras`, `wides`, `over`, `match_id`, `season`, `start_date`.

R packages used: `cricketdata`, `dplyr`, `tidyr`, `readr`, `ggplot2`.
Install SVG export support (optional) with `install.packages("svglite")`.

### The football project (Python)

The Rodri vs Rice project uses StatsBomb open data via `statsbombpy` and
`mplsoccer`. Its charts are already exported to
`analysis/football/figures/` and copied into `site/static/charts/football/`.
See `analysis/football/VERIFIED_PROJECT.md` for the method and the original
notebook location.

---

## Data attribution

- **Cricsheet** ball-by-ball data is used under the Creative Commons
  Attribution-ShareAlike 4.0 licence (CC BY-SA 4.0). Attribution:
  [cricsheet.org](https://cricsheet.org/).
- **StatsBomb Open Data** is used under StatsBomb's open-data terms; see the
  [open-data repository](https://github.com/statsbomb/open-data).
- Where a match is not yet in an archive, statistics are taken from published
  scorecards (ESPNcricinfo and others), cited per article, and never fabricated
  at delivery level.

Every data-led article carries a sources-and-methodology section. Verified
facts, interpretation and unavailable data are labelled distinctly.

---

## Deployment

The site is static — deploy the `dist/` folder to any static host. Nothing has
been deployed yet; pick one of the options below and run it.

### Option A — Netlify (recommended, config included)

1. Push this repo to GitHub.
2. In Netlify: **Add new site → Import an existing project** and pick the repo.
3. Netlify reads `netlify.toml`: build command
   `pip install -r requirements.txt && python3 site/build.py`, publish dir
   `dist`. No changes needed.
4. Deploy. Then update `base_url` in `site/config.yaml` to the Netlify URL (or
   your custom domain) and redeploy so SEO/OpenGraph/sitemap URLs are correct.

### Option B — GitHub Pages (workflow included)

1. Push to GitHub.
2. Repo **Settings → Pages → Source: GitHub Actions**.
3. `.github/workflows/deploy.yml` builds and publishes on every push to `main`.
4. For a project page (`username.github.io/<repo>`), set `base_url` in
   `site/config.yaml` to that URL.

### Option C — Vercel

Framework preset **Other**, build command `pip install -r requirements.txt &&
python3 site/build.py`, output directory `dist`.

---

## Before you publish — quick checklist

- `python site/build.py` completes without error.
- `Rscript analysis/cricket/india_nz_3rd_t20i.R` passes all validation checks.
- New stats match the analysis output (nothing hand-typed and unchecked).
- Every image has `alt` text; every chart is introduced and interpreted.
- Nav links, article pages, filters and search all work in `--serve` preview.
- `base_url` in `site/config.yaml` and the contact links are set to your real
  details.

#!/usr/bin/env python3
"""
Static site generator for the sports-analytics portfolio.

Why a small custom generator? The brief wants a fast, maintainable, fully
static editorial site with a Markdown content workflow and no server needed to
read an article. Node/Astro is not available in this environment, so this uses
Python + Jinja2 + Markdown (all present in the local Anaconda install) to the
same end: add a Markdown file with frontmatter, run the build, deploy the
`dist/` folder to any static host.

Usage:
    python site/build.py            # build into dist/
    python site/build.py --serve    # build, then serve dist/ on :8000

Content lives in site/content/<section>/*.md with YAML frontmatter.
Templates live in site/templates/. Static assets in site/static/.
"""
from __future__ import annotations

import argparse
import datetime as dt
import math
import os
import re
import shutil
import sys
from pathlib import Path

import yaml
import markdown as md
from jinja2 import Environment, FileSystemLoader, select_autoescape

ROOT = Path(__file__).resolve().parent
PROJECT_ROOT = ROOT.parent
CONTENT_DIR = ROOT / "content"
TEMPLATE_DIR = ROOT / "templates"
STATIC_DIR = ROOT / "static"
DIST = PROJECT_ROOT / "dist"

SECTIONS = {
    "cricket": {
        "name": "Cricket",
        "accent": "lime",
        "categories": ["Match Analysis", "Data Stories"],
        "filters": True,   # show the category filter
        "blurb": "Match breakdowns and data-led cricket stories.",
    },
    "football": {
        "name": "Football",
        "accent": "cyan",
        "categories": [],      # no sub-categories — everything together
        "filters": False,
        "blurb": "Player comparisons, tactical work and football data stories.",
    },
}

WORDS_PER_MIN = 220


# --------------------------------------------------------------------------- #
# Content loading
# --------------------------------------------------------------------------- #
def parse_frontmatter(text: str):
    """Split a Markdown file into (frontmatter dict, body)."""
    if text.startswith("---"):
        parts = text.split("---", 2)
        if len(parts) >= 3:
            fm = yaml.safe_load(parts[1]) or {}
            return fm, parts[2].lstrip("\n")
    return {}, text


def reading_time(body: str) -> int:
    # Count prose words only: drop HTML tags and their attributes so embedded
    # chart/callout markup doesn't inflate the estimate.
    prose = re.sub(r"<[^>]+>", " ", body)
    words = len(re.findall(r"[A-Za-z0-9']+", prose))
    return max(1, round(words / WORDS_PER_MIN))


def render_markdown(body: str) -> str:
    return md.markdown(
        body,
        extensions=["extra", "attr_list", "toc", "tables", "sane_lists"],
        output_format="html5",
    )


def load_articles():
    """Load every article across sections. Returns list of dicts."""
    articles = []
    for section in SECTIONS:
        sdir = CONTENT_DIR / section
        if not sdir.exists():
            continue
        for path in sorted(sdir.glob("*.md")):
            raw = path.read_text(encoding="utf-8")
            fm, body = parse_frontmatter(raw)
            if fm.get("draft"):
                continue
            slug = fm.get("slug") or path.stem
            date_val = fm.get("date")
            if isinstance(date_val, dt.datetime):
                date_val = date_val.date()
            html = render_markdown(body)
            articles.append({
                "section": section,
                "section_name": SECTIONS[section]["name"],
                "accent": SECTIONS[section]["accent"],
                "slug": slug,
                "url": f"/{section}/{slug}/",
                "title": fm.get("title", slug),
                "description": fm.get("description", ""),
                "standfirst": fm.get("standfirst", fm.get("description", "")),
                "date": date_val,
                "date_display": date_val.strftime("%d %B %Y") if date_val else "",
                "category": fm.get("category", "Data Stories"),
                "tags": fm.get("tags", []) or [],
                "cover": fm.get("cover", ""),
                "cover_alt": fm.get("cover_alt", fm.get("title", "")),
                "author": fm.get("author", "Pranav Arakkal"),
                "sources": fm.get("sources", []) or [],
                "methodology": fm.get("methodology", ""),
                "featured": bool(fm.get("featured", False)),
                "reading_time": fm.get("reading_time") or reading_time(body),
                "body_html": html,
                "related": fm.get("related", []) or [],
                "medium": fm.get("medium", ""),
            })
    # newest first
    articles.sort(key=lambda a: (a["date"] or dt.date.min), reverse=True)
    return articles


def load_projects():
    pdir = CONTENT_DIR / "projects"
    projects = []
    if not pdir.exists():
        return projects
    for path in sorted(pdir.glob("*.md")):
        raw = path.read_text(encoding="utf-8")
        fm, body = parse_frontmatter(raw)
        if fm.get("draft"):
            continue
        slug = fm.get("slug") or path.stem
        date_val = fm.get("date")
        if isinstance(date_val, dt.datetime):
            date_val = date_val.date()
        projects.append({
            "slug": slug,
            "url": f"/projects/{slug}/",
            "title": fm.get("title", slug),
            "research_question": fm.get("research_question", ""),
            "competition": fm.get("competition", ""),
            "date_range": fm.get("date_range", ""),
            "dataset": fm.get("dataset", ""),
            "source": fm.get("source", ""),
            "tools": fm.get("tools", []) or [],
            "repo": fm.get("repo", ""),
            "app": fm.get("app", ""),
            "accent": fm.get("accent", "lime"),
            "cover": fm.get("cover", ""),
            "cover_alt": fm.get("cover_alt", fm.get("title", "")),
            "summary": fm.get("summary", ""),
            "date": date_val,
            "date_display": date_val.strftime("%d %B %Y") if date_val else "",
            "body_html": render_markdown(body),
            "status": fm.get("status", ""),
        })
    projects.sort(key=lambda p: (p["date"] or dt.date.min), reverse=True)
    return projects


def load_medium(config):
    """Fetch the Medium RSS feed and return external article stubs.

    These link straight to Medium (write once, there). They are cached to
    site/.cache/medium.xml so the build still works offline. Classification
    into cricket/football is by keyword; anything else is skipped so only
    sport pieces surface. Returns a list shaped like local articles but with
    `external=True` and `url` pointing at Medium.
    """
    import urllib.request
    import xml.etree.ElementTree as ET

    feed = (config.get("medium_feed") or "").strip()
    if not feed:
        return []

    cache_dir = ROOT / ".cache"
    cache_dir.mkdir(exist_ok=True)
    cache = cache_dir / "medium.xml"
    xml_text = None
    try:
        req = urllib.request.Request(feed, headers={"User-Agent": "Mozilla/5.0 (portfolio build)"})
        with urllib.request.urlopen(req, timeout=15) as resp:
            xml_text = resp.read().decode("utf-8", "replace")
        cache.write_text(xml_text, encoding="utf-8")
        print("  medium: fetched feed")
    except Exception as e:  # offline or blocked — fall back to cache
        if cache.exists():
            xml_text = cache.read_text(encoding="utf-8")
            print(f"  medium: using cached feed ({e})")
        else:
            print(f"  medium: unavailable, skipping ({e})")
            return []

    try:
        root = ET.fromstring(xml_text)
    except ET.ParseError:
        return []

    ns = {"content": "http://purl.org/rss/1.0/modules/content/"}
    # Whole-word keyword match (so "odi" doesn't match "podium"). Title is
    # weighted by checking it first.
    cric_kw = ("cricket", "t20", "t20i", "ipl", "odi", "wpl", "batting", "bowling",
               "rcb", "bazball", "padikkal", "sooryavanshi", "wicket", "innings",
               "test match", "bowler", "batsman", "batter")
    foot_kw = ("football", "euro", "rodri", "rice", "midfield", "midfielder",
               "premier league", "winger", "striker", "finisher", "statsbomb",
               "defender", "fullback", "xg")

    def has_kw(text, kws):
        return any(re.search(r"\b" + re.escape(k) + r"\b", text) for k in kws)

    out = []
    for item in root.iter("item"):
        title = (item.findtext("title") or "").strip()
        link = (item.findtext("link") or "").split("?")[0]
        pub = item.findtext("pubDate") or ""
        html = item.findtext("content:encoded", namespaces=ns) or ""
        text = re.sub(r"<[^>]+>", " ", html).lower()
        title_l = title.lower()
        # Classify on the title first; fall back to body. This keeps an F1 piece
        # (no cricket/football words in its title) from matching a stray body word.
        if has_kw(title_l, cric_kw):
            section = "cricket"
        elif has_kw(title_l, foot_kw):
            section = "football"
        elif has_kw(text, cric_kw) and not has_kw(text, foot_kw):
            section = "cricket"
        elif has_kw(text, foot_kw) and not has_kw(text, cric_kw):
            section = "football"
        else:
            continue
        # parse RFC822 date
        try:
            date_val = dt.datetime.strptime(pub[:25].strip(), "%a, %d %b %Y %H:%M:%S").date()
        except Exception:
            date_val = None
        # first paragraph as a description
        first_p = re.search(r"<p>(.*?)</p>", html, re.S)
        desc = re.sub(r"<[^>]+>", "", first_p.group(1)).strip() if first_p else ""
        desc = re.sub(r"\s+", " ", desc)[:180]
        out.append({
            "section": section,
            "section_name": SECTIONS[section]["name"],
            "accent": SECTIONS[section]["accent"],
            "slug": None,
            "url": link,
            "external": True,
            "title": title,
            "description": desc,
            "standfirst": desc,
            "date": date_val,
            "date_display": date_val.strftime("%d %B %Y") if date_val else "",
            "category": "Data Stories",
            "tags": [],
            "cover": "",
            "cover_alt": title,
            "author": config["author"],
            "reading_time": max(1, round(len(re.findall(r"[A-Za-z0-9']+", text)) / WORDS_PER_MIN)),
        })
    print(f"  medium: {len(out)} sport articles")
    return out


def load_page(name: str):
    path = CONTENT_DIR / "pages" / f"{name}.md"
    if not path.exists():
        return {}, ""
    raw = path.read_text(encoding="utf-8")
    fm, body = parse_frontmatter(raw)
    return fm, render_markdown(body)


# --------------------------------------------------------------------------- #
# Rendering
# --------------------------------------------------------------------------- #
def make_env(config):
    env = Environment(
        loader=FileSystemLoader(str(TEMPLATE_DIR)),
        autoescape=select_autoescape(["html", "xml"]),
        trim_blocks=True,
        lstrip_blocks=True,
    )
    env.globals["config"] = config
    env.globals["sections"] = SECTIONS
    env.globals["now"] = dt.datetime.now()
    return env


def write(path: Path, html: str):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(html, encoding="utf-8")


def related_for(article, all_articles):
    """Resolve related articles by slug, else fall back to same section."""
    by_slug = {a["slug"]: a for a in all_articles if a.get("slug")}
    rel = [by_slug[s] for s in article["related"] if s in by_slug]
    if len(rel) < 3:
        same = [a for a in all_articles
                if a["section"] == article["section"] and a["slug"] != article["slug"]
                and a not in rel]
        rel += same[: 3 - len(rel)]
    return rel[:3]


def build(serve=False):
    config = yaml.safe_load((ROOT / "config.yaml").read_text(encoding="utf-8"))
    env = make_env(config)

    articles = load_articles()
    projects = load_projects()

    # Merge in Medium articles (write-once-on-Medium). Suppress any Medium post
    # that already has a local article pointing at it (via frontmatter `medium:`)
    # so nothing is duplicated.
    local_medium_urls = {a.get("medium", "").split("?")[0] for a in articles if a.get("medium")}
    local_titles = {a["title"].strip().lower() for a in articles}
    medium_articles = [
        ma for ma in load_medium(config)
        if ma["url"].split("?")[0] not in local_medium_urls
        and ma["title"].strip().lower() not in local_titles
    ]
    for a in articles:
        a.setdefault("external", False)
    all_articles = articles + medium_articles
    all_articles.sort(key=lambda a: (a["date"] or dt.date.min), reverse=True)
    # listings use the merged set; article *pages* are built only for local ones.
    articles_local = articles
    articles = all_articles

    # Fresh dist
    if DIST.exists():
        shutil.rmtree(DIST)
    DIST.mkdir(parents=True)

    # Static assets
    if STATIC_DIR.exists():
        shutil.copytree(STATIC_DIR, DIST, dirs_exist_ok=True)

    pages_built = []

    # ---- Homepage --------------------------------------------------------- #
    featured = next((a for a in articles if a["featured"]), articles[0] if articles else None)
    cricket_articles = [a for a in articles if a["section"] == "cricket"]
    football_articles = [a for a in articles if a["section"] == "football"]
    about_fm, about_html = load_page("about")
    write(DIST / "index.html", env.get_template("home.html").render(
        cricket_articles=cricket_articles[:4],
        football_articles=football_articles[:4],
        latest=articles[:6],
        page_title=config["title"],
        page_desc=config["description"],
        canonical="/",
    ))
    pages_built.append("/")

    # ---- Section listing pages ------------------------------------------- #
    for section, meta in SECTIONS.items():
        sec_articles = [a for a in articles if a["section"] == section]
        sec_featured = next((a for a in sec_articles if a["featured"]),
                            sec_articles[0] if sec_articles else None)
        rest = [a for a in sec_articles if a is not sec_featured]
        write(DIST / section / "index.html", env.get_template("section.html").render(
            section=section, meta=meta,
            featured=sec_featured, articles=rest, all_count=len(sec_articles),
            page_title=f"{meta['name']} — {config['title']}",
            page_desc=meta["blurb"],
            canonical=f"/{section}/",
        ))
        pages_built.append(f"/{section}/")

        # ---- Article pages (local only; Medium posts link out) ----------- #
        for a in [x for x in sec_articles if not x.get("external")]:
            write(DIST / section / a["slug"] / "index.html",
                  env.get_template("article.html").render(
                      a=a, meta=meta,
                      related=related_for(a, articles),
                      page_title=f"{a['title']} — {config['title']}",
                      page_desc=a["description"],
                      canonical=a["url"],
                      og_image=a["cover"],
                  ))
            pages_built.append(a["url"])

    # ---- Projects -------------------------------------------------------- #
    write(DIST / "projects" / "index.html", env.get_template("projects.html").render(
        projects=projects,
        page_title=f"Projects — {config['title']}",
        page_desc="Larger, reproducible cricket and football analysis projects.",
        canonical="/projects/",
    ))
    pages_built.append("/projects/")
    for p in projects:
        write(DIST / "projects" / p["slug"] / "index.html",
              env.get_template("project.html").render(
                  p=p,
                  page_title=f"{p['title']} — {config['title']}",
                  page_desc=p["summary"] or p["research_question"],
                  canonical=p["url"],
                  og_image=p["cover"],
              ))
        pages_built.append(p["url"])

    # ---- About ----------------------------------------------------------- #
    write(DIST / "about" / "index.html", env.get_template("about.html").render(
        body_html=about_html, fm=about_fm,
        page_title=f"About — {config['title']}",
        page_desc=about_fm.get("description", config["description"]),
        canonical="/about/",
    ))
    pages_built.append("/about/")

    # ---- 404 ------------------------------------------------------------- #
    write(DIST / "404.html", env.get_template("404.html").render(
        page_title="Not found", page_desc="", canonical="/404.html"))

    # ---- sitemap.xml + robots.txt + RSS ---------------------------------- #
    base = config["base_url"].rstrip("/")
    urls = sorted(set(pages_built))
    sitemap = env.get_template("sitemap.xml").render(base=base, urls=urls, articles=articles)
    write(DIST / "sitemap.xml", sitemap)
    write(DIST / "robots.txt", f"User-agent: *\nAllow: /\nSitemap: {base}/sitemap.xml\n")
    rss = env.get_template("rss.xml").render(base=base, articles=articles_local[:20])
    write(DIST / "rss.xml", rss)

    print(f"Built {len(pages_built)} pages into {DIST}")
    print(f"  articles: {len(articles)}  projects: {len(projects)}")

    if serve:
        import functools
        import http.server
        import socketserver
        port = 8000
        # Bind the handler to dist/ explicitly rather than chdir-ing into it,
        # so a later rebuild (which recreates dist/) can't break the server's
        # working directory.
        handler = functools.partial(http.server.SimpleHTTPRequestHandler,
                                    directory=str(DIST))
        socketserver.TCPServer.allow_reuse_address = True
        with socketserver.TCPServer(("", port), handler) as httpd:
            print(f"Serving {DIST} at http://localhost:{port} (Ctrl-C to stop)")
            httpd.serve_forever()


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--serve", action="store_true", help="serve dist/ after building")
    args = ap.parse_args()
    build(serve=args.serve)

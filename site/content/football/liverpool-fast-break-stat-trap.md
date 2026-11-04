---
title: "The Stat That Lied About Liverpool's Counter-Attacks"
slug: "liverpool-fast-break-stat-trap"
description: "A tag in the data made Slot's Liverpool look like they counter-attacked twice as much as Klopp's. Count the counters yourself and the gap mostly vanishes. A story about trusting a number you didn't build."
standfirst: "The numbers said Slot's Liverpool took more than twice as many shots on the break as Klopp's. It looked like a real tactical shift. Then I counted the counters myself, and the whole thing got a lot smaller."
date: 2026-11-05
category: "Data Stories"
tags: ["Premier League", "Liverpool", "Jurgen Klopp", "Arne Slot", "counter-attack", "data quality", "openplay"]
cover: "/images/slot_v_klopp_cover.jpg"
cover_alt: "Split graphic of Arne Slot and Jurgen Klopp, both in Liverpool training kit, facing away from each other"
author: "Pranav Arakkal"
featured: false
medium: ""
methodology: >-
  Built in Python from openplay event data (Noah Bair, CC-BY 4.0) for the
  Premier League, 2014/15 to 2025/26. The two title seasons are Klopp's 2019/20
  and Slot's 2024/25, 38 league games each. "Fast-break shots" are shots the
  data provider tagged with the Fast Break play-pattern. The self-counted
  definition: a counter starts when a team wins the ball in its own half (a
  recovery, interception, tackle, keeper pick-up, claim or save), and counts if
  the team reaches the final third within 10 seconds before losing the ball,
  shooting, or 15 seconds passing; a "counter shot" is one that ends in a shot.
  The same rules were run for all 20 teams each season, and the ranking holds
  across other thresholds (6 to 15 seconds, ball won before the halfway line or
  deeper). Every team is faced once home and once away, so venue is balanced.
sources:
  - label: "openplay — open men's soccer event data with xG (Noah Bair), CC-BY 4.0"
    url: "https://github.com/nlbair/openplay"
  - label: "Premier League — How do Liverpool's title-winning teams of Klopp and Slot compare? (Alex Keble)"
    url: "https://www.premierleague.com/en/news/4288372"
  - label: "Cover image: Coaches' Voice"
related:
  - "klopp-slot-liverpool-title-sides"
---
When I was comparing Liverpool's two title-winning sides, one number jumped off the screen. Shots from fast breaks: **0.74 a game under Klopp in 2019/20, and 1.74 under Slot in 2024/25.** More than double.

That's a great headline. It fits the story everyone tells, too: Klopp's side kept the ball and squeezed teams high, Slot's sat a bit deeper and sprang forward on the counter. The data seemed to prove it.

So of course I wrote it down and moved on. And then it nagged at me, because the number came from a label I hadn't checked. This is the story of what happened when I did.

## Who decides what a "fast break" is?

Here's the thing about that 0.74-to-1.74 jump: I didn't define a fast break. The company that collects the data did. Every shot in the dataset comes with a little label saying how the move started, and one of the options is "Fast Break." I just counted the ones that carried the tag.

That's fine, as long as the tag means the same thing from one season to the next. So I checked. I pulled every shot in the Premier League since 2014/15 and asked a simple question: what share of all shots, across the whole league, got the "Fast Break" tag each season?

<figure class="chart-figure">
  <img src="/charts/football/fastbreak_tag_drift.png" alt="Line chart from 2014/15 to 2025/26 showing the share of all shots tagged Fast Break. Both the whole-league line and Liverpool's line climb from about 1-2% early on to about 7% by 2024/25, moving together. Klopp's 2019/20 and Slot's 2024/25 are circled.">
  <figcaption>The share of shots tagged "Fast Break" climbed steadily for the whole league, not just Liverpool. Both lines rise together.
  <span class="chart-source">openplay event data, Premier League 2014/15 to 2025/26.</span></figcaption>
</figure>

Look at the grey line, the whole league. In the mid-2010s, about 1-2% of all shots were tagged as fast breaks. By 2024/25 it was about 7%. The tag didn't stay still. Either teams across the league all started counter-attacking three or four times as much (unlikely), or the people doing the tagging simply got more generous with the label over the years (far more likely).

And Liverpool's line rides right along with the league's. So a good chunk of that "0.74 to 1.74" jump isn't Liverpool changing. It's the same drift that lifted everyone. I'd caught a rising tide and called it a Liverpool wave.

## Count them yourself

The fix is to stop trusting the label and define a counter-attack with rules I can write down and you can argue with. Mine:

- It **starts** when a team wins the ball in its **own half** (a tackle, interception, loose-ball recovery, or the keeper claiming it).
- It **counts as a counter** if the team reaches the **final third within 10 seconds** of winning it.
- It's a **counter shot** if that move ends in a shot.

No magic, no hidden tagging. And crucially, I ran the exact same rules for all 20 teams in each season, so Liverpool's number only means something next to everyone else's.

<figure class="chart-figure">
  <img src="/charts/football/fastbreak_league_rank.png" alt="Two ranked bar charts of counter-attacks ending in a shot per match, one per season, all 20 teams, Liverpool highlighted in red. In 2019/20 Liverpool are 3rd behind Man Utd and Wolves; in 2024/25 Liverpool are 1st, just ahead of Chelsea.">
  <figcaption>Counter-attacks that ended in a shot, counted with my own rules, ranked across the league. Klopp's side 3rd, Slot's 1st, but both well above the pack.
  <span class="chart-source">openplay event data, Premier League 2019/20 and 2024/25.</span></figcaption>
</figure>

Now the picture is calmer, and more interesting. By my count, Klopp's side made **1.21 counter shots a game** (3rd in the league) and Slot's made **1.37** (1st). Slot's side was still better at it, but the gap is a fraction of what the tag suggested, not "more than double".

And here's the number I like best. If you take how often each team *wins the ball deep* and ask what share of those turn into a quick counter, both title sides land at almost exactly the same spot: **about 12 counters per 100 deep ball-wins, against a league average of 8.** Once they'd won it back, Klopp's side and Slot's side broke forward at the same rate. The headline wasn't "Slot counter-attacked more." It was "both of these teams were elite at it, and always had been."

I tried wrecking this conclusion, too: shorter time windows, longer ones, winning the ball deeper or higher up. Slot's side ranked top in every single version. The finding is sturdy. It's just a much smaller finding than the raw tag implied.

## One thing that *did* change

So if both sides countered about as well, what actually moved? The man on the end of it.

Salah took the most counter shots under both managers, but the cast around him changed completely. Under Klopp, the next names were Mané, Oxlade-Chamberlain and Firmino. Under Slot, it was Gakpo, Szoboszlai, Díaz and Jones. And the route changed: under Klopp, counters that ended in a shot mostly went through the middle or down the left. Under Slot, nearly half came down Liverpool's right, which is exactly where Salah moved to live (a shift I dug into in the [main Klopp-vs-Slot piece](/football/klopp-slot-liverpool-title-sides/)).

So the counter-attack didn't get more frequent so much as it got **re-routed**, down Salah's side.

## The actual lesson

I almost published "Slot's Liverpool counter-attacked twice as much as Klopp's." It would have looked authoritative. It had a number, a source, a tidy narrative. It was also mostly wrong, because the number was measuring the data company's labelling habits as much as Liverpool's football.

The tag wasn't useless. It points at something real, and when I built my own version the direction survived. But the *size* of the effect was an illusion, and the only way to find that out was to stop trusting a number I hadn't built and rebuild it from the raw events.

That's the whole job, really. A stat with a confident label is the easiest thing in the world to repeat. Checking whether it means what you think it means is slower, less fun, and the only part that actually counts.

Count the counters yourself.

---
title: "Same Reds, Different Beat: Klopp's 99 vs Slot's 84"
slug: "klopp-slot-liverpool-title-sides"
description: "Two Liverpool title teams, five shared players, two very different styles. The data behind Klopp's 2019/20 and Slot's 2024/25: a quieter press, a sharper right side, and why 99 points flattered a team Slot's chances say was better."
standfirst: "Klopp's Liverpool won 99 points. Slot's won 84. But the chances each team created say the gap is the other way round. Here's what actually changed, and what only looks like it did."
date: 2026-11-04
category: "Data Stories"
tags: ["Premier League", "Liverpool", "Jurgen Klopp", "Arne Slot", "tactics", "xG", "openplay"]
cover: "/images/slot_v_klopp_cover.jpg"
cover_alt: "Split graphic of Arne Slot and Jurgen Klopp, both in Liverpool training kit, facing away from each other"
author: "Pranav Arakkal"
featured: true
medium: ""
methodology: >-
  Built in Python from openplay event data (Noah Bair, CC-BY 4.0) for the
  Premier League. The two seasons are Klopp's title year, 2019/20, and Slot's,
  2024/25, 38 league games each. Possession is each team's share of the match's
  passes (the dataset's possession_pct column overflows and is rebuilt here).
  PPDA is the opponent's passes in their own 60% of the pitch divided by
  Liverpool's tackles, interceptions, challenges and fouls there; lower means a
  harder press. Expected points come from a Poisson-binomial model: each shot's
  xG is treated as a weighted coin, the per-match win/draw/loss chances are
  summed into points, and the season total is compared with points actually won.
  League-wide expected points match actual points to within about 1%. Fast
  breaks use the data provider's play-pattern tag. xG is openplay's model, so
  totals differ from other providers; the direction should hold.
sources:
  - label: "openplay — open men's soccer event data with xG (Noah Bair), CC-BY 4.0"
    url: "https://github.com/nlbair/openplay"
  - label: "Premier League — How do Liverpool's title-winning teams of Klopp and Slot compare? (Alex Keble)"
    url: "https://www.premierleague.com/en/news/4288372"
  - label: "Coaches' Voice — Jurgen Klopp and Arne Slot tactics comparison"
    url: "https://learning.coachesvoice.com/cv/arne-slot-jurgen-klopp-tactics/"
  - label: "Tifo Football (The Athletic) — The difference between Slot and Klopp at Liverpool"
    url: "https://www.youtube.com/watch?v=hO4AZx7jpxw"
  - label: "Cover image: Coaches' Voice"
related:
  - "rodri-rice-euro-2024-progressions"
---
Jürgen Klopp's Liverpool won the title with **99 points**. Arne Slot's won it with **84**. Easy, then: Klopp's was the better team, and Slot just kept the seat warm.

Hold on. Five of the same players started both title runs: Alisson, Van Dijk, Alexander-Arnold, Robertson and Salah. Same spine, same club, five years apart, two different bosses. So I pulled the ball-by-ball data for both seasons and asked a simple question: what actually changed, and what only looks like it did?

The short version: the press got quieter, the right side got sharper, and the 99 points flattered a team that, by the chances it created, was not as good as the one that came after it.

## Same engine, different gears

Start with how the two teams played. Not how well, just *how*.

<figure class="chart-figure">
  <img src="/charts/football/klopp_slot_style.png" alt="Bar chart comparing Klopp 2019/20 and Slot 2024/25 per match: possession 63% vs 58%, passes 680 vs 571, non-penalty xG 1.7 vs 2.0, fast-break shots 0.7 vs 1.7, PPDA 9.8 vs 9.7, shots against 9.0 vs 10.2">
  <figcaption>Each pair of bars is scaled so Klopp's side sits at 100. The numbers are the real per-match values.
  <span class="chart-source">openplay event data, Premier League 2019/20 and 2024/25.</span></figcaption>
</figure>

Klopp's side had more of the ball: 63% possession against 58%, and about 110 more passes a game. That fits the memory. The surprise is what Slot's side did with less of it. It created **more** non-penalty xG (2.0 a game against 1.7) and took **more than twice as many** shots on the counter (1.74 a game against 0.74). The team that supposedly slowed everything down was the one breaking faster.

One number barely moved: the press. PPDA, which measures how quickly a team swarms the ball back, was 9.8 for Klopp's side and 9.7 for Slot's. On this measure they pressed just as hard.

That last point surprised me, because everyone (rightly) remembers Slot calming Liverpool down. The Premier League's own analysis found Slot's side recording a third fewer "pressed sequences" and a quarter fewer ball recoveries than Klopp's. Both can be true: Slot's side still presses hard *when it presses*, but it does so less often and holds a more compact shape the rest of the time. Our data shows the same thing from a different angle, that the team defended about four metres deeper on average even though the intensity of the press itself held up.

## The right side swapped jobs

Here's the change you could see with your own eyes if you knew where to look: the right flank.

Under Klopp, Alexander-Arnold hugged the touchline and whipped it in, while Salah drifted inside to get on the end of things. Under Slot, they traded. Salah stayed high and wide on the right, and Trent came inside to build. The Premier League piece pins a lot on this, that Slot's wingers hold the width while the full-backs tuck in to protect the middle, where Klopp's full-backs flew forward and did the creating.

The shot maps show the result. Here's every open-play shot Salah took in each season.

<figure class="chart-figure">
  <img src="/charts/football/klopp_slot_salah.png" alt="Two half-pitch shot maps of Mohamed Salah's open-play shots. Under Klopp the shots cluster centrally in and around the box; under Slot they shift noticeably to the right side of the box. Goals marked in gold.">
  <figcaption>Salah's open-play shots, attacking left to right. Dot size is the chance quality (xG); gold is a goal. Under Slot the whole cluster slides right.
  <span class="chart-source">openplay event data, Premier League 2019/20 and 2024/25.</span></figcaption>
</figure>

Same player, same goal, different postcode. Under Klopp his shots pile up through the middle of the box. Under Slot they shift to the right channel, exactly where a wide forward who stays wide would shoot from. He took a few more shots, scored a few more goals (19 to 15 in open play), and did it from a different spot on the pitch.

The flip side is the full-backs. In 2019/20 Alexander-Arnold and Robertson combined for 25 league assists. In 2024/25, all of Liverpool's full-back assists came to seven, every one of them Trent's. Klopp's chances came from the full-backs bombing on. Slot's came from Salah and a cleverer midfield.

## The midfield did a different job

Klopp's title midfield was a running machine: Fabinho, Henderson, Wijnaldum. Win it, move it, do it again. Three engines, not much fuss.

Slot's three (Gravenberch, Mac Allister, Szoboszlai) did more of the clever stuff. Per 90 minutes on the pitch, Slot's midfield played **51% more key passes** and produced **66% more expected assists** than Klopp's. Their share of the team's chances created jumped from about a quarter to a third. The Premier League's numbers tell the same story in a neater line: Klopp's three main midfielders made 60 open-play chances across the whole season, and Slot's three made 100 in 34 games.

What Slot's midfield did *less* of was win the ball back, down about a quarter per 90. So it isn't that one midfield was better and one worse. One was built to hunt and carry; the other to pick locks. Coaches' Voice frames the structural reason: Klopp pressed with a front three and three central midfielders, Slot with a front two and a double pivot sitting behind a number ten, which gives more cover and lets the clever players stay higher.

## So why 99 and 84?

This is the fun bit, because the honest answer flips the question.

To separate "how good were the chances" from "how many points did they get", I worked out each team's **expected points**. The idea: take every shot in a match, treat its xG as the chance it goes in, and work out how likely each scoreline was. That gives you the points a team would *usually* take from the chances in that game. Add it up over the season. (As a sanity check, every team's expected points across the league adds up to within about 1% of the points actually won, so the method isn't tilted.)

<figure class="chart-figure">
  <img src="/charts/football/klopp_slot_points_vs_xpts.png" alt="Bar chart. Klopp 2019/20: 99 points won (1st in the league), 72 expected on chances (3rd). Slot 2024/25: 84 points won (1st), 81 expected (1st).">
  <figcaption>Points won against the points the chances were "worth". Klopp's side won 27 more than its chances deserved, the biggest overperformance of any team in the data.
  <span class="chart-source">openplay event data, Premier League, all seasons 2014/15 to 2025/26.</span></figcaption>
</figure>

Klopp's 99-point side created and allowed chances worth about **72 points**, third-best in the league that year behind Manchester City. It won 99. That's **27 points more than it "should" have**, and across every team-season in the data (that's 240 of them), nobody overperformed by more. Slot's side created chances worth about **80 points, the best in the league**, and won 84. Almost bang on.

So by the quality of the football, measured in chances made and chances allowed, **Slot's side was the stronger of the two**. Klopp's side was the one that squeezed every last point out of what it had.

Where did those extra points come from? Three places, all pulling the same way:

- **Finishing and goalkeeping.** Klopp's side scored about 18 goals more than its chances suggested and conceded a couple fewer. Slot's finished roughly in line with its chances.
- **The big games.** Against the six best teams, Klopp's side took 31 points from 12 matches. Slot's took 20, despite creating slightly better chances in them.
- **The last ten minutes.** Klopp's side gained 10 points from goals after the 80th minute and never lost one late. Slot's gained 6 and lost 5.

None of that is fake. Scoring more than your chances suggest, year after year, is a real skill, and Klopp's attack beat its xG for eight seasons running. But a +27 season is the kind of thing that doesn't repeat, and sure enough, Liverpool fell back the very next year. The 99 was a brilliant team catching a brilliant run at the same time.

## One man did a lot of it

There's a catch to Slot's season, and his name is Mohamed Salah. In 2019/20 Salah scored or assisted 34% of Liverpool's league goals. In 2024/25 that number was **57.5%**. More than half the team ran through one 32-year-old.

Klopp had Salah too, but he also had Mané chipping in 18 goals and seven assists, and two full-backs serving up 25 assists between them. The load was spread. Slot's title leaned on Salah in a way Klopp's never had to, which is a strength when your best player is having the season of his life, and a worry the moment he isn't.

## Did either of them change for the opponent?

Andy Robertson has said Klopp trusted his way and didn't fuss much about the other team, while Slot was deep into the numbers and how each opponent played. I tried to test it: I sorted the other 19 teams into types (do they keep the ball, do they play it forward quickly) and checked how Liverpool's own style shifted against each type.

The honest result is a shrug. Both teams adjusted in the same direction, pressing a bit less and sitting a bit deeper against the strong possession sides. Slot's pressing intensity varied with the opponent a little more than Klopp's, in every way I cut the data, but not by enough to call it real on one season of games. Klopp's long-ball share actually varied *more* with the opponent, though that's partly good teams forcing it rather than a plan. Neither changed shape: Klopp played his 4-3-3 in 35 of 38 games, Slot his 4-2-3-1 in 35 of 38. So the data neither crowns Robertson right nor proves him wrong. It just won't say much on 38 games each.

## What the data can't see

A few honest limits. This is event data: it records what happened on the ball, not what a coach asked for, so a team pushed deep by City looks the same as one told to sit. The xG is openplay's model, so another provider would shift the exact numbers (the direction should hold). 2019/20 was also the COVID season, finished in empty stadiums, which is context no spreadsheet captures. And two title runs is a tiny sample to pin a manager's philosophy on.

## The verdict

Klopp's 99-point side was the more *dominant* team, and the more *clinical* one. It pressed high, ran hard, leaned on flying full-backs, and converted its chances better than any team in the data. The reputation is earned.

But Slot's 84-point side, by the chances it created and allowed, was quietly the *better* team on the pitch, helped by Salah's insane run.

Same club. A different coach/manager. Both champions.

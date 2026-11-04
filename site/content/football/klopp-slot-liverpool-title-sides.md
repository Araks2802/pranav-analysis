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
  League-wide expected points match actual points to within about 1%.
  Counter-attacks are counted from the events, not the provider's "Fast Break"
  tag (which has grown more common league-wide over time): a counter starts
  when a team wins the ball in its own half and counts if it reaches the final
  third within 10 seconds and ends in a shot, with the same rules run for all
  20 teams. Opponents are classified from their matches against everyone except
  Liverpool, split at each season's median possession and verticality
  (progressive passes per 100 passes). Average positions use the median of a
  player's touches (and, separately, defensive actions) for the season's
  most-used XI. xG is openplay's model, so totals differ from other providers;
  the direction should hold.
sources:
  - label: "openplay — open men's soccer event data with xG (Noah Bair), CC-BY 4.0"
    url: "https://github.com/nlbair/openplay"
  - label: "Premier League — How do Liverpool's title-winning teams of Klopp and Slot compare? (Alex Keble)"
    url: "https://www.premierleague.com/en/news/4288372"
  - label: "Coaches' Voice — Jurgen Klopp and Arne Slot tactics comparison"
    url: "https://learning.coachesvoice.com/cv/arne-slot-jurgen-klopp-tactics/"
  - label: "Tifo Football (The Athletic) — The difference between Slot and Klopp at Liverpool"
    url: "https://www.youtube.com/watch?v=hO4AZx7jpxw"
  - label: "Squawka — Tactical explainer: what is a fast break? (Opta's definition)"
    url: "https://www.squawka.com/en/features/fast-breaks-explained/"
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

Klopp's side had more of the ball: 63% possession against 58%, and about 110 more passes a game. That fits the memory. The surprise is what Slot's side did with less of it. It created **more** non-penalty xG (2.0 a game against 1.7), and the raw data says it took far more shots on the counter too. That second claim turned out to need a hard look, and I've given it one further down, because the number is not what it first seems.

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

You can see the whole swap in where everyone stood. Here's the average position of each player across the season, worked out from the middle of all their touches.

<figure class="chart-figure">
  <img src="/charts/football/klopp_slot_avg_positions.png" alt="Two pitch maps of Liverpool's average player positions. Under Klopp (4-3-3), Alexander-Arnold is deep and wide on the right touchline while Salah sits infield near the box. Under Slot (4-2-3-1), Salah is wide on the right touchline and Alexander-Arnold has tucked inside; the front line is wider and the full-backs sit deeper.">
  <figcaption>Average position of each player, both title sides. Each dot is the middle of a player's touches across the season; bigger dots mean more touches. Attacking left to right, right touchline at the bottom.
  <span class="chart-source">openplay event data, Premier League 2019/20 and 2024/25.</span></figcaption>
</figure>

Look at the right edge. Under Klopp, Alexander-Arnold is the widest man on the pitch and Salah tucks inside him. Under Slot, they've switched: Salah is the one hugging the line, with Trent pulled infield next to the midfield. The front line is wider too, and both full-backs sit a touch deeper, which is the "full-backs tuck in to protect the middle" idea in one picture.

The flip side is the full-backs. In 2019/20 Alexander-Arnold and Robertson combined for 25 league assists. In 2024/25, all of Liverpool's full-back assists came to seven, every one of them Trent's. Klopp's chances came from the full-backs bombing on. Slot's came from Salah and a cleverer midfield.

There's one more way to see the whole thing at once: where each player stood, with the ball and without it.

<figure class="chart-figure">
  <img src="/charts/football/klopp_slot_with_without_ball.png" alt="A 2x2 grid of pitch maps. Top row: average position with the ball. Bottom row: average position when defending. Under Klopp the full-backs sit wide and high with the ball; under Slot Salah holds the right touchline and the full-backs are deeper. Defending, both teams drop into a compact block, Slot's a touch deeper.">
  <figcaption>Each dot is a player's median position across the season. Top row is with the ball, bottom row is defending. Attacking left to right; bigger dots mean more of the ball (or more defending).
  <span class="chart-source">openplay event data, Premier League 2019/20 and 2024/25.</span></figcaption>
</figure>

The top row is the attacking shape, and it's where the right-side swap jumps out: Klopp's Alexander-Arnold is the widest man on the pitch, Slot's Salah is. The bottom row is the same eleven when the other team has it, and both collapse into a tidy block, Slot's sitting a little deeper. It's a neat picture of a side that attacks with freedom and defends with shape.

## The counter-attack that got re-routed, not revved up

Remember that claim from the top, that Slot's side took far more shots on the counter? The raw number said 0.74 a game under Klopp and 1.74 under Slot, more than double. It fits the story so perfectly that I nearly ran with it. Then I noticed the number came from a label I hadn't checked.

A "fast break" in this data is the provider's own tag. [Opta defines it](https://www.squawka.com/en/features/fast-breaks-explained/) as "an attempt created after a team quickly turn defence into attack, winning the ball in their own half." Fine, but is that tag applied the same way every season? I pulled every Premier League shot since 2014/15 and found the share tagged "Fast Break" has climbed steadily for the *whole league*, from about 1-2% of shots in the mid-2010s to around 7% now. Liverpool rode that same rising tide. (Squawka, using the same data, clocked a record league average of 2.04 fast breaks a game last season.) So a big chunk of that "0.74 to 1.74" jump isn't Liverpool. It's the label getting more generous.

So I counted counters myself, with rules I can show you: the ball won in Liverpool's own half, reaching the final third within 10 seconds, ending in a shot, and I ran the exact same rules for all 20 teams. By that count, Klopp's side made **1.21 counter shots a game** and Slot's **1.37** — Slot's still higher, but a world away from "more than double". And measured as a rate (counters per deep ball-win), both title sides land in the same spot, about 12 per 100, against a league average of 8. Both were elite at it. Neither was *more* elite in any way that holds up.

What actually changed was the direction. Here's where every counter that ended in a shot went, coloured by the third of the pitch it ran through.

<figure class="chart-figure">
  <img src="/charts/football/klopp_slot_counter_lanes.png" alt="Two pitch maps of Liverpool's counter-attacks that ended in a shot. Under Klopp the lines spread through the centre (43%) and left (35%). Under Slot nearly half (46%) funnel down Liverpool's right.">
  <figcaption>Every counter that ended in a shot, from where the ball was won to the shot. Lines are coloured by which third they entered the final third through.
  <span class="chart-source">openplay event data, Premier League 2019/20 and 2024/25.</span></figcaption>
</figure>

Under Klopp, counters mostly went through the middle (43%) or down the left (35%). Under Slot, **46% funnelled down Liverpool's right** — Salah's side. Same elite counter-attack, pointed in a different direction. Salah took the most counter shots under both managers, but the supporting cast changed completely: Mané, Oxlade-Chamberlain and Firmino under Klopp; Gakpo, Szoboszlai, Díaz and Jones under Slot.

The lesson I nearly skipped: a stat with a confident label is the easiest thing to repeat and the easiest to get wrong. The tag pointed at something real, but its *size* was an illusion, and the only way to find that out was to rebuild it from scratch.

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
- **The big games.** Against the rest of the final top six, Klopp's side took 25 points from 10 matches (beating City, United, Chelsea, Leicester and Spurs, dropping points only in a dead-rubber loss at City and a draw at United). Slot's side took 19 from its 10 (against Arsenal, City, Chelsea, Newcastle and Villa), drawing four and losing at Chelsea, despite creating slightly better chances in them.
- **The last ten minutes.** Klopp's side gained 10 points from goals after the 80th minute and never lost one late. Slot's gained 6 and lost 5.

None of that is fake. Scoring more than your chances suggest, year after year, is a real skill, and Klopp's attack beat its xG for eight seasons running. But a +27 season is the kind of thing that doesn't repeat, and sure enough, Liverpool fell back the very next year. The 99 was a brilliant team catching a brilliant run at the same time.

## One man did a lot of it

There's a catch to Slot's season, and his name is Mohamed Salah. In 2019/20 Salah scored or assisted 34% of Liverpool's league goals. In 2024/25 that number was **57.5%**. More than half the team ran through one 32-year-old.

Klopp had Salah too, but he also had Mané chipping in 18 goals and seven assists, and two full-backs serving up 25 assists between them. The load was spread. Slot's title leaned on Salah in a way Klopp's never had to, which is a strength when your best player is having the season of his life, and a worry the moment he isn't.

## Did either of them change for the opponent?

Andy Robertson has said Klopp trusted his way and didn't fuss much about the other team, while Slot was deep into the numbers and how each opponent played. I tried to test it: I sorted the other 19 teams into types and checked how Liverpool's own style shifted against each type.

To split the teams I used the two things that vary independently: how much a team keeps the ball, and how quickly it plays forward. That gives four recognisable types, one per quadrant.

<figure class="chart-figure">
  <img src="/charts/football/klopp_slot_opponent_types.png" alt="Two scatter plots, one per season, of Liverpool's 19 opponents. The x-axis is possession, the y-axis is how quickly a team plays forward. Dashed lines at the medians split each into four quadrants: keeps the ball patient (blue), keeps the ball vertical (green), counter-attacking (orange) and low block (purple). Teams like Man City and Arsenal sit top-right; Burnley, Sheff Utd and Crystal Palace sit on the low-possession side.">
  <figcaption>Liverpool's opponents, classified from their matches against everyone else (not against Liverpool, to keep it fair). Each dot is a team; the dashed lines are that season's medians.
  <span class="chart-source">openplay event data, Premier League 2019/20 and 2024/25.</span></figcaption>
</figure>

Then, for each type, I looked at how Liverpool's own pressing, defensive line, long balls and so on changed. The honest result is a shrug. Both teams adjusted in the same direction, pressing a bit less and sitting a bit deeper against the strong possession sides. Slot's pressing intensity varied with the opponent a little more than Klopp's, in every way I cut the data, but not by enough to call it real on one season of games. Klopp's long-ball share actually varied *more* with the opponent, though that's partly good teams forcing it rather than a plan. Neither changed shape: Klopp played his 4-3-3 in 35 of 38 games, Slot his 4-2-3-1 in 35 of 38. So the data neither crowns Robertson right nor proves him wrong. It just won't say much on 38 games each.

## What the data can't see

A few honest limits. This is event data: it records what happened on the ball, not what a coach asked for, so a team pushed deep by City looks the same as one told to sit. The xG is openplay's model, so another provider would shift the exact numbers (the direction should hold). 2019/20 was also the COVID season, finished in empty stadiums, which is context no spreadsheet captures. And two title runs is a tiny sample to pin a manager's philosophy on.

## The verdict

Klopp's 99-point side was the more *dominant* team, and the more *clinical* one. It pressed high, ran hard, leaned on flying full-backs, and converted its chances better than any team in the data. The reputation is earned.

But Slot's 84-point side, by the chances it created and allowed, was quietly the *better* team on the pitch, helped by Salah's insane run.

Same club. A different coach/manager. Both champions.

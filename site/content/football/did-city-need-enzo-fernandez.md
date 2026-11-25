---
title: "£125m on Deadline Day: Did City Really Need Enzo?"
slug: "did-city-need-enzo-fernandez"
description: "Manchester City paid a joint British record £125m for Enzo Fernández on deadline day. The data says he's a rare creator who fits Maresca's system. It also says the midfield around him has nobody who sits, and that the cheapest fix may be asking Elliot Anderson to be the Rodri or Caicedo."
standfirst: "City paid £125m for Enzo Fernández on deadline day and handed him the number 17. I went through two seasons of data from Europe's top five leagues to work out whether they needed him, and what the midfield is really missing."
date: 2026-11-25
category: "Data Stories"
tags: ["Premier League", "Manchester City", "Enzo Fernández", "Elliot Anderson", "Enzo Maresca", "transfers", "midfield", "openplay"]
cover: "/images/enzo_city_cover.jpg"
cover_alt: "Elliot Anderson, Enzo Fernández and Ayyoub Bouaddi in Manchester City home shirts against a sky-blue crowd background"
author: "Pranav Arakkal"
featured: true
medium: ""
methodology: >-
  Built in Python from openplay event data (Noah Bair, CC-BY 4.0): every on-ball
  action in the Premier League, La Liga, Serie A, Bundesliga and Ligue 1 in
  2024/25 and 2025/26. There is no event data for 2026/27 yet, so every player is
  measured at his 2025/26 club. Possession is each team's share of the match's
  passes, and per-90 numbers are scaled to 50% possession. Other leagues are
  converted to Premier League terms using players who moved to England, compared
  with players who changed clubs within England. Creative level is the average
  percentile across six creating stats (progressive passes, passes into the final
  third and box, key passes, xA, npxG). Ball losses count the last controlled
  action before the opponent gets the ball, in the middle and final third. The
  ball-loss index divides actual losses by the losses an average player would have
  made with the same kinds of action in the same zones. Player positions are each player's average touch position, placed between his
  own team's centre-backs and striker in every match so that deep and high teams
  compare fairly. A counter is a move from a turnover that reaches the defending team's
  third within 15 seconds. Prices are fees paid or reported values (Transfermarkt
  and news reports, November 2026). Full method, code and every number are in the
  presentation linked in the post.
sources:
  - label: "openplay — open men's soccer event data with xG (Noah Bair), CC-BY 4.0"
    url: "https://github.com/nlbair/openplay"
  - label: "Manchester City — Enzo Fernández squad number revealed"
    url: "https://www.mancity.com/news/mens/enzo-fernandez-squad-number-revealed-63923952"
  - label: "ESPN — Elliot Anderson completes move to Manchester City"
    url: "https://www.espn.com/soccer/story/_/id/49433223/elliot-anderson-completes-move-manchester-city-nottingham-forest"
  - label: "ESPN — Man City confirm Ayyoub Bouaddi signing from Lille"
    url: "https://global.espn.com/football/story/_/id/49700891/man-city-confirm-ayyoub-bouaddi-signing-lille"
  - label: "The Guardian — Manchester City confirm Bouaddi signing as Marmoush and González head out"
    url: "https://www.theguardian.com/football/2026/aug/26/manchester-city-omar-marmoush-spurs-loan-obligation-buy-nico-gonzalez-newcastle"
  - label: "Sky Sports — Has Enzo Fernández given Enzo Maresca a problem in midfield?"
    url: "https://www.skysports.com/football/news/13613559/man-city-vs-fulham-has-enzo-fernandez-given-enzo-maresca-a-problem-in-midfield-and-how-does-he-fix-the-imbalance"
  - label: "Transfermarkt — player market values (November 2026)"
    url: "https://www.transfermarkt.com"
  - label: "Cover image: BBC Sport"
related:
  - "rodri-rice-euro-2024-progressions"
  - "klopp-slot-liverpool-title-sides"
---
Deadline day. **£125m.** A joint British record. And then City hand Enzo Fernández the **number 17**.

I'll be honest: that one stung a bit. Seventeen is Kevin De Bruyne's number, and KDB is my favourite player. (Enzo says it was his first number for Argentina, and he was born on 17 January, so fine, he has a reason.)

But the shirt isn't the real question. Fans have spent the last few weeks arguing about whether City needed him at all, and whether the new midfield leaves them open on the counter. So I went through two seasons of data from Europe's top five leagues to find out.

<p><a class="btn btn--solid" href="/files/did-city-need-enzo.pdf" target="_blank" rel="noopener">Flick through the full presentation (PDF)</a></p>

## First, City had to buy someone

Let's be fair to City. They didn't buy midfielders for fun.

<figure class="chart-figure">
  <img src="/charts/football/enzo_minutes.png" alt="Bar chart of Manchester City central midfield minutes in 2025/26. Bernardo Silva 2,718, Phil Foden 1,808, Rodri 1,576, Nico González 1,511, Tijjani Reijnders 1,436, Rayan Cherki 1,435. Bernardo, Rodri, Nico González and Reijnders are highlighted as having left.">
  <figcaption>The four highlighted players left in summer 2026.
  <span class="chart-source">openplay event data, Premier League 2025/26. Minutes at defensive, central or attacking midfield.</span></figcaption>
</figure>

Rodri went to Barcelona, Bernardo to Real Madrid, Reijnders to Al Qadsiah and Nico González to Newcastle. Between them they played **60% of City's central-midfield minutes** last season. That's a whole midfield walking out of the door.

City spent about **£327m** replacing it: Elliot Anderson (£116m), Ayyoub Bouaddi (about £86m) and Enzo (£125m).

## The case for Enzo

Before anyone panics, here's what Enzo genuinely brings.

**He already knows the job.** Maresca's Chelsea always played two holding midfielders: one sits, one steps forward to create. Enzo was the one stepping forward for a season and a half.

<figure class="chart-figure">
  <img src="/charts/football/enzo_enzo_partner.png" alt="Bar chart comparing Enzo Fernández and Moisés Caicedo per 90 at Chelsea under Maresca. Key passes 1.5 vs 0.6, passes into the box 1.4 vs 0.7, progressive passes 4.2 vs 3.4, defensive actions 8.3 vs 11.2.">
  <figcaption>Enzo created; his partner did the defending.
  <span class="chart-source">openplay event data, Chelsea Premier League matches under Maresca, per 90 minutes.</span></figcaption>
</figure>

**He's genuinely rare.** I searched every central midfielder in Europe's top five leagues aged 28 or under, adjusted for possession and league strength, over two seasons. Only **Martin Ødegaard** matched Enzo on both style and creating, and Arsenal aren't selling their captain to City.

**He keeps the ball well for what he's asked to do.** Enzo's job involves risky, forward passes, so he loses the ball more than a sitting midfielder would. But compared with players doing the same kind of job, he gives it away less often than about 3 in 4 midfielders.

<div class="stat-row">
  <div class="stat-callout"><div class="stat-value">Only 1</div><div class="stat-label">Player in Europe matching Enzo on style and creating: Ødegaard</div></div>
  <div class="stat-callout"><div class="stat-value">2.5×</div><div class="stat-label">Enzo's key passes compared with his Chelsea partner</div></div>
  <div class="stat-callout"><div class="stat-value">3 in 4</div><div class="stat-label">Midfielders he beats at keeping the ball, compared with players in similar roles</div></div>
</div>

So no, this isn't a case of City throwing money at the wrong player. The problem is what's around him.

## The catch: Anderson is not quite Rodri

Anderson was always going to be the Rodri replacement. On passing and winning the ball back, he's one of the ten most Rodri-like midfielders in Europe.

On the pitch the picture is closer than you'd think. Here is where each midfielder plays on average, split into when he defends (where he wins or contests the ball) and when he attacks (where he is on the ball). The pitch is zoomed in on the middle.

<figure class="chart-figure">
  <img src="/charts/football/enzo_pitch_positions.png" alt="Two zoomed football pitches showing each midfielder's average position in 2025/26. Defending: Anderson is the deepest, then Bouaddi, Caicedo, Rodri, Enzo, Cherki and Nico González. Attacking: Caicedo, Rodri and Nico González are deepest, Anderson is just ahead of them, and Bouaddi, Enzo and Cherki are clearly higher.">
  <figcaption>Sitters in gold. City attack to the right.
  <span class="chart-source">openplay event data, 2025/26, each player at his own club. Defending = tackles, interceptions, recoveries, challenges and blocks. Attacking = passes, dribbles, touches and shots.</span></figcaption>
</figure>

When City's midfielders defend, Anderson is the deepest of them all, deeper than Caicedo and Rodri. On the ball he sits just ahead of the three sitters, while Bouaddi, Enzo and Cherki are clearly higher. Cherki, as you'd expect from a number 10, is the furthest forward.

Two warnings. Event data only sees a player when he does something, so this is where he is when he touches the ball or makes a defensive action, not a full map. And Forest defended deep: their defensive actions averaged lower than City's. Measured against his own partner, Anderson was still the one going forward. In games where Forest played two holding midfielders, he was the higher of the two **79% of the time**, with Ibrahim Sangaré sitting behind him. That's how Caicedo and Enzo split the job at Chelsea.

So Anderson isn't far from a sitter's position already, which makes my later suggestion more realistic. The difference is what he does with the ball: he carries and dribbles far more than Rodri or Caicedo.

## Pep and Maresca always had a sitter

This is the chart that convinced me.

<figure class="chart-figure">
  <img src="/charts/football/enzo_setups.png" alt="Four football pitches showing midfielders' average positions: Pep's City 2024/25, Pep's City 2025/26, Maresca's Chelsea 2024/25 and City now. The first three each have one sitter (Kovačić, Rodri or Nico González, Caicedo) inside the shaded strip. City now, made up of Bouaddi, Anderson, Enzo and Cherki, has nobody in it.">
  <figcaption>Sitters in gold, inside the shaded strip. City now have nobody in it.
  <span class="chart-source">openplay event data. Dashed lines mark each team's centre-backs and striker. City now: measured at their 2025/26 clubs.</span></figcaption>
</figure>

Pep rotated his midfield constantly. No trio started more than three league games together. But there was **always** one player who sat: Kovačić in 2024/25, Rodri or Nico González last season. Maresca had Caicedo at Chelsea. City now have Anderson, Enzo, Bouaddi and Cherki, and every one of them plays forward.

## What happens on the counter

Two things matter when nobody sits.

First, the ball comes back more often. City's old core lost it about 10–12 times per 100 touches in the middle and final third. Every option they have now is at 16–18.

<figure class="chart-figure">
  <img src="/charts/football/enzo_losses.png" alt="Bar chart of ball losses per 100 touches in the middle and final third, 2025/26. Rodri 9.8, Nico González 10.0, Bernardo Silva 11.7, Enzo 15.9, Cherki 17.2, Anderson 17.5, Bouaddi 17.6.">
  <figcaption>Each player at his 2025/26 club.
  <span class="chart-source">openplay event data, 2025/26.</span></figcaption>
</figure>

Part of that is the job (they're asked to do riskier things) and part is the players. Roughly 40% job, 60% player.

Second, I looked at 2,167 games where a team started two holding midfielders, and split them into four equal groups by how high up the pitch the *deeper* of the two played. Counters here are fast breaks from a turnover that reach the defending team's third within 15 seconds.

<figure class="chart-figure">
  <img src="/charts/football/enzo_pivot_height.png" alt="Three bar charts by how high the deeper of two holding midfielders plays. Counters faced per game fall from 17.8 to 13.7. Danger of each counter rises from 0.030 to 0.033 xG. Total counter danger per game falls from 0.52 to 0.45 xG.">
  <figcaption>Left: teams whose deepest midfielder sits very deep face more counters. Middle: each counter against a high pivot is a bit more dangerous. Right: add it up and the high pivot is not worse off.
  <span class="chart-source">openplay event data, top five leagues, 2024/25 and 2025/26, compared at similar possession.</span></figcaption>
</figure>

Yes, the deepest group faces **more** counters. That's not because sitting invites them. Teams that sit deep tend to be the ones defending, so the opponent simply has the ball in your half more often. Teams with a high pivot are usually pinning the other side back and face fewer counters (13.7 a game against 17.8).

But each counter that does get through a high pivot is about **10% more dangerous**, because there's nobody in front of the back line to slow it. Multiply it out and the totals come out close: about 0.45 xG of counter danger per game for the highest group, against about 0.52 for the others.

So a high pivot isn't a disaster by itself, and I'm not going to pretend the data says it is. It only becomes a problem when the team also loses the ball a lot. That's City's situation: more turnovers in the middle, and a thinner shield when they happen. That fits what the eye test has been saying through the run of three straight league defeats, including the 3-1 at Forest.

## The fix might already be in the squad

Here's the part I like most. Maresca's Chelsea had Enzo create and Caicedo sit. City already have Enzo. They have Anderson, who on passing and winning the ball back looks like Rodri.

So my suggestion: **ask Anderson to sit back more and be the Caicedo or Rodri, rather than venturing forward.** Move him a few yards back, let Enzo be the one who goes, and City have the same split Enzo already played for a season and a half.

It fixes the shape for free. Part of why Anderson loses the ball so often is the job he's been given (about 40% of it, on my numbers), so sitting should bring that down too. He'd give up some carries and shots. I haven't tested whether he can hold that role over a season, because he's never been the deepest midfielder at a club. It's a call for Maresca, but the profile says it's worth a try before anyone spends another £20m.

## The one that got away: Nico González

Here's my opinion, and I think the numbers back it up: **letting Nico González go was a mistake.**

He was the one player in the squad who did the boring, vital job. He played right in the sitter strip. For keeping the ball, he was in the best 10% of midfielders in Europe. And he counter-pressed as hard as Caicedo. He's exactly the profile this midfield is crying out for, and he's at Newcastle now.

## And if Anderson can't do it?

Then a sitter is still a cheap gap to fill.

<figure class="chart-figure">
  <img src="/charts/football/enzo_price_security.png" alt="Scatter of price against ball-loss index. Holding midfielders Altimira (£16m) and André (£21m) and creators Fagioli (£14m), Stiller (£43m) and Sučić (£39m) keep the ball better than average. Enzo (£125m) is better than average too. Wharton (£60m) and Stach (£28m) lose it more.">
  <figcaption>Higher on the chart = keeps the ball better for his role. Prices are fees paid or reported values.
  <span class="chart-source">openplay event data, 2024/25 and 2025/26. Prices: Transfermarkt and news reports, November 2026.</span></figcaption>
</figure>

- **Sergi Altimira** (moved to Sporting this summer, about £16m) and **André** (Wolves, about £21m) do the sitter's job: they win the ball back and keep it simple.
- **Angelo Stiller** (Stuttgart, about £43m) creates a little less than Enzo but keeps the ball better for his role.
- Stiller and Altimira together would have cost about **£59m**, under half of Enzo's fee.

## So, did City need Enzo?

**They needed a creator, and Enzo is one of the best they could have got.** The fee is huge, but a like-for-like replacement didn't exist, and he already knows Maresca's system inside out.

**But what the midfield needs most is a sitter.** Pep always had one. Maresca always had one. City now don't, and that's what leaves the middle thin when they lose the ball.

My answer: **put Anderson in that role.** Anderson sits, Enzo creates, and Bouaddi or Cherki fill the space around them. If Anderson can't make the switch, a holding midfielder would cost a fraction of £125m.

Not a bad signing, then. A rebuild that needs one player to change jobs.

*One honest caveat: there's no event data for this season yet, so everything here measures the players at their 2025/26 clubs. Players change with new teams, so treat the directions as solid and the exact sizes as rough.*

<p><a class="btn btn--ghost" href="/files/did-city-need-enzo.pdf" target="_blank" rel="noopener">See every chart and the full method in the presentation (PDF)</a></p>

---
title: "£125m on Deadline Day: Did City Really Need Enzo?"
slug: "did-city-need-enzo-fernandez"
description: "Manchester City paid a joint British record £125m for Enzo Fernández on deadline day. The data says he's a rare creator who fits Maresca's system. Maresca himself said two years ago what Enzo needs next to him, and right now Elliot Anderson is doing that job alone."
standfirst: "City paid £125m for Enzo Fernández on deadline day and handed him the number 17. I went through two seasons of data from Europe's top five leagues, then checked it against this season so far, to work out whether they needed him and what the midfield is really missing."
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
  2024/25 and 2025/26. openplay has no 2026/27 data yet, so the event-data parts
  measure every player at his 2025/26 club, and I only use the findings that hold
  across teams (creating, ball losses for a player's role, prices). Possession is
  each team's share of the match's passes, and per-90 numbers are scaled to 50%
  possession. Other leagues are converted to Premier League terms using players
  who moved to England. Creative level is the average percentile across six
  creating stats (progressive passes, passes into the final third and box, key
  passes, xA, npxG). Ball losses count the last controlled action before the
  opponent gets the ball, in the middle and final third. The ball-loss index
  divides actual losses by the losses an average player would have made with the
  same kinds of action in the same zones. Midfield positions are each player's
  average position on the ball, compared only with his own team-mates. A counter
  is a move from a turnover that reaches the defending team's third within 15
  seconds. This season's numbers are published season totals (as of 9 November
  2026) and match reports, not event data, so treat them as early and rough.
  Prices are fees paid or reported values (Transfermarkt and news reports,
  November 2026). Full method and every number are in the presentation linked in
  the post.
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
  - label: "manchestercity.news — Enzo Fernandez is the one Man City problem Maresca is bringing on himself (season stats, 9 Nov 2026)"
    url: "https://www.manchestercity.news/enzo-fernandez-maresca-anderson-midfield-balance-2026/"
  - label: "Fernandez dropped, Anderson scores: Man City's £327m midfield dilemma (match report, via AOL)"
    url: "https://www.aol.com/articles/fernandez-dropped-anderson-scores-man-160726000.html"
  - label: "Chelsea FC — Maresca underlines trust in Enzo Fernández and explains Malo Gusto role (1 Nov 2024)"
    url: "https://www.chelseafc.com/en/news/article/maresca-underlines-trust-in-enzo-fernandez-and-explains-malo-gusto-role"
  - label: "Transfermarkt — player market values (November 2026)"
    url: "https://www.transfermarkt.com"
  - label: "Cover image: BBC Sport"
related:
  - "rodri-rice-euro-2024-progressions"
  - "klopp-slot-liverpool-title-sides"
---
Deadline day. **£125m.** A joint British record. Then the shirt number drops: **17**.

Seventeen. Kevin De Bruyne's number. My favourite player's number, now on Enzo Fernández's back.

Enzo is one of those players you can't stand until he plays for your team. For years he was the guy in blue you loved to moan about. Now he's in sky blue, and suddenly he's "passionate" and "a proper winner". Football is funny like that.

He does have a reason for the 17: it was his first number for Argentina, and he was born on 17 January. I'll allow it. Just about.

But the shirt isn't the real question. City won their first seven league games under Maresca, then lost three in a row, including a 3-1 at Forest. Fans have spent the weeks since arguing about whether City needed Enzo at all, and whether the new midfield leaves them open on the counter. So I went through two seasons of data from Europe's top five leagues, then checked it against what's happened this season.

<p><a class="btn btn--solid" href="/files/did-city-need-enzo.pdf" target="_blank" rel="noopener">Flick through the full presentation (PDF)</a></p>

## First, City had to buy someone

Let's be fair to City. They didn't buy midfielders for fun.

<figure class="chart-figure">
  <img src="/charts/football/enzo_minutes.png" alt="Bar chart of Manchester City central midfield minutes in 2025/26. Bernardo Silva 2,718, Phil Foden 1,808, Rodri 1,576, Nico González 1,511, Tijjani Reijnders 1,436, Rayan Cherki 1,435. Bernardo, Rodri, Nico González and Reijnders are highlighted as having left.">
  <figcaption>The four players in dark blue left in summer 2026.
  <span class="chart-source">openplay event data, Premier League 2025/26. Minutes at defensive, central or attacking midfield.</span></figcaption>
</figure>

Rodri went to Barcelona, Bernardo to Real Madrid, Reijnders to Al Qadsiah and Nico González to Newcastle. Between them they played **60% of City's central-midfield minutes** last season. That's a whole midfield walking out of the door.

City spent about **£327m** replacing it: Elliot Anderson (£116m), Ayyoub Bouaddi (about £86m) and Enzo (£125m).

## The case for Enzo

Before anyone panics, here's what Enzo genuinely brings.

**He already knows the job.** Maresca's Chelsea always played two holding midfielders: one sits, one steps forward to create. Enzo was the one stepping forward for a season and a half.

<figure class="chart-figure">
  <img src="/charts/football/enzo_enzo_partner.png" alt="Bar chart comparing Enzo Fernández and Moisés Caicedo per 90 at Chelsea under Maresca. Key passes 1.5 vs 0.6, passes into the box 1.4 vs 0.7, progressive passes 4.2 vs 3.4, defensive actions 8.3 vs 11.2.">
  <figcaption>Enzo created; Caicedo did the defending. Hold on to that second part.
  <span class="chart-source">openplay event data, Chelsea Premier League matches under Maresca, per 90 minutes.</span></figcaption>
</figure>

**He's genuinely rare.** I searched every central midfielder in Europe's top five leagues aged 28 or under, adjusted for possession and league strength, over two seasons. Only **Martin Ødegaard** matched Enzo on both style and creating, and Arsenal aren't selling their captain to City.

**He keeps the ball well for what he's asked to do.** Enzo's job involves risky, forward passes, so he loses the ball more than a sitting midfielder would. Compared with players doing the same kind of job, though, he gives it away less often than about 3 in 4 midfielders.

<div class="stat-row">
  <div class="stat-callout"><div class="stat-value">Only 1</div><div class="stat-label">Player in Europe matching Enzo on style and creating: Ødegaard</div></div>
  <div class="stat-callout"><div class="stat-value">2.5×</div><div class="stat-label">Enzo's key passes compared with Caicedo at Chelsea</div></div>
  <div class="stat-callout"><div class="stat-value">3 in 4</div><div class="stat-label">Midfielders he beats at keeping the ball, compared with players in similar roles</div></div>
</div>

So no, City didn't throw money at the wrong player. The real question is who plays next to him.

## Maresca already told us the answer

In November 2024, Maresca dropped Enzo at Chelsea and explained why. Caicedo and Roméo Lavia, he said, gave the team physicality and strength in the middle. Then came the line that sums up this whole post:

> "When we play with Enzo it has to be with one of Moi or Romeo, and Enzo moves forward we struggle in the middle for physicality."

Enzo was never meant to be one of two players holding the middle. He's the one who goes. Behind him, Maresca always had a ball-winner. And so did Pep.

<figure class="chart-figure">
  <img src="/charts/football/enzo_setups.png" alt="Three football pitches showing midfielders' average positions on the ball. Pep's City 2024/25: Kovačić deepest, then Gündoğan, Bernardo and De Bruyne. Pep's City 2025/26: Rodri and Nico González deepest, then Bernardo, Reijnders, Foden and Cherki. Maresca's Chelsea 2024/25: Caicedo deepest, then Enzo and Palmer.">
  <figcaption>The sitter in gold. Each pitch is one team, and each dot is a midfielder's average position on the ball.
  <span class="chart-source">openplay event data, Premier League. City attack to the right.</span></figcaption>
</figure>

Pep rotated his midfield constantly. No trio started more than three league games together. But there was **always** one player who sat: Kovačić in 2024/25, Rodri or Nico González last season. At Chelsea, Caicedo sat and Enzo stepped up next to him.

At City, the obvious man to sit is Anderson. On passing and winning the ball back he's one of the ten most Rodri-like midfielders in Europe (9th of 476). My first idea for this post was simple: ask Anderson to sit back and be the Caicedo, and let Enzo go. Then I looked at this season.

## This season: Anderson is doing it alone

He already sits. One match report put it plainly: Anderson is restricted to sitting in front of the back four when Enzo is in the side. The problem is that he's doing the defending for both of them.

<figure class="chart-figure">
  <img src="/charts/football/enzo_this_season.png" alt="Bar chart of Premier League defending per 90 this season. Anderson against Enzo: tackles 2.4 vs 0.9, interceptions 1.4 vs 0.9, duels contested 14.2 vs 10.1, duels won 8.5 vs 4.5.">
  <figcaption>Anderson makes well over twice as many tackles as Enzo, and wins almost twice as many duels.
  <span class="chart-source">Season totals as of 9 November 2026 (manchestercity.news), turned into per 90. Anderson 788 minutes, Enzo 600.</span></figcaption>
</figure>

This is Maresca's own warning playing out. At Chelsea, Enzo moved forward and Caicedo held the middle. At City, Enzo moves forward, Cherki is ahead of him and doesn't defend much either, and Anderson is left on his own.

You could see it at Forest. Anderson was left scrambling back for the first goal, then got beaten to the ball by Xaver Schlager for the second. By then, Sky Sports counted 17 shots City had faced from fast breaks. Only Newcastle had faced more.

Against Fulham, Maresca benched Enzo and started Bouaddi. With a partner who defends next to him, Anderson got the licence to roam. He created a match-high three chances and scored a volley in a 1-1 draw. One game proves nothing, but it's exactly what the data pointed to: **with Cherki in the team, play Bouaddi, not Enzo.**

## Why it hurts on the counter

The ball also comes back more often than it used to. City's old core lost it about 10–12 times per 100 touches in the middle and final third. Every option they have now is at 16–18.

<figure class="chart-figure">
  <img src="/charts/football/enzo_losses.png" alt="Bar chart of ball losses per 100 touches in the middle and final third, 2025/26. Rodri 9.8, Nico González 10.0, Bernardo Silva 11.7, Enzo 15.9, Cherki 17.2, Anderson 17.5, Bouaddi 17.6.">
  <figcaption>Each player at his 2025/26 club.
  <span class="chart-source">openplay event data, 2025/26.</span></figcaption>
</figure>

Part of that is the job (they're asked to do riskier things) and part is the players. Roughly 40% job, 60% player.

And when nobody stays back, each counter gets more dangerous. I looked at 2,167 games where a team started two holding midfielders and split them into four equal groups by how high up the pitch the *deeper* of the two played.

<figure class="chart-figure">
  <img src="/charts/football/enzo_pivot_height.png" alt="Three bar charts by how high the deeper of two holding midfielders plays. Counters faced per game fall from 17.8 to 13.7. Danger of each counter rises from 0.030 to 0.033 xG. Total counter danger per game falls from 0.52 to 0.45 xG.">
  <figcaption>Left: teams that sit deep face more counters, because they're usually the ones defending. Middle: each counter against a high pair is a bit more dangerous. Right: add it up and it evens out.
  <span class="chart-source">openplay event data, top five leagues, 2024/25 and 2025/26, compared at similar possession.</span></figcaption>
</figure>

Each counter that gets past a high pair is about **10% more dangerous**, because there's nobody in front of the back line to slow it down. On its own that isn't a disaster, since teams with a high pair face fewer counters. It becomes a problem when the team also loses the ball a lot. That's City.

## The one that got away: Nico González

Here's my opinion, and I think the numbers back it up: **letting Nico González go was a mistake.**

He was the one player in the squad who did the boring, vital job. He shared the sitting role with Rodri last season. For keeping the ball, he was in the best 10% of midfielders in Europe. And he counter-pressed as hard as Caicedo. He's exactly the partner Maresca described for Enzo, and he's at Newcastle now.

## What else could City have done?

A ball-winner who keeps it simple is a cheap gap to fill.

<figure class="chart-figure">
  <img src="/charts/football/enzo_price_security.png" alt="Scatter of price against ball-loss index. Holding midfielders Altimira (£16m) and André (£21m) and creators Fagioli (£14m), Stiller (£43m) and Sučić (£39m) keep the ball better than average. Enzo (£125m) is better than average too. Wharton (£60m) and Stach (£28m) lose it more.">
  <figcaption>Higher on the chart = keeps the ball better for his role. Prices are fees paid or reported values.
  <span class="chart-source">openplay event data, 2024/25 and 2025/26. Prices: Transfermarkt and news reports, November 2026.</span></figcaption>
</figure>

- **Sergi Altimira** (moved to Sporting this summer, about £16m) and **André** (Wolves, about £21m) do the sitter's job: they win the ball back and keep it simple.
- **Angelo Stiller** (Stuttgart, about £43m) creates a little less than Enzo but keeps the ball better for his role.
- Stiller and Altimira together would have cost about **£59m**, under half of Enzo's fee.

## So, did City need Enzo?

**They needed a creator, and Enzo is one of the best they could have got.** The fee is huge, but a like-for-like replacement didn't exist, and he knows Maresca's system inside out.

**But Maresca knows better than anyone what Enzo needs: a ball-winner behind him.** At Chelsea that was Caicedo or Lavia. At City, Anderson can do it, just not on his own while Enzo and Cherki both push on.

So here's my team: **Anderson and Bouaddi** in the middle. With Cherki playing, that's the midfield. Without him, Enzo plays as the 10 in front of them, which is where he hurts teams most anyway. And if City want Anderson free to roam like he did against Fulham, a proper holding midfielder would cost a fraction of £125m.

Not a bad signing, then. Just one that needs the right partner, and his manager said so two years ago.

<p><a class="btn btn--ghost" href="/files/did-city-need-enzo.pdf" target="_blank" rel="noopener">See every chart and the full method in the presentation (PDF)</a></p>

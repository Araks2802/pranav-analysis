---
title: "Obrigado, Cristiano"
slug: "obrigado-cristiano"
description: "A goodbye to one of my idols, told through the second half of his Portugal career. The open-play data on how Cristiano Ronaldo kept scoring for his country deep into his late 30s, and why the goals outran the chances almost to the end."
standfirst: "Cristiano Ronaldo has retired. This is my thank-you to him, built from the data of his late-career years with Portugal. The numbers are only here to carry the feeling: that a man who should have slowed down simply refused to."
date: 2026-11-03
category: "Data Stories"
tags: ["Cristiano Ronaldo", "Portugal", "international football", "xG", "openplay", "tribute"]
cover: "/images/ronaldo_cover.jpg"
cover_alt: "Cristiano Ronaldo in the red of Portugal, arms spread wide after a goal, looking up to the crowd"
author: "Pranav Arakkal"
featured: true
medium: ""
methodology: >-
  Built in Python from openplay event data (Noah Bair, CC-BY 4.0). Every number
  here is scoped to Portugal internationals the dataset covers, which begins in
  2014 and runs to the end of his career. That matters: this is the second half
  of his Portugal story, not the whole of it, so these are not his career totals
  and I never treat them as such. Within that 2014-onward window the data holds
  47 matches, 213 shots and 34 goals against 33.06 expected goals (xG). xG is
  openplay's model, which treats each shot as a chance between 0 and 1 of going
  in and sums them, so a player's goals above their xG is a rough read on
  finishing over luck. Goals are split by how they were taken (open play,
  penalty, header, free kick) from the event records, giving 10 penalty goals
  and 3 headed goals in the window. Per-tournament splits count only the matches
  in each competition. Totals from other providers will differ because the xG
  model differs; the shape of the story should hold.
sources:
  - label: "openplay, open men's soccer event data with xG (Noah Bair), CC-BY 4.0"
    url: "https://github.com/nlbair/openplay"
---
I want to start by saying this one is not really an analysis. It is a thank-you, and the charts are only here because I did not trust myself to find the words on their own.

Cristiano Ronaldo has retired. I have been putting off writing that sentence for a while. He was one of my idols growing up, one of the first athletes who made me believe that the gap between where you are and where you want to be is just work, done over and over, long after everyone else has gone home. I learned that from watching him before I ever learned it anywhere else.

So I did the only thing I know how to do when something matters to me. I pulled the data and I sat with it. The open-play dataset I use covers his Portugal games from 2014 onward, which is the second half of his international career, the part where the world kept waiting for him to fade. It never has his full record in it, and I am not going to pretend it does. What it holds is the back nine of a career that most players never even get to start. And honestly, that is the part I wanted to tell, because it is the part that moved me most.

In that window alone, from 2014 to the end, the data has him at **47 matches, 213 shots and 34 goals**. A man in his thirties, playing for his country, still shooting more than four times a game and still scoring. Let me show you what that actually looked like.

## He kept outrunning the odds

The honest way to measure a finisher is to compare the goals they score with the quality of the chances they get. The chances get a number, xG, and you add them up. Across these late-career games his chances were worth **33.06 xG**, and he scored **34**. Right on the line, and often above it, deep into an age when strikers are supposed to be living off scraps and memory.

<figure class="chart-figure">
  <img src="/charts/football/ronaldo_goals_vs_xg.png" alt="Line chart tracking Cristiano Ronaldo's cumulative goals against his cumulative expected goals for Portugal from 2014 onward, the two lines running almost on top of each other and finishing at 34 goals and 33.06 xG">
  <figcaption>His goals against the chances those shots were worth, 2014 onward. The two lines barely separate, which is the quiet proof that this was not luck. He got the chances a top striker gets, and he took them, into his late thirties.
  <span class="chart-source">Source: openplay (Noah Bair, CC-BY 4.0)</span></figcaption>
</figure>

I keep coming back to this chart. There is no magic trick in it, no run of fortune carrying him. The goals and the chances walk together the whole way. That is just a very good player, doing the very good thing, for far longer than the body is meant to allow.

## How he did it

He was never only one kind of goalscorer, and that is part of why he lasted. In this window the 34 goals break down into open play, penalties, headers and the odd free kick. **10 of them were penalties**, which tells its own story: he still wanted the ball in the biggest moments, still walked up and took the weight when others would rather hide. **3 were headers**, the ones that always felt like they hung in the air a half-second longer than physics should allow.

<figure class="chart-figure">
  <img src="/charts/football/ronaldo_goal_types.png" alt="Bar chart breaking Cristiano Ronaldo's 34 Portugal goals from 2014 onward into how they were scored: open play, penalties, headers and free kicks, with 10 penalties and 3 headers labelled">
  <figcaption>The 34 goals by how they were taken. 10 from the spot, 3 with his head, the rest from open play and set pieces. A striker who could hurt you four different ways at an age when most have one left.
  <span class="chart-source">Source: openplay (Noah Bair, CC-BY 4.0)</span></figcaption>
</figure>

When you can score with your feet, your head and from twelve yards under the most pressure a footballer ever feels, defenders never get to rest. That is the thing coaches talk about. He made eleven other men nervous just by being on the pitch.

## Where he hurt you from

Here is every shot that found the net in this window, laid out on the pitch.

<figure class="chart-figure">
  <img src="/charts/football/ronaldo_shot_map.png" alt="Shot map of the pitch showing where Cristiano Ronaldo's goals for Portugal came from in the 2014-onward window, clustered inside and around the penalty box with a scatter of longer-range efforts">
  <figcaption>Where his goals came from, 2014 onward. A dense cluster in the heart of the box, the finisher's address, with the penalty spot marked out and a few from further than any thirty-something has a right to try.
  <span class="chart-source">Source: openplay (Noah Bair, CC-BY 4.0)</span></figcaption>
</figure>

Look at where the goals live. Right in the middle of the box, where you have to be brave to stand because that is where the elbows and the studs are. The young Ronaldo cut in from the left and bent them into the far corner. This one, the older one, moved into the six-yard box and the penalty spot and simply refused to leave. He changed his game to keep scoring. Not everyone has the humility to do that.

## From a broken final to one more summer

If you want the heart of why I love him, it is not in a single number. It is in a timeline.

<figure class="chart-figure">
  <img src="/charts/football/ronaldo_tournament_timeline.png" alt="Timeline chart of Cristiano Ronaldo's Portugal tournaments from Euro 2016 to World Cup 2026 in the 2014-onward window, showing shots and goals per competition">
  <figcaption>His tournaments across the window, from Euro 2016 to the 2026 World Cup. Each one a chapter, each with its own weight of shots and goals.
  <span class="chart-source">Source: openplay (Noah Bair, CC-BY 4.0)</span></figcaption>
</figure>

Euro 2016 is the one that still gets me. In that tournament the data has him taking **46 shots and scoring 4 goals**. Not a vintage return by his own impossible standard. And then the final, the biggest night Portugal had ever played, and he goes off injured in tears, carried away before his team had even won anything. He could have hidden from that. Instead he spent the rest of the night on the touchline, limping, shouting, coaching, willing them over the line. Portugal won their first ever major trophy with their talisman reduced to a cheerleader on a bad knee. That is not a stat. That is who he is. The goals were never the whole of it.

## He was still elite at 39

And then, when the story was supposed to be over, he wrote one more chapter.

<figure class="chart-figure">
  <img src="/charts/football/ronaldo_nations_league_surge.png" alt="Chart of Cristiano Ronaldo's Nations League 2024/25 campaign showing 38 shots and 8 goals at age 39 and 40, highlighting a late-career scoring surge">
  <figcaption>The Nations League across 2024/25: 38 shots, 8 goals, at 39 and 40 years old. A late surge when the only sensible prediction was a decline.
  <span class="chart-source">Source: openplay (Noah Bair, CC-BY 4.0)</span></figcaption>
</figure>

**38 shots and 8 goals** in the Nations League, at thirty-nine going on forty. Read that again. Most players that age are long retired, or coaching, or doing punditry about men half their age. He was still the one Portugal looked to when they needed a goal, and he was still finding it. The surge in that chart is a man telling time to wait a little longer. It did.

## Obrigado

So here is the goodbye.

The data in this piece is only the second half of his Portugal story, the years from 2014 on, and it is already this much: a finisher who matched his chances almost perfectly into his late thirties, who scored with his feet and his head and from the spot, who dragged his country to its first trophy on one leg, and who was still elite at forty. The first half, the half the dataset never saw, was somehow even bigger.

But I did not fall for the numbers. The numbers came later, when I was old enough to go looking for them. I fell for the way he ran back to the halfway line after a goal, impatient for the next one. I fell for the obsession, the sense that no amount was ever enough. He made a generation of us believe that work was a kind of talent too.

Thank you, Cristiano. For the goals, yes, but more for the standard. You showed us what it looks like to refuse to be ordinary, for twenty years, in front of everyone. Portugal will not see another like you, and neither will I.

Obrigado.

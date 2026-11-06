---
title: "Obrigado, Cristiano"
slug: "obrigado-cristiano"
description: "A goodbye to Cristiano Ronaldo, one of my idols, and to the nights he gave Portugal, from Euro 2016 to his last World Cup."
standfirst: "Cristiano Ronaldo has retired. This is my thank-you to one of my idols, for the goals, for the standard he set, and for the nights none of us will forget."
date: 2026-11-06
category: "Data Stories"
tags: ["Cristiano Ronaldo", "Portugal", "international football", "tribute", "openplay"]
cover: "/images/ronaldo_cover.jpg"
cover_alt: "Cristiano Ronaldo seen from behind in the red and green number 7 Portugal shirt, arms spread wide towards a packed stadium crowd"
author: "Pranav Arakkal"
featured: true
medium: ""
methodology: >-
  The chart is built in Python from openplay event data (Noah Bair, CC-BY 4.0).
  It covers Cristiano Ronaldo's Portugal matches in that dataset: 47 matches
  from June 2016 to July 2026, with 210 shots, 31 goals and 30.85 expected
  goals (xG). That is the second half of his international career, not the
  whole of it. The dataset starts in 2014/15, so his debut in 2003 and his
  earlier goals are not in it, and none of the figures here are career totals.
  Penalty shootout kicks are not counted as goals, because they are not goals in
  a match record. His age at each goal is calculated from his birth date, 5
  February 1985. The few events described that the data cannot show, such as the
  Euro 2016 final and the Euro 2024 penalty against Slovenia, come from the
  public record. The matches in the data come from three international
  competitions: the European Championship, the World Cup and the UEFA Nations
  League. Qualifiers and friendlies are not in the data. The second chart
  sorts each of his 31 goals by what it did to the match. The score before and
  after every goal is rebuilt from the dataset's goal events, and the rebuilt
  score matches the recorded final score in all 47 of his Portugal matches in
  the data, with extra time included and penalty shootouts excluded. A goal
  that gave Portugal a lead they never lost is the goal that put Portugal ahead
  of the opponent's final total, which is the usual definition of a winning
  goal. An equaliser is a goal that levelled the score from behind. Goals that
  opened the scoring or added to a lead without deciding the match fall into
  neither group, and penalties count as goals. Final results come from the
  recorded scores.
sources:
  - label: "openplay, open men's soccer event data with xG (Noah Bair), CC-BY 4.0"
    url: "https://github.com/nlbair/openplay"
---
Cristiano Ronaldo has retired, and I have been putting off writing that sentence.

He was one of my idols. I do not say that lightly, and I do not think I am the only one. For a very long time he made it look normal to demand more of yourself than anyone else was asking. More training, more goals, one more season, one more tournament. Whatever you think of the rest of it, nobody can say he did not give everything he had to the game.

So this is a thank-you. I wanted to use the one thing I know how to do, which is sit with the data, but I did not want the numbers to take over. There are two charts in this piece, and they are only there because they say something I could not say any better.

## Ten years, one dot at a time

Here is every goal he scored for Portugal in the data I use, from the summer of 2016 to the summer of 2026, across the European Championships, the World Cups and the Nations League. One dot is one goal. The hollow ones are penalties.

<figure class="chart-figure">
  <img src="/charts/football/ronaldo_every_goal.png" alt="Timeline of 31 dots, one for each of Cristiano Ronaldo's goals for Portugal from Euro 2016 to the 2026 World Cup, grouped by tournament with his age underneath. A highlighted band marks that 19 of the 31 goals came after his 36th birthday, including eight in the 2024/25 Nations League at 39 and 40 and three at the 2026 World Cup at 41.">
  <figcaption>Every goal for Portugal in the data, in order, with his age at the time. Nineteen of the thirty-one came after his 36th birthday.
  <span class="chart-source">Source: openplay (Noah Bair, CC-BY 4.0). Penalty shootout kicks are not counted.</span></figcaption>
</figure>

Look at the right-hand side of it. Nineteen of those thirty-one goals came after his 36th birthday. Eight came in a single Nations League campaign, at 39 and 40. And three came at the 2026 World Cup, when he was 41 years old. At an age when most players have long since stopped, he was still the person Portugal looked to when they needed something to happen, and he was still finding it.

## The nights that stay with you

Some of those dots are not just goals.

Euro 2016 is the first group on the left, three goals in the tournament Portugal won. I think about the final more than the goals. He went off injured, in tears, early on, with his country still waiting for its first major trophy. And then he spent the rest of the night on the touchline, limping, shouting, holding the team together from the outside. Portugal won. It is hard to explain to someone who was not watching what that meant, to see the best player in the team become its loudest supporter on the biggest night it had ever had.

At the World Cup in 2018 he scored a hat-trick against Spain, the last goal a free kick in the 87th minute that pulled his side level. The year after, he scored another against Switzerland in the Nations League finals, a competition Portugal went on to win. Five goals at Euro 2020, at 36. Then Euro 2024, the one tournament in the chart with no dot at all. He missed a penalty against Slovenia and cried, and then he walked up in the shootout and scored. That is the part I keep returning to. The dots are the goals. The man is in what he did after the ones that did not go in.

## The goals that mattered

There is one more thing I wanted to count. Not how many goals he scored, but how many of them actually changed a match.

<figure class="chart-figure">
  <img src="/charts/football/ronaldo_decisive_goals.png" alt="Chart of the 17 goals out of Cristiano Ronaldo's 31 for Portugal that changed the result of a match, each shown at the minute it was scored. Eleven in red gave Portugal a lead they never lost and six in gold levelled the score from behind, such as two equalisers against Hungary at Euro 2016, an 87th minute free kick against Spain at the 2018 World Cup, and an equaliser against Spain in the 2025 Nations League final. The score before and after each goal and the final result are listed beside it.">
  <figcaption>The goals that gave Portugal a lead they never lost (red) or pulled them level from behind (gold), at the minute he scored them.
  <span class="chart-source">Competitions: European Championship, World Cup and UEFA Nations League, 2016 to 2026. Qualifiers and friendlies are not in the data. Source: openplay (Noah Bair, CC-BY 4.0). Penalty shootout kicks are not counted.</span></figcaption>
</figure>

Seventeen of those thirty-one goals did. Eleven gave Portugal a lead they never lost, and six pulled them level when they were behind. That is more than half of everything he scored in these years. Some of the eleven came in comfortable wins, where the first goal is a winner only on paper. But plenty of them were the whole match.

Some of them you will remember. Against Hungary in 2016, Portugal fell behind twice and he pulled them level twice. At the 2018 World Cup he scored the only goal against Morocco in the third minute, and then, with Portugal 3-2 down to Spain, he scored a free kick in the 87th minute to save the point. Three of the seventeen came in that very same 87th minute, including the winner against Scotland in 2024. In the 2025 Nations League final he pulled Portugal level against Spain, and they went on to win the trophy on penalties. And at the 2026 World Cup, at 41, a penalty against Croatia brought them back to 1-1 in a game they won 2-1.

That is what I will remember. Not the tally, but how often it was him when the match needed to change.

## What he gave us

When I try to say what he did for football, I do not start with a number.

He took a country of about ten million people and made it expect to win. He made the work behind the glamour look like the point of the whole thing, the training, the sleep, the refusal to be satisfied. He showed a generation of children in smaller places that you do not have to be born into the biggest stage to end up on it. And he did it for so long that the idea of a footballer's career having a shape, a peak and then a slow decline, stopped feeling true while he was playing.

I will not pretend he was loved by everyone, or that he needed to be. But I do not think you can watch someone chase the same thing for twenty years, and keep chasing it at 41, without feeling something.

## Obrigado

Thank you, Cristiano, for the standard you set and for how long you held it. For the nights in tears and the nights you made us leap off the sofa. For making a lot of us believe that wanting something badly enough, for long enough, is its own kind of talent.

Obrigado.

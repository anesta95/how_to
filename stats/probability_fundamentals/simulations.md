Since 2018, Spain women's national team has scored 165 goals in 52 matches, at an average of 3.2 goals per match. This translates to an average of $\frac{3.2}{90} = 0.036$ goals per minute in a regular 90 minute match. Since teams almost never score twice in the same minute, we can take `0.036` as the probability of Spain scoring each minute against an average team — the input to our model.

Since 2018, the average international team has `1.79` goals per match, while England – their opponent in the 2023 World Cup – has conceded just `0.52` per match. One way to adjust Spain’s scoring probability for the strength of their opponents is to multiply by this ratio:

$0.036 * \frac{0.52}{1.79} = 0.0105$
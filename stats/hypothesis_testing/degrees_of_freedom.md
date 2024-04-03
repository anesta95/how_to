Say you have a random variable that is equivalent to rolling a six-sided die twice. This would be defined as:

$Y = \displaystyle\sum_{j=1}^2\sum_{i=1}^6S^2_{i,j}$

Where $S^2_{i,j}$ are just _independent standard normal random_ variables. Here $Y$ has a $\chi^2$ distribution and by definition a $\chi^2(k)$ random variable is the sum of the squares of $k$ independent standard normal random variables. 

So the number of degrees of freedom when the $S^2_{i,j}$ are independent is $k = 6 * 2 = 12$ which is just the total number of squared terms in the sum.

_However_, sometimes not all of the random variables are indepenent. For example, rolling a six-sided die $n$ times to find the number of times a specific outcome $i$ is rolled – stated as $N_i$ – is constrained by the relation $N_1 + \dots + N_6 = n\:(fixed)$ so knowing the frequencies of the first 5 outcomes completely determines the sixth.

The degrees of freedom were cut down from 6 to 5 because of this constraint. Every constraint among the variables appearing in the Pearson's statistic reduces the number of degrees of freedom by 1. 

Point estimates derived from the _maximum likelihood principle_ decrease $k$ too: The number of degrees of freedom drops by 1 for each parameter estimated with data. For example, the number of observed times rolling any number $i$ on a six-sided die in sample experiment data – stated as $N_i$ – divided by the total number of rolls $n$ is one singular point estimate. If you use one for each value of the die you need to subtract 5 degrees of freedom, one for each die value minus the one that is already taken out because of the _constraint_ that you'd be able to estimate it based on knowning $N_1$ through $N_5$ and the total $n$. Similar to the $(1 - p)$ law of total probablity principle.

When a test calls for the measurement of deviations from what's expected, Pearson's $\chi^2$ statistic $\displaystyle\sum_j\frac{(O_j - E_j)^2}{E_j}$ is typically a great statistic to use. That's because, under a very general circumstance, it's distributed like a $\chi^2(k)$ random variable.

Some care is needed when counting the number of degrees of freedom $k$, though.

The naive count is just the total number of squared terms in the sum above, but every _constraint_ and every _point estimate_ using data reduces this by 1.
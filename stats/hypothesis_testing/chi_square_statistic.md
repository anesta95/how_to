In a string of $n$ events, say for example shooting basketball free throws, there are $\binom{n}{m}$ ways of having $m$ misses.

Here the **choose** symbol $\binom{}{}$ counts the different arrangements of misses:
$\binom{n}{m} = \frac{n!}{m! * (n - m)!}$ 

For example, if a basketball player has a historical free-throw miss rate of $p$, the **product rule** $P(A\:\cup\:B) = P(A) * P(B)$, says that the probability they miss $m$ shots out of $n$ tries is:

$P(m) = \binom{n}{m}(p)^m * (1 - p)^{n-m}$

**if** their skills remain unchained from the historical miss rate.

This is the **binomial random variable**: the number of successes $k$ out of $n$ _independent_ trials of that experiment. The **binomial distribution** of that variable is:

$\binom{n}{k}p_i^m(1 - p_i)^{n-m}$

where $p_i$ is the probability player $i$ will miss a shot.

The sum of squares of $k$ independent standard normal variables is called a $\chi^2(k)$ **random variable**.

Generally, there are two key design principles to abide by when making a statistic for hypothesis testing — it needs to measure extremeness, and it should have a known probability distribution.

These properties let us find a clear-cut critical region for rejecting the null hypothesis.
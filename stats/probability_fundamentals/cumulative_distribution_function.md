The **Cumulative Distribution Function** or CDF:

$P(X\:\leq\:x)$

We call $P(X\:\leq\:x)$ the CDF since it _accumulates_ the PMF (probability mass function) values. If $X$ is a random quantity, $P(X\:\leq\:x)$ is the sum of all its PMF values up to and including the one for $x$.

As we make $x$ smaller $CDF(x) = P(X\:\leq\:x)$ can only go down or stay the same, and vice versa. If we take $x$ really, really small, $CDF(x)$ drops to 0. When $x$ is big enough, $CDF(x)$ is the sum of all the PMF's (probability mass function) values, so it has to be $100\%$. $CDF(x)$ is $100\%$ as long as $x$ is big enough.

The cumulative sums in the CDF $P(X\:\leq\:x)$ generally smooth out the noise in the PMF $P(X = x)$. This lies in the _accumulation of probabilities_. Because the CDF is a cumulative sum of probabilties, the jump at $x$ is $P(X = x + 1)$. Say your PMF has 63 entries, the average jump size for each value of $x$ is $\frac{1}{63} \approx 0.016$. The CDF plots look much smoother than the PMF ones because the average jump size is smaller, particularly with CDFs with larger numbers of entries/values.
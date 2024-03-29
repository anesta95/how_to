In hypothesis testing, some conjecture about a population parameter like the mean is tested with sample data.

In effect, we make a guess about, say, $\mu$ and then use the data to see if our guess has some grounding in reality.

Instead of hypothesizing the value of $\mu$ and then testing the hypothesis, we estimate $\mu$ directly from the sample data.

The basis for estimating a parameter like $\mu$ is the **confidence interval**.

Remember that the sample mean $\bar{X}$ is approximately normal if the sample size is large.

That means the probablity distribution has a "bell curve" shape that's peaked at the true mean $\mu$ and has width set by $\frac{\sigma}{\sqrt{n}}$, which we assume is somehow known.

By increasing the sample size $n$, we can be more confident that our sample mean $\bar{X}$ reflects the value of the true mean $\mu$.

However we can't expect that $\bar{X}$ will **exactly** equal the true mean $\mu$ — there's randomness inherent in our sample selection process.

**Confidence intervals** let us make more precise and quantitative estimates for the true population mean in terms of the sample mean.

**Standardizing** a normal random variable scales the probability distribution of the variable to the **standard normal distribution** with mean 0 and standard deviation 1. This gives a one-to-one correspondence between the values of the original distribution and the values of the standard normal distribution.

Let's say we want to be “95% confident” that our sample mean is close to $\mu$.

If we _standardize_ $\bar{X}$ as 

$Z = \frac{\bar{X} - \mu}{\frac{\sigma}{\sqrt{n}}}$

we want

$P(-z_0 \leq Z \leq z_0) = 0.95$

We know that $P(-1.96 \leq Z \leq 1.96) = 0.95$, where

$Z = \frac{\bar{X} - \mu}{\frac{\sigma}{\sqrt{n}}}$

With a little bit of algebra, we can put this equation in the form

$P(? \leq \mu \leq ?) = 0.95$

Consider a company trial with these results and parameters:

Sample size $n = 100$, $\sigma = 4 days$, and sample mean $\bar{X} = 8.5$

If $\sigma$ and $n$ are known and $\bar{X}$ is measured, then 

$(\bar{X} - 1.96 * \frac{\sigma}{\sqrt{n}}, \bar{X} + 1.96 * \frac{\sigma}{\sqrt{n}})$

is the 95% **confidence interval** for the true mean $\mu$

_However ..._

It's a common misconception that the true mean has 95% probability of being in the 95% confidence interval.

The true mean $\mu$ is a fixed number — we just don't know what it is, and we're using our sample to learn something about it. The interval

$(\bar{X} - 1.96 * \frac{\sigma}{\sqrt{n}}, \bar{X} + 1.96 * \frac{\sigma}{\sqrt{n}})$

either contains $\mu$ or it doesn't – so the probablity of $\mu$ being in the 95% confidence interval is 1 if it's in the interval and 0 if it's not.
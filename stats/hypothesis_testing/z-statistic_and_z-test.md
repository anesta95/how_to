$Z$-test: a powerful tool for testing a statistical hypothesis when _the underlying distrubtion is normal_ **and** _the population variance is known_. Central to every $Z$-test is the $Z$-statistic, which emerges directly from the **central limit theorem**.

Consider an experiment on whether a new weight loss drug is effective without diet and exercise. Our default assumption, called the **null hypothesis** or $H_0$​, is the belief that the drug has no impact on weight. The **alternative hypothesis**, $H_A$, is the belief that weight loss is likely when the drug is used.

Let $\mu$ be the mean of weight loss during the drug trial. A good _null hypothesis_ would be $\mu = 0$ because if the participants in the trial lose no weight on average, $\mu = 0$ means the drug had **no effect**. Thus $\mu \gt 0$ would be a good _alternative hypothesis_ because it would show that on average participants did actually lose weight.

Now that we specified our hypotheses, we're ready to take some sample data and try to identify whether or not it supports the null hypothesis. The way this typically proceeds is by comparing the sample data to the data we would expect assuming the null hypothesis is **true**. 

If our sample is highly improbable or “extreme” — given what we'd expect when the null hypothesis describes reality — then the sample is not strong evidence in favor of $H_0$. The purpose of the $Z$-test — and many other statistical tests — is to facilitate this comparison. 

We expect the $Z$-statistic to look something like:

$\text{Z = (some measure of the distance between }\bar{X}\:and\:\mu_0) * \text{(something that grows with sample size)}$

Here $\bar{X}$ is the sample mean and $\mu_0$ is the mean assuming the null hypothesis is true. In the experiment above that would be $\mu_0 = 0$.

$Z$ becomes larger (more "extreme")
* if the gap between the sample mean and the null mean is large **or** 
* if the sample size is very large

A precise formula for the $Z$-statistic can be derived from the _central limit theorem_:

The **central limit theorem** tells us that $\frac{\bar{X} - \mu_0}{\frac{\sigma}{\sqrt{n}}}$ (where $\frac{\sigma}{\sqrt{n}}$ is the variance of the sample) is approximately standard normal if $n$ is large. Rewritten as:

$(\bar{X} - \mu_0) * \frac{\sqrt{n}}{\sigma}$

Not only does this random variable have a well-known distribution, it also has all the right features to be a useful measure of “extremeness.” Because of these two advantages, we find the $Z$-**statistic** (of the sample means)

$Z = \frac{\bar{X} - \mu_0}{\frac{\sigma}{\sqrt{n}}}$ to be very useful for hypothesis testing. Our $Z$-statistic assigns a number to our sample that reflects its “extremeness.”

How do we test for this $Z$-statistic, with a $Z$-test! A **$Z$-test** is a test to determine if a sample could have plausibly arisen from a given _normal_ distribution. $Z$-tests are based on some simple features of a standard normal random variable $Z$.

Now, there are many ways of constructing intervals containing $95\%$ of the probability. Sometimes, we want to know if there's any difference at all, and we don't care whether it's positive or negative. Other times, we are only testing for positive changes (as with a drug). In general, the confidence interval we use for the $Z$-test depends on our hypotheses.

* $(-\infty, -1.96 \cup [1.96, \infty)$ is the $5\%$ **critical region** (a.k.a region of rejection of the null hypothesis) for the **two-tailed $Z$-test** while
* $[1.65, \infty)$ is the $5\%$ **critical region** for the (right) **one-tailed** **$Z$-test**

Returning to our weight-loss trial. Let's say the population standard deviation is $\sigma = 10$ kilograms in the trial. The test group of $100$ participants loses an average of $1$ kilogram during the trial, so if the null hypothesis is indeed true and the drug does not work, then the $Z$-statistic is

$Z = \frac{\bar{X} - \mu_0}{\frac{\sigma}{\sqrt{n}}} = \frac{1 - 0}{\frac{10}{\sqrt{100}}} = 1$

Because the sample mean $\bar{X}$ is 1, the null hypothesis mean $\mu_0$ is 0, the standard deviation $\sigma$ is 10 and the sample size $n$ is 100.

Here's how to interpret this — if the null hypothesis were true, then $Z$ is a standard normal random variable and we'd expect a sample $Z$-value to be near 0 (with some small tolerance for random chance). So, since the critical region is relatively far away from the origin, we'd expect the $Z$-value to be well outside the critical region.

This means the critical region gives us a simple criterion for rejecting $H_0$: If the criticla region contains the sampled $Z$-statistic, reject $H_0$ – if not, don't reject $H_0$. 

The value of 5% is called the **significance** of the test, which generally is the probability of rejecting the null hypothesis when it's true. What's so special about 5%? Well, nothing really! It just happens to be the default choice in statistics.

In general, the alternative hypothesis tells us the type of test to use. Let's return to the weight loss experiment example to see how this works. Originally, we took “the drug doesn't work” $\mu_0 = 0$ to be our null hypothesis, and “the drug causes weight loss” $\mu_0 \gt 0$ our alternative.

Here are two possible modifications of the alternative hypothesis:

* $H_{A1}$: “The drug causes weight gain.” $\mu_0 \lt 0$
* $H_{A2}$: “The drug has some effect.” $\mu_0 \neq 0$

In one instance, a (left) one-tailed $Z$-test would be appropriate — for the other, a two-tailed test should be applied.

### Steps of the Z-test:
1. Set a null hypothesis and an alternative hypothesis.
2. Use the alternative hypothesis to decide between a one-tailed $Z$-test and a two-tailed $Z$-test.
3. Choose the significance of the test — the default is usually 5%.
4. Compute the $Z$-statistic $Z = \frac{\bar{X} - \mu_0}{\frac{\sigma}{\sqrt{n}}}$ from the sample data.
5. If the $Z$-score is in the critical region, reject the null hypothesis — otherwise, don't reject it. 

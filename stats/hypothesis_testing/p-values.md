$p$-**value**, short for **probability value**, measures how likely a result occurs through chance alone.

The more **extreme** the $Z$-value, the less plausible the null hypothesis becomes. The $p$-value, much like the $Z$-statistic, is another measure of extremeness, but one given by probability. The concept of the $p$-value applies to situations where the $Z$-test doesn't.

The $p$-**value** is the probability of witnessing an event at least as extreme as our result. Like the $Z$-test critical region, the threshold for $p$-value "extremeness" is a bit arbitrary.

Typically, $p$-values of less than 0.05 are taken as extreme, but that **significance level** should be decreased if you want to be extra-sure that you have good evidence to reject $H_0$

For a large enough sample size, the underlying distribution is normal thanks to the central limit theorem. So, if we define $Z$ to be a standard normal variable, the $p$-value is:

$P\left( Z \geq \frac{\bar{X} - \mu_0}{\frac{\sigma}{\sqrt{n}}} \mid H_0 \right)$

In words, we first standardize the sample mean $\bar{X}$, and then, using the standard normal distribution, we compute the probability that $Z$ is bigger than or equal to this standardized value **if $H_0$ is true**.

_All $p$-values we'll encounter are conditional on $H_0$ being true._ The **smaller** the $p$-value, the more **extreme** the result is if $H_0$ were true. This in turn means the evidence doesn't favor $H_0$.

The advantage of $p$-values is their versatility — since they're defined to be the probability of seeing an event at least as extreme as our result, they can be calculated in a wide variety of situations.

### $p$-hacking – don't do this!

An example: a company has been trying for years to make a weight loss drug. The company has created 20 different weight loss drugs, and now they want to test each drug separately on distinct samples of 100 people.

Here's their process — they're going to reject the null hypothesis “the drugs do nothing” if at least one of the $p$-values is less than the significance level 0.05. They'll then claim that all the drugs with such low $p$-values actually work.

This is **not** a good way for the company to find their weight loss breakthrough. It's pretty likely that the company will make a false claim. The problem is that, with so many drugs being tested, there's a very good chance that random chance will serve up an outlier that seems to support rejecting the null hypothesis when in fact it's true.

It's possible due to **random chance** alone that a trial will demonstrate an extreme enough average weight loss that the company would be fooled into rejecting $H_0$​. Put another way, they're at risk for making false conclusions because of “freak samples,” which appear with greater probability the more drugs that are tested. The probability of this is quite large since they're testing 20 drugs.

Each of the trials results in a sample mean — let's label them:

$\bar{X}_1, \bar{X}_2, \dots, \bar{X}_{20}$

Each trial has the same number of participants $n=100$. For the sake of argument, let's also assume each trial has the same known variance $\sigma$. The null hypothesis is that none of the drugs have an effect, so $\mu = 0$ for each of the drugs.

All this means that each of the sample means gets standardized the same way. **Standardizing** a normal random variable scales the probability distribution of that variable to the **standard normal distribution** with mean 0 and standard deviation 1. This gives a one-to-one correspondence between the values of the original distribution and the values of the standard normal distribution. Let's call the standardizations $S_1, \dots, S_{20}$ so that

$S_i = \frac{\bar{X_i} - \mu_0}{\frac{\sigma}{\sqrt{n}}} = \frac{10}{\sigma}\bar{X}_i$ and $S_i$ is a standard normal random variable.

Let $\Phi$ be the cumulative distribution function of the standard normal. For any random variable $X$, the **cumulative distribution function** $F_X$ is defined as $F_X(x) = P(X \leq x)$, which is the probability that $X$ is less than or equal to $x$.

In other words $\Phi(z) = P(Z \leq z)$, where $Z$ is a standard normal variable.

The important takeaway is this – **good** statistical research boils down to 

1. forming a hypothesis, then
2. collecting data, and then
3. performing a hypothesis test – if $p \lt 0.05$, reject the null hypothesis

The company stats people instead

1. collected data then
2. tested a bunch of different things (drug efficacies in this case) and looked for $p$-values $\lt 0.05$, and then
3. claimed strong evidence for the things that have $p$-values $\lt 0.05$

This kind of process has a very high probability of producing false conclusions. In the specific example above that chance is $0.95^20$. The 95% chance that each one of the 20 trials had a correct rejection of the null hypothesis, to the 20th power (one for each trial) since they are independent events.
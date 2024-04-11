Student $t$-variables also turn up when we wish to compare two means. Two common scenarios are:

* The "before-and-after" scenario – a **paired $t$-test** – compares the means of a single population at two different _times_ to see if some change has occurred.
* The second scenario compares the means of two _separate_ populations.

A Student $t$-statistic is at the heart of the hypothesis tests in both cases, the specific form of the $t$-statistic depends greatly on the data samples themselves. Specifically, the data tells us whether to define a $t$-statistic using **pooled** or **unpooled variance**. 

The template for measuring relative extremeness in the difference of two means:

$\frac{\bar{X}_{after} - \bar{X}_{before}}{\sqrt{\frac{\sigma^2_{before}}{n} + \frac{\sigma^2_{after}}{n}}}$

This isn't immediately helpful since $\sigma^2_{before}$ and $\sigma^2_{after}$ are unknown population parameters.

One option is to simply substitute teh **sample variances** $s^2_{before}$ and $s^2_{after}$ in for $\sigma^2_{before}$ and $\sigma^2_{after}$, respectively, resulting in the so-called **unpooled variance**. Another option is to aggregate the data from both samples into a single estimator called the **pooled variance**.

Now choosing between **pooled** or **unpooled variance** comes down to deciding if the data suggest the true variances are really the same.

If two populations labeled $1$ and $2$ are compared and the ratio of sample variances obeys

$\frac{1}{2} \lt \frac{s_1}{s_2} \lt 2$

then the data suggest $\sigma_1 = \sigma_2$ otherwise $\sigma_1 \neq \sigma_2$.

### Pooled Variance
If you have two populations labeled $j = 1$ and $j = 2$ with the _same_ variance $\sigma^2$. Take $n_j$ independent random draws from population $j$. Label the draws by $i$, call the results $X_{i,j}$, and let $\bar{X}_j$ be the sample mean.

To make an estimator for the common variance $\sigma^2$:

$\displaystyle\sum^{n_1}_{i=1}(X_{i,1} - \bar{X}_1)^2 + \displaystyle\sum^{n_2}_{i=1}(X_{i,2} - \bar{X}_2)^2$

Each term measures the spread of values from a single population. This messy expression can be more conveniently written in terms of the sample variances:

$(n_1 - 1)s^2_1 + (n_2 - 1)s^2_2$

This just follows from the definition of sample variance.

Since $(n_1 - 1)s^2_1 + (n_2 - 1)s^2_2$ has expected value $(n_1 + n_2 - 2)\sigma^2$

$s^2_p = \frac{n_1 - 1}{n_1 + n_2 - 2}s^2_1 + \frac{n_2 - 1}{n_1 + n_2 - 2}s^2_2$ 

which simplifies to:

$s^2_p = \frac{(n_1 - 1)s^2_1 + (n_2 - 1)s^2_2}{n_1 + n_2 - 2}$

is an unbiased estimator of the common variance $\sigma^2$ of the two populations. Because this estimator combines – or "pools" – the info of two samples, $s^2_p$ is called the **pooled variance**.

**Pooled variance** is given by:

$s^2_p = \frac{(n_1 - 1)s^2_1 + (n_2 - 1)s^2_2}{n_1 + n_2 - 2}$ 

where $s^2_j$ is the sample variance of the sample drawn from population $j$.

**Pooled variance** is used when it's safe to assume that $\sigma_1 = \sigma_2$

If the ratio of sample variances obeys:

$\frac{1}{2} \lt \frac{s_1}{s_2} \lt 2$

then the data suggest $\sigma_1 = \sigma_2$ otherwise $\sigma_1 \neq \sigma_2$.

When the sample sizes are _different_, an appropriate statistic is given by:

$t_{n_1 + n_2 - 2} = \frac{\bar{X}_2 - \bar{X}_1}{\sqrt{\frac{s^2_p}{n_1} + \frac{s^2_p}{n_2}}}$

**Pooled variance** is useful in characterizing the _change in a population over time_.
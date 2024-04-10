### t-tests
When a proportion $p$ of a population has some attribute, then the **sample proportion**

$\hat{p} = \frac{1}{n}\displaystyle\sum^n_{i=1}X_i$

computed from a simple random sample is an unbiased estimator of $p$.

Here, $n$ is the sample size, and $\frac{1}{n}\displaystyle\sum^n_{i=1}X_i$, which counts the sample members having the feature of interest, is a sum of **indicator variables**:

$X_i= \begin{cases}1 & \text { if sample member } i \text { has the attribute } \\ 0 & \text { otherwise. }\end{cases}$

This assumes that every member of the population either has the attribute or doesn't, and the probability of having the attribute is the same for every member of the population.

A statistic to measure the **difference** between two sample proportions/means. This is a **t-test**. It draws from the way Gaussian variables are scaled to the standard $Z$ variable:

$\frac{\text{difference between the samples}}{\sqrt{\text{some measure of spread}}}$

The _pooled average_ $\hat{p}$ of the two sample proportions is $\frac{n_1}{n_1 + n_2}\hat{p}_1 + \frac{n_2}{n_1 + n_2}\hat{p}_2$

### t-variables
When we have many samples in our dataset, it often makes sense to assume that things are distributed normally. When the dataset is small, this assumption is no longer valid. 

In more realistic scenarios where **both $\sigma$ and $\mu$** are **unknown**. This involves using a new random variable called a **$t$-variable**.

It's difficult to pin down exactly how large a sample needs to be in order for the central limit theorem to be applicable, but a guideline used by many statisticians is that $n$, the sample size, should be at least $30$.

If your sample size is below that, you can't trust that $\frac{\bar{X} - \mu}{\frac{\sigma}{\sqrt{n}}}$ to be close to normal, which is important when claiming the margin of error to be about $1.96\text{(a.k.a the z-score for 90\% confidence interval)} * \frac{\sigma}{n}$.

However you can use the **sample variance** as an unbiased estimator of $\sigma^2$. It makes sense to replace the denominator of $\frac{\bar{X} - \mu}{\frac{\sigma}{\sqrt{n}}}$ with the **sample standard deviation**

$s = \sqrt{\frac{1}{n - 1}\displaystyle\sum^n_{i=1}(X_i - \bar{X})^2}$

The **Student $t$-variable** with $n$ **degrees of freedom** is $t_n = \frac{Z}{\sqrt{\frac{\chi^2(n)}{n}}}$

where $Z$ is a standard normal random variable that's independent of the $\chi^2(n)$ variable in the denominator.
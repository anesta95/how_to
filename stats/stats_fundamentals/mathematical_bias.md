**Sampling bias**: A bias in which a sample is collected in such a way that some members of the intended population have a lower or higher sampling probability than others.

**Statistical bias**: Is the propensity of a measurement process to systematically overvalue or undervalue a population parameter.

A **population** refers to the complete set of elements within a group, while a **sample** is a subset of the population chosen to represent the entire population.

An **unbiased estimator** is a reliable statistical measurement with an expected value that matches precisely with the value it aims to estimate. Conversely, the expected value of a biased estimator differs from the true value.

Generally, the variance of a sample is lower than the variance of the population from which it is drawn. This is due to two main reasons:
1. The sample mean is always part of the sample, but the population mean may not be included in the sample. Consequently, the sample variance could potentially underestimate the actual population variance.
2. The majority of samples won't include the outliers simply due to randomness. If a sample variance doesn't take into account these outliers, while the population variance does, then the sample variance is likely to be somewhat smaller.

The formula for population variance is $\sigma^2 = \frac{\Sigma(x - \mu)^2}{N}$

Or, the sum of the squared differences between the data points and the population mean, divided by the number of observations in the population. Since we know that samples typically display less variability compared to the population they're drawn from, applying the population variance formula to a sample would yield an average sample variance that is less than the true population variance. It's undesirable to apply the population variance formula on a sample as it is noticeably a biased estimator. Utilizing the population variance formula to calculate the sample variance tends to undervalue the population variance, given that samples are likely to exclude outliers. 

Nonetheless, if we divide by a number smaller than the sample size within our variance formula, we will obtain a higher variance value that aligns more closely with the population variance. We can offset this by dividing by `n−1` rather than `n`, allowing us to adjust our formula to yield an unbiased estimate. While a specific sample may still not be entirely accurate, if we took all samples of the same size and averaged their variances, we would arrive at the correct population variance.

To get an _unbiased variance_ of the sample, we need to divide by `n-1` to get the formula for the **sample variance**:

$s^2 = \frac{\Sigma(x - \bar{x})^2}{n - 1}$
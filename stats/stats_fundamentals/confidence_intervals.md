The **central limit theorem** informs us that, under many circumstances, samples from a population will likely produce values that are normally distributed around the actual population's values. Surprisingly, this holds true even when the population characteristics are not normally distributed. This is excellent news as it suggests that our sample values are likely to closely mirror the population values.

Well, with 95.5% certainty we know that our sample will fall within 2 standard deviations of the mean of the actual population. For instance, we could take a sample of the population to see how many people are left-handed and find that about 10% of the sample was left-handed and the sample had a standard deviation that gives us a 95% probability that the real population proportion is between 8% and 12%. Such a range, which we believe is likely to contain the actual value, is called a **confidence interval**. It's important to note that the higher our desired certainty level that our interval encompasses the actual value, the wider the interval must be.

In normally distributed data:
* __68.3%__ chance population mean/proportion is within a range of __1 standard deviation__ of the sample mean/proportion 
* __95.5%__ chance population mean/proportion is within a range of __2 standard deviations__ of the sample mean/proportion
* __99.7%__ chance population mean/proportion is within a range of __3 standard deviations__ of the sample mean/proportion

To quantify the likelihood that our sample is representative of the actual population value, and to clarify what we mean by “representative,” statisticians employ a tool known as a confidence interval:

"Given the sample size, it's 90%/95%/99% likely that the population's proportion falls between `low value of confidence interval` and `high value of confidence interval`.

When we use sampled data to estimate a proportion within the population, our guess at the standard deviation, known as the **standard error**, is calculated using the formula:

$SE = \sqrt{\frac{\hat{p}\hat{q}}{n}}$

where $\hat{p}$ is our sampled proportion, its complement is $\hat{q} = 1 - \hat{p}$, and $n$ is the number of individuals in the sample

Example: After conducting an examination of 900 trees in our local forest, we found that 280 of them are maple trees. What is the standard error of this sample?

$\hat{p} = 280 / 900$
and
$\hat{q} = 1 - (\frac{280}{900})$
and $n = 900$

$\sqrt{\frac{0.3\bar{1} * 0.6\bar{8}}{900}}$ = $0.01543160493037$ or $~1.5\%$

We can utilize the sample proportion to derive a **standard error**, and use this information to estimate the probability that the real population proportion falls within a certain distance from our sample.

To calculate the **confidence interval** for a specific percentage of confidence (e.g. 70% or 95%) you need to multiple your standard error by a **z-score** that is associated with your desired confidence level (for 95% it is 1.96) and then add and subtract this value from the sample proportion mean to get your confidence range.

Depending on the degree of uncertainty we're willing to tolerate, our confidence intervals might either include or exclude a crucial value.
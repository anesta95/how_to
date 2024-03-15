$z$-score assigns a value to a data point $x$ from a data set by considering its distance to the mean $\mu$ and how spread the data set is, measured by standard deviation $\sigma$:

$z = \frac{x - \mu}{\sigma}$

If we know the mean and standard deviation for a variable, we can find the location of any value on that distribution by converting it to a $z$-score usiing the formula above. Essentially what we're doing here is finding the distance between the score $x$ and the mean $\mu$ and then dividing that distance by the value of one standard deviation $\sigma$ to see how many standard deviations it would take to travel that distance.

To find the $p$-value associated with a $z$-score do the following:

## In R:

`pnorm(q, mean = 0, sd = 1, lower.tail = T)`

Where:
* `q`: The $z$-score. 
* `mean`: The mean $\mu$ of the _normal_ distribution. Default is 0.
* `sd`: The standard deviation $\sigma$ of the normal distribution. Default is 1.
* `lower.tail`: If `T`, the probability to the left of `q` in the normal distribution is returned. If `F`, the probability to the right is returned. Default is `T`.

Some examples

### Left-tailed test
Suppose we want to find the $p$-value associated with a $z$-score of `-0.77` in a left-tailed hypothesis test.

`pnorm(q=-0.77, lower.tail=T)`

The $p$-value is `0.2206`. If we use a significance level of $\alpha$ = 0.05, we would fail to reject the null hypothesis of our hypothesis test because this $p$-value is not less than `0.05`.

### Right-tailed test
Suppose we want to find the $p$-value associated with a $z$-score of `1.87` in a right-tailed hypothesis test.

`pnorm(q=1.87, lower.tail=F)`

The $p$-value is `0.0307`. If we use a significance level of $\alpha$ = 0.05, we would reject the null hypothesis of our hypothesis test because this $p$-value is less than `0.05`.

### Two-tailed test
Suppose we want to find the $p$-value associated with a $z$-score of `1.24` in a right-tailed hypothesis test.

`2 * pnorm(q=1.24, lower.tail=F)`

To find this two-tailed $p$-value we simply multiplied the one-tailed $p$-value by two.

The $p$-value is `0.2149`. If we use a significance level of $\alpha$ = 0.05, we would fail to reject the null hypothesis of our hypothesis test because this $p$-value is not less than `0.05`.


## In python:
```{python}
import scipy.stats

# Where z-score here is -0.67
p_value = scipy.stats.norm.sf(abs(-0.67))

```
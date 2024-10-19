Student $t$-statistics are indispensable tools for comparing **two** population means, but where do we turn when we need to compare **three** or **more** means? This is where **analysis of variance** (**ANOVA** for short) tools come into play. These are very closely related to _linear regression_. Linear regression is the most natural setting for understanding its main ideas.

In _ANOVA_:
* independent categorical variables are called **factors**
* the dependent variable is often called the **response**, and
* the categories of the factors are called **levels**.

The **significance** is the probability of rejecting the null hypothesis when it's true.

* The significance is also known as the **false positive rate** since a **false positive** is the type of error made when the null hypothesis is incorrectly rejected when it's true.
* In contrast, a **true positive** describes the result of a test that correctly rejects $H_0$ when it's false.

Generally, the null hypothesis states that **no** real effect is present.

The probability of a **false positive** also known as a **Type 1 error** skyrockets as we increase the number of **levels** – categories of the independent variable. Fortunately ANOVA methods allow us to compare multiple population means while retaining control over the significance. 

### Linear Regression
In the context of linear regression, the dependent variable is still called a response. However the independent variable is called a _predictor_ variable since linear regression is just a data model to make a prediction of future events based on past data.

The model $B$ = constant can't perfectly account for all observations $b_i$. Our measure for its overall performance is the **SSE** or **Sum of Squared Errors**:

$\displaystyle\sum_{observations}(\text{observation - model prediction})^2 = \displaystyle\sum^n_{i=1}(b_i - constant)^2$

The $i^{th}$ term measures how much the model fails to account for the corresponding observation (i.e. the model's error). The bigger $(b_i - constant)^2$ is, the greater the failure.

The best possible constant model makes the SSE – sum of squared errors – as small as possible. The sample mean, $constant = \frac{1}{n}\displaystyle\sum^n_{i=1}b_i = \bar{b}$, minimizes the model SSE, so it's the best possible choice if we focus our attention on constant models.

For observations $y_1,\dots,y_n$, the SSE of the model $Y = \bar{y}$ is $\displaystyle\sum^n_{i=1}(y_i - \bar{y})^2$, which is the smallest value for the SSE among all constant models.

### Best-fit lines

We say that the **best-fit line** is the one that leads to the smallest SSE. There's a surefire process for finding the best-fit line.

The linear model of a data set with minimal SSE corresponds graphically to the straight line that passes closest to all points in the scatter plot.

If the points are ${(x_1,y_1),\dots(x_n,y_n)}$ then the intercept is given by $c = \bar{y} - m\bar{x}$ while the slope $m$ is given by $m = \frac{s^2_{XY}}{s^2_{X}}$ where $s^2_X$ and $s^2_Y$ are the sample variances of the predictor and response variables, respectively.

Put together, we have the **best-fit line** $y = c + mx$

### Linear Regression F-statistic
The null hypothesis $H_0$ says that there's no relationship between the response variable and the predictor variable(s). Put another way, any variation in the response seen in our data is due solely to random noise or other variables that have nothing to do with the predictor(s).

Turning this around, if the best-fit line far outperforms the best constant model, then we'd have good evidence to reject $H_0$.

The performance of the best constant model is measured by the **total sum of squares** $SST = \displaystyle\sum_i(observation_i - sample\:mean)^2$, which is a random variable when the random noise $\epsilon_i$ is taken into account.

In general, the SST is approximately a $\chi^2$ variable when the linear regression null hypothesis is true and $n$ is very large.

On the other hand, the overall error in the best-fit model is given by the **sum of squared errors**:

$SSE = \displaystyle\sum_i(observation_i - best–fit\:model_i)^2$

The SSE has $(n - 2)$ degrees of freedom since there are two point estimators present — one for the **slope** and one for the **intercept**.

If $(SST−SSE)$ is relatively **small**, then we don't have much reason to claim that the best-fit model is an improvement over the best constant model — the overall error is pretty much the same in this case.

If, on the other hand, $(SST−SSE)$ is relatively **big**, then the best-fit line does a much better job accounting for the data than the best constant model.

We'll be able to find a better fit to the data whenever we add more model parameters. The question is, "How much better?". So we have to ask, "Is the squared-error reduction noteworthy, or is it just the generic reduction that we can expect from using a fancier model?"

To answer this question, we need a baseline expectation for the amount of squared error — relative to the best-fit line — that is associated with each degree of freedom of the dataset.
In plain terms, each new data point $(X_i,Y_i)$ contributes $\sim (Y_i - best-fit_i)^2$ to the SSE.

The amount of squared error per degree of freedom, relative to the best-fit line, is just $\Delta\sigma^2 = \frac{SSE}{n - 2}$

The linear model is _justified_ when $(SST - SSE) \gg \Delta\sigma^2$. This can be re-written as: $\frac{SST - SSE}{\Delta\sigma^2} \gg 1$.

The linear model is _unsupported_ when $\frac{SST - SSE}{\Delta\sigma^2} \approx 1$

This ratio has come to be known as the $F$-statistic and is a general-purpose indicator for whether the variation in a dataset justifies the use of a linear model. Substituting the value for $\Delta\sigma^2$, it becomes

$F = \frac{SST - SSE}{\frac{SSE}{n - 2}}$

Being the difference of two $\chi^2$ variables, (SST - SSE) follows the so-called ANOVA identity (SST - SSE) = SSR where $SSR = \displaystyle\sum_i = (best-fit\:model_i - sample\:mean)^2$. This is also called the **sum of squares due to regression**, which is another $\chi^2$ variable.

In the case of a multilinear model that removes $g$ (the number of coefficients) degrees of freedom, we should compare the reduction in squared error (SST - SSE), to $g * \Delta\sigma^2$, and $F$ becomes: $F = \frac{(SST - SSE)}{g * \Delta\sigma^2}$ or $F = \frac{\frac{SSR}{g}}{\frac{SSE}{n-1-g}}$.

If the SSE, SST, and SSR are normalized by their respective number of degrees of freedom, then we write them as MSSE, MSST, and MSSR to reflect that they are **mean sums of squared error** per degree of freedom.

In general we can find a threshold $c(n,g)$ such that
* if $F \gt c(n,g)$, then we reject $H_0$, and
* if $F \approx c(n,g)$, then we fail to reject $H_0$

To find the critical value $c(n,g)$, we need to know just how $F$ is distributed.

As we've shown, the $F$-statistic is the ratio of two $\chi^2$ variables, and we can work out its distribution in terms of the individual $\chi^2$ distributions.

If we call the total number of degrees of freedom in either variable a and b, then we can define a new random variable called the $F$ **random variable**.

Let $\chi^2_a$ and $\chi^2_b$ be independent $\chi^2$ random variables. Then $F(a,b) = \frac{\frac{\chi^2_a}{a}}{\frac{\chi^2_b}{b}}$ is called an $F$ **random variable with $a$ and $b$ degrees of freedom.**

### ANOVA Tables

The information presented in an ANOVA table gives a way to judge _how well_ a best-fit line models data. The larger the $F$-value, the better the linear best-fit model describes the data in comparison to the baseline constant model, with is just the sample mean. 

If the $p$-value given by $p = P(F \geq the\:observed\:F-value)$ is below the the significance level (typically 0.05), then we have enough evidence to reject the null hypothesis $H_0$ that there's no linear relationship between a predictor variable and a response variable.

The $F$-value, on the other hand, measures how well the best-fit line performs compared to the best constant model, aka the sample mean.

### Mean Comparisons

> "How do we compare multiple population means without inflating the false positive rate?"

The answer lies in reframing the comparison problem as a problem in linear regression. This is referred to as **one-way ANOVA**.

The model prediction is the level mean $\mu_j$ for any factor in level $j$, i.e.

$\text{(model prediction)} = \mu_0 + \displaystyle\sum^{l - 1}_{j=1}(\mu_j - \mu_0)x_j$

In general mean comparison problems, the null hypothesis $H_0$ states that there are no differences in the population means: $\mu_0 = \mu_1 = \mu_2 = \dots$

Consider the model prediction that's outlined above as a _response variable_ and the indicators as _predictor variables_:

So testing $H_0$ is the same as testing the null hypothesis of linear regression. The null hypothesis $\mu_0 = \mu_1 = \mu_2 = \dots$ is equivalent to stating that the model prediction doesn't depend on any of the predictor variables.

The **latter** version of $H_0$ is precisely what an ANOVA table allows us to decide. 
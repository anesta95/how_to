Student $t$-statistics are indispensable tools for comparing **two** population means, but where do we turn when we need to compare **three** or **more** means? This is where **analysis of variance** (**ANOVA** for short) tools come into play. These are very closely related to _linear regression_. Linear regression is the most natural settign for understanding its main ideas.

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

The model $B$ = constant can't perfectly account for all observations $b_i$. Our measure for its overall performance is the **SSE**:

$\displaystyle\sum_{observations}(\text{observation - model prediction})^2 = \displaystyle\sum^n_{i=1}(b_i - constant)^2$

The $i^{th}$ term measures how much the model fails to account for the corresponding observation (i.e. the model's error). The bigger $(b_i - constant)^2$ is, the greater the failure.

The best possible constant model makes the SSE – sum of squared errors – as small as possible. The sample mean, $constant = \frac{1}{n}\displaystyle\sum^n_{i=1}b_i = \bar{b}$, minimizes the model SSE, so it's the best possible choice if we focus our attention on constant models.

For observations $y_1,\dots,y_n$, the SSE of the model $Y = \bar{y}$ is $\displaystyle\sum^n_{i=1}(y_i - \bar{y})^2$, which is the smallest value for the SSE among all constant models.

### Best-fit lines

We say that the **best-fit line** is the one that leads to the smallest SSE. There's a surefire process for finding the best-fit line.

The linear model of a data set with minimal SSE corresponds graphically to the straight line that passes closest to all points in the scatter plot.

If the points are ${(x_1,y_1),\dots(x_n,y_n)}$ then the intercept is given by $c = \bar{y} - m\bar{x}$ while the slope $m$ is given by $m = \frac{s^2_{XY}}{s^2_{X}}$ where $s^2_X$ and $s^2_Y$ are the sample variances of the predictor and response variables, respectively.

Put together, we have the **best-fit line** $y = c + mx$
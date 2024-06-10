One can turn categorical variables in a regression model into numerical ones by pivoting them wider (i.e. one column per value option in the variable) and using binary (i.e. `1` for `TRUE` and `0` for `FALSE`) variables for each.

When the regression line for one variable in a multi-variable model does not seem to fit the data well, it suggests that some of the _independent_ variables in the model **interact**. Two independent variables $x_1$ and $x_2$ **interact** if the impact of $x_1$ on the dependent variable $y$ depends on the value of $x_2$.

To create a new independent variable — an interaction term — one can multiply $x_1$ and $x_2$. The interaction term accounts for the fact that the change in the value of variable $x_1$ can be itself _dependent_ on the variable $x_2$ An **interaction term** is a product of two or more independent variables that have a joint effect on the dependent variable.


By _transforming variables_ that are continuous/numerical (e.g. taking the exponent, square root, square, log etc.), we can use linear regression to describe non-linear relationships.

_Natural logarithm_ of a number $x$ is a number $log(x)$ such that $exp(log(x)) = x$.

To create a multiple linear regression model, we can _transform_ the dependent variable and some or all of the independent variables. By transforming variables we can apply multiple linear regression even to non-linear relationships.
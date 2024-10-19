### Assessing a model

To assess how well a multiple linear regression model predicts the data one should define a base model to compare with it. We can compare any multiple variable linear regression model with a model with _no_ independent variables.

In the absence of any additional information, the best prediction is always the mean value. Any reduction in the **Mean Squared Error** (MSE) seen by adding in independent variables can by quantified by taking the proportion of the amount of reduction in the MSE to the old MSE derived from the model of _no_ independent variables (using just the simple mean) and subtracting it from one. This reduction is called the **coefficient of determination** $R^2$.

The _coefficient of the determination_ ($R^2$) of a model is equal to $1 - \frac{\text{MSE of the model}}{\text{MSE of the base model}}$. The base model has $R^2 = 0.0$ and a perfect model would have $R^2 = 1.0$. The smaller the average distance between actual and predicted values, the closer to $1.0$ the coefficient of determination is.

### Choose Variables
A variable improves predictions when it gives information that isn’t already in the model. Independent variables tend to produce better predictions when they are:
* _Strongly_ correlated with the quantity we want to predict
* _Weakly_ correlated or uncorrelated with _each other_.

### Avoid Overfitting
With enough variables included, a regression model will eventually fit the data perfectly, whether or not those variables are meaningful. This is called **overfitting**.

Sometimes adding more variables made a model worse at making predictions about unseen data, even as the model fit the initial data increasingly well. _Overfitting_ results in models that look good at first, but make bad predictions.

Using a larger dataset and a simpler model would help avoid overfitting. With a larger data set, it becomes easier to tell which variables are worth including and which ones are not. It's possible to overfit a model with a variable that seems like it could be relevant. When a variable increases $R^2$ only slightly, it may be better to leave it out. A simpler model, with fewer variables, is often more useful.

### Interpret the model

To see the true effect of just changing one specific variable in a model, we must “control” for these other variables. **Controlling** a variable means keeping it constant. This can help to show the true relationship between the variables of interest.

To isolate the effect of a variable $x$ one can:
1. Select a set of data points with similar values for variables $a$ and $b$ you would like to control for.
2. Run a _simple linear regression_ with variable $y$ you'd like to see effects on as a function of variable $x$ that will change and is not being controlled for.

But this isn't the only way to example the effect of a single variable in a model. Another way is to include all variables into a _multiple regression model_. However, one should take care in how one interprets the coefficients of variable in a multiple regression model.

Coefficients taken alone may not tell the whole story. Inspecting data visually is one way to check the reliability of predictions.


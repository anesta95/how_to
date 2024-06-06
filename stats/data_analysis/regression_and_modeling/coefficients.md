Adding new variables to a model changes the **coefficients**. The new variable affects the entire model. The coefficients change in order to balance the entire model equation. 

In a model $y = a_0 + a_1x_1 + a_2x_2 + a_3x_3 + \dots,$ an increase in $x_1$ by 1 changes $y$ by $a_1$, with $x_2, x_3, \dots$ held constant.

If we increase one independent variable and hold the other independent variables constant, the dependent variable:
* increases if the independent variable has a **positive** coefficient, and
* decreases if the independent variable has a **negative** coefficent

The same variable expressed in different _units_ (such as hours instead of minutes) will have a different coefficient. For this reason, a larger coefficient doesn’t necessarily mean a more important variable. 

### Optimize Coefficients

Coefficients are calculated to give the model that best fits the data. Fitting the data as well as possible means bringing the line as close as we can to all data points, to minimize the _mean squared error (MSE)_. Mean squared error (MSE) is the average of the squared differences between the actual and the predicted values.

With the model's _predictions_ on the $x$-axis, of a scatter plot, we can add additional variables to get a better fit, with a smaller MSE. The more coefficients one has, the harder it becomes to find the best fit manually. When working with multiple regression, all one has to do is specify the input variables — the optimal equation is worked out for you.



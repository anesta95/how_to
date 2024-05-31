Fitting a line to the data allows you to predict values using a **function**, which describes the relationship between two variables mathematically. 

### Computing Linear Regression

Linear regression is a simple, fast way to choose a line to fit data. Most programming languages and spreadsheets can compute it automatically. These functions calculate the _slope_ and _intercept_ of the linear regression for two measurements, $X$ and $Y$. The slope of a line describes its steepness and direction. It is calculated by change in $y$ divided by change in $x$. The intercept is where the regression line intersects with the $y$-axis, which is also when the $x$ value is $0$. 

We can write a function to describe the relationship between these two measurements in the form $y = mx + b$ where $m$ is the slope, $b$ is the intercept, $x$ is the input value, and $y$ is the estimated value on the line.

Linear regression is an efficient way to find a line that fits the data.

### Prediction

We can use the regression line to extrapolate a short time into the future.

### Accuracy

To assess the accuracy of the predicted values in a regression line, once can use **mean absolute error** (MAE). Absolute error is the absolute value of the error, so it is always positive. Because we are not squaring the error, as we do with MSE, MAE is not as sensitive to outliers. **Mean absolute error** (MAE) is the average of the absolute values of all the errors.

One can use a regression line based on current data to make predictions for the future and then assess the accuracy of the predictions with mean absolute error (MAE).
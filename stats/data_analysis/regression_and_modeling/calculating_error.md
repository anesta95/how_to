### Mean squared error

_Error_ is the difference between the predicted value on the regression line and the actual value. The positive and negative errors cancel out, so the average, or mean, is close to _0_. Simply using the mean won't help us evaluate the regression line. Squaring the errors to make them all positive, and then computing the mean will yield a large positive number which is the **mean squared error** (MSE) or the average of the squared errors.

It turns out that the line with the lowest MSE is also the linear regression line. The regression line is optimal in the sense that it minimizes squared errors. Because the regression line minimizes squared errors, linear regression is also called **least squares**.

### R squared

Instead of using the regression line one can also use the simple mean of all the $Y$ values for the data points as guess for any corresponding $X$ value. This will almost always yield a _mean squared error_ (MSE) that's *higher* than the regression line/line of best fit/least squares. Using regression typically reduces the _mean squared error_ by a percentage from just using the mean of all $Y$ values – the average line. This reduction in MSE is called $R^2$ and is expressed as a decimal such as $0.33$

$R^2$, expressed as a decimal, is the reduction in mean squared error (MSE) between the average and regression line. $R^2$ is not only the reduction in mean squared error (MSE) but also **the square of correlation** or the $R$ value. Because it is squared, $R^2$ is always positive, even for negative correlation $R$ values.

Higher correlation $R$ corresponds with a higher $R^2$ and a higher reduction in the MSE. As correlation approaches 1, or increases, so does $R^2$.
Data is commonly split into **quartiles** which split the data into fourths. This can be visualized using a _boxplot_.

The first quartile is a value for which a quarter – 25% – of data points in the set come before. Second quartile is the same value for 50% of the data points. The second quartile is another term for the _median_. Third quartile is the value where 75% of the data points come before it. The median of the lower half of the data is the first quartile and the median of the upper half of the data is the third quartile. 

The _maximum_ and _minimum_ values in a dataset are the 100% and 0%, respectively.

When we have an odd number of terms, the quartile calculation gets more complicated. For example, in the dataset `{1,2,3,4,5,6,7}` we could include the 4 in the set representing the lower half as well as the set representing the upper half, or we can exclude the 4 from both sets, or do something else entirely.

The method of excluding the median from both halfs in data sets with an odd number of values is the **Tukey method**. The method of including the median in both halfs is the **M&M method**. Neither method is completely satisfactory, as it biases quartiles either slightly toward or away from the median.

To obtain the number at a specific quantile value, one can do **linear interpolation**. For example, to obtain the quantile at 28%, we'll assume there is a straight line between the values of the two closest known points. 

For example, for two points at x = 20, y = 3 and x = 30, y = 6 we can calculate the slope as $y_1 - y_2 / x_1 - x_2$ = `6 - 3 / 30 - 20` = `3/10`.
Now that we know the slope, we'll use point-slope form of the line and the point `(30, 6)`.

**Point-slope Form**: When we know a point $(x_1, y_1)$ on the line and slope of the line $m$. Given this, the equation for the line is $(y - y_1) = m(x - x_1)$. 

In the example this would be: 
`y - 6 = .3(28 - 30)` = `y = -.6 + 6` = `y = 5.4`.

In general, when we have _n_ data points, the interval between each one is: $100 / n - 1$%

In this case the line is calculated with the percentage quantile as the x-axis value and the value itself as the y-axis value.
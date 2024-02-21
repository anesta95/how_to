The interquartile range or **IQR** is the difference between the first quartile and the third quartile.

We can use the IQR to identify **outliers** in a dataset. An outlier in a dataset has a value that is significantly larger or smaller than most of the rest of the set.
The IQR is used in a common mathematical definition of an outlier. Specifically, an outlier is any data point that is

* Smaller than `(first quartile)−(1.5×IQR)` _or_
* Larger than `(third quartile)+(1.5×IQR)`

Sometimes boxplots are modified to _exclude outliers_. Any points that are determined to be outliers are replaced with a dot. The endpoints of the boxplot then show the minimum and maximum excluding these outliers.


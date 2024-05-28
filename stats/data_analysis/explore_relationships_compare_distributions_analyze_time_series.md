## Explore Relationships

### Scatterplots
To make a scatterplot less crowded, transform it so that each unit on the $x$-axis represents the same **ratio** between GDPs, using a **logarithmic** scale.

On a **linear scale**, each unit corresponds to _adding_ the same amount. On a **logarithmic scale**, each unit corresponds to _multiplying_ by the same amount. A base-10 **logarithm** tells us how many times we need to multiply 10 to get another number. For example, it takes 3 multiplications to get 1000 from 10, ($10 * 10 * 10$ or $10^3$) so $log(1000)=3$.

A base-10 logarithm gives us roughly the number of digits in a number, or its order of magnitude.

### General rule of thumb
When both variables vary from data point to data point by orders of magnitude, one should adjust both axes to logarithmic. Logarithmic axes can make the plot much clearer.

## Compare Distributions

### Histograms

The **mode** is the most common value (or values) in a dataset.

In a continuous distribution, it's likely that no values repeat. When examining a histograme, one can approximate the mode with the histogram's tallest bar.

### Boxplots

A visualization type useful for comparing _multiple distributions_ is a **box and whisker plot**, or **boxplot**.

In a boxplot, the middle line represents the **median**, and the ends of the 'whiskers' mark the **minimum** and **maximum** values. The 'box' ranges from the 25th percentile of the data — called the lower quartile, or $Q_1$ — and the 75th percentile — called the upper quartile, or $Q_3$.

Both histograms and boxplots give us an overview of the dataset, but they focus on its different aspects. Histograms illustrate a detailed view of a distribution, while boxplots summarize that distribution.

### Time Series

An ordered sequence of values taken at equally spaced time points in time is called a **time series**. A **trend** is the general, long-term pattern of a time series. Parts of a time series can have different trends than the overall trend of the time series.

Analyzing a time series usually requires looking at long-term trends and short-term variability.

In general: The most appropriate visualization is a plot that displays only the necessary information. 
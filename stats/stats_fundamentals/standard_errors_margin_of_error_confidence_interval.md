## Standard Errors
Standard errors relate to differences that occur from sampling errors, but _not_ from nonsampling errors. Sampling errors are differences between the results computed from a sample of observations and those computed from all observations in the population. All estimates produced from sample surveys have uncertainty associated with them as a
result of being based on a sample of the population rather than the full population. This uncertainty — called sampling error — means that estimates derived from the survey will likely differ from the values that would have been obtained if the entire population had been included in the survey, _as well_ as from values that would have been obtained had a different set of sample units been selected for the survey.

Measures of the magnitude of sampling error reflect the variation in the estimates over all possible samples that could have been selected from the population using the same sampling methodology. The **margin of error** is the measure of the magnitude of sampling error provided with published survey estimates.

### Margins of Error and Confidence Intervals
A margin of error (MOE) describes the precision of an estimate at a given level of confidence. The confidence level associated with the MOE indicates the likelihood that the sample estimate is within a certain range (the MOE) of the population value. The MOEs for published Census Bureau's ACS estimates are provided at a 90 percent confidence level. From these MOEs, data users can easily calculate 90 percent confidence intervals that define a range expected to contain the _true_ or population value of an estimate 90 percent of the time. By adding and subtracting the MOE from the point estimate, we can calculate the 90 percent confidence interval for that estimate. 

Estimates with smaller MOEs—relative to the value of the estimate—will have narrower confidence intervals indicating that the estimate is more precise and has less sampling error associated
with it. However, when constructing confidence intervals from MOEs, data users should be aware of any “natural” limits on the upper and lower bounds. For example, if a population estimate is near zero, the calculated value of the lower confidence bound may be less than zero. However, a negative number of people does not make sense, so the lower confidence bound should be reported as zero instead. Another natural limit would be 100 percent for the upper confidence bound of a percent estimate. Data users should always keep the context and meaning of an estimate in mind when creating and interpreting confidence intervals.

### Standard Errors and Coefficients of Variation a.k.a Relative Standard Error

A standard error (SE) measures the variability of an estimate due to sampling and provides the basis for calculating the MOE. The SE provides a quantitative measure of the extent to which an estimate derived from a sample can be expected to deviate from the value for the full population. SEs are needed to calculate coefficients of variation and to conduct tests of statistical significance. Data users can easily calculate the SE of a survey estimate by dividing the positive value of its MOE by 1.645 (the **z-score**) (or 1.95 for 95% confidence, etc.) as shown below:

$\text{SE} = \frac{MOE}{z-score}$ or alternatively $\text{MOE} = \text{SE} * \text{z-score}$

Generally standard error can be calculated as $SE = \frac{\sigma}{\sqrt{n}}$ OR $SE = \frac{s}{\sqrt{n}}$ where $\sigma$ is the _population standard deviation_, $s$ is the _sample standard deviation_ and $n$ is the sample size.

The SE for an estimate depends on the underlying variability in the population for that characteristic and the sample size used for the survey. In general, the larger the sample size, the smaller the SE of the estimates produced from the sample data. 

**Coefficients of variation** are another useful measure of sampling error. A coefficient of variation (CV) measures the _relative_ amount of sampling error that is associated with a sample estimate. The CV is calculated as the ratio of the SE for an estimate to the estimate itself $\hat{X}$ and is usually expressed as a percent:

$CV = \frac{SE}{\hat{X}} * 100$

A small CV indicates that the SE is small relative to the estimate, and a data user can be more confident that the estimate is close to the population value. The CV is also an indicator of the reliability of an estimate. When the SE of an estimate is close to the value of the estimate, the CV will be larger, indicating that the estimate has a large amount of sampling error associated with it and is not very reliable. 

### Determining Statistical Significance
One of the most important uses of ACS data is to make comparisons between estimates—across different geographic areas, different time periods, or different population subgroups. Data users may also want to compare ACS estimates with data from past decennial censuses. For any comparisons based on ACS data, it is important to take into account the sampling error associated with each estimate through the use of a statistical test for significance. This test shows whether the observed difference between estimates likely represents a true difference that exists within the full population (is statistically significant) or instead has occurred by chance because of sampling (is not statistically significant). Statistical significance means that there is strong statistical evidence that a true difference exists within the full population. Data users should not rely on overlapping confidence intervals as a test for statistical significance because this method will not always provide an accurate result.

When comparing two ACS estimates, a test for significance can be carried out by making several calculations using the estimates and their corresponding SEs. These calculations are straightforward given the published MOEs available for ACS estimates in data.census.gov and many other Census Bureau data products. The steps to test for a statistically significant difference between two ACS estimates are as follows:

1. Calculate the SEs for the two ACS estimates using the formula above.
2. Square the resulting SE for each estimate.
3. Sum the squared SEs.
4. Calculate the square root of the sum of the squared SEs.
5. Divide the difference between the two ACS estimates by the square root of the sum of the squared SEs.
6. Compare the absolute value of the result from Step 5 with the critical value for the desired level of confidence (1.645 for 90 percent, 1.960 for 95 percent, or 2.576 for 99 percent).
7. If the absolute value of the result from Step 5 is greater than the critical value, then the difference between
the two estimates can be considered statistically significant, at the level of confidence corresponding to the
critical value selected in Step 6.

## Relative Standard Errors a.k.a Coefficients of Variation
Relative standard errors are standard error values that are reported as a percentage of the estimate value.

### Using Standard Errors
Standard errors can be used to measure the precision with which an estimate from a particular sample approximates the expected result (value) of all possible samples (population). The chances are about 68 out of 100 that an estimate from the survey differs from a population result by less than the standard error. The chances are about 90 out of 100 that this difference would be within 1.645 standard errors. The chances are about 90 out of 100 that this difference would be within 1.645 standard errors.

The standard errors can be used to define a range or level of confidence (confidence interval) around an estimate. The BLS and Census Bureau uses a 90 percent confidence level. If all possible samples were selected and an estimate of a value and its sampling error were computed for each, then (for approximately 90 percent of the samples) the intervals from 1.645 standard errors below the estimate to 1.645 standard errors above the estimate would include the "true" average value. For 95% that **z-score** is 1.96 standard errors, for 99% it's 2.576, and for 99.5% it's 2.807 standard errors. If you wish to calculate a 95 percent confidence interval, replace the critical value of 1.645 with 1.96. For a 99 percent confidence interval, use 2.575 as the critical value.

### Example

The 90% confidence interval for a total compensation estimate of \$37.03 from the BLS [Employment Cost Index](https://www.bls.gov/eci/home.htm) with a **relative standard error** of 1.3\%. This confidence interval comes out to \$37.03 plus or minus $\pm$ \$0.79 (1.645 standard errors times \$0.48 – which is 37.03 * .0013) or \$36.24 to $37.82.

### Building an interval

* Total compensation for civilian workers = \$37.03
    * Relative standard error = 1.3% of \$37.03 = \$0.48 
    * 90% confidence interval = \$37.03 $\pm$ (1.645 x \$0.48) = [\$36.24, \$37.82]

Thus, there is a 90% chance that the population value is between $36.24 and $37.82.
The next example shows that it may be difficult to draw conclusions about differences between two estimates without considering the relative standard error.

### Comparing Intervals

* Retirement and savings costs for professional and business services workers = \$0.17
    * Relative standard error = 39.0%
    * 90% confidence interval = \$0.17 $\pm$ (1.645 x .39 x \$0.17) = [\$0.06, \$0.28]
* Retirement and savings costs for education and health services workers = \$0.08
    * Relative standard error = 24.7%
    * 90% confidence interval = \$0.08 $\pm$ (1.645 x .247 x \$0.08) = [\$0.05, \$0.11]

Values from $0.06 to $0.11 fall within the 90% confidence intervals for both industries. Thus, at the relevant level of precision, all values within the range of $0.06 to $0.11 are plausible values for either industry. That is, the comparative statement that retirement and savings costs for professional and business services workers is larger than costs for those in education and health services workers does not pass the statistical significance test.


## Sources
* [BLS Relative Standard Errors](https://www.bls.gov/ecec/factsheets/ecec-relative-standard-errors.htm)
* [US Census Bureau Understanding Error and Determining Statistical Significance](https://www.census.gov/content/dam/Census/library/publications/2021/acs/acs_aian_handbook_2021_ch07.pdf)
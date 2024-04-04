A test to draw a conclusion about whether two populations share the same distribution is called a **homogeneity test**. To test for homogeneity, one can use a Pearson's statistic of the form:

$\displaystyle\sum_i\frac{(O_i - E_i)^2}{E_i}$

where $O$ is an observed variable with value $i$ and $E$ is the _expected_ value $i$ of variable $O$.

_However_, to apply a $\chi^2$ test to categorical data organized into a table, the expected count of _each cell_ needs to be greater than 5. The idea behind the criterion is this — counts are discrete, but the $\chi^2$ approximation relies on the counts being roughly normally distributed. When the **expected counts** are greater than 5, the normal approximation tends to be good.

**Expected counts** are the proportion of people in a group of the population – say those getting their blood pressure taken that are married – that is expected based on the category group's proportion to the entire population. In this example say the proporiton of people who are prehypertensive to the total sample population is about $\frac{38}{120} = 17.5\%$. Given that, we would expect the proportion of the 50 total _married_ people in the sample to be $50 * 0.175 = 8.75$.

To use the go-to Pearson statistic for homogeneity tests:
$\displaystyle\sum_{cells}\frac{(\text{observed count in cell - expected cell count})^2}{\text{expected cell count}}$

However before you can perform a homogeneity test, you need to count the degrees of freedom. The naive degrees of freedom a.k.a the total number of degrees of freedom if each squared term in the sum were an independent variable. This is just the discrete number of cells in the table of each category. Using the previous example this would be both married & unmarried people who fall into one of the four blood pressure categories: normal, prehypertensive, hypertensive S1, and hypertensive S2.

For any table with $r$ rows and $c$ columns, the naive number of degrees of freedom in $\displaystyle\sum_{cells}\frac{(O_i - E_i)^2}{E_i}$ is the number of squared terms in the sum, which is the number of cells, or $r * c = rc$

We have to decrease $rc$ by 1 for every constraint in order to get the true count of the degrees of freedom. If the sum of the counts in every row and every column is known and fixed, they each contribute 1 constraint. Thus the rows and columns contribute $r + c$ constraints, which means the native count of degrees of freedom $r*c$ needs to be decreased by this amount.

_Additionally_, If you have the **total** sum number of sample (e.g. people in a study) you don't need one of the $r + c$ constraints coming from the rows and columns of the table. So you have to add one back in.

All together, a table with $r$ rows and $c$ columns recording cell counts for a homogeneity test of categorical variables has $(r+c−1)$ constraints. Subtracting this from the naive degree of freedom count gives us:

$rc - (r + c - 1) = r(c - 1) - (c - 1) = (r - 1) * (c - 1)$


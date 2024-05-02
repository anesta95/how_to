# [Using the Online SDA Tabulator with NHIS](https://nhis.ipums.org/nhis/resources/userNotes_sda_instructions.pdf)

Before you begin to use the Survey Data Analyzer (SDA), an online data tabulator, we recommend that
you open a separate browser and pull up the [variables page](https://nhis.ipums.org/nhis-action/variables/group) on the National Health Interview Survey
(NHIS) [website](https://nhis.ipums.org/nhis/) to access the appropriate documentation for each variable of interest. ***Variable lists for any given survey year can also be found by clicking the `Codebook` button at the top of the SDA web tool.*** Most years of the survey have at least several hundred variables, and the website has tools to help you
locate the variables you want. Variable descriptions on the website report codes and frequencies
(useful when recoding data), specify the appropriate weight in each year, and discuss changes that limit
comparability of the variable over time. For example, the variable HEALTH, which we will use below, has
gone from a 4-point scale to a 5-point scale over time. Changes like this are described in detail in the
variable descriptions on the NHIS website. 

There are two main tasks for which SDA is useful: 
1) Calculating frequencies and cross-tabulations 
2) Comparing means 

These tasks are discussed, in turn, below. Researchers who wish to use NHIS data for
more advanced analyses (e.g., regressions) should download a data extract from the NHIS website and
conduct their analysis with a statistical package such as SAS, SPSS, or Stata, rather than with SDA. 

## Frequencies/Cross-tabulation Program

First select the year(s) in which you are interested from the [SDA-NHIS interface](https://nhis.ipums.org/nhis/sda.shtml) Let's use the 2009 sample.

Next, choose the variables you would like to analyze. To generate frequencies or cross-tabulations, you
can either type the variable names into the Row and Column boxes pictured below... 

![sda_frequencies_cross_tab_blank](../.imgs/sda_frequencies_cross_tab_blank.png)

...or use the variable dictionary on the left side of the screen. (Given the number of variables in most
years of IHIS, this second option is probably more time consuming and less helpful.) 

The variable dictionary is generated based on the sample(s) you have selected. The variables available
in each sample are organized into thematic groups by record type (household, person). To select a
variable to analyze using the dictionary, click on the variable name. 

After you click on the variable name, the "selected box" above will be populated with the variable you
have chosen. Now use the "Copy to" buttons below your variable name to enter your variable into the
field of your choice. (If you entered the variable names directly, after finding the variables you want to
use on the IHIS website, you will go directly to the step directly below this text.) Select the `age` variable in the `Person -> Demographic` folders.

![sda_age_variable_selection](../.imgs/sda_age_variable_selection.png)

The two most important fields in the frequencies/cross-tabulation program are "Row" and "Column."
With variables entered into these fields, the system will produce a basic cross tabulation, or table. By
default, the SDA will calculate column percentages so that the values in each column sum to 100.

We will walk through a brief example of some considerations that should be made to obtain a table that
presents data in a meaningful way. First we will show you some points to consider in selecting the row,
column, and other characteristics. Let's say you want a table that presents the relationship between age
and health status. To create this table, enter "age" as the row variable and "health" (`Person -> General Health`) as the column variable. The input is pictured below. 

![sda_age_health_variable_selection](../.imgs/sda_age_health_variable_selection.png)

To obtain output, click "Run the Table." The beginning of the output looks like this: 

![sda_age_health_table_response](../.imgs/sda_age_health_table_response.png)

The resulting table is potentially problematic for four reasons. First, the table is large and therefore
does not provide an overall sense of the relationship (if any) between age and health status. This is
because the age variable has 86 valid values, resulting in 86 different rows in the table. The partial
output above pictures only the first 12 rows of the age variable. 

Second, the column percentages (rather than the row percentages) sum to 100. Whether you want
percents for rows or columns depends on your research question. In our example, the column
percentages largely reflect the size of the age category, rather than the relationship between age and
health. It would be much more useful if the row percentages (showing the distribution of health status
within each age group) were present and summed to 100.

Third, the table includes data from individuals whose health status was coded as "unknown--refused"
and "unknown--don't know." You will probably want to exclude these "unknown" cases, to get
meaningful row percentages of health status by age that sum to 100 percent.

Fourth, the table is unweighted. The National Health Interview Survey (NHIS) has a complex sample
design that oversamples some demographic groups in some years, so weighted results should be used.


The solution to the first problem (of too many values) is to use an SDA function known as recoding. To
recode a variable, hold your cursor over the "Create Variables" option at the top of the SDA web page. Then make sure the "Recode" tab is selected. The rest of the screen should look like this:

![sda_recode_variable_start](../.imgs/sda_recode_variable_start.png)

Our goal is to simplify our original output by collapsing the values of the age variable into more
manageable categories. One strategy might be to group the responses by decade (i.e., 0-9, 10-19, etc.).
To do this, we first need to name the new, recoded variable that we are creating. You may choose any
name you want, as long as it is not a name already taken by another variable. Let's call our new age
variable "age_r," with the "r" indicating that the variable is a recode.

The second step in recoding is to identify the already existing variable(s) that will be used as the
source(s) from which we create our new, grouped age variable. In this example, the existing variable is
"age." You can type "age" into the "Name(s) of existing variables to use for the recode:" box, or you can select age from the variable list to the left and click the "Copy to: Name of existing variable" button.

The top portion of the right-hand side of the screen should now look like this: 

![sda_recode_variable_rename](../.imgs/sda_recode_variable_rename.png)
















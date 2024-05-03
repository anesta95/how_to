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

Just below this, we need to enter values and labels for the output variable (age_r) and the values of the
input variable (age) that will be used to define the values of the output variable. At this point, it is a
good idea to look at the codes and frequencies for the variable you are recoding, by checking these
through the variable description on the IHIS website in a separate browser window. 

If we go to the variable description for the IHIS variable "age" and click on "codes," this brings up a table
of codes for each year (marked by X's if the code is present in the specific year, or by unweighted
numeric values if you select "case-count view"). Through the codes and frequencies page, we learn that
the variable "age" is topcoded at age 85+ for some survey years, and that the number of cases in each
single year age category becomes quite small at the highest ages. We might, then, decide to make the
final age category be age 80 or older. 

To return to the SDA interface, if we wanted people age 0-9 to be put into one category with the value
"0" and the label "0's," and we repeated this pattern for each age grouping, the screen should look like
this. Note that you can we click on "Add another recoding rule" to continue our recoding:

![sda_recode_variable_rules](../.imgs/sda_recode_variable_rules.png)

We have now assigned output values for all of the valid values of the input variable "age." If you want,
you may assign a label to the new variable age_r, although this is not necessary. Now, click on the "Start
Recoding" button, located just below the "Descriptive Text" menu. 

![sda_recode_start_recoding](../.imgs/sda_recode_start_recoding.png)

SDA will then create our new variable "age_r" by recoding values of the input variable "age." As you can
see from the output, a variable that had 86 values has been used to create a variable that has only 9
values.

![sda_recode_results_description](../.imgs/sda_recode_results_description.png)

We can now use the new variable "age_r" in any analysis, just as we would use any other variable. To
return to the Frequencies/Crosstabulation menu, hold your cursor over the "Analysis" option at the top
of the screen and navigate to the "Tables" tab. 

![sda_back_to_analysis](../.imgs/sda_back_to_analysis.png)

You can now repeat the same steps as before to create a table of age and health status. However, this
time you will use "age_r" as the row variable (instead of "age"). The column variable will still be
"health." However, at this stage, we can also take care of the "unknown--refused" and "unknown --
don't know" categories from the health status variable. As you saw in the original table of age and
health status, the valid values of health status are 1-5, and 7 and 9 are the values of the "unknown"
groups we do not want to include. We can limit cases by typing "health(1-5)" as our column variable.
This means we only want the table calculated for those having a health status value of 1-5. 

To generate more meaningful percentage figures, we can check the "Row" box under Table Options for
Percentaging. This allows us to see the distribution of health status within age categories.
(Alternatively, we could make "age_r" the column variable, and make "health(1-5)" the row variable. In
that case, column percentages, which are already set as the default percentaging option, would be more
helpful.) 

Neither row nor column percentages are intrinsically better than the other. The default SDA setting
produces column percentages, but you should choose between row and column depending on which is
appropriate for your research question. 

Finally, as explained above, we need to run weighted data. The variable descriptions available on the
NHIS website tell us which weights to use with each variable. That documentation tells us that for the
NHIS variables HEALTH and AGE (which is the source variable for our SDA variable "age_r") we need to
use PERWEIGHT. We can select perweight from the Weight drop-menu. Thus, the input incorporating
all these changes should look like this: 

![sda_2009_age_health_query_redux](../.imgs/sda_2009_age_health_query_redux.png)

Note: If all you want to do is look at the distribution of cases within the sample, it is not necessary to
run the table using weights. However, if you want to make any inferences about the population from
which this sample is drawn, weights are necessary.

By clicking "Run the Table," we get new output: 

![sda_2009_age_health_query_redux_results](../.imgs/sda_2009_age_health_query_redux_results.png)

This is a much more manageable table, and it includes only respondents whose health status was known and reported.

Each cell of the table contains 3 numbers. If you look at the upper-left corner of the above graphic, you will find a key that explains what each of these numbers means. Users should bear in mind that the NHIS represents the US civillian, non-institutionalized population (hereafter, "the population" for brevity) in a given year. 

If you look, for example, at the cell at the intersection of "30's" and "Excellent," you see that 13.0 is the
column percent. This means that 13% of the population with excellent health are in their 30's. The
second number is 35.6, which is the row percent. This indicates that 35.6% of the population in their
30's are in excellent health. This is a more meaningful number than the column percent. You might contrast it with, say, the row percent in the 80+ Excellent health cell. The results there indicate that only 9.5% of people at least 80 are in excellent health. Finally, back in the cell at the intersection of "30's" and "Excellent" you see a "weighted N" of just over 14 million. This indicates that there were about 14 million people in the population in 2009 who were in their 30's and had excellent health. 

Now let's imagine that you want to know whether the relationship between age and health status varies
according to some third variable. Perhaps the relationship is different for males than it is for females.
You can take a third variable into account by using the "Control" field, to produce a separate table for
each category of the variable you enter there. If you wanted to see the relationship between age and
health status for males and females separately, you would enter the variable "sex" as the control variable.

![sda_2009_age_health_query_redux_sex_control](../.imgs/sda_2009_age_health_query_redux_sex_control.png)

Clicking on "Run the Table" yields this output: 

![sda_2009_age_health_sex_control_male_results](../.imgs/sda_2009_age_health_sex_control_male_results.png)
![sda_2009_age_health_sex_control_female_results](../.imgs/sda_2009_age_health_sex_control_female_results.png)

Entering "sex" as a control variable allows a quick visual comparison of whether the relationship
between age and health status is different for males than for females. For both groups the tables
indicate a negative relationship between age and health. That is, older people tend to have worse
health status than younger people.

Users will notice that the default output includes color coding, which is representative of Z-statistics.

![sda_z_stat_and_color_code](../.imgs/sda_z_stat_and_color_code.png)

To see explanations of the meaning of Z-statistics and the color coding, click on the question marks next to "Color coding" and "Z-statistics" checkboxes in the interface of Output Options. 

![sda_color_coding_output_options](../.imgs/sda_color_coding_output_options.png)

You can also opt to turn the color coding off by unchecking the "color coding" box shown above.

Another SDA option, "selection filter(s)," allows you to analyze only a specific subset of respondents for
a given variable. This option works best when using the NHIS data file for 1997 forward, when you want
to select only certain years (e.g., 2002 and 2007) to use in your analysis. 

When used with other, non-year variables, however, the selection filter is only useful for getting a sense
of data distribution. The selection filter is not useful for variance estimation or significance testing,
because of the complex sample design of the NHIS.

To continue the example begun above, let's say we wanted to check the relationship between age and
health by sex, but only for people who have never been married. In other words, is the relationship
between health and age different for never married females than for never married males? To do this,
enter the variable "marstat" (legal marital status) as a selection filter, followed by the code for "never
married" in parentheses. 

To find out the code for "never married," you can review the codes and frequencies by clicking on
"codes" in the MARSTAT variable description on the IHIS website. Alternatively, you can enter "marstat"
in the Variable Selection box to the left side of the screen and click "View." Doing so will open another
window: 

![marstat_variable_viewer](../.imgs/marstat_variable_viewer.png)

As you can see, the code for "Never married" is 50. Thus, your input to produce tables for only nevermarried people will look like this: 

![sda_2009_age_health_sex_control_marstat_filter](../.imgs/sda_2009_age_health_sex_control_marstat_filter.png)

Clicking "Run the Table" produces separate tables for males and females again, since we have kept "sex"
as a control variable.

![sda_2009_age_health_sex_control_male_never_married_results](../.imgs/sda_2009_age_health_sex_control_male_never_married_results.png)
![sda_2009_age_health_sex_control_female_never_married_results](../.imgs/sda_2009_age_health_sex_control_female_never_married_results.png)

This time, however, only respondents who have never been married have been included. As you see,
the number of cases drops off dramatically, beginning with people in their 30's compared to those in
their 20's.

Note: While use of a selection filter to produce a table for a subset population may give you a general
sense of the relationship between variables, users should be cautious about drawing statistical
inferences from such results. Due to the complex sample design of the National Health Interview
Survey, restricting analysis to a subpopulation as described above may yield incorrectly computed
standard errors. See the IHIS user note on Variance Estimation for further discussion of this problem and
for examples of correct practice in subpopulation analysis using a statistical package like SAS, Stata, or
SAS-callable SUDAAN. 

## Analyzing Multiple Years of Data









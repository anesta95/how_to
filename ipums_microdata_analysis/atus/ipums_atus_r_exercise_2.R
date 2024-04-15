# IPUMS Data Training Exercise: 
# An introduction to IPUMS Time Use 
# (Exercise 1 for R) https://assets.ipums.org/_files/exercises/ipums-atus-exercise-r-2.pdf

# IPUMS Tutorials: https://www.ipums.org/support/tutorials
# IPUMS Data Training Exercises: https://www.ipums.org/support/exercises
# IPUMS Data and R: https://tech.popdata.org/ipumsr/articles/ipums.html
# Introduction to the IPUMS API for R Users: https://tech.popdata.org/ipumsr/articles/ipums-api.html

## Summary
# In this exercise, you will gain an understanding of how the Time Use dataset is structured
# and how it can be leveraged to explore your research interests. This exercise will use the
# Time Use dataset to explore basic frequencies of income, purchases, caring for children and
# time spent preparing food. You will create data extracts that include the variables
# ACT_PURCH, FAMINCOME, FOODPREP, and CHILDCARE; then, you will use a sample
# code to analyze these data

## Make an Extract
#  On the homepage, go to Build an Extract (on the left column)
#  Click on the "Change Samples" box, and select years 2009 and 2011. Keep
# the defaults "ATUS respondents" and select "Submit sample selections".
#  Under the "Time Use" dropdown menu, select "Activity coding structure".
# Click on the plus sign next to the variable ACT_PURCH to select the
# variable and add it to our data cart.
#  Click on the "Create time use variable" box at the top. Select "Load" next
# to ACT_HHACT, then the diamond sign next to Household Activities to
# expand the category.
#  Unselect all subcategories except for "Food and Drink Preparation,
# Presentation, and Clean-up", and click "Save time use variable" at the
# bottom.
#  Name your new variable "foodprep" and select "Save time use variable".
# This selects the time use variable we just created, and adds it to our data
# cart.

## Request the Data
#  Click on the "Create time use variable" box again, and this time select the box at the
# top "Create variable from scratch".
#  Select the box next to All, then click on the "Secondary Activity" box at the top.
#  Under Secondary Activity, select "Duration of time spent during activity on secondary
# child care of all children" and then "Save time use variable".
#  Name this new variable "childcare" and label it "Secondary childcare". Then select
# "Save time use variable" again to select it and add it to the cart.
#  Under the Household dropdown menu, click on Geographic and then select the
# variable REGION.
#  Using the drop down menu or search feature, select the following variables and add
# them to your data cart using the plus symbol to the left of the variables:
#   o ACT_PURCH: Consumer purchases
#   o FAMINCOME: Yearly family income
#   o AGE: Age
#   o SEX: Sex
#   o FOODPREP: Created variable for time spent preparing food
#   o CHILDCARE: Created variable for time with childcare as a secondary activity

## Review and submit your extract
#  Choose the green "View Cart" at the top.
#  Click on the green "Create data extract".
#  You will get an email when the data is available to download
#  To get to the page to download the data, follow the link in the email, or follow the
# Download/Revise Extracts link on the homepage.

## Getting the data into your statistics software
# The following instructions are for R. If you would like to use a different stats package, see:
#   https://ipums.org/support/exercises
#  Go to https://www.atusdata.org/atus/ and click on Download or Revise Extracts.
#  Right-click on the Data link next to the extract you created.
#  Choose "Save Target As..." (or "Save Link As...").
#  Save into "Documents" (Documents should pop up as the default location).
#  Do the same for the DDI link next to the extract.
#  (Optional) Do the same thing for the R script.
#  You do not need to decompress the data to use it in R.

## Install the ipumsr package
#  Open R from the Start menu
#  If you haven't already installed the ipumsr package, in the command prompt, type
# the following command:

# install.packages("ipumsr")

## Read the data
#  Set your working directory to where you saved the data above by adapting the
# following command (Rstudio users can also use the "Project" feature to set the 
# working directory. In the menubar, select File -> New Project -> Existing Directory 
# and then navigate to the folder):

# setwd("~/")
# "~/" goes to your Documents directory on most computers

#  Run the following command from the console, adapting it so it refers to the extract
# you just created (note the number may not be the same depending on how many 
# extracts you have already made):

library(ipumsr)
ddi <- read_ipums_ddi("../../microdata/atus_00002.xml")
data <- read_ipums_micro(ddi)

# Or, if you downloaded the R script, the following is equivalent: source("atus_00002.R")
#  This tutorial will also rely on the dplyr, tidyr and ggplot2 packages, so if you want to
# run the same code, run the following command (but if you know other ways better,
# feel free to use them):

library(dplyr)
library(ggplot2)
library(tidyr)

#  To stay consistent with the exercises for other statistical packages, this exercise does
# not spend much time on the helpers to allow for translation of the way IPUMS uses
# labelled values to the way base R does. You can learn more about these in the value-
# labes vignette in the R package. From R run command: vignette("value- labels",
# package = "ipumsr").

## Analyze the Sample
# Part 1: Generate a New Variable

# 1. Create a variable distinguishes individuals who reported consumer purchases
# on the day of their interview.

data <- data %>% 
  mutate(PURCHASE = ACT_PURCH > 0)

# 2. Find a frequency for reported consumer purchases for the sample for each year?

data %>% 
  group_by(YEAR) %>% 
  summarize(PURCHASE = mean(PURCHASE))

# 2009: 41.6% of people had consumer purchases on the day of their interview
# 2010: 40.8% of people had consumer purchases on the day of their interview

# 3. Is there a difference in incidence of consumer purchasing between men and 
# women in 2009

data %>% 
  group_by(YEAR, SEX = haven::as_factor(SEX)) %>% 
  summarize(PURCHASE = mean(PURCHASE))

# Yes, about 45% of women in 2009 had a consumer purchase on the day of their
# ATUS interview, while only about 37.1% of men did.

# 4. In the sample when consumer purchases are greater than zero, what is the average
# amount of time spent on purchases each year? Does it appear the recession had any
# effect?

data %>% 
  group_by(YEAR) %>% 
  summarize(ACT_PURCH = mean(ACT_PURCH))

# A very small change in the average time spent on purchases, a decline from 
# 25 minutes to 24.7 minutes. This is not a significant difference.

# Part 2: Using Weights (WT06)
# Note on Weights
# The ATUS sample design requires use of weights to provide and accurate
# representation at the national level. Half of the interview days in the sample are
# weekdays, while the other half are weekends. The weight WT06 adjusts for the
# disproportional number of weekend days, and should be used to weight time use
# variables. More specifically, WT06 gives the number of person-days in the
# calendar quarter represented by each survey response. Also keep in mind that
# the "Eating and Health," "Well-Being," and "Employee Leave" Modules have
# weights unique to them.

# 5. Using weights, what is the average time spent on purchases?
data %>% 
  group_by(YEAR) %>% 
  summarize(ACT_PURCH = weighted.mean(ACT_PURCH, WT06))

# Average time spent on purchases in 
# 2009: 22.7 mins
# 2011: 22.2 mins

## Part 3: Relationships in the Data
# Go to the ATUS homepage and choose Demographic Variables.

# 6. What is the range of values for this variable? What values indicate 
# family incomes of $35,000 and higher.

# In the family income variable https://www.atusdata.org/atus-action/variables/FAMINCOME#codes_section
# the codes 010 through 016 indicate family incomes with $35,000 and higher.

# 7. What is the average time spent in food preparation across income groups? 
# Is there a trend?

data %>% 
  group_by(FAMINCOME = haven::as_factor(FAMINCOME, level = "both")) %>% 
  summarize(foodprep = weighted.mean(foodprep, WT06))

# Yes, there seems to be a general negative trend of time spent doing food income
# decreasing as family income increases. From high 30 minutes to 
# low 30 minute as soon as family income increases above $30K/yr.

# 8. Does the pattern change when you separate the analysis by year?

data %>% 
  group_by(YEAR, FAMINCOME = haven::as_factor(FAMINCOME, level = "both")) %>% 
  summarize(foodprep = weighted.mean(foodprep, WT06)) %>% 
  pivot_wider(names_from = YEAR, values_from = foodprep)

# No the pattern does not change from 2009 to 2011

# 9. What could be an explanation for the data results in questions 7 and 8
# The lowest income group may have slightly lower food prep time because they may work multiple
# jobs or be single parents with not enough time to dedicate to food preparation, while on
# the other hand, high paying jobs such as lawyers may have a high opportunity cost of
# time and also work long hours.

## Part 4: Graph the Data

# 10. Graph the results from 8.

data_summary <- data %>% 
  group_by(YEAR, FAMINCOME = haven::as_factor(FAMINCOME)) %>% 
  summarize(foodprep = weighted.mean(foodprep, WT06))

ggplot(data_summary, aes(x = FAMINCOME, y = foodprep, fill = factor(YEAR))) +
  geom_col(position = position_dodge()) + 
  scale_fill_manual(values = c("#7570b3", "#e6ab02")) + 
  theme(
    axis.text.x = element_text(angle = 20, hjust = 1),
    legend.position = "bottom"
  )

## Part 5: Relationships in Data Part 2

# 11. The way the variable CHILDCARE is constructed, what activities will it include?

# Duration of time spent during activity (any activity) on secondary
# child care of all children. Basically time spend doing anything 
# while also taking care of kids on the side.

# CHILDCARE should include time in any activity in which the respondent also
# reported child care at the same time

# 13. What are the codes for REGION? Find it under Demographic Variables.

# Code 1: Northeast
# Code 2: Midwest
# Code 3: South
# Code 4: West

# 13. What is the average amount of time for adults to be taking care of children
# as a secondary activity?

data %>% 
  filter(AGE >= 18) %>% 
  summarize(childcare = weighted.mean(childcare, WT06))

# 101 minutes

# 14. Are there differences in means across regions in 2011 in time spent in
# secondary child care? What about between men and women?

data %>% 
  filter(AGE >= 18) %>% 
  group_by(REGION = haven::as_factor(REGION), SEX = haven::as_factor(SEX)) %>% 
  summarize(childcare = weighted.mean(childcare, WT06)) %>% 
  pivot_wider(names_from = REGION, values_from = childcare)

# It looks like more secondary childcare time occurs in the West and much less
# in the Northeast.

# Women across regions spend more time doing secondary child care than men.
# The largest gaps are in the West and the smallest gap is in the Midwest.

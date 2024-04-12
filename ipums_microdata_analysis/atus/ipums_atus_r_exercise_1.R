# IPUMS Data Training Exercise: 
# An introduction to IPUMS Time Use 
# (Exercise 1 for R) https://assets.ipums.org/_files/exercises/ipums-atus-exercise-r-1.pdf

# IPUMS Tutorials: https://www.ipums.org/support/tutorials
# IPUMS Data Training Exercises: https://www.ipums.org/support/exercises
# IPUMS Data and R: https://tech.popdata.org/ipumsr/articles/ipums.html
# Introduction to the IPUMS API for R Users: https://tech.popdata.org/ipumsr/articles/ipums-api.html

## Summary
# In this exercise, you will gain an understanding of how the Time Use dataset is structured
# and how it can be leveraged to explore your research interests. This exercise will use the
# Time Use dataset to explore basic frequencies of income, purchases, caring for children
# and time spent preparing food. You will create data extracts that include the variables
# ACT_SPORTS, BLS_SOCIAL_RELIG, EDUC, and EMPSTAT; then, you will use a sample
# code to analyze these data.

## Make an Extract
#  On the homepage, go to Build an Extract (on the left column)
#  Click on Select Samples, select the year 2011, keep the default "ATUS
# respondents" and click Submit sample selections.
#  Click on the "Time Use" dropdown menu, and select "Activity coding
# structure". Click on the plus sign next to ACT_SPORTS to select the
# variable and add it to the cart.

## Request the Data
#  Click again on the "Time Use" dropdown menu, and select "BLS
# published tables". Select the variable BLS_SOCIAL_RELIG (close to the
# bottom of the page) to add to our data cart by clicking the plus sign next to the variable.
#  Select the Person dropdown menu, click on Technical Person, and select
# the DAY variable.
#  Select the variables
# o ACT_SPORTS: Sports, exercise, and recreation
# o BLS_SOCIAL_RELIG: Religious and spiritual activities
# o EDUC: Highest level of education attained
# o DAY: Day of the week of interview
# o SEX: Sex
# o EMPSTAT: Employment status

## Review and submit your extract
#  Choose the green "View Cart" at the top.
#  Click on the green "Create data extract".
#  You will get an email when the data is available to download
#  To get to the page to download the data, follow the link in the email, or
# follow the Download/Revise Extracts link on the homepage.

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
ddi <- read_ipums_ddi("../../microdata/atus_00001.xml")
data <- read_ipums_micro(ddi)

# Or, if you downloaded the R script, the following is equivalent: source("atus_00001.R")
#  This tutorial will also rely on the dplyr package, so if you want to run the same code,
# run the following command (but if you know other ways better, feel free to use them):

library(dplyr)
#  To stay consistent with the exercises for other statistical packages, this exercise
# does not spend much time on the helpers to allow for translation of the way IPUMS
# uses labelled values to the way base R does. You can learn more about these in the
# value-labels vignette in the R package. From R, run command

# vignette("value-labels", package = "ipumsr")

## Analyze the Sample
# Part 1: Generate a New Variable
# 1. On the website, go to “Build an Extract,” which you'll find on the left
# hand side of the homepage. Click on Education in the Person
# dropdown menu under Select Variables. Click on EDUC and find the
# codes for educational attainment
# a. Create a variable that combines the codes into four categories

ipums_val_labels(data$EDUC)

data <- data %>% 
  mutate(
    EDUC_CAT = lbl_na_if(
      lbl_relabel(EDUC,
        lbl(1, "Less than HS") ~ .val %in% 10:19,
        lbl(2, "HS Degree") ~ .val %in% 20:29,
        lbl(3, "Some college") ~ .val %in% 30:39,
        lbl(4, "College degree +") ~ .val %in% 40:49
      ), ~.lbl == "NIU (Not in universe)"
    )
  )

# 2. Is there a difference in the average number of minutes spent doing
# religious activities reported by individuals of different education levels in
# this sample?

data %>% 
  group_by(EDUC_CAT = haven::as_factor(EDUC_CAT)) %>% 
  summarize(BLS_SOCIAL_RELIG = mean(BLS_SOCIAL_RELIG))

# Less than HS                 17.2
# HS Degree                    14.7
# Some college                 12.7
# College degree +             12.2

## Part 2: Using Weights (WT06)
# Note on Weights
# The ATUS sample design requires use of weights to provide and accurate
# representation at the national level. Half of the interview days in the sample are
# weekdays, while the other half are weekends. The weight WT06 adjusts for the
# disproportional number of weekend days, and should be used to weight time
# use variables. More specifically, WT06 gives the number of person-days in the
# calendar quarter represented by each survey response. Also keep in mind that
# the "Eating and Health", "Well-Being", and "Employee Leave" Modules have
# weights unique to them.

# 3. Now answer question 2 using weights.
data %>% 
  group_by(EDUC_CAT = haven::as_factor(EDUC_CAT)) %>% 
  summarize(BLS_SOCIAL_RELIG = weighted.mean(BLS_SOCIAL_RELIG, WT06))

# Less than HS                12.3 
# HS Degree                    9.35
# Some college                 8.58
# College degree +             8.08

## Part 3: Relationships in the Data
# Go to the homepage and choose "Time Use Variables" on the left column under Data. Click
# ACT_SPORTS and then the link to the description
# https://www.atusdata.org/atus-action/time_use_variables/group/2

# 4. Is physical exercise the only thing that falls under this category?

# No, it also includes participatory outdoor games or activities, such as horseshoes, croquet, and paintball. 

# 5. What is the average number of minutes spent doing activities under the
# ACT_SPORTS category for each day of the week?

data %>% 
  group_by(DAY = haven::as_factor(DAY)) %>% 
  summarize(ACT_SPORTS = weighted.mean(ACT_SPORTS, WT06))

# Sunday          22.1
# Monday          17.8
# Tuesday         19.0
# Wednesday       20.0
# Thursday        17.3
# Friday          17.1
# Saturday        28.4

# 6. What is the average number of minutes spent on these activities for each
# day of the week if the time was more than zero? Do you have a theory
# why weekends might differ generally from weekdays? Do these averages
# seem reasonable?

data %>% 
  filter(ACT_SPORTS > 0) %>% 
  group_by(DAY = as_factor(DAY)) %>% 
  summarize(ACT_SPORTS_IF_ANY = weighted.mean(ACT_SPORTS, WT06))

# Sunday                128. 
# Monday                 89.5
# Tuesday                92.5
# Wednesday              98.5
# Thursday               84.3
# Friday                104. 
# Saturday              136.

# This must mean the number of people who are exercising in a certain day is
# relatively small and the overall distribution is somewhat right-skewed
# (i.e. the amount of exercise people for people who exercise **at all** is relatively high)

# 7. How many people reported exercise or watching sports on the day of the interview?

data %>% 
  group_by(ANY_SPORTS = ACT_SPORTS > 0) %>% 
  summarize(ACT_SPORTS_ANY_NUM = n()) %>% 
  mutate(ACT_SPORTS_ANY_PCT = ACT_SPORTS_ANY_NUM / sum(ACT_SPORTS_ANY_NUM))

# 2,319 people

# 8. How many observations does this year's sample have for ACT_SPORTS?
# What percentage of people reported time spent doing ACT_SPORTS
# activities?

# 12,479 people total. About 18.6% reported time doing ACT_SPORTS.

# 9. What is the percent of people employed in the sample?

data %>% 
  group_by(EMPSTAT = haven::as_factor(EMPSTAT)) %>% 
  summarize(n = n()) %>% 
  mutate(pct = n / sum(n))

# 59.98% of people are either employed at work or employed and absent

# 10. Find the average amount of time participating in sports according to
# employment status for women.

# 11. Find the average amount of time participating in sports according to
# employment status for men. What differences do you see?

data %>% 
  filter(SEX == 2) %>% 
  group_by(EMPSTAT = haven::as_factor(EMPSTAT)) %>% 
  summarize(ACT_SPORTS = weighted.mean(ACT_SPORTS, WT06))

data %>% 
  filter(SEX == 1) %>% 
  group_by(EMPSTAT = haven::as_factor(EMPSTAT)) %>% 
  summarize(ACT_SPORTS = weighted.mean(ACT_SPORTS, WT06))

# Average number of minutes in sports participation
#                               W           M
# Employed - at work           15.0       21.7
# Employed - absent            19.7       19.6
# Unemployed - on layoff       19.3       24.4
# Unemployed - looking         19.0       49.2
# Not in labor force           13.8       31.1

# The average time spent participating in sports doesn’t seem to differ too much
# across employment status for women, but it does for men.






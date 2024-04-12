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

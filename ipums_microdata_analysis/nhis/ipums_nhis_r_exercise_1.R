# IPUMS Data Training Exercise: 
# An introduction to IPUMS NHIS 
# (Exercise 1 for R) https://assets.ipums.org/_files/exercises/ipums-nhis-exercise-r-1.pdf

# IPUMS Tutorials: https://www.ipums.org/support/tutorials
# IPUMS Data Training Exercises: https://www.ipums.org/support/exercises
# IPUMS Data and R: https://tech.popdata.org/ipumsr/articles/ipums.html
# Introduction to the IPUMS API for R Users: https://tech.popdata.org/ipumsr/articles/ipums-api.html

## Summary
# In this exercise, you will gain an understanding of how the NHIS dataset is structured and
# how it can be leveraged to explore your research interests. This exercise will use the NHIS
# dataset to explore basic frequencies of flu vaccination, health insurance coverage,
# educational attainment, and overall health status. You will create data extracts that include
# the variables HINOTCOVE, EDUCREC2, HEALTH, and VACFLUSH12M; then you will use
# the sample code to analyze these data.

## Make a Data Extract
#  Return to the homepage and click on Browse and Select Data.

# Select Samples
#  Click the Select Samples button, and check the box for the 2010 sample. Click the
# submit sample selections button.
#  The variable drop-down menus allow you to explore variables by topic. For example,
# you might expect to find variables about flu shots under the "Vaccinations" group.
#  The search tool allows you to search for variables. Observe the options for limiting
# your search results by variable characteristics or variable type.
#  You may add a variable to your cart by clicking on the plus sign in the "Add to Cart"
# column of the topical variable list, or list of search results.
#  You may view information about the variable by clicking on the variable name, and
# navigating through the tabs that include a description of the variable, codes and
# value labels, the universe of persons asked the question, and information on the
# comparability of the variable among other pieces of information. If you are reviewing
# variable-specific information, you may click on the "Add to Cart" button near the top
# of the screen to add this variable to your data cart.
#  Using the drop down menu or search feature, select the following variables and add
# them to your data cart using the plus symbol to the left of the variables:
  # HINOTCOVE: Health insurance status
  # EDUCREC2: Educational attainment

# Review and submit your extract
#  Click the green VIEW CART button under your data cart.
#  Review variable selection. Note that additional variables are in your data cart. The
# data extract system automatically supplies variables that indicate the sample
# (YEAR), are needed for variance estimation (SERIAL, PERNUM), and are used for
# weighting the variables and years selected. Click the green Create Data Extract
# button.
#  Review the 'Extract Request Summary' screen, describe your extract, and click
# Submit Extract.
#  You will receive an email when the data is available to download.
#  To access the page to download the data, follow the link in the email, or click on the
# Download or Revise Extracts link on the homepage.

## Create two additional extracts
#  Create an extract using the 1972, 1981, 1997, and 2010 samples and the HEALTH
# variable.
#  Create an extract using the samples of years 1997 through 2010 and the
# VACFLUSH12M variable.

## Getting the data into your statistics software
# Download the data
#  Go to https://nhis.ipums.org/nhis/ and click on Download or Revise Extracts.
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
ddi <- read_ipums_ddi("nhis_00001.xml")
data <- read_ipums_micro(ddi)

# Or, if you downloaded the R script, the following is equivalent: source("nhis_00001.R")
#  This tutorial will also rely on the dplyr package, so if you want to run the same code,
# run the following command (but if you know other ways better, feel free to use them):

library(dplyr)
#  To stay consistent with the exercises for other statistical packages, this exercise
# does not spend much time on the helpers to allow for translation of the way IPUMS
# uses labelled values to the way base R does. You can learn more about these in the
# value-labels vignette in the R package. From R, run command

# vignette("value-labels", package = "ipumsr")

## Analyze the Sample
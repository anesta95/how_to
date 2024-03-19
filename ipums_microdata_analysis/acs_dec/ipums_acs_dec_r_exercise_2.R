# IPUMS Data Training Exercise: 
# ACS/Decennial Extraction and Analysis 
# (Exercise 2 for R) https://assets.ipums.org/_files/exercises/ipums-usa-exercise-r-2.pdf

# IPUMS Tutorials: https://www.ipums.org/support/tutorials
# IPUMS Data Training Exercises: https://www.ipums.org/support/exercises
# IPUMS Data and R: https://tech.popdata.org/ipumsr/articles/ipums.html
# Introduction to the IPUMS API for R Users: https://tech.popdata.org/ipumsr/articles/ipums-api.html

## Summary
# In this exercise, you will gain basic familiarity with the IPUMS USA data exploration and
# extract system to answer the following research questions: What proportion of households
# in the US has a mortgage? Is the mother's spoken language a consistent determinant of a
# child's preferred language? How are utility costs changing over time, and are changes in
# cost different by urban status? You will create a data extract that includes the variables
# MORTGAGE, VALUEH, LANGUAGE, SEX, AGE, METRO, OWNERSHP, COSTELEC,
# COSTGAS, ROOMS, UNTSSTR; then you will use the sample code to analyze these data.
# After completing this exercise, you will have experience navigating the IPUMS USA website
# and should be able to leverage these data to explore your own research interests.

## Make a data extract
#  Navigate to the IPUMS USA homepage and click on "Browse Data."

# Select Samples – Extract #1: Associations in Household Ownership
# • Go to the homepage and click SELECT DATA located at the top of the page.
# • On the following webpage, click SELECT SAMPLES.
# • Choose the 2010 ACS (1-year) sample by “check marking” the radio box to the left
# of the sample name.
# • Once checked, click SUBMIT SAMPLE SELECTIONS.

# Select Variables – Extract #1: Associations in Household Ownership
# • Return to the SELECT DATA page. Using the variable table or search feature, find
# the variables:
#   o MORTGAGE: Mortgage status
#   o VALUEH: House value
#   o LANGUAGE: Language spoken at home
#   o SEX: Sex
#   o AGE: Age
# • Once you have located the variables, click the radio button `Add to cart’ on the left
# side of the page. This selects them to be included in the data extract.
# • Once the sample and variables are selected, click VIEW CART -> CREATE DATA
# EXTRACT.
# • For this example, we will attach to each person case the language spoken by their
# mother if she resides in the household.
# • To accomplish this, click “ATTACH CHARACTERISTICS” on the EXTRACT
# REQUEST page. Check the box at the intersection of LANGUAGE and Mother, and
# SUBMIT.
# • Review and provide a short description for the extract and click SUBMIT EXTRACT.
# • You will receive an e-mail when the data is available for download.

# Select Samples – Extract #2: Housing Costs
# • Go to the homepage and click SELECT DATA located at the top of the page.
# • On the following webpage, click SELECT SAMPLES.
# • Choose the 2005 through 2010 ACS (1-year) samples by “check marking” the radio
# box to the left of the sample names.
# • Once checked, click SUBMIT SAMPLE SELECTIONS.

# Select Variables - Extract #2: Housing Costs
# • Return to the SELECT DATA page. Using the variable table or search feature, find
# the variables:
#   o METRO: Metropolitan status
#   o OWNERSHP: Ownership of dwelling
#   o COSTELEC: Annual electricity cost
#   o COSTGAS: Annual gas cost
#   o COSTWATR: Annual water cost
#   o ROOMS: Number of rooms
#   o UNITSSTR: Units in structure
#   o CPI99: CPI-U adjustment factor to 1999 dollars
# • Once you have located the variables, click the radio button `Add to cart’ on the left
# side of the page. This selects them to be included in the data extract. The radio
# button should then change from a `+’ to a checkmark to confirm selection.
# • Review and provide a short description for the extract and click SUBMIT EXTRACT.
# • You will receive an e-mail when the data is available for download.

# Review and submit your extract
#  Click on the "View Cart" button underneath your data cart.
#  Review your variable and sample selection to ensure your extract is complete.
#   o You may notice a number of additional variables you did not select are in
#   your cart; IPUMS preselects a number of key technical variables, which are
#   automatically included in your data extract.
#  Add additional variables or samples if they are missing from your extract, or click the
#   "Create Data Extract" button.
#  Review the Extract Request screen that summarizes your extract; add a description
#   of your extract (e.g., "USA Exercise 2: Household Ownership” or “USA Exercise 2:
#   Housing Costs”) and click "Submit Extract".
#  You will receive an email when your data extract is available to download.

## Getting the data in your statistics software
# Download the Data
# • Go to https://usa.ipums.org/usa/ and click on Download or Revise Extracts.
# • Right-click on the Data link next to the extract you created.
# • Choose "Save Target As..." (or "Save Link As...").
# • Save into "Documents" (Documents should pop up as the default location).
# • Do the same for the DDI link next to the extract.
# • (Optional) Do the same thing for the R script.
# • You do not need to decompress the data to use it in R.

# Install the ipumsr package
# • Open R from the Start menu
# • If you haven't already installed the ipumsr package, in the command prompt, type
# the following command:
# install.packages("ipumsr")

# Read the data
# • Set your working directory to where you saved the data above by adapting the
# following command (Rstudio users can also use the "Project" feature to set the
# working directory. In the menubar, select File -> New Project -> Existing Directory
# and then navigate to the folder):
# setwd("~/") "~/" goes to your Documents directory on most computers.

# • Run the following command from the console, adapting it so it refers to the extract
# you just created (note the number may not be the same depending on how many
# extracts you have already made):
# library(ipumsr)
# ddi <- read_ipums_ddi("usa_00001.xml")
# data <- read_ipums_micro(ddi)

# Or, if you downloaded the R script, the following is equivalent: source("usa_00001.R")

# • This tutorial will also rely on the dplyr, tidyr, and ggplot2 packages, so if you want to
# run the same code, run the following commands (but if you know other ways better,
# feel free to use them):
# library(dplyr)
# library(tidyr)
# library(ggplot2)

# • To stay consistent with the exercises for other statistical packages, this exercise
# does not spend much time on the helpers to allow for translation of the way IPUMS
# uses labelled values to the way base R does. You can learn more about these in the
# value-labels vignette in the R package. From R, run command:
# vignette("value-labels", package = "ipumsr")

### Doing the same analysis but using the API ###
# https://developer.ipums.org/
library(ipumsr)
library(dplyr)
library(tidyr)
library(ggplot2)

con <- file(description = "../../.api_keys/ipums.txt", open = "rt", blocking = F)
IPUMS_API_KEY <- readLines(con, n = 1)
close(con)

usa_samples_df <- get_sample_info("usa", api_key = IPUMS_API_KEY)

## Sample 1:
usa_ex_2_vars <- list(
  var_spec("MORTGAGE"),
  var_spec("VALUEH"),
  var_spec("LANGUAGE", attached_characteristics = c("mother")),
  var_spec("SEX"),
  var_spec("AGE")
)

usa_ex_2_1_def <- define_extract_usa(
  description = "USA extract for Exercise 2 for R via API",
  samples = c("us2010a"),
  variables = usa_ex_2_vars
)

usa_ex_2_1_submitted <- submit_extract(usa_ex_2_1_def, api_key = IPUMS_API_KEY)
usa_ex_2_1_complete <- wait_for_extract(usa_ex_2_1_submitted, api_key = IPUMS_API_KEY)

usa_ex_2_1_complete$status
usa_ex_2_1_num <- usa_ex_2_1_complete$number
names(usa_ex_2_1_complete$download_links)

download_extract(usa_ex_2_1_complete, 
                 download_dir = "../../microdata/",
                 api_key = IPUMS_API_KEY)

ddi_1 <- read_ipums_ddi(paste0("../../microdata/usa_0000", usa_ex_2_1_num, ".xml")) 

data_1 <- read_ipums_micro(ddi_1)

## Sample 2:
usa_ex_2_2_def <- define_extract_usa(
  description = "USA extract for Exercise 2 for R via API",
  samples = c("us2005a", "us2006a", "us2007a", "us2008a", "us2009a", "us2010a"),
  variables = c("METRO", "OWNERSHP", "COSTELEC", "COSTGAS", "COSTWATR",
                "ROOMS", "UNITSSTR", "CPI99")
)

usa_ex_2_2_submitted <- submit_extract(usa_ex_2_2_def, api_key = IPUMS_API_KEY)
usa_ex_2_2_complete <- wait_for_extract(usa_ex_2_2_submitted, api_key = IPUMS_API_KEY)

usa_ex_2_2_complete$status
usa_ex_2_2_num <- usa_ex_2_2_complete$number
names(usa_ex_2_2_complete$download_links)

download_extract(usa_ex_2_2_complete, 
                 download_dir = "../../microdata/",
                 api_key = IPUMS_API_KEY)

ddi_2 <- read_ipums_ddi(paste0("../../microdata/usa_0000", usa_ex_2_2_num, ".xml"))

data_2 <- read_ipums_micro(ddi_2)




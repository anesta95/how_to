# IPUMS Data Training Exercise: 
# ACS/Decennial Extraction and Analysis 
# (Exercise 1 for R) https://assets.ipums.org/_files/exercises/ipums-usa-exercise-r-1.pdf

# IPUMS Tutorials: https://www.ipums.org/support/tutorials
# IPUMS Data Training Exercises: https://www.ipums.org/support/exercises
# IPUMS Data and R: https://tech.popdata.org/ipumsr/articles/ipums.html
# Introduction to the IPUMS API for R Users: https://tech.popdata.org/ipumsr/articles/ipums-api.html

## Summary
# In this exercise, you will gain basic familiarity with the IPUMS USA data exploration and
# extract system to answer the following research questions: What proportion of the U.S.
# population lives on farms? Is there an association between veteran status and labor-force
# participation? What is the trend in carpooling over time by metropolitan area status? You
# will create a data extract that includes the variables FARM, EMPSTAT, VETSTAT, METRO,
# CARPOOL, STRATA, and CLUSTER; then you will use the sample code to analyze these
# data. After completing this exercise, you will have experience navigating the IPUMS USA
# website and should be able to leverage these data to explore your own research interests.

## Make data extracts
#  Navigate to the IPUMS USA homepage and click on "Browse Data."

# Select Samples - Extract #1: Farm Population
# • Go the homepage and click SELECT DATA located at the top of the page.
# • On the following webpage, click SELECT SAMPLES
# • Choose the 1860, 1940, and 1960 1% samples by “check marking” the radio box to
# the left of each sample name.
# • Once checked, click SUBMIT SAMPLE SELECTIONS

# Select Variables - Extract #1: Farm Population
# • Return to the SELECT DATA page. Using the variable table or search feature, find
# the variables:
#   o FARM: Household Farm Status
# • Using the search feature: Click SEARCH and input 'FARM' for the search term and
# click SEARCH. The default search criteria will be sufficient. The resulting page will
# return a list of related variables to the search terms. Once you have located FARM,
# click the radio button `Add to cart’ on the left side of the page. This selects FARM
# to be included in the data extract. The radio button should then change from a `+’
# to a checkmark to confirm selection (see below)

# Review and submit extract #1
#  Click on the "View Cart" button underneath your data cart.
#  Review your variable and sample selection to ensure your extract is complete.
# o You may notice a number of additional variables you did not select are in
# your cart; IPUMS preselects a number of key technical variables, which are
# automatically included in your data extract.
#  Add additional variables or samples if they are missing from your extract, or click the
# "Create Data Extract" button.
#  Review the Extract Request screen that summarizes your extract; add a description
# of your extract (e.g., "USA Exercise 1”) and click "Submit Extract".
#  You will receive an email when your data extract is available to download.

# Select Samples - Extract #2: Veteran and Labor Force Status
# • Go to the homepage and click SELECT DATA located at the top of the page.
# • On the following webpage, click SELECT SAMPLES
# • Choose the 1980 (5% state) and 2000 (1%) samples by “check marking” the radio
# box to the left of each sample name.
# • Once checked, click SUBMIT SAMPLE SELECTIONS

# Select Variables - Extract #2: Veteran and Employment Status
# • Return to the SELECT DATA page. Using the variable table or search feature, find
# the variables:
# o VETSTAT: Veteran Status
# o EMPSTAT: Employment Status
# • Once you have located the variables, click the radio button `Add to cart’ on the left
# side of the page. This selects them to be included in the data extract. The radio
# button should then change from a `+’ to a checkmark to confirm selection.
# • Review and provide a short description for the extract and click SUBMIT EXTRACT.
# You will receive an e-mail when the data is available for download.

# Select Samples - Extract #3: Carpooling and Metropolitan Status
# • Go to the homepage and click SELECT DATA located at the top of the page.
# • On the following webpage, click SELECT SAMPLES
# • Choose the 2010 (ACS 1-year) and 1980 (5% state) samples by “check marking”
# the radio box to the left of each sample name.
# • Once checked, click SUBMIT SAMPLE SELECTIONS

# Select Variables - Extract #3: Carpooling and Metropolitan Status
# • Return to the SELECT DATA page. Using the variable table or search feature, find
# the variables:
#   o CARPOOL: Mode of carpooling
# o METRO: Metropolitan Status
# • Once you have located the variables, click the radio button `Add to cart’ on the left
# side of the page. This selects them to be included in the data extract. The radio
# button should then change from a `+’ to a checkmark to confirm selection.
# Review and provide a short description for the extract and click SUBMIT EXTRACT. You
# will receive an e-mail when the data is available for download.

## Getting the data into your statistics software
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

# Run the following command from the console, adapting it so it refers to the extract
# you just created (note the number may not be the same depending on how many
# extracts you have already made): 

library(ipumsr)
ddi_1 <- read_ipums_ddi("../../microdata/usa_0001.xml")
data_1 <- read_ipums_micro(ddi_1)

ddi_2 <- read_ipums_ddi("../../microdata/usa_0002.xml")
data_2 <- read_ipums_micro(ddi_2)

ddi_3 <- read_ipums_ddi("../../microdata/usa_0003.xml")
data_3 <- read_ipums_micro(ddi_3)

# • This tutorial will also rely on the dplyr package, so if you want to run the same code,
# run the following command (but if you know other ways better, feel free to use
# them): 
library(dplyr)

# Or, if you downloaded the R script, the following is equivalent:
# source("usa_00001.R")
# source("usa_00002.R")
# source("usa_00003.R")

### Doing the same analysis but using the API ###
# https://developer.ipums.org/
con <- file(description = "../../.api_keys/ipums.txt", open = "rt", blocking = F)
IPUMS_API_KEY <- readLines(con, n = 1)
close(con)

usa_samples_df <- get_sample_info("usa", api_key = IPUMS_API_KEY)

## Sample 1:
usa_ex_1_1_def <- define_extract_usa(
  description = "USA extract for Exercise 1 for R via API",
  samples = c("us1860a", "us1940a", "us1960a"),
  variables = c("FARM")
)

usa_ex_1_1_submitted <- submit_extract(usa_ex_1_1_def, api_key = IPUMS_API_KEY)
usa_ex_1_1_complete <- wait_for_extract(usa_ex_1_1_submitted, api_key = IPUMS_API_KEY)

usa_ex_1_1_complete$status
usa_ex_1_1_num <- usa_ex_1_1_complete$number
names(usa_ex_1_1_complete$download_links)

download_extract(usa_ex_1_1_complete, 
                 download_dir = "../../microdata/",
                 api_key = IPUMS_API_KEY)

ddi_1 <- read_ipums_ddi(paste0("../../microdata/usa_0000", usa_ex_1_1_num, ".xml"))

data_1 <- read_ipums_micro(ddi_1)

## Sample 2:
usa_ex_1_2_def <- define_extract_usa(
  description = "USA extract for Exercise 1 for R via API",
  samples = c("us1980a", "us2000d"),
  variables = c("VETSTAT", "EMPSTAT")
)

usa_ex_1_2_submitted <- submit_extract(usa_ex_1_2_def, api_key = IPUMS_API_KEY)
usa_ex_1_2_complete <- wait_for_extract(usa_ex_1_2_submitted, api_key = IPUMS_API_KEY)

usa_ex_1_2_complete$status
usa_ex_1_2_num <- usa_ex_1_2_complete$number
names(usa_ex_1_2_complete$download_links)

download_extract(usa_ex_1_2_complete, 
                 download_dir = "../../microdata/",
                 api_key = IPUMS_API_KEY)

ddi_2 <- read_ipums_ddi(paste0("../../microdata/usa_0000", usa_ex_1_2_num, ".xml"))

data_2 <- read_ipums_micro(ddi_2)

## Sample 3:
usa_ex_1_3_def <- define_extract_usa(
  description = "USA extract for Exercise 1 for R via API",
  samples = c("us1980a", "us2010a"),
  variables = c("CARPOOL", "METRO")
)

usa_ex_1_3_submitted <- submit_extract(usa_ex_1_3_def, api_key = IPUMS_API_KEY)
usa_ex_1_3_complete <- wait_for_extract(usa_ex_1_3_submitted, api_key = IPUMS_API_KEY)

usa_ex_1_3_complete$status
usa_ex_1_3_num <- usa_ex_1_3_complete$number
names(usa_ex_1_3_complete$download_links)

download_extract(usa_ex_1_3_complete, 
                 download_dir = "../../microdata/",
                 api_key = IPUMS_API_KEY)

ddi_3 <- read_ipums_ddi(paste0("../../microdata/usa_0000", usa_ex_1_3_num, ".xml"))

data_3 <- read_ipums_micro(ddi_3)



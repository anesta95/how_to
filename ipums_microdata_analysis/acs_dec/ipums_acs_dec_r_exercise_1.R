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

### A note on IPUMS USA and sample weighting ###
# Many of the data samples provided by IPUMS USA are based on statistical survey
# techniques to obtain a nationally representative sample of the population. This means that
# persons with some characteristics are over-represented in the samples, while others are
# underrepresented.
# 
# To obtain representative statistics, users should always apply IPUMS USA sample weights
# for the population of interest (persons/households). IPUMS USA provides both person
# (PERWT) and household—level (HHWT) sampling weights to assist users with applying a
# consistent sampling weight procedure across data samples. While appropriate use of
# sampling weights will produce correct point estimates (e.g., means, proportions), it is also
# necessary to use additional statistical techniques that account for the complex sample
# design to produce correct standard errors and statistical tests.
# 
# IPUMS USA has provided the variables STRATA and CLUSTER for this purpose. While
# unnecessary for the following analytic exercises focused on mean and proportional
# estimates, a further discussion can be found on the IPUMS USA website: ANALYSIS AND
# VARIANCE ESTIMATION WITH IPUMS USA 
# https://usa.ipums.org/usa/complex_survey_vars/userNotes_variance.shtml
###

## Analyze the Data

# Part 1: Frequencies

# Get a basic frequency of the FARM variable for selected historical years.
# 1. On the website, find the codes page for the FARM variable and write down each
# code value and its associated category label

# Code 0 = N/A
# Code 1 = Non-Farm
# Code 2 = Farm
# Code 9 = Blank/missing

data_1$FARM

# 2. How many people lived on farms in the US in 1860? 1960?
data_1 %>% 
  group_by(YEAR, FARM) %>% 
  summarize(people = sum(PERWT))
  
# 1860 farm residents = 12,931,661
# 1960 farm residents = 15,882,199

# 3. What proportion of the population lived on a farm in 1860? 1960?

data_1 %>% 
  group_by(YEAR, FARM = haven::as_factor(FARM, level = "both")) %>% 
  summarize(n = sum(PERWT)) %>% 
  mutate(pct = n / sum(n))

# 1860 farm residents = 47.3% of the population
# 1960 farm residents = 8.86% of the population

# Using household weights (HHTWT)
# Suppose you were interested not in the number of people living farms, but in the number of
# households that were farms. To get this statistic you would need to use the household
# weight. In order to use household weight, you should be careful to select only one person
# from each household to represent that household's characteristics (use PERNUM = 1 as
# the subset). You will need to apply the household weight (HHWT).

# 4. What proportion of households in the sample lived on farms 1940? (Hint: don't use the weight quite yet)
data_1 %>%
  filter(PERNUM == 1 & YEAR == 1940) %>%
  group_by(FARM = haven::as_factor(FARM)) %>%
  summarize(n = sum(PERNUM)) %>%
  mutate(pct = n / sum(n))

# 18.6%
# 5. How many households were farms in 1940?
data_1 %>%
  filter(PERNUM == 1 & YEAR == 1940) %>%
  group_by(FARM = haven::as_factor(FARM)) %>%
  summarize(n = sum(HHWT))

# 7,075,921

# 6. What proportion of households were farms in 1940? (use the weight now)
data_1 %>%
  filter(PERNUM == 1 & YEAR == 1940) %>%
  group_by(FARM = haven::as_factor(FARM)) %>%
  summarize(n = sum(HHWT)) %>% 
  mutate(pct = n / sum(n))

# 18.3%
# 7. Does the sample over or under-represent farm households?
# Slightly over-represents farm households

# Part 2: Frequencies
# This portion of the exercise uses Extract #2: Veteran and Employment Status

# 8. What is the universe for EMPSTAT for this sample, and what are the codes for this variable?
# Universe: Persons age 16+
# Codes: 
# Code 0 = N/A
# Code 1 = Employed
# Code 2 = Unemployed
# Code 3 = Not in labor force
# Code 9 = Unknown/Illegible

# 9. Using the variable description for VETSTAT, describe the issue a researcher would
# face if they wanted to research women serving in the armed forces from World War
# II until the present.

# "Women were first included in veteran service questions in the 1980 census." So
# it would be difficult to accurately use this data to describe the population
# of veterans who are women from WWII which ended in 1945.

# 10. What percent of veterans and non-veterans were:
data_2 %>% 
  filter(YEAR == 1980) %>% 
  group_by(VETSTAT = haven::as_factor(VETSTAT), EMPSTAT = haven::as_factor(EMPSTAT)) %>% 
  summarize(n = sum(PERWT)) %>% 
  mutate(pct = n / sum(n))

# a. Employed in 1980?
# Veterans: 76.1%
# Non-veterans: 54.3%

# b. Not part of the labor force in 1980?
# Veterans: 20.1%
# Non-veterans: 41.7%


# 11. What percent of veterans and non-veterans were:
data_2 %>% 
  filter(YEAR == 2000) %>% 
  group_by(VETSTAT = haven::as_factor(VETSTAT), EMPSTAT = haven::as_factor(EMPSTAT)) %>% 
  summarize(n = sum(PERWT)) %>% 
  mutate(pct = n / sum(n))

# a. Employed in 2000?
# Veterans: 54.9%
# Non-veterans: 64.4%

# b. Not part of the labor force in 2000?
# Veterans: 42.8%
# Non-veterans: 32.1%

# 12. What could explain the difference in relative labor force participation in veterans
# versus non-veterans between 1980 and 2000?

# The population of veterans become elderly the more time passed between 
# WWII and the Vietnam War which had drafts and thus the proportion of 
# veterans that were outside the prime working age (25-54) increased.

# Also an increase in disabled veterans, particularly with PTSD.

# 13. How do relative employment rates change when non-labor force participants are 
# excluded in 2000?

data_2 %>% 
  filter(YEAR == 2000, EMPSTAT != 3) %>% 
  group_by(VETSTAT = haven::as_factor(VETSTAT),
           EMPSTAT = haven::as_factor(EMPSTAT)) %>% 
  summarize(n = sum(PERWT)) %>% 
  mutate(pct = n / sum(n))

# When excluding those not in the labor force, the relative employment & unemployment
# rates are fairly similar, with ~94.7%/5.3% for non-veterans and 95.9%/4.1% for veterans.

# Part 3: Advanced Exercises

# This portion of the exercise uses Extract #3: Carpooling and Metropolitan Status.

# 14. What are the codes for METRO and CARPOOL?
# METRO Codes: 
# Code 0 = Metropolitan status indeterminable (mixed)
# Code 1 = Not in metropolitan area
# Code 2 = (In MSA) In central/principal city
# Code 3 = (In MSA) Not in central/principal city
# Code 9 = (In MSA) Central/principal city status indeterminable (mixed)

# CARPOOL Codes:
# Code 0 = N/A
# Code 1 = Drives alone
# Code 2 = Carpools
# Code 3 = Carpools: Shares driving
# Code 4 = Carpools: Drives others only
# Code 5 = Carpools: Passenger only

# 15. What is a limitation of CARPOOL if you are using 2010 and 1980? How could
# you address this limitation

# The code 2 for CARPOOL was taken for the 2010 sample,
# but 3, 4, and 5 are taken for the 1980 sample. They have different levels of 
# detail for carpooling. A new variable could be defined to combine these codes. 
# Collapsing three 1980 categories (3-5) into one (2) may fix this limitation. 

# 16. What are the proportion of carpoolers and lone drivers NOT in the metro 
# area, in the central city, and outside the central city in 1980? 
# First, we’ll need to define a new variable from CARPOOL. Let’s name it “car”. 
# If car is 0, it indicates a lone driver, if 1, it’s any form of carpooling. 
# If 2, driving to work is not applicable.

data_3 <- data_3 %>% 
  mutate(CAR = lbl_relabel(CARPOOL,
                           lbl(2, "Any form of carpooling") ~ .val %in% c(2, 3, 
                                                                          4, 5)
                           )
         )


unique(data_3$CAR)

data_3 %>% 
  filter(YEAR == 1980, METRO %in% c(1, 2, 3)) %>% 
  group_by(METRO = haven::as_factor(METRO),
           CAR = haven::as_factor(CAR)) %>% 
  summarize(n = sum(PERWT)) %>% 
  mutate(pct = n / sum(n))

##  |METRO   |% Drive Alone   |% Carpoolers   |
##  |---|---|---|
##  |Not in Metro Area   |24.6%   |8.5%   |
##  |Central City   |22.7%   |7.1%   |
##  |Outside Central City   |31.3%   |8.7%   |

# 17. Does this make sense?

# Yes, a higher proportion of residents in the metro area but outside
# the central city drive alone to work which lower proportions in the central 
# city and outside the metro area completely do. However residents
# outside the metro area completely are just as likely to carpool as
# those in the suburbs which are both higher than the rate for those in the
# central city.

# Yes, commuters outside the metro area or central city are
# more likely to drive than those in the central city, for whom carpooling is not
# applicable because they could use public transportation. Commuters outside the
# central city might be more likely to carpool than those outside the metro area 
# because they are likely to work within the central city and may live close to 
# others who work in the same concentrated urban area.

# 18. Do the same for 2010. What does this indicate for the trend in 
# carpooling/driving alone over time in the U.S.?

data_3 %>% 
  filter(YEAR == 2010, METRO %in% c(1, 2, 3)) %>% 
  group_by(METRO = haven::as_factor(METRO),
           CAR = haven::as_factor(CAR)) %>% 
  summarize(n = sum(PERWT)) %>% 
  mutate(pct = n / sum(n))

# It looks like in the intervening 30 years, residents both not in the MSA (32.6%; +8pp)
# and in the MSA but not in the central/principal city (a.k.a. suburbs) (36.5%; +5.2pp)
# are driving more alone to work. While carpooling for both groups has also declined 
# to about halfed the rate it was before (~4.3% for both). Increases
# for those driving alone in the MSA and in the central/principal city also
# increased.

# In 2010, a greater proportion of the population drove
# alone and a smaller proportion carpooled.


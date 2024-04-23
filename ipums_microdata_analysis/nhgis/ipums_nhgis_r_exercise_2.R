# IPUMS Data Training Exercise: 
# ACS/Decennial Extraction and Analysis 
# (Exercise 2 for R) https://assets.ipums.org/_files/exercises/ipums-nhgis-exercise-r-2.pdf

# IPUMS Tutorials: https://www.ipums.org/support/tutorials
# IPUMS Data Training Exercises: https://www.ipums.org/support/exercises
# IPUMS Data and R: https://tech.popdata.org/ipumsr/articles/ipums.html
# Introduction to the IPUMS API for R Users: https://tech.popdata.org/ipumsr/articles/ipums-api.html
# IPUMS NHGIS API Requests: https://tech.popdata.org/ipumsr/articles/ipums-api-nhgis.html

## Summary
# In this exercise, you will gain an understanding of how the NHGIS datasets are structured
# and how they can be leveraged to explore your research interests. Using NHGIS datasets,
# you will explore changes in the number of college graduates living in Minnesota cities to
# answer the research question: “Which cities in Minnesota saw the greatest change in the
# number of college-educated residents since 1990?

### Doing the same analysis but using the API ###
# https://developer.ipums.org/
library(ipumsr)
library(dplyr)
library(purrr)
con <- file(description = "../../.api_keys/ipums.txt", open = "rt", blocking = F)
IPUMS_API_KEY <- readLines(con, n = 1)
close(con)

## Registering with NHGIS
# Go to https://www.nhgis.org/ click on Login at the top, and apply for access. On login
# screen, enter email address and password and submit! Then, enter the NHGIS data finder.

# Investigate the Scope of Relevant Data
# A common first step is to look into the range of data available on the topic of interest. Click
# the Topics filter button, then select “Educational Attainment”, and submit the selection.

ds <- get_metadata_nhgis(type = "datasets", api_key = IPUMS_API_KEY)
dt <- get_metadata_nhgis(type = "data_tables", api_key = IPUMS_API_KEY)

# 1. How many source tables are available for this topic? 

edu_attainment_tbls <- dt %>% 
  filter(
    grepl("Educational Attainment", description)
  )

# From the filtering via the API I see 1,259 tables but from the data finder
# via https://data2.nhgis.org/main there look to be 1,643 data tables for
# educational attainment

# 2. From what year is the oldest table that gives population counts by educational
# attainment? 

edu_attainment_tbls %>% 
  filter(grepl("Population", description)) %>% 
  arrange(dataset_name)

# 1940 via tables found in the API from dataset 1940_cPHAE
# 1934 via tables found in the data folder from dataset 1934_tPH_Chi
# in table Population 18 Years and Over by Grades Completed.

# Find Data for the Period of Interest
# With the topic already selected, click the Years filter button, then select “1990”, and submit
# the selection.

# The Select Data grid now lists all the tables related to the topic of “Educational Attainment”
# with data from 1990. One way to proceed would be to select one of the “source tables”
# listed here and then look for another more recent table to compare with it. However, the
# categories, terms, and universes used by census tables often change over time, which can
# make it difficult to pull together comparable data.

# For many topics (including this one, conveniently!), NHGIS provides a simpler alternative:
# “time series tables”, which link together comparable data from multiple years in one table.
#  Click on the Time Series Table tab, located just right of the Source Tables tab at the
# top of the Select Data grid.
#  Locate the following Time Series Table and answer the questions that follow:
#   o Persons 25 Years and Over by Educational Attainment [7]

ts <- get_metadata_nhgis(type = "time_series_tables", api_key = IPUMS_API_KEY)

edu_attain_ts <- ts %>% 
  filter(
    description == "Persons 25 Years and Over by Educational Attainment [7]"
  )

# Learn About the Table in the Data Finder (and API)

# 3. Click the table to see additional information. How many time series does this
# table contain

edu_attain_ts$time_series

# This table contains 7 time series.

# 4. Which 3 source tables are used to create this 1 time series table? 
 
edu_attain_ts_tbl <- edu_attain_ts$name
# Detailed metadata
edu_attain_ts_tbl_dtl <- get_metadata_nhgis(time_series_table = edu_attain_ts_tbl,
                                            api_key = IPUMS_API_KEY)

# Data from the NP57 Educational Attainment table from the 1990 Census STF 3
# Data from the NP037C Population 25 Years and Over by Sex by Educational Attainment from 2000 SF 3a 
# Data from the B15002 Sex by Educational Attainment for the Population 25 Years and Over from the 2010 and 2011 ACS
# Data from the B15003 Educational Attainment for the Population 25 Years and Over from the 2011 to 2022 ACS

# 5. What advantage is there in using this table rather than the "Persons 18 Years and Over by Educational Attainment [7]"?
# A large portion of people aged 18-24 are still actively working to complete a degree. 
# The 25+ table helpfully captures the population after most have completed their formal education.

# 6. What type of Geographic Integration does this table use?
edu_attain_ts$geographic_integration

edu_attain_ts_tbl_dtl$geographic_integration

# Nominal

# 7. In the Select Data grid, click on “Nominal” in the Geographic Integration column.
# With this type of integration, what should we keep in mind as we compare data
# across time? 

# Nominally integrated tables link geographic units across time according to their names and codes, 
# disregarding any changes in unit boundaries. 
# The identified geographic units match those from each census source, 
# so the spatial definitions and total number of units may vary from one time to another 
# (e.g., a city may annex land, a tract may be split in two, a new county may be created, etc.). 
# The tables include data for a particular geographic unit only at times when the unit's 
# name or code was in use, resulting in truncated time series for some areas.

# Nominal integration is useful for:
#   
# * Mapping spatial patterns at different times, in which case it is appropriate to map the geographic units in use at each time
# * Measuring changes in areas where boundaries were stable, as they are for most states and counties between censuses
# * Studying changes in characteristics of places and county subdivisions according to their legal definitions, including annexations, etc.
# 
# Users should be cautious when interpreting changes in nominally integrated time 
# series because a single unit code may refer to distinctly different areas at different times. 
# We recommend that users of nominally integrated tables inspect NHGIS GIS files 
# (which are available https://www.nhgis.org/user-resources/data-availability#gis-files 
# for most years and levels covered by time series tables) 
# to identify any boundary changes in areas of interest.
# 
# For more information, see the NHGIS Time Series Tables documentation page https://www.nhgis.org/documentation/time-series.

## Create a data extract
# Creating a data extract requires the user to select the table(s), specify a geographic level,
# and select the data layout structure.
#  Click the plus sign to the left of the table name to add it to your Data Cart.
#  Click the green Continue button under your Data Cart.
#  On the Data Options screen, select the “Place” geographic level. – (In census terminology, cities, villages, and town centers are all “places”)

## Review and submit your extract
#  Click the green VIEW CART button under your data cart.
#  Review the 'Extract Request Summary' screen, describe your extract, and click
# Submit Extract.
#  You will receive an email when the data is available to download.
#  To access the page to download the data, follow the link in the email, or click on
# the Download or Revise Extracts link on the homepage.

### Via the API tutorial ###
# https://tech.popdata.org/ipumsr/articles/ipums-api-nhgis.html#defining-an-ipums-nhgis-extract-request

tst <- tst_spec(
  name = edu_attain_ts_tbl,
  geog_levels = "place",
  years = c("1990", "2008-2012")
)

nhgis_ext_2 <- define_extract_nhgis(
  description = "Example for NHGIS Exercise 2",
  time_series_tables = tst
)

nhgis_ext_2_submitted <- submit_extract(nhgis_ext_2, api_key = IPUMS_API_KEY)

nhgis_ext_2_complete <- wait_for_extract(nhgis_ext_2_submitted, api_key = IPUMS_API_KEY)

nhgis_ext_2_complete$status
nhgis_ext_2_complete_num <- nhgis_ext_2_complete$number
names(nhgis_ext_2_complete$download_links)

download_extract(nhgis_ext_2_complete, 
                 download_dir = "../../microdata/",
                 api_key = IPUMS_API_KEY)

nhgis_csv_file <- paste0("../../microdata/nhgis000", nhgis_ext_2_complete_num, "_csv.zip")

nhgis_ddi <- read_nhgis_codebook(nhgis_csv_file) # Contains metadata, nice to have as a separate object

nhgis <- read_nhgis(nhgis_csv_file)

## Getting the data into your statistics software
# The following instructions are for R.
# Download the Data

#  Go to https://data2.nhgis.org/main and click on Download/ Revise Extracts
#  Right-click on the "data" link next to extract you created, under "files"
#  Choose "Save Target As..." (or "Save Link As...")
#  Save into "Documents" (that should pop up as the default location)
#  Do the same thing for the DDI link next to the extract
#  (Optional) Do the same thing for the R script
#  You do not need to decompress the data to use it in R

# Install the ipumsr package
#  Open R from the Start menu
#  If you haven't already installed the ipumsr package, in the command
# prompt, type the following command:
# install.packages("ipumsr")

# Read the Data
#  Set your working directory to where you saved the data above by adapting the
# following command (Rstudio users can also use the "Project" feature to set the
# working directory. In the menubar, select File -> New Project -> Existing Directory
# and then navigate to the folder):
  
# setwd("~/")  

#  Run the following command from the console, adapting it so it refers to the extract
# you just created (note the number may not be the same depending on how many
# extracts you have already made):
# library(ipumsr)
# ddi <- read_ipums_ddi("nhgis_00001.xml")
# data <- read_ipums_micro(ddi)
# Or, if you downloaded the R script, the following is equivalent: source("nhgis_00001.R")

# This tutorial will also rely on the dplyr package, so if you want to run the same code, run
# the following command (but if you know other ways better, feel free to use them):
# library(ipumsr)
# library(dplyr)
# library(ggplot2)

#  To stay consistent with the exercises for other statistical packages, this exercise
# does not spend much time on the helpers to allow for translation of the way IPUMS
# uses labelled values to the way base R does. You can learn more about these in the
# value-labels vignette in the R package. From R run command:

# vignette("value-labels", package = "ipumsr")

## Part 1: Analyze the data
# 8. How many places are included in this table?

length(unique(nhgis$NHGISCODE))

# 30,362

# 9. Why do you think some places have missing values for some years?
nhgis %>% 
  group_by(NHGISCODE) %>% 
  summarize(NAME1990 = NAME1990[1], num_years = n())

# Possibilities:
# They didn’t exist yet or ceased to exist at some point. They were unincorporated
# places that the Census did not identify in some years. The city changed its name
# or merged with another.

# 10. How many place records are there for Minnesota?
# (Future questions will refer to the Minnesota subset)

mn <- nhgis %>% 
  filter(STATE == "Minnesota")

length(unique(mn$NHGISCODE))

# 916

# 11. Aiming to compare counts of college graduates from 1990 and 2008-2012, it will be
# helpful first to think about only the columns of interest. Defining “college graduates”
# as anyone with a bachelor’s degree or higher, which columns should we use?
# Note: The 2008-2012 data include both estimates and margins of error columns. For now,
# we’re only interested in the estimate.

nhgis_ddi %>%
  ipums_var_info() %>%
  select(var_name, var_label) %>%
  filter(grepl("^B85", var_name) & !grepl("^Margin of error",
                                          var_label))

# Create a new variables called “CollegeGrad,” and sum the appropriate counts to
# create totals for all places.

# 12. How many college graduates were living in White Bear Lake in 1990?

mn <- mn %>% 
  mutate(CollegeGrad1990 = B85AF1990 + B85AG1990,
         CollegeGrad2008_2012 = B85AF125 + B85AG125)

mn %>%
  select(NHGISCODE, PLACE, CollegeGrad1990) %>%
  filter(grepl("^White Bear Lake", PLACE))

# 4,445

# Summarize the table to calculate “ChangeCollegeGrad”, and compute the total
# change in college grads between 1990 and 2008-2012 for all places.

# 13. Which city had the highest increase? How much was it?

mn_change <- mn %>% 
  filter(!is.na(NAME1990), !is.na(NAME2012)) %>% 
  group_by(NHGISCODE) %>% 
  summarize(PLACE = PLACE[1], ChangeCollegeGrad = CollegeGrad2008_2012 - CollegeGrad1990)

mn_change %>% 
  slice_max(order_by = ChangeCollegeGrad, n = 5)

# 1 G27043000 Minneapolis city             40568
# 2 G27058000 St. Paul city                20224
# 3 G27071428 Woodbury city                17214
# 4 G27054880 Rochester city               15535
# 5 G27051730 Plymouth city                14519

# We would expect that cities with great increases also had high overall population
# growth and vice versa. Continue working through the next set of questions if you
# would like to find out which cities had the greatest increases in the proportion of the
# population with bachelor’s degrees.

## Part 2: College Grads by Place (Optional)
# Create a new variable called Total, and sum the appropriate counts to get the total of all
# persons 25 years and over.

# 14. What was the total population 25+ of St. Paul in 2008-2012
mn <- mn %>% 
  rowwise() %>% 
  mutate(TotalPop = sum(c_across(ends_with("125")))) %>% 
  ungroup()


mn %>% 
  select(NHGISCODE, PLACE, TotalPop) %>% 
  filter(grepl("St. Paul", PLACE))

# 174,459

# Create a new variables called PctCollege. Multiply 100 times each CollegeGrad variable
# divided by each Total variable to calculate the percentage of the 25+ population with college
# degrees

# 15. Which city had the highest percentage of college grads in 2008-2012?
# Create a summary table with ChangePctCollege and calculate the differences between the
# PctCollege variables between 1990 and 2008-2012.

mn <- mn %>% 
  mutate(PctCollegeGrad2008_2012 = CollegeGrad2008_2012 / TotalPop)

mn %>% 
  select(NHGISCODE, PLACE, PctCollegeGrad2008_2012, TotalPop, CollegeGrad2008_2012) %>% 
  slice_max(order_by = PctCollegeGrad2008_2012, n = 5)

# Woodland city with 79.8%

# 16. Which city had the highest increase in its proportion of college graduates?

mn_prop_change <- mn %>% 
  rename(TotalPop2009_2012 = TotalPop) %>% 
  rowwise() %>% 
  mutate(TotalPop1990 = sum(c_across(matches("^B85\\w{2}1990")))) %>% 
  ungroup() %>% 
  mutate(PctCollegeGrad1990 = CollegeGrad1990 / TotalPop1990) %>% 
  group_by(NHGISCODE) %>% 
  summarize(PLACE = PLACE[1], ChangeCollegeGrad = PctCollegeGrad2008_2012 - PctCollegeGrad1990)

mn_prop_change %>% 
  slice_max(order_by = ChangeCollegeGrad, n = 5)

# Carver city had a +43.7 percentage point increase.

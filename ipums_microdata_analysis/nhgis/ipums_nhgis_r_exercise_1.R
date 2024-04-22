# IPUMS Data Training Exercise: 
# ACS/Decennial Extraction and Analysis 
# (Exercise 1 for R) https://assets.ipums.org/_files/exercises/ipums-nhgis-exercise-r-1.pdf

# IPUMS Tutorials: https://www.ipums.org/support/tutorials
# IPUMS Data Training Exercises: https://www.ipums.org/support/exercises
# IPUMS Data and R: https://tech.popdata.org/ipumsr/articles/ipums.html
# Introduction to the IPUMS API for R Users: https://tech.popdata.org/ipumsr/articles/ipums-api.html
# IPUMS NHGIS API Requests: https://tech.popdata.org/ipumsr/articles/ipums-api-nhgis.html

## Summary
# In this exercise, you will gain an understanding of how the NHGIS datasets are structured
# and how they can be leveraged to explore your research interests. This exercise will use an
# NHGIS dataset to explore slavery in the United States in 1830. You will create data extract
# and use a sample code to analyze these data.

### Doing the same analysis but using the API ###
# https://developer.ipums.org/
library(ipumsr)
library(dplyr)
library(purrr)
con <- file(description = "../../.api_keys/ipums.txt", open = "rt", blocking = F)
IPUMS_API_KEY <- readLines(con, n = 1)
close(con)

## Basic IPUMS NHGIS concepts
# IPUMS NHGIS supports 3 main types of data products: datasets, time series tables, and shapefiles.

# Dataset:
# A dataset contains a collection of data tables that each correspond to a particular tabulated summary statistic. 
# A dataset is distinguished by the years, geographic levels, and topics that it covers. 
# For instance, 2021 1-year data from the American Community Survey (ACS) is encapsulated in a single dataset. 
# In other cases, a single census product will be split into multiple datasets.

# Time Series Table:
# A time series table is a longitudinal data source that links comparable statistics from multiple U.S. censuses in a single bundle. 
# A table is comprised of one or more related time series, each of which describes a single summary statistic measured at multiple times for a given geographic level.

# A Shapefile or GIS file:
# A shapefile (or GIS file) contains geographic data for a given geographic level and year. 
# Typically, these files are composed of polygon geometries containing the boundaries of census reporting areas.

## IPUMS NHGIS metadata https://tech.popdata.org/ipumsr/articles/ipums-api-nhgis.html
# Of course, to make a request for any of these data sources, we have to know the codes that the API uses to refer to them. 
# Fortunately, we can browse the metadata for all available IPUMS NHGIS data sources with get_metadata_nhgis().

# Users can view summary metadata for all available data sources of a given data type, or detailed metadata for a specific data source by name.

## Summary metadata
# To see a summary of all available sources for a given data product type, use the type argument. 
# This returns a data frame containing the available datasets, data tables, time series tables, or shapefiles.

ds <- get_metadata_nhgis(type = "datasets", api_key = IPUMS_API_KEY)

# We can use basic functions from dplyr to filter the metadata to those records of interest. 
# For instance, if we wanted to find all the data sources related to agriculture from the 1900 Census, 
# we could filter on group and description:
ds %>% 
  filter(
    group == "1900 Census",
    grepl("Agriculture", description)
  )

# The values listed in the name column correspond to the code that you would use to request 
# that dataset when creating an extract definition to be submitted to the IPUMS API.

# Similarly, for time series tables:
tst <- get_metadata_nhgis(type = "time_series_tables", api_key = IPUMS_API_KEY)

# While some of the metadata fields are consistent across different data types, 
# some, like geographic_integration, are specific to time series tables:

head(tst)

# Note that for time series tables, some metadata fields are stored in list columns, 
# where each entry is itself a data frame:
  
tst$years[[1]]
tst$geog_levels[[1]]

# To filter on these columns, we can use map_lgl() from purrr. 
# For instance, to find all time series tables that include data from a particular year:

# Iterate over each `years` entry, identifying whether that entry contains "1840"
# in its `name` column.
tst %>% 
  filter(map_lgl(years, ~ "1840" %in% .x$name))

## Detailed metadata
# Once we have identified a data source of interest, 
# we can find out more about its detailed options by providing its name to the corresponding argument of get_metadata_nhgis():

cAg_meta <- get_metadata_nhgis(dataset = "1900_cAg", api_key = IPUMS_API_KEY)

# This provides a comprehensive list of the possible specifications for the input data source. 
# For instance, for the `1900_cAg` dataset, we have 66 tables to choose from, and 3 possible geographic levels:

cAg_meta$data_tables
cAg_meta$geog_levels

# You can also get detailed metadata for an individual data table. 
# Since data tables belong to specific datasets, both need to be specified to identify a data table:

get_metadata_nhgis(dataset = "1900_cAg", data_table = "NT2", api_key = IPUMS_API_KEY)

# Note that the name element is the one that contains the codes used for interacting 
# with the IPUMS API. The nhgis_code element refers to the prefix attached to 
# individual variables in the output data, and the API will throw an error if 
# you use it in an extract definition. For more details on interpreting each of 
# the provided metadata elements, see the documentation for get_metadata_nhgis().


## Quick Instructions
# Apply any combination of the four filters below to find 1830 slavery related tables:
#    Geographic Levels = 'State'
#    Years = '1830'
#    Topics = 'Slavery'
#    Datasets = '1830_cPop'

## Guided Instructions
# Suppose you were interested not only in slavery, but in all that's covered by the 1830
# Census. Note: To view all available 1830 data, use only the Years Filter set to '1830'.

# 1. How many tables are available from the 1830 Census?
ds <- get_metadata_nhgis(type = "datasets", api_key = IPUMS_API_KEY)

census_1830_ds <- ds %>% 
  filter(group == "1830 Census") %>% 
  pull(name)

census_1830_meta <- get_metadata_nhgis(dataset = census_1830_ds, api_key = IPUMS_API_KEY)

census_1830_meta$data_tables

# There are 15 data tables available from the 1830 census.

# 2. Other than enslavement status, what are some other topics we could learn about for 1830?
census_1830_meta$data_tables$description

# Disability by race & age
# Urban population in cities of 25,000 and over
# Number of foreigners not naturalized, among others

## Locate the desired table
#  Let's focus in on the slavery topic. To narrow the results, apply the Topics Filter
# of 'Slavery'. (You can find it at the bottom of the list of POPULATION topics.)

#  The Select Data grid now lists all the tables related to the topic of Slavery. If you
# don’t also have the Years Filter on, scroll down to find the 1830 tables, or utilize
# additional filters to further limit the available tables.

#  Locate this 1830 table and answer the questions that follow: "NT12.
# Race/Slave Status by Sex"

census_1830_meta$data_tables %>% 
  filter(grepl("Slave", description))

## Learn About the Table in the Data Finder
census_1830_NT12 <- get_metadata_nhgis(dataset = census_1830_ds, data_table = "NT12", api_key = IPUMS_API_KEY)

# 3. Click the table name to see additional information. How many variables does this table contain?
census_1830_NT12$variables
# The table contains six variables.

# 4. For which geographic levels is the table available?
census_1830_meta$geog_levels
# Nation, state, county

# 5. Close the table pop-up window and inspect the Select Data table... What is the
# universe for this table? 

census_1830_NT12$universe
# The universe for this table is "Persons"

# 6. What differentiates this table from the other available slavery tables from 1830?
# It has both "white" and "colored" population counts by sex while the other
# three only have "colored" populations.

# 7. Name a percentage or ratio this table would allow us to calculate that the other
# tables would not, based on the counts available in each table?

# Percentage of non-White enslaved people to the combined non-White enslaved and White population
# The ratio of non-White enslaved men to women
# The proportion of non-White people who not enslaved to the total non-White population

## Make an extract
# Creating a data extract requires the user to select the table(s), specify a geographic level,
# and select the data layout structure...
#  Click the plus sign to the left of the table name to add table NT12 to your Data Cart.
#  (Optional) R is also capable of using shape files, if you want, you can download
# them by: – Click on the "GIS Boundary Files" Tab – Click on the plus sign to the left
# of the State Geographic Level Table
#  Click the green Continue button in your Data Cart.
#  On the Data Options screen, select the geographic level of “State”.
#  Click the green Continue button in your Data Cart
#  On the Review and Submit screen, select the "Comma delimited (best for GIS)"
# option (it doesn't matter if you include the descriptive header rows or not), add an
# extract description if you wish, and click Submit.

## Request and Extract the Data
# From the Extracts History page, you will be able to download your data extract once it has
# finished processing, typically within a few minutes. You may leave this page and return
# once you have received the email alerting you to your finished extract.
# If you refresh your browser window (click on the loop icon at top, or press F5), you will see
# the extract status change from “queued” to “in progress” to “complete”, at which time you
# will be able to click the “tables” link to download the data.
#  Return to the Extracts History page if not currently there.
#  Right-click on the “tables” link for the extract you created.
#  Choose 'Save Target As...' (or 'Save link as...').
#  Save the zip file into “Documents”.
#  Repeat the process for the GIS data if you are going to use it(right-click, choose
# 'Save Target As...', ...)
#  The R package can read the extracts as zip files, or if you wish to open in other
# programs, you can unzip them, by: Right-clicking on the 'nhgis0001_csv.zip' file, and
# select Extract All... Then click the Extract button. (Repeat for the shape if you
# desire).

### Via the API tutorial ###
# https://tech.popdata.org/ipumsr/articles/ipums-api-nhgis.html#defining-an-ipums-nhgis-extract-request

sf_meta <- get_metadata_nhgis(type = "shapefiles", api_key = IPUMS_API_KEY)

ex_1_r_sf_name <- sf_meta %>% 
  filter(year == "1830", geographic_level == "State") %>% 
  pull(name)

dataset <- ds_spec(
  "1830_cPop",
  data_tables = c("NT12"),
  geog_levels = "state"
)

nhgis_ext_1 <- define_extract_nhgis(
  description = "Example for NHGIS Exercise 1",
  datasets = dataset,
  shapefiles = ex_1_r_sf_name
)

nhgis_ext_1_submitted <- submit_extract(nhgis_ext_1, api_key = IPUMS_API_KEY)

nhgis_ext_1_complete <- wait_for_extract(nhgis_ext_1_submitted, api_key = IPUMS_API_KEY)

nhgis_ext_1_complete$status
nhgis_ext_1_complete_num <- nhgis_ext_1_complete$number
names(nhgis_ext_1_complete$download_links)

download_extract(nhgis_ext_1_complete, 
                 download_dir = "../../microdata/",
                 api_key = IPUMS_API_KEY)

nhgis_csv_file <- paste0("../../microdata/nhgis000", nhgis_ext_1_complete_num, "_csv.zip")
nhgis_shp_file <- paste0("../../microdata/nhgis000", nhgis_ext_1_complete_num, "_shape.zip")

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

# Change these filepaths to the filepaths of your downloaded extract
# nhgis_csv_file <- "nhgis0001_csv.zip"
# nhgis_shp_file <- "nhgis0001_shape.zip"
# library(ipumsr)
# nhgis_ddi <- read_ipums_codebook(nhgis_csv_file) # Contains metadata, nice to have as separate object
# nhgis <- read_nhgis(nhgis_csv_file, verbose = FALSE

# This tutorial will also rely on the dplyr package, so if you want to run the same code, run
# the following command (but if you know other ways better, feel free to use them):
# library(ipumsr)

## Analyze the Data
# Part 1: Analyze the data

# 8. How many states/territories are included in the this table?
length(table(nhgis$STATE))

# 28 states

# 9. Why do you think other states are missing?

# I don't think other existed in 1830, there are multiple territories
# even: Michigan, Florida, Arkansas

# 10. Create a new variable called total_pop, with the total population for each state, 
# by summing the counts in columns ABO001 to ABO006.

# Which state had the largest population?

nhgis <- nhgis %>% 
  rowwise() %>% 
  mutate(total_pop = sum(c_across(starts_with("ABO")))) %>% 
  ungroup()


nhgis %>% 
  slice_max(order_by = total_pop, n = 1)

# New York State with 1,913,006 people

# 11. Create a variable called slave_pop, with the total slave population by summing the
# variables ABO003 and ABO004. Which state had the largest slave population?

nhgis <- nhgis %>% 
  mutate(enslaved_person_pop = ABO003 + ABO004)

nhgis %>% 
  slice_max(order_by = enslaved_person_pop, n = 1)

# Virginia with 469,757 people

# 12. Create a variable called pct_enslaved_persons with the Enslaved Persons Population
# divided by the Total Population. Which states had the highest and lowest pct_enslaved_persons?

nhgis <- nhgis %>% 
  mutate(pct_enslaved_persons = enslaved_person_pop / total_pop)

nhgis %>% 
  filter(pct_enslaved_persons %in% c(min(pct_enslaved_persons, na.rm = T),
                                     max(pct_enslaved_persons, na.rm = T)))

# South Carolina had the largest percentage at 54.3% and
# Vermont had the lowest at literally none.

# 13. Are there any surprises, or is it as you expected?
nhgis %>% 
  filter(pct_enslaved_persons > 0.5) %>% 
  select(STATE, enslaved_person_pop, total_pop, pct_enslaved_persons)

nhgis %>% 
  filter(STATE %in% c("New York", "New Jersey")) %>% 
  select(STATE, enslaved_person_pop, total_pop, pct_enslaved_persons)

# Some states had more slaves than free persons.
# Some ‘free states’ were home to substantial numbers of slaves.

## Part 2: Inspect the Codebook
# Open the .txt codebook file that is in the same folder as the comma delimited file you have
# already analyzed. The codebook file is a valuable reference containing information about
# the table or tables you’ve downloaded.

# Some of the information provided in the codebook can be read into R, using the function
# read_nhgis_codebook()

nhgis_ddi <- read_nhgis_codebook(nhgis_csv_file) 

# 14. What is the proper citation to provide when using NHGIS data in publications or
# researcher reports?

cat(ipums_file_info(nhgis_ddi, "conditions"))

# 15. What is the email address for NHGIS to share any research you have published?
#  (You can also send questions you may have about the site. We’re happy to help!)

# nhgis@umn.edu

## Part 3: Make maps using R
# One of the reasons we are excited about bringing IPUMS data to R is the GIS capabilities
# available for free in R. To use them, you'll need to install the sf package with the following
# command:
 
# install.packages("sf")

# If that doesn't work, or you prefer the older style "sp" package for geographic analysis,
# ipumsr does provide support. For more information, see the "ipums-geography" vignette in
# R.
# To load the NHGIS data with the spatial features attached, we use this command (again,
# you may need to adjust the filepaths):

# Change these filepaths to the filepaths of your downloaded extract
# nhgis_csv_file <- "nhgis0001_csv.zip"
# nhgis_shp_file <- "nhgis0001_shape.zip"

# 16. Make a map of the percent of the population that are enslaved people.

library(sf)

nhgis_geo <- read_ipums_sf(
  shape_file = nhgis_shp_file
)

# To combine spatial data with tabular data without losing the attributes
# included in the tabular data, use an ipums shape join:
nhgis_1830_full_join <- ipums_shape_full_join(nhgis, nhgis_geo, by = "GISJOIN")

library(ggplot2)

ggplot(data = nhgis_1830_full_join, aes(fill = pct_enslaved_persons)) +
  geom_sf() +
  scale_fill_continuous("", labels = scales::percent) +
  labs(
    title = "Percent of Population that was Enslaved by
State",
    subtitle = "1830 Census",
    caption = paste0("Source: ", ipums_file_info(nhgis_ddi,
                                                 "ipums_project"))
  )






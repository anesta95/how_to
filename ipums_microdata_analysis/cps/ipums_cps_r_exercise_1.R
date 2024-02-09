# IPUMS Data Training Exercise: 
# CPS Extraction and Analysis 
# (Exercise 1 for R)

# IPUMS Tutorials: https://www.ipums.org/support/tutorials
# IPUMS Data Training Exercises: https://www.ipums.org/support/exercises

## Summary
# This exercise will use the IPUMS dataset to explore associations between health and
# work status and to create basic frequencies of food stamp usage and answer the
# following research question: "What is the frequency of food stamp recipiency in the
# US? Are health and work statuses related?" You will create a data extract that includes
# the variables PERNUM, FOODSTMP, AGE, EMPSTAT, AHRSWORKT, and HEALTH;
# then you will use sample code to analyze these data.

## Make an Extract
#  Go back to homepage and go to Select Data
#  Click the Select Samples box, check the box for the 2011 ASEC sample, Click
# the Submit sample selections box.
# o Using the drop down menu or search feature, select the following
# variables:
#    FOODSTMP: Food stamp receipt
#  AGE: Age
#  EMPSTAT: Employment status
#  AHRSWORKT: Hours worked last week
#  HEALTH: Health status

library(ipumsr)
library(dplyr)

ddi <- read_ipums_ddi("../../microdata/cps_00014.xml")

data <- read_ipums_micro(ddi)

# Or, if you downloaded the R script, the following is equivalent:
# source("cps_00001.R")

# This exercise does not spend much time on the helpers to allow for translation 
# of the way IPUMS uses labelled values to the way base R does. You can learn more
# about these in the value-labes vignette in the R package. From R run command:
# vignette("value-labels", package = "ipumsr")

## Analyzing the Sample
# Part 1: Frequencies of FOODSTMP
# 1. On the website, find the codes page for the FOODSTMP variable and write down
# the code value, and what category each code represents.

# https://cps.ipums.org/cps-action/variables/FOODSTMP#codes_section
# Code 0 = Not-in-universe
# Code 1 = No
# Code 2 = Yes

# 2. What is the universe for FOODSTMP in 2011 (under the Universe tab on the
# website)?

# https://cps.ipums.org/cps-action/variables/FOODSTMP#universe_section
# All interviewed households and group quarters.
# Note the NIU on the codes page, this is a household variable and 
# the NIU cases are the vacant households.

# 3. How many households received food stamps in 2011? How many people?
# Need to specify PERNUM == 1 to get only household rows and use
# ASECWTH
data %>% 
  filter(FOODSTMP == 2, PERNUM == 1) %>% 
  pull(ASECWTH) %>% 
  sum()

# 12,855,283 households

# Need to use just ASECWT
data %>% 
  filter(FOODSTMP == 2) %>% 
  pull(ASECWT) %>% 
  sum()

# 39,187,348 people

# 4. What proportion of households received food stamps in 2011? People?
# Households 10.7%
data %>% 
  filter(PERNUM == 1) %>% 
  summarize(FOODSTMP = weighted.mean(FOODSTMP == 2, ASECWTH))

# People 12.8%
data %>% 
  summarize(FOODSTMP = weighted.mean(FOODSTMP == 2, ASECWT))

# Using household weights (ASECWTH)
# 5. How many households received food stamps in 2011? 12,855,283 households
# 6. What proportion of households received food stamps in 2011? 10.7% of
# households

# MAKE SURE YOU ARE USING ONLY PERNUM == 1 when analyzing household level data

## Part 2: Relationships in the Data
# 7. What is the universe EMPSTAT in 2011?
# https://cps.ipums.org/cps-action/variables/EMPSTAT#universe_section
# 1962 - 1967 (ASEC): Persons age 14+ (pre-1968 samples do not include persons 
# under age 14)
# 1968-1998: Persons age 14+
# 1989+: Persons age 15+

# 8. What are the possible responses and codes for the self-reported HEALTH variable?
# https://cps.ipums.org/cps-action/variables/HEALTH#codes_section

# 1 Excellent
# 2 Very good
# 3 Good
# 4 Fair
# 5 Poor

# 9. What percent of people with 'poor' self-reported health are at work?
data %>% 
  group_by(HEALTH = as_factor(HEALTH)) %>% 
  summarize(AT_WORK = weighted.mean(EMPSTAT == 10, ASECWT))

# 11.6%

# 10. What percent of people with 'very good' self-reported health are at work?
# 51.6%

# 11. In the EMPSTAT universe, what percent of people:
# a. self-report 'poor' health and are at work?
# b. self-report 'very good' health and are at work?

data %>% 
  filter(AGE >= 15) %>% 
  mutate(AT_WORK = EMPSTAT == 10) %>% 
  group_by(HEALTH, AT_WORK) %>% 
  summarize(n = sum(ASECWT)) %>% 
  mutate(pct = n / sum(n))

# Note: both AGE >= 15 and EMPSTAT != 0 will ensure that you are in the EMPSTAT
# universe.

# a. 11.8%
# b. 64%

## Part 3: Relationships in the Data
# 12. What is the universe for AHRSWORKT?
# https://cps.ipums.org/cps-action/variables/AHRSWORKT#universe_section
# 1962 - 1988 (ASEC): Civilians age 14+, at work last week (pre-1968 samples do
# not include persons under age 14)
# 1989+: Civilians age 15+, at work last week.

# 13. What are the average hours of work for each self-reported health category?
data %>% 
  filter(AGE >= 15, AHRSWORKT < 999) %>% 
  group_by(HEALTH = as_factor(HEALTH)) %>% 
  summarize(AHRSWORKT = weighted.mean(AHRSWORKT, ASECWT))

# Excellent      38.4
# Very good      38.7
# Good           37.8
# Fair           35.7
# Poor           32.4




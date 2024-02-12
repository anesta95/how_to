# IPUMS Data Training Exercise: 
# CPS Extraction and Analysis 
# (Exercise 2 for R) https://assets.ipums.org/_files/exercises/ipums-cps-exercise-r-2.pdf

# IPUMS Tutorials: https://www.ipums.org/support/tutorials
# IPUMS Data Training Exercises: https://www.ipums.org/support/exercises
# IPUMS Data and R: https://tech.popdata.org/ipumsr/articles/ipums.html
# Introduction to the IPUMS API for R Users: https://tech.popdata.org/ipumsr/articles/ipums-api.html

## Summary
# This exercise will use the IPUMS dataset to explore associations between parent and
# child health, and analyze relationships between disability variables and marital status
# to answer the following research question: "Is there an association between parent and
# child health? What are the trends in disabilities and marital status?" You will create a
# data extract that includes the variables AGE, SEX, MARST, HEALTH, DIFFHEAR, and
# DIFFEYE; then you will use sample code to analyze these data

## Make an extract
#  Go to the homepage and go to Select Data
#  Click the Select/Change Samples box, check the box for the 2010 and 2011
# ASEC samples, then click Submit Sample Selections
#   o Using the drop down menu or search feature, select the following
#   variables:
#      AGE: Age
#      SEX: Sex
#      MARST: Marital status
#      HEALTH: Health status
#      DIFFHEAR: Hearing difficulty
#      DIFFEYE: Vision difficulty

library(ipumsr)
library(dplyr)
library(ggplot2)
ddi <- read_ipums_ddi("../../microdata/cps_00015.xml")

data <- read_ipums_micro(ddi)
# Or, if you downloaded the R script, the following is equivalent:
# source("cps_00015.R")
### Doing the same analysis but using the API ###
con <- file(description = "../../.api_keys/ipums/cps.txt", open = "rt", blocking = F)
IPUMS_API_KEY <- readLines(con, n = 1)
close(con)

cps_samples_df <- get_sample_info("cps", api_key = IPUMS_API_KEY)

cps_ex_2_vars <- list(
  var_spec("AGE",
           attached_characteristics = c("spouse")
           ),
  var_spec("SEX",
           attached_characteristics = c("spouse")
  ),
  var_spec("MARST",
           attached_characteristics = c("spouse")
  ),
  var_spec("HEALTH",
           attached_characteristics = c("spouse",
                                       "father",
                                       "mother")
  ),
  var_spec("DIFFHEAR",
           attached_characteristics = c("spouse")
  ),
  var_spec("DIFFEYE",
           attached_characteristics = c("spouse")
  )
)

cps_ex_2_def <- define_extract_cps(
  description = "CPS extract for Exercise 2 for R",
  samples = c("cps2010_03s", "cps2011_03s"),
  variables = cps_ex_2_vars
)

cps_ex_2_submitted <- submit_extract(cps_ex_2_def, api_key = IPUMS_API_KEY)
cps_ex_2_complete <- wait_for_extract(cps_ex_2_submitted, api_key = IPUMS_API_KEY)

cps_ex_2_complete$status
cps_ex_2_num <- cps_ex_2_complete$number
names(cps_ex_2_complete$download_links)

download_extract(cps_ex_2_complete, 
                 download_dir = "../../microdata/",
                 api_key = IPUMS_API_KEY)

ddi <- read_ipums_ddi(paste0("../../microdata/cps_000", cps_ex_2_num, ".xml"))

data <- read_ipums_micro(ddi)


# This exercise does not spend much time on the helpers to allow for translation 
# of the way IPUMS uses labelled values to the way base R does. You can learn more
# about these in the value-labes vignette in the R package. From R run command:
# vignette("value-labels", package = "ipumsr")

## Part 1: Creating New Variables
# What are the names of the attached variables (can be found on extract request
# screen, or in the data)?

# AGE_SP, age of spouse; HEALTH_MOM, health of
# mother; HEALTH_POP, health of father; HEALTH_SP, health of spouse;
# DIFFHEAR_SP, hearing disability of spouse; DIFFEYE_SP, vision disability of
# spouse

# 2. On the website, find the FAQ entry for attaching characteristics. What value will
# the respondents without a parent or spouse present have for the attached
# variables? 

# https://cps.ipums.org/cps-action/faq#ques34
# Persons without a parent/spouse present in the household would receive a missing value.

# 3. What are the MARST codes for married respondents?
# 1 Married, spouse present
# 2 Married, spouse absent

# 4. Create a variable for married men equal to the difference in spouses' age

data <- data %>% 
  mutate(AGE_DIFF = if_else(SEX == 1 & (MARST %in% c(1, 2)), AGE - AGE_SP, NA))

# 5. What is the mean age difference between married men and their spouses
# a. For men aged 30 and under?
# b. For 50 and over?

# All men: 2.3 years
data %>% 
  summarize(nm_all_married_men = weighted.mean(AGE_DIFF, ASECWT, na.rm = T))

# 30 and under: -.16 years
data %>% 
  filter(AGE <= 30) %>% 
  summarize(nm_all_married_men = weighted.mean(AGE_DIFF, ASECWT, na.rm = T))
# 50 and over: 3.2 years
data %>% 
  filter(AGE >= 50) %>% 
  summarize(nm_all_married_men = weighted.mean(AGE_DIFF, ASECWT, na.rm = T))

## Part 2 Relationships in the Data
# 6. What is the universe for DIFFEYE and DIFFHEAR? What is the Code for NIU
# (Not in Universe)?

# https://cps.ipums.org/cps-action/variables/DIFFEYE#universe_section
# https://cps.ipums.org/cps-action/variables/DIFFEYE#codes_section
# https://cps.ipums.org/cps-action/variables/DIFFHEAR#universe_section
# https://cps.ipums.org/cps-action/variables/DIFFHEAR#codes_section

# Civilians age 15+.
# NIU code is 0

# 7. 
# a. What percent of the population (in the universe) is deaf or has a serious hearing
# difficulty?
data %>% 
  filter(DIFFHEAR != 0) %>% 
  summarize(DIFFHEAR = weighted.mean(DIFFHEAR == 2, ASECWT))
# 3.09%

# b. What percent of the population (in the universe) is blind or has serious
# sight difficulties?
data %>% 
  filter(DIFFEYE != 0) %>% 
  summarize(DIFFEYE = weighted.mean(DIFFEYE == 2, ASECWT))

# 1.67%

# 8. What percent of the deaf population is married with a spouse present?
data %>% 
  filter(DIFFHEAR == 2) %>% 
  summarize(MARST = weighted.mean(MARST == 1, ASECWT))
# 49.7%

# 9. What percent of the deaf population is married to a spouse who is also deaf?
data %>% 
  filter(DIFFHEAR == 2) %>% 
  mutate(DIFFHEAR_SP_BIN = !is.na(DIFFHEAR_SP) & DIFFHEAR_SP == 2) %>% 
  summarize(COUPLE_DEAF = weighted.mean(DIFFHEAR_SP_BIN, ASECWT, na.rm = T))

# 7.66%

## Part 3: Relationships in the Data
# 10. What ages of respondents have their parents identified through the attach
# characteristics? (hint: see variable descriptions for MOMLOC and POPLOC).

# https://cps.ipums.org/cps-action/variables/MOMLOC#description_section
# https://cps.ipums.org/cps-action/variables/POPLOC#description_section

# Children under age 19

# 11. Does there seem to be a relationship between parents and children's health?
data_summary <- data %>% 
  filter(!is.na(HEALTH_MOM)) %>% 
  group_by(HEALTH = as_factor(HEALTH), HEALTH_MOM = as_factor(HEALTH_MOM)) %>% 
  summarize(n = sum(ASECWT)) %>% 
  mutate(pct = n / sum(n))

ggplot(data_summary, aes(x = HEALTH_MOM, y = pct,
                         fill = HEALTH)) + geom_col(position = "dodge")

# Yes there does

# 12. What other tests could you do to examine this relationship?

# Correlation matrix, covariance analysis, regression analysis

# 13. Could there be a sampling issue affecting the relationship between children and
# parent’s health? 

# Yes, parents are reporting children's health
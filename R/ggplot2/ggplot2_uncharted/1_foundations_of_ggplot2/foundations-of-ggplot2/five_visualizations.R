library(readr)
library(dplyr)
library(ggplot2)

# penguins_url <- "https://www.ggplot2-uncharted.com/data/palmerpenguins.csv"
# penguins_ggplot2 <- read_csv(penguins_url)

# Writing data for hard copy
# write_csv(
#   penguins_ggplot2,
#   "./data/penguins.csv"
#   )

# 1. Penguins visualization:
# Scatterplot of bill/flipper length or bill depth by body mass colored by species
# and faceted by sex.

penguins_ggplot2 <- read_csv(file = "./data/penguins.csv")

# TODO: Find out if NA sex can be filtered within visualization step or if it
# has to be done beforehand.
penguins_ggplot2 |> 
  filter(!is.na(sex)) |> 
  ggplot(aes(x = body_mass_g, y = bill_depth_mm)) +
  geom_point(aes(color = species)) +
  geom_smooth(aes(color = species)) +
  facet_wrap(~sex)

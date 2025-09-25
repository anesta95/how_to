library(readr)
library(dplyr)
library(ggplot2)
library(stringr)

# penguins_url <- "https://www.ggplot2-uncharted.com/data/palmerpenguins.csv"
# penguins_ggplot2 <- read_csv(penguins_url)

# Writing data for hard copy
# write_csv(
#   penguins_ggplot2,
#   "./data/penguins.csv"
#   )

# Plot 1: Penguins visualization:
# Scatterplot of bill/flipper length or bill depth by body mass colored by species
# and faceted by sex.

penguins_ggplot2 <- read_csv(file = "./data/penguins.csv")

# Filtering out NA rows for sex and making sex text title case
penguins_ggplot2_no_sex_na <- penguins_ggplot2 |> 
  filter(!is.na(sex)) |> 
  mutate(sex = str_to_title(sex))

# Making ggplot
penguins_ggplot2_plt <- penguins_ggplot2_no_sex_na |> 
  ggplot(aes(x = body_mass_g, y = bill_depth_mm)) +
  geom_point(aes(color = species)) +
  geom_smooth(aes(color = species)) +
  facet_wrap(~sex) +
  theme_bw() +
  labs(
    title = "Penguin Body Mass and Bill Depth by Sex",
    subtitle = "Body mass correlates most with bill depth for female adelie and chinstrap penguins",
    caption = "Adult pengins on islands in the Palmer Archipelago, Antarctica from ggplot2 penguins dataset.",
    x = "Body Mass (grams)",
    y = "Bill Depth (millimeters)"
    
  ) +
  theme(
    plot.title = element_text(face = "bold", size = 32),
    plot.subtitle = element_text(face = "bold", size = 20),
    plot.caption = element_text(size = 10),
    plot.margin = margin(20, 100, 20, 20, "pt"),
    axis.title = element_text(size = 12, margin = margin(10, 10, 25, 10, "pt")),
    axis.text = element_text(face = "bold", size = 16),
    strip.text = element_text(face = "bold", size = 16),
    legend.position = "none"
  )

# Saving plot
ggsave(
    filename = "./visualizations/penguins_ggplot2_uncharted_module_1_project.png",
    plot = penguins_ggplot2_plt,
    width = 1200,
    height = 675,
    units = "px",
    dpi = 72
)






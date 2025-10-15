library(readr)
library(dplyr)
library(ggplot2)
library(stringr)
library(scales)
library(purrr)

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
  geom_smooth(aes(color = species, fill = species)) +
  facet_wrap(~sex) +
  theme_bw() +
  labs(
    title = "Penguin Body Mass and Bill Depth by Sex",
    subtitle = "Body mass correlates most with bill depth for female adelie and chinstrap penguins",
    caption = "Adult pengins on islands in the Palmer Archipelago, Antarctica from ggplot2 penguins dataset.",
    color = "Species",
    x = "Body Mass (grams)",
    y = "Bill Depth (millimeters)"
  ) +
  guides(color = guide_legend(override.aes=list(fill=NA)),
         fill = "none") +
  theme(
    plot.title = element_text(face = "bold", size = 32),
    plot.subtitle = element_text(face = "bold", size = 20),
    plot.caption = element_text(size = 10, margin = margin(10, 3, 3, 3, "pt")),
    plot.margin = margin(20, 100, 20, 20, "pt"),
    axis.title = element_text(size = 12, margin = margin(10, 10, 10, 10, "pt")),
    axis.text = element_text(face = "bold", size = 16),
    strip.text = element_text(face = "bold", size = 16),
    legend.title = element_text(face = "bold", size = 18),
    legend.text = element_text(size = 16),
    legend.key = element_rect(fill = "white"),
    legend.position = "top"
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

# Plot 2 Penguins visualization: Grouped bar flipper_length_mm for each species faceted by year
penguins_ggplot2_plt_2 <- penguins_ggplot2_no_sex_na |> 
  ggplot(aes(x = species, y = flipper_length_mm)) +
  coord_cartesian(ylim = c(150, NA)) +
  geom_bar(aes(fill = sex),
           stat = "summary",
           fun = "mean",
           position = position_dodge(width = .8)) +
  scale_y_continuous(expand = expansion(mult = c(0, .15))) +
  facet_wrap(~year) +
  theme_bw() +
  labs(
    title = "Flipper Length by Penguin Species",
    subtitle = "From '07 - '09. Gentoo penguins consistently larger than Adelie and Chinstrap penguins.",
    caption = "Adult pengins on islands in the Palmer Archipelago, Antarctica from ggplot2 penguins dataset.",
    y = "Length (millimeters)"
  ) +
  theme(
    plot.title = element_text(face = "bold", size = 32),
    plot.subtitle = element_text(face = "bold", size = 20),
    plot.caption = element_text(size = 10, margin = margin(10, 3, 3, 3, "pt")),
    plot.margin = margin(20, 100, 20, 20, "pt"),
    axis.title.y = element_text(size = 12, margin = margin(10, 10, 10, 10, "pt")),
    axis.title.x = element_blank(),
    axis.text = element_text(face = "bold", size = 16),
    strip.text = element_text(face = "bold", size = 16),
    legend.title = element_blank(),
    legend.text = element_text(face = "bold", size = 16),
    legend.position = "top"
  )

# Saving plot
ggsave(
  filename = "./visualizations/penguins_2_ggplot2_uncharted_module_1_project.png",
  plot = penguins_ggplot2_plt_2,
  width = 1200,
  height = 675,
  units = "px",
  dpi = 72
)

# Plot 3 HYDE: Scatterplot of countries GDP per capita and urban population colored by continent
# hyde_url <- "https://www.ggplot2-uncharted.com/data/hyde.csv"
# hyde_ggplot2 <- read_csv(hyde_url)

# Writing data for hard copy
# write_csv(
#   hyde_ggplot2,
#   "./data/hyde.csv"
#   )

# Reading data
hyde_ggplot2 <- read_csv("./data/hyde.csv")

hyde_ggplot2_plt <- hyde_ggplot2 |> 
  ggplot(aes(x = urban_pop, y = gdp_per_capita)) +
  geom_point(aes(color = region_un, size = pop_est), alpha = 0.5) +
  scale_size_binned_area(n.breaks = 7, nice.breaks = T, max_size = 8, 
                         labels = label_number(scale = 1, 
                                               scale_cut = cut_short_scale())) +
  scale_x_continuous(labels = percent_format(scale = 1)) +
  scale_y_log10(labels = label_currency(prefix = "$", scale_cut = cut_short_scale())) +
  geom_smooth() +
  theme_bw() +
  labs(
    title = "Countries Over Half Urbanized Correlate with GDP",
    subtitle = "Proportion of population urbanized by GDP per capita",
    caption = "Country-level population, urbanization, and economic indicators for 2022 from the HYDE 3.3 database (Goldewijk et al. (2023), Utrecht University).",
    color = "Region",
    size = "Total Population",
    x = "Urbanized Proportion",
    y = "GDP per Capita"
  ) +
  guides(color = guide_legend(override.aes = list(alpha = 1, size = 4)),
         size = guide_bins(direction = "horizontal", show.limits = T, 
                           theme = theme(
                             legend.title = element_text(margin = margin(r = 15, unit = "pt")),
                             legend.text = element_text(angle = 45, hjust = 1)))) +
  theme(
    plot.title = element_text(face = "bold", size = 32),
    plot.subtitle = element_text(face = "bold", size = 20),
    plot.caption = element_text(size = 10, margin = margin(10, 3, 3, 3, "pt")),
    plot.margin = margin(20, 100, 20, 20, "pt"),
    axis.title = element_text(size = 12, margin = margin(10, 10, 10, 10, "pt")),
    axis.text = element_text(face = "bold", size = 16),
    strip.text = element_text(face = "bold", size = 16),
    legend.title = element_text(face = "bold", size = 18),
    legend.text = element_text(size = 16),
    legend.key = element_rect(fill = "white"),
    legend.position = "top"
  )

# Saving plot
ggsave(
  filename = "./visualizations/hyde_ggplot2_uncharted_module_1_project.png",
  plot = hyde_ggplot2_plt,
  width = 1200,
  height = 675,
  units = "px",
  dpi = 72
)

# Plot 4 Simpsons: Line plot of episodes over time by IMDB rating with points sized to viewership
# simpsons_url <- "https://www.ggplot2-uncharted.com/data/simpsons_episodes.csv"
# simpsons_ggplot2 <- read_csv(simpsons_url)
# 
# # Writing data for hard copy
# write_csv(
#   simpsons_ggplot2,
#   "./data/simpsons.csv"
#   )

# Reading data
simpsons_ggplot2 <- read_csv("./data/simpsons.csv")

# Getting average season rating and viewership
simpsons_avg_imdb_views <- simpsons_ggplot2 |> 
  group_by(season) |> 
  summarize(avg_imdb = mean(imdb_rating, na.rm = T),
            avg_views = mean(us_viewers_in_millions, na.rm = T)) 
  
simpsons_ggplot_plt <- ggplot(simpsons_avg_imdb_views, aes(x = season, y = avg_imdb)) +
  geom_line(color = "#FFD521", linewidth = 3) +
  geom_point(aes(size = avg_views), color = "#F05E2F") +
  scale_x_continuous(breaks = seq(from = 1, to = 28, by = 2)) +
  scale_size_binned_area(n.breaks = 7, max_size = 12, labels = label_number(scale = 1e6, 
                                               scale_cut = cut_short_scale())) +
  theme_bw() +
  labs(
    title = "Seasons 5 through 7 were Peak Simpsons",
    subtitle = "Average IMDB rating and US viewership by simpsons season",
    caption = "Source: IMDB.",
    size = "Average Viewers",
    x = "Season",
    y = "Average IMDB Rating"
  ) +
  guides(size = guide_bins(direction = "horizontal", show.limits = T,
                           theme = theme(
                             legend.title = element_text(margin = margin(r = 15, unit = "pt")),
                             legend.text = element_text(angle = 45, hjust = 1)))) +
  theme(
    plot.title = element_text(face = "bold", size = 32),
    plot.subtitle = element_text(face = "bold", size = 20),
    plot.caption = element_text(size = 10, margin = margin(10, 3, 3, 3, "pt")),
    plot.margin = margin(20, 100, 20, 20, "pt"),
    panel.grid.minor = element_blank(),
    axis.title.x = element_text(size = 12, margin = margin(20, 10, 10, 10, "pt")),
    axis.title.y = element_text(size = 12, margin = margin(10, 20, 10, 10, "pt")),
    axis.text = element_text(face = "bold", size = 16),
    strip.text = element_text(face = "bold", size = 16),
    legend.title = element_text(face = "bold", size = 18),
    legend.text = element_text(size = 16),
    legend.key = element_rect(fill = "white"),
    legend.position = "top"
  )

# Saving plot
ggsave(
  filename = "./visualizations/simpsons_ggplot_uncharted_module_1_project.png",
  plot = simpsons_ggplot_plt,
  width = 1200,
  height = 675,
  units = "px",
  dpi = 72
)

# Plot 5 Simpsons: Bar chart of average rating for character name in title
simpsons_names <- c(
  "homer",
  "bart",
  "marge",
  "lisa",
  "burns",
  "ned",
  "moe"
)

simpsons_scores <- map_dbl(
  simpsons_names,
  function(x) {
    simpsons_ggplot2 |> 
      filter(str_detect(str_to_lower(title), x)) |> 
      pull(imdb_rating) |> 
      mean()
  }
)

simpsons_ggplot2_plt_2 <- tibble(
  character_name = str_to_title(simpsons_names),
  avg_imdb = simpsons_scores
) |> 
  ggplot(aes(x = reorder(character_name, -avg_imdb), y = avg_imdb)) +
  geom_col(fill = "#FFD521", color = "#000000") +
  coord_cartesian(ylim = c(6.5, NA)) +
  theme_bw() +
  labs(
    title = "Homer and Burns Episodes Most Highly Rated",
    subtitle = "Average IMDB rating for episodes with character name in title",
    caption = "Source: IMDB.",
    y = "Average IMDB Rating"
  ) +
  guides(size = guide_bins(direction = "horizontal", show.limits = T,
                           theme = theme(
                             legend.title = element_text(margin = margin(r = 15, unit = "pt")),
                             legend.text = element_text(angle = 45, hjust = 1)))) +
  theme(
    plot.title = element_text(face = "bold", size = 32),
    plot.subtitle = element_text(face = "bold", size = 20),
    plot.caption = element_text(size = 10, margin = margin(10, 3, 3, 3, "pt")),
    plot.margin = margin(20, 100, 20, 20, "pt"),
    panel.grid.minor = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_text(size = 12, margin = margin(10, 20, 10, 10, "pt")),
    axis.text = element_text(face = "bold", size = 16),
    strip.text = element_text(face = "bold", size = 16),
  )

# Saving plot
ggsave(
  filename = "./visualizations/simpsons_2_ggplot2_uncharted_module_1_project.png",
  plot = simpsons_ggplot2_plt_2,
  width = 1200,
  height = 675,
  units = "px",
  dpi = 72
)

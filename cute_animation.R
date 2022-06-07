
# Instalar librerias ------------------------------------------------------

# install.packages(c(tidyverse,
#                    gganimate,
#                    gifski,
#                   png))

# install.packages("remotes")
#remotes::install_github("sharlagelfand/ggcute")

# -------------------------------------------------------------------------

library(tidyverse)
library(gganimate)
library(gifski)
library(png)
library(ggcute)

cute_psd_plot <- curva_data_clean %>%
  left_join(., sieved_data_clean) %>%
  mutate(
    trat = case_when(
      trat == "REM" ~ "Peroxide\nremoval",
      trat == "SINREM" ~ "Without\nperoxide\nremoval"
    ),
    method = case_when(method == "CLASSIC" ~ "Classic ISP",
                       method == "PLUS" ~ "ISP Plus")
  ) %>%
  ggplot(aes(
    x = dp_mm,
    y = max_likeli,
    group = seq_along(max_likeli),
    color = rep
  )) +
  geom_point(size = 1) +
  geom_point(aes(x = min_mm,
                 y = cum_value,
                 alpha = ""),
             pch = 4,
             size = 2) +
  scale_alpha_manual(values = 1) +
  facet_grid(. ~ trat + method, scales = "free") +
  labs(x = "particle diameter (micrometer)",
       y = "cumulative relative mass (-)",
       alpha = "Sieved data") +
  scale_color_discrete(name = "Replicate",
                       labels = c("A", "B")) +
  scale_x_log10() +
  ggcute::theme_fairyfloss() +
  theme(axis.text.x = element_text(
    angle = 90,
    vjust = 0.5,
    hjust = 1
  )) +
  transition_reveal(max_likeli) +
  view_follow(fixed_x = TRUE,fixed_y = TRUE)


animate(cute_psd_plot, renderer = gifski_renderer("figures/cute_psd.gif"))



psd_plot <- curva_data_clean %>%
  left_join(., sieved_data_clean) %>%
  mutate(
    trat = case_when(
      trat == "REM" ~ "Peroxide removal",
      trat == "SINREM" ~ "Without peroxide removal"
    ),
    method = case_when(method == "CLASSIC" ~ "Classic ISP",
                       method == "PLUS" ~ "ISP Plus")
  ) %>%
  ggplot(aes(
    x = dp_mm,
    y = max_likeli,
    group = interaction(soil, hzn, trat, method, rep),
    color = rep
  )) +
  geom_point(size = 1) +
  geom_point(aes(x = min_mm,
                 y = cum_value,
                 alpha = ""),
             color = "darkgreen",
             pch = 4,
             size = 2) +
  scale_alpha_manual(values = 1) +
  geom_ribbon(aes(ymin = p2_5, ymax = p97_5),
              alpha = 0.3,
              color = "grey50") +
  facet_grid(. ~ trat + method, scales = "free") +
  theme_bw() +
  theme(axis.text.x = element_text(
    angle = 90,
    vjust = 0.5,
    hjust = 1
  )) +
  labs(x = "particle diameter (μm)",
       y = "cumulative relative mass (-)",
       alpha = "Sieved data") +
  scale_x_log10() +
  scale_color_discrete(name = "Replicate",
                       labels = c("A", "B"))

ggsave("figures/psd_plot.png",
       dpi = 300,
       device = "png",
       psd_plot)


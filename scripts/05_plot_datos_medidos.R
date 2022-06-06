scale_factor_plot <-
  max(measured_data_clean$pressure_pa) / max(measured_data_clean$temperature_c)

measured_plot <-
  measured_data_clean %>%
  mutate(
    trat = case_when(
      trat == "REM" ~ "Peroxide\nremoval",
      trat == "SINREM" ~ "Without\nperoxide removal"
    ),
    method = case_when(method == "CLASSIC" ~ "Classic ISP",
                       method == "PLUS" ~ "ISP Plus")
  ) %>%
  pivot_longer(cols = c(pressure_pa, fit_pa, temperature_c),
               names_to = "medicion") %>%
  mutate(value = case_when(
    medicion == "temperature_c" ~ as.numeric(value * scale_factor_plot),
    T ~ as.numeric(value)
  )) %>%
  ggplot(aes(
    x = runtime_s,
    group = interaction(soil, hzn, trat, method, rep),
    color = rep
  )) +
  geom_point(aes(y = value, shape = medicion)) +
  scale_y_continuous(
    name = "pressure (Pa)",
    sec.axis = sec_axis(~ . / scale_factor_plot, name = "temperature (°C)")
  ) +
  facet_grid(. ~ trat + method, scales = "free") +
  scale_color_discrete(name = "Replicate",
                       labels = c("A", "B")) +
  scale_shape_discrete(name = "Measurement",
                       labels = c("fit", "pressure (Pa)", "temperature (°C)")) +
  labs(x = "runtime (seconds)") +
  theme_bw() +
  theme(axis.text.x = element_text(
    angle = 90,
    vjust = 0.5,
    hjust = 1
  )) 

ggsave("figures/measured_plot.png",
       dpi = 300,
       device = "png",
       measured_plot)

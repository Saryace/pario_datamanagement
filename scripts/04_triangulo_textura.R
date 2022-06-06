# USDA triangle -----------------------------------------------------------

data(USDA)

USDA_text <- USDA  %>% group_by(Label) %>%
  summarise_if(is.numeric, mean, na.rm = TRUE)

USDA_text

# ggplot ------------------------------------------------------------------

textural_triangle <- ggplot(data = USDA, aes(y = Clay,
                                   x = Sand,
                                   z = Silt)) +
  coord_tern(L = "x", T = "y", R = "z") +
  geom_polygon(aes(fill = Label),
               alpha = 0.0,
               size = 0.5,
               color = "black") +
  geom_text(data = USDA_text,
            aes(label = Label),
            color = 'black',
            size = 2) +
  geom_point(
    data = datos_data_clean,
    aes(
      x = sand,
      y = clay,
      z = silt,
      color = method,
      shape = trat
    ),
    size = 3,
    alpha = 0.75
  ) +
  scale_color_discrete(
    name = "",
    labels = c("Classic ISP", "ISP Plus") 
  ) +
  scale_shape_discrete(
    name = "",
    labels = c("Peroxide removal", "Without peroxide removal") 
  ) +
  theme(
    text = element_text(family = "Helvetica"),
    legend.position = "bottom"
  ) +
  guides(fill = "none") +
  theme_bw() +
  theme_showarrows() +
  theme_clockwise() +
  ggtitle("Soil with organic matter content < 1%")

ggsave("figures/textural_triangle.png",dpi = 300, device="png", textural_triangle)
# Usando Sand, Silt and Clay, calcular clase textural ---------------------

textural_clases <- TT.points.in.classes(
  tri.data = as.data.frame(datos_data_clean),
  css.names = c("clay", "silt", "sand"),
  class.sys = "USDA.TT",
  PiC.type = "t",
  text.tol = 100.1
)

datos_data_clean$CLASS <- textural_clases

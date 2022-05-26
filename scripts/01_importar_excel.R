# Hacer lista de archivos -------------------------------------------------

file.list <- list.files("data", pattern = '*.xlsx',
                        full.names = TRUE)

# Obtener la data raw -----------------------------------------------------

curva_raw <-
  bind_rows(setNames(lapply(file.list, function(x)
    read_excel(x,
               sheet = 4,
               "B8:F508")),
    file.list), .id = "id")

ssc_raw <-
  bind_rows(setNames(lapply(file.list, function(x)
    read_excel(x,
               sheet = 5,
               "B8:D18")),
    file.list), .id = "id")



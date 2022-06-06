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

measured_raw <-   bind_rows(setNames(lapply(file.list, function(x)
  read_excel(x,
             sheet = 3,
             range = cell_limits(c(8, 2), c(NA, 6)))),
  file.list), .id = "id")

sieved_raw <-   bind_rows(setNames(lapply(file.list, function(x)
  read_excel(x,
             sheet = 2,
             "B8:G13")),
  file.list), .id = "id")

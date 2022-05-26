# Cargar scripts  ---------------------------------------------------------

list.files("scripts", pattern="\\.R$", full.names = T) %>% 
  purrr::map(source) 

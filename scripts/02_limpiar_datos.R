
# Ordenar las columnas en formato largo -----------------------------------

curva_data_clean <-
  curva_raw %>% 
  separate(id, into=c("SOIL","HZN","TRAT","METHOD","REP"), sep = "_") %>% 
  mutate(SOIL = str_remove_all(SOIL,"data/"),
         REP  = str_remove_all(REP,".xlsx")) %>% 
  clean_names()


# Ordenar en formado ancho ------------------------------------------------

datos_data_clean <-
  ssc_raw %>% 
  select(-3) %>% 
  mutate_if(is.numeric, funs(. * 100)) %>% 
  separate(id, into=c("SOIL","HZN","TRAT","METHOD","REP"), sep = "_") %>% 
  mutate(SOIL = str_remove_all(SOIL,"data/"),
         REP  = str_remove_all(REP,".xlsx")) %>% 
  distinct(.,.keep_all = TRUE) %>% #clay data esta repetido
  group_by(SOIL,HZN,TRAT,METHOD,REP) %>% 
  spread(FRACTION,`MAX-LIKELI`) %>% 
  clean_names()


# Ordenar en formado ancho ------------------------------------------------

sieved_data_clean <-
  sieved_raw %>% 
  clean_names() %>% 
  mutate(psd_sand = coalesce(particle_size_class, particle_size_class_2)) %>% 
  separate(id, into=c("SOIL","HZN","TRAT","METHOD","REP"), sep = "_") %>% 
  mutate(SOIL = str_remove_all(SOIL,"data/"),
         REP  = str_remove_all(REP,".xlsx")) %>% 
  select(-c(particle_size_class, particle_size_class_2)) %>% 
  clean_names()


# Datos medidos (presion, tiempo y temperatura) ---------------------------

measured_data_clean <-
  measured_raw %>% 
  separate(id, into=c("SOIL","HZN","TRAT","METHOD","REP"), sep = "_") %>% 
  mutate(SOIL = str_remove_all(SOIL,"data/"),
         REP  = str_remove_all(REP,".xlsx")) %>% 
  clean_names() %>% 
  select(-c(scaled_pressure_pa, x5))

# Guardar data clean ------------------------------------------------------

write_csv(curva_data_clean, "output/curva_data_clean.csv")
write_csv(datos_data_clean, "output/datos_data_clean.csv")
write_csv(sieved_data_clean, "output/sieved_data_clean.csv")
write_csv(measured_data_clean, "output/measured_data_clean.csv")
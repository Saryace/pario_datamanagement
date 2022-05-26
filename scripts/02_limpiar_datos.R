curva_data_clean <-
  curva_raw %>% 
  separate(id, into=c("SOIL","HZN","TRAT","METHOD","REP"), sep = "_") %>% 
  mutate(SOIL = str_remove_all(SOIL,"data/"),
         REP  = str_remove_all(REP,".xlsx")) 

datos_data_clean <-
  ssc_raw %>% 
  select(-3) %>% 
  separate(id, into=c("SOIL","HZN","TRAT","METHOD","REP"), sep = "_") %>% 
  mutate(SOIL = str_remove_all(SOIL,"data/"),
         REP  = str_remove_all(REP,".xlsx")) %>% 
  distinct(.,.keep_all = TRUE) %>% #clay data esta repetido
  group_by(SOIL,HZN,TRAT,METHOD,REP) %>% 
  spread(FRACTION,`MAX-LIKELI`)

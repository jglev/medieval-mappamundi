library(data.table)
library(dplyr)
library(magrittr)
library(readr)


dataset %>% 
  magrittr::set_colnames(dataset %>% names() %>% tolower()) %>%
  tidyr::gather(
    key = "map",
    value = "toponym",
    contains("_normalized_reading"),
    contains("_diplomatic_reading"),
    na.rm = TRUE
  ) %>% 
  mutate(
    group = mapply(
      switch,
      gsub("[^AB]", "", key),
      A = groupA,
      B = groupB
    ),
    key = sub("[AB]", "", key)
  )

mini_iris %>% gather(key = flower_att, value = measurement, -Species)




%>%
  extract(
    map,
    c("normalized", "loop_number"),
    "(Q.\\..)\\.(.)") %>%


dataset %>%
  gather(key, value) %>%
  separate(key, into = c(
    "type", "var"
  )) %>%
  group_by(section, var) %>%
  summarise(
    result = var(value[type == "est"]) / mean(value[type == "var"])
  )

dataset %>% names() %>% str

library(magrittr)
library(data.table)

dataset <- readr::read_csv(
  "~/Documents/Project_Work/2017-04-05_Heather_Wacha_Psalter_Maps_Project/Sub-Git_Repository_for_Dataset/Mappamundi_Project_Dataset.csv",
  na = "") %>% 
  dplyr::select(-`Map Name`) %>% 
  magrittr::set_colnames(dataset %>% names() %>% tolower())

map_names <- dataset %>% 
  names() %>% 
  stringr::str_replace('_*(normalized|diplomatic)_reading.*', '') %>% 
  unique()

dataset_tidy <- dataset %>% 
  magrittr::set_colnames(dataset %>% names() %>% tolower()) %>% 
  data.table::setDT() %>% data.table::melt(
    measure.vars = patterns(
      ".*_normalized_reading.*",
      ".*diplomatic_reading.*"
    ),
    variable.name = "map_name",
    value.name = c("normalized", "diplomatic"),
    variable.factor = TRUE,
    na.rm = TRUE
  ) 
levels(x) <- c("one","two","three")
  
levels(dataset_tidy$map_name) = map_names

dataset_tidy %>% View()



  



dataset_tidy %>% select(map) %>% str()
  

dt <- as.data.table(read.table(text = "id A1g_hi A2g_hi A3g_hi A4g_hi BA1g_hi B2g_hi B3g_hi B4g_lo
1  2      3      4      5 6 7 8 9 10", header = T))
dt %>% gather(time, hi, -id) %>% mutate(time = extract_numeric(time)) %>% View()



  View()

res[, ProductNumber := factor(ProductNumber, labels = c("A","B"))]


d %>%
  gather(key, value, est_v1:var_v5) %>%
  separate(key, into = c("type", "var")) %>%
  group_by(section, var) %>%
  summarise(
    result = var(value[type == "est"]) / mean(value[type == "var"])
  )
  

df.value <- dataset %>%
  tidyr::gather(key="map", value="toponym_descriptive", contains("Diplomatic_reading"))


reshape(
  dataset,
  varying = 2:11,
  direction = 'long',
  sep="_",
  timevar="variable"
)



d %>%
  gather(key, value, est_v1:var_v5) %>%
  separate(key, into = c("type", "var")) %>%
  group_by(section, var) %>%
  summarise(
    result = var(value[type == "est"]) / mean(value[type == "var"])
  )





df.date <- dataset %>%
  tidyr::gather(key="map", value="toponym_normalized", contains("normalized_reading"))
data.frame(
  df.value,
  df.date
)
  
  colnames()

contains("Diplomatic_reading"),
contains("normalized_reading")

gather(key, value, -id, -time) %>%
  extract(key, c("question", "loop_number"), "(Q.\\..)\\.(.)") %>%
  spread(question, value)
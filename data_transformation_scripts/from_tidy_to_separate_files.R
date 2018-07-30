purrr::map(paste0(tolower(map_names), ".csv"), function(x) {write("", file = x)})

write_csv_from_group  = function(data_subset) {
  write_csv(
    data_subset %>% select(-map_name),
    paste0(
      data_subset %>% pull(map_name) %>% unique(),
      ".csv"
    )
  )
}

dataset_tidy %>% 
  group_by(map_name) %>% 
  do(write_csv_from_group(.))


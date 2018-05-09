source(file.path(
  "data_transformation_scripts",
  "from_combined_untidy_to_combined_tidy.R"
))

dplyr::tibble(
  non_coded = dataset_tidy %>% 
    dplyr::pull(normalized) %>% 
    unique() %>% 
    sort()
) %>% 
  dplyr::mutate(coded = non_coded) %>% 
  readr::write_csv(
    path = file.path(
      "map_files",
      "unique_toponyms_normalization_tagging.csv"
    )
  )
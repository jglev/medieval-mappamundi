# Get the data files in the directory:
files_in_directory <- ?list.files(
  path = getwd(),
  pattern = '*.csv',
  full.names = TRUE,
  recursive = FALSE  # Set this to TRUE to go into the example_map_files
                     # directory and load the files from it.
)

# Get the filenames without extensions (i.e., get the map names):
map_names <- tools::file_path_sans_ext(
  files_in_directory %>% basename()
)

# Load the data, and combine it into a single tibble:
map_data <- files_in_directory %>% 
  purrr::map_df(read_csv, .id = "map_name") %>% 
  mutate(map_name = factor(map_name))

# Overwrite the map_name column with the original map names:
map_data$map_name %<>% forcats::lvls_revalue(map_names)

# Interact with the tidy data output --------------------------------------

# Optionally, view the tidied dataset:
# map_data %>% View()

# Or view the first 2 toponyms for each map:
# map_data %>% group_by(map_name) %>% top_n(2) %>%
#   knitr::kable(format = 'markdown')

# Optionally, write a CSV of the tidy dataset:
# By default, this will write to the current Working Directory, which you can
# see by using the command:
# getwd()
write_csv(
  map_data,
  path = 'Mappamundi_Project_Dataset_Tidy.csv',
  na = ''
)

# Load packages -----------------------------------------------------------

library(forcats)
library(dplyr)
library(knitr)
library(magrittr)
library(purrr)
library(readr)
library(tools)

# Settings ----------------------------------------------------------------

# This script assumes that the working directory is the map_files
# directory. In RStudio, you can select this directory by clicking
# Session -> Set Working Directory -> Choose Directory

# Define file combination function ----------------------------------------

combine_separate_data_files <- function(
  directory = getwd(),
  filename_pattern = '.*csv',
  recursive_search = FALSE
) {

  # Get the data files in the directory:
  files_in_directory <- list.files(
    path = directory,
    pattern = filename_pattern,
    full.names = TRUE,
    recursive = recursive_search  
      # Set this to TRUE to go into the example_map_files
      # directory and load the files from it.
  )
  
  # Get the filenames without extensions (i.e., get the map names):
  map_names <- tools::file_path_sans_ext(
    files_in_directory %>% basename()
  )
  
  # Load the data, and combine it into a single tibble:
  map_data <- files_in_directory %>% 
    purrr::map_df(readr::read_csv, .id = "map_name") %>% 
    dplyr::mutate(
      map_name = map_name %>% as.integer() %>% sort() %>% factor()
    )
  
  # Check the number of elements per map
  # map_data %>% group_by(map_name) %>% summarize(n = n())
  
  # Overwrite the map_name column with the original map names:
  map_data$map_name %<>% 
    forcats::lvls_revalue(map_names)
  
  # Again, check the number of elements per map
  # map_data %>% group_by(map_name) %>% summarize(n = n())
  
  map_data
}

# Interact with the tidy data output --------------------------------------
  
# Optionally, view the tidied dataset:
# combine_separate_data_files() %>% View()

# Or view the 2 toponyms from each map:
# combine_separate_data_files() %>%
# group_by(map_name) %>% top_n(2) %>%
#  knitr::kable(format = 'markdown')

# Optionally, write a CSV of the tidy dataset:
# By default, this will write to the current Working Directory, which you can
# see by using the command:
# getwd()

# readr::write_csv(
#   combine_separate_data_files(),
#   path = 'Mappamundi_Project_Dataset_Tidy.csv',
#   na = ''
# )

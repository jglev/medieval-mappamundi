# Tidy the combined mappamundi datset
# Author: Jacob Levernier and Heather Wacha
# Year: 2018
# License: BSD 3-Clause

# The mappamundi dataset is a series of column-based lists of place names.
# Each map has two columns, one with a name including 'diplomatic_reading' and
# the other with a name including 'normalized_reading'. This data format was
# chosen to ease adding data to the dataset by a researcher using a spreadsheet
# program such as Microsoft Excel or LibreOffice Calc.
# This script transforms the data into a 'tidy' format, where each row is one
# place name in one map, and each column is a separate, but consistent,
# variable.
# For more on 'tidy' data, see http://r4ds.had.co.nz/tidy-data.html.

# Load packages -----------------------------------------------------------

library('data.table')
library('dplyr')
library('magrittr')
library('knitr')
library('readr')
library('stringr')

# Load the dataset --------------------------------------------------------

# This assumes that the working directory is set to the base directory of this
# repository.
# In RStudio, you can click Session -> Set Working Directory -> 
# To Project Directory to accomplish this.

dataset <- readr::read_csv(
  file.path(
    'data',
    'untidy',
    'mappamundi_combined_untidy.csv'
  ),
  na = ''
) %>% 
  dplyr::select(-`Map Name`)  # Drop the 'Map Name' column
  
dataset <- magrittr::set_colnames(
  dataset,
  dataset %>% names() %>% tolower() # Lowercase all column names
)

# Tidy the dataset --------------------------------------------------------

# Get the names of all maps, across the dataset, looking across column names
# and then collapsing across 'diplomatic_reading' and 'normalized_reading'
# variants:
map_names <- dataset %>% 
  names() %>% 
  stringr::str_replace('_*(normalized|diplomatic)_reading.*', '') %>% 
  unique()

# 'Melt' the data into a tidy format:
dataset_tidy <- dataset %>% 
  magrittr::set_colnames(dataset %>% names() %>% tolower()) %>% 
  data.table::setDT() %>% data.table::melt(
    measure.vars = patterns(
      '.*\\snormalized',
      '.*\\sdiplomatic'
    ),
    variable.name = 'map_name',
    value.name = c('normalized', 'diplomatic'),
    variable.factor = TRUE,
    na.rm = TRUE
  )
# Rename the map_name variable level names from numbers (which happened during
# the melting process above) to their equivalent map names:
levels(dataset_tidy$map_name) <- map_names

# Interact with the tidy data output --------------------------------------

# Optionally, view the tidied dataset:
# dataset_tidy %>% View()

# Or view the first 2 toponyms for each map:
# dataset_tidy %>% group_by(map_name) %>% top_n(2) %>%
#   knitr::kable(format = 'markdown')

# Optionally, write a CSV of the tidy dataset:
# By default, this will write to the current Working Directory, which you can
# see by using the command:
# getwd()
readr::write_csv(
  dataset_tidy,
  path = file.path('data', 'tidy', 'combined', 'mappamundi_combined_tidy.csv'),
  na = ''
)

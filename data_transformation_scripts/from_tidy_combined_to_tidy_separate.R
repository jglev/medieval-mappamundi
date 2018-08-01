# Split a combined tidy dataset into separate files, one for each map
# Author: Jacob Levernier and Heather Wacha
# Year: 2018
# License: BSD 3-Clause

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
    'tidy',
    'combined',
    'mappamundi_combined_tidy.csv'
  ),
  na = ''
)

# Write the data into separate files --------------------------------------

write_csv_from_group  = function(data_subset) {
  readr::write_csv(
    data_subset %>% select(-map_name),
    file.path(
      'data',
      'tidy',
      'individual',
      paste0(
        data_subset %>% pull(map_name) %>% unique(),
        '.csv'
      )
    )
  )
}

message('Writing output CSVs, and then displaying the combined tidy dataset...')

dataset %>% 
  group_by(map_name) %>% 
  do(write_csv_from_group(.))


# Take comma-separated strings (within cells of a CSV) and combine them into
# one-way relationships for easy import into a network mapping application
# Jacob Levernier
# September 2017
# Released under a BSD 3-Clause License (https://opensource.org/licenses/BSD-3-Clause).

# Settings ----------------------------------------------------------------

# Working directory: The directory on your computer in which the data file can
# be found, and into which you would like to save the output from this script.
# Include a trailing slash ('/') at the end:

# If you don't know what a directory path is: In RStudio, you can click on Session -> Set Working Directory... -> Choose Directory..., then select the directory that contains Mappamundi_Project_Full_Dataset_Edge_List.csv. You can then take the path that's printed at the bottom of the window, and paste that between the quotation marks here:
working_directory_to_set <- "/path/to/directory/that/contains/Mappamundi_Project_Full_Dataset_Edge_List.csv"

# Data file name within the working directory:
# NOTE: The data file should be a Comma-Separated Values file with comma delimiters and double-quotes (") around text fields.

# The CSV file SHOULD have a header row (i.e., a row with column names).
dataFileName <- "2017-08-27-1404_Mappamundi_Project_Full_Dataset.csv"
transpose_dataset_first <- TRUE # This should be TRUE or FALSE. It should be TRUE if the data are arranged with each map as a separate column. It should be FALSE if the data are arranged with each map as a separate row.

# The filename to which to write the output from this script:
output_filename <- "2017-08-27-1404_Mappamundi_Project_Full_Dataset_Edge_List.csv"

filename_to_write_unique_names_to_check_to <- "Unique_Values_to_Look_Over_for_Duplicates.txt"

# Processing steps --------------------------------------------------------

# Set the working directory
setwd(working_directory_to_set)

dataSetToParse <- read.csv(
  dataFileName,
  header = TRUE,
  sep = ",",
  stringsAsFactors = FALSE
)

# If we've been asked to transpose the dataset, do so:
if (transpose_dataset_first == TRUE) {
  dataSetToParse <- as.data.frame(t(dataSetToParse))
  dataSetToParse <- cbind(rownames(dataSetToParse), dataSetToParse)

  # Remove the first row, which would have been row titles in the
  # originally-transposed dataset:
  dataSetToParse <- dataSetToParse[2:nrow(dataSetToParse),]
}

# Create a blank data.frame, which we'll append to below:
edge_list_of_places_and_map_names <- data.frame()

for (i in 1:nrow(dataSetToParse)) {
  message("Processing row ", i, "...")

    vector_of_places_in_row <- unlist(dataSetToParse[i, 2:ncol(dataSetToParse)])

    map_name <- dataSetToParse[i, 1]

    vector_of_places_in_row_with_blanks_removed <- vector_of_places_in_row[
      vector_of_places_in_row != ""
    ]

    pairwise_combinations_of_places <- data.frame(
      "from" = vector_of_places_in_row_with_blanks_removed,
      "to" = map_name
    )

  # Check our work
  # View(pairwise_combinations_of_places)

  edge_list_of_places_and_map_names <- rbind(
    edge_list_of_places_and_map_names,
    pairwise_combinations_of_places
   )
} # End of for loop

# Lowercase everything:
edge_list_with_lowercased_rows <- apply(
  edge_list_of_places_and_map_names,
  2,
  tolower
)
# View(edge_list_with_lowercased_rows) # Check our work


# Write a CSV file for this:
write.table(
  edge_list_with_lowercased_rows,
  file = output_filename,
  row.names = FALSE,
  col.names = TRUE,
  sep = ",",
  # The eol/"end of line" marker \r\n is \n, which is read by older Mac machines
  #  as "new line", \r, which is read by Unix machines as newline (or "carriage
  #  Return"), and \r\n, which is read by Windows machines as newline. See,
  #  e.g., https://stackoverflow.com/questions/1761051/difference-between-n-and-r/1761086#1761086
  eol = "\r\n"
)


edge_list_with_lowercased_rows.data_frame <- as.data.frame(
  edge_list_with_lowercased_rows
)

unique_values <- as.character(
  sort(unique(
    edge_list_with_lowercased_rows.data_frame[
      # Just use rows from a particular set of maps (ones whose names match the search string here).
      grep(
        "Normalized_Reading",
        edge_list_with_lowercased_rows.data_frame$to,
        ignore.case = TRUE
      )
      ,
      "from"
      ]
  ))
)

write.table(
  unique_values,
  file = filename_to_write_unique_names_to_check_to,
  row.names = TRUE,
  quote = FALSE
)

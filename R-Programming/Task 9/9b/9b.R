#TASK 9 : Write a R program to read the .csv file and perform the following.
#(b) remove outliers from the data
#Program:
library(readr)
library(dplyr)
file_path <- 'crime.csv'
data <- read_csv(file_path)
# Check if "Year" is a numeric column
if ("Year" %in% colnames(data) && is.numeric(data$Year)) {
  column <- data$Year
  # Remove outliers using IQR method
  Q1 <- quantile(column, 0.25)
  Q3 <- quantile(column, 0.75)
  IQR_value <- Q3 - Q1
  lower_bound <- Q1 - 1.5 * IQR_value
  upper_bound <- Q3 + 1.5 * IQR_value
  data_no_outliers <- data %>%
    filter(column >= lower_bound & column <= upper_bound)
  print("Data without outliers:")
  print(data_no_outliers)
} else {
  # If "Year" is not numeric, keep all rows
  data_no_outliers <- data
  print("No numeric column named 'Year' found.")
}
# Print the original data
print("Original Data:")
print(data)

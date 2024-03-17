## Task 8
##Write a R program to create a Data Frame which contain details of 5 employees and 
##]display summary of the data
#Program
# Create the data frame.
emp.data <- data.frame(
 emp_id = c (1:5), 
 emp_name = c("Ram","Raja","Arjun","Ryan","Gary"),
 salary = c(623.3,515.2,611.0,729.0,843.25), 
 start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11","2015-03-27")),stringsAsFactors = FALSE)
# Print the data frame.
print(emp.data)

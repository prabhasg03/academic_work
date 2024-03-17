## Task 8
## Write a R program to create a Data Frame which contain details of 5 employees
## and display summary of the data
#Program
# Create the data frame.
emp.data <- data.frame(
 emp_id = c (1:5), 
 emp_name = c("Ram","Raja","Arjun","Ryan","Gary"),
 salary = c(623.3,515.2,611.0,729.0,843.25), 
 start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11","2015-03-27")),stringsAsFactors = FALSE)
# Print the data frame.
print(emp.data)
#Output:
#   emp_id emp_name salary start_date
# 1      1      Ram 623.30 2012-01-01
# 2      2     Raja 515.20 2013-09-23
# 3      3    Arjun 611.00 2014-11-15
# 4      4     Ryan 729.00 2014-05-11
# 5      5     Gary 843.25 2015-03-27

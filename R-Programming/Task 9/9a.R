#TASK 9 : Write a R program to read the .csv file and perform the following.
#(a) Summary statistics on the data
# Program:
library(readr)
data <- read_csv("Salary_Data.csv")
# Summary statistics
summary(data)
#Output:
#> # Summary statistics
#> summary(data)
#YearsExperience      Salary      
#Min.   : 1.100   Min.   : 37731  
#1st Qu.: 3.200   1st Qu.: 56721  
#Median : 4.700   Median : 65237  
#Mean   : 5.313   Mean   : 76003  
#3rd Qu.: 7.700   3rd Qu.:100545  
#Max.   :10.500   Max.   :122391 

#Task 10
#Write a R program to read the .csv file and perform the following. 
#(b)Test a hypothesis about the data
#Program:
# Load the required library
library(readr)
data <- read.csv("crime.csv")
t_test_result <- t.test(data$Burglary, mu = 2)
print(t_test_result)
if (t_test_result$p.value < 0.05) {
  cat("Reject the null hypothesis. There is significant evidence that the mean of variable_of_interest is different from 0.")
} else {
  cat("Fail to reject the null hypothesis. There is not enough evidence to conclude that the mean of variable_of_interest is different from 0.")
}

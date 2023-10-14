#Write a R program to create a list of random numbers in normal distribution and count the
#occurrences of each value.
#Program:
n=as.numeric((readline("Enter Size of list:"))[[1]])
m=as.numeric((readline("Enter Mean of Normal Distribution:"))[[1]])
sd=as.numeric((readline("Enter Standard Deviation of Normal Distribution:"))[[1]])
cat("List of Random Numbers")
n = floor(rnorm(n))
print('List of random numbers in normal distribution:')
print(n)
t = table(n)
print("Count occurrences of each value:")
print(t)
#Output:
# > #Write a R program to create a list of random numbers in normal distribution and count the
#   > #occurrences of each value.
#   > #Program:
#   > n=as.numeric( .... [TRUNCATED] 
#                   Enter Size of list:5
#                   
#                   > m=as.numeric((readline("Enter Mean of Normal Distribution:"))[[1]])
#                   Enter Mean of Normal Distribution:50
#                   
#                   > sd=as.numeric((readline("Enter Standard Deviation of Normal Distribution:"))[[1]])
#                   Enter Standard Deviation of Normal Distribution:100
#                   
#                   > cat("List of Random Numbers")
#                   List of Random Numbers
#                   > n = floor(rnorm(n))
#                   
#                   > print('List of random numbers in normal distribution:')
#                   [1] "List of random numbers in normal distribution:"
#                   
#                   > print(n)
#                   [1]  1 -3 -1  0 -1
#                   
#                   > t = table(n)
#                   
#                   > print("Count occurrences of each value:")
#                   [1] "Count occurrences of each value:"
#                   
#                   > print(t)
#                   n
#                   -3 -1  0  1 
#                   1  2  1  1 
#                   > 

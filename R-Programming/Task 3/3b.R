#Write R program to find the factors of a given number using functions
#Program:
find_factors = function(n) {
  factors = vector()
  for (i in 1:n) {
    if (n %% i == 0) {
      factors = c(factors, i)
    }
  }
  return(factors)
}
n=as.numeric(readline(prompt="Enter Number to get factors:"))
factors = find_factors(16)
print(factors)
#Output:
#Enter Number to get factors:
#16
#[1]  1  2  4  8 16

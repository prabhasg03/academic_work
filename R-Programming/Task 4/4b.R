#4b.) Write R program to find the sum of natural numbers using recursive function
#Program:
sum_natural <- function(n) {
  if (n == 0 || n == 1) {
    return(n)
  }
  return(n+sum_natural(n - 1))
}

n<-as.numeric(readline("Enter Number:"))
if((n)<0){
  cat("Invalid input. Please enter a positive integer.")
}else{
  cat("Sum of ",n," natural numbers:",sum_natural(n))
}
#Output:
#Enter Number:5
#Sum of  5  natural numbers: 15
#[Execution complete with exit code 0]

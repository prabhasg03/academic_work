#4a.) Write R program to generate Fibonacci series using recursive function.
fibonacci <- function(f) {
  if (f == 0 || f == 1) {
    return(f)
  }
  else {
    return(fibonacci(f - 1) + fibonacci(f - 2))
  }
}

n=readline("Enter Number:")
n=as.integer(n)
if (n < 0) {
  cat("Invalid input. Please enter a positive integer.")
} else {
  cat("The Fibonacci series is: ")
  for (i in 0:n) {
    cat(fibonacci(i)," ")
  }
}
#Output:
#Enter Number:4
#The Fibonacci series is: 0  1  1  2  3

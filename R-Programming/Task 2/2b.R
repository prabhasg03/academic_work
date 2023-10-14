#2b.)Write R program to find the given number is prime or not.
#Program:
is_prime <- function(n){
  if(n==2 || n==3){return(TRUE)}
  if((n<2)|n%%2==0){
    return(FALSE)
  }
    for (i in 2:sqrt(n)) {
      if(n%%i==0){
        return(FALSE)
      }
    }
  return(TRUE)
}

print("Enter a number to check prime or not:")
n=as.numeric((readline())[[1]])
if(is_prime(n)){
  print(c(n,"is a Prime number."))
}else{
  print(c(n,"is not a Prime number."))
}
#OUTPUT:

#> is_prime <- function(n){
#+   if(n==2 || n==3){return(TRUE)}
#+   if((n<2 .... [TRUNCATED] 

#> print("Enter a number to check prime or not:")
#[1] "Enter a number to check prime or not:"

#> n=as.numeric(readline())
#7

#> if(is_prime(n)){
#+   print(c(n,"is a Prime number."))
#+ }else{
#+   print(c(n,"is not a Prime number."))
#+ }
#[1] "7"                  "is a Prime number."

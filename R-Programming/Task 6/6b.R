#TASK 6
#(b) Write a R program for multiplication of two matrices.
a = matrix(c(1,3,5,7), ncol=2, nrow=2)
b = matrix(c(2,4,6,8), ncol=2, nrow=2)
a*b
a %*% b
#Output:
#     [,1] [,2]
#[1,]    2   30
#[2,]   12   56
#     [,1] [,2]
#[1,]   22   46
#[2,]   34   74

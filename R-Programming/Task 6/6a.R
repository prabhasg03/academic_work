#TASK 6
#(a) Write a R program for addition of two matrices.
# Create two 2x3 matrices. 
m1 = matrix(c(1, 2, 3, 4, 5, 6), nrow = 2) 
print("Matrix-1:")
print(m1)
m2 = matrix(c(0, 1, 2, 3, 0, 2), nrow = 2) 
print("Matrix-2:")
print(m2) 
result = m1 + m2 
print("Result of addition"a)
print(result)
#Output
#[1] "Matrix-1:"
#     [,1] [,2] [,3]
#[1,]    1    3    5
#[2,]    2    4    6
#[1] "Matrix-2:"
#     [,1] [,2] [,3]
#[1,]    0    2    0
#[2,]    1    3    2
#[1] "Result of addition"
#     [,1] [,2] [,3]
#[1,]    1    5    5
#[2,]    3    7    8

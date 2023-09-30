#TASK 1
#Write a R program to create an array of two 3x3 matrices (each with 3 rows and 3 columns)
#from two given two vectors of any length. And display
#(a) the second row of the second matrix of the array
#(b) the element in the 3rd row and 3rd column of the 1st matrix
#Program:
print("Enter Elements with space for vector 1:")
v1=as.numeric((strsplit(readline()," "))[[1]])
print("Enter Elements with space for vector 2:")
v2=as.numeric((strsplit(readline()," "))[[1]])
print(v1)
print(v2)
m1 <- matrix(v1[1:9], nrow=3)
m2 <- matrix(v2[1:9], nrow=3)
arr <- array(c(m1, m2), dim=c(3,3,2))
print(arr[2,,2])
print(arr[3,3,1])
#Output:
#> #TASK 1
#  > #Write a R program to create an array of two 3x3 matrices (each with 3 rows and 3 columns)
#  > #from two given two vectors of any length. An .... [TRUNCATED] 
#  [1] "Enter Elements with space for vector 1:"

#> v1=as.numeric((strsplit(readline()," "))[[1]])
#1 2 3 4 5 6 7 8 9

#> print("Enter Elements with space for vector 2:")
#[1] "Enter Elements with space for vector 2:"

#> v2=as.numeric((strsplit(readline()," "))[[1]])
#9 8 7 6 5 4 3 2 1

#> print(v1)
#[1] 1 2 3 4 5 6 7 8 9

#> print(v2)
#[1] 9 8 7 6 5 4 3 2 1

#> m1 <- matrix(v1[1:9], nrow=3)

#> m2 <- matrix(v2[1:9], nrow=3)

#> arr <- array(c(m1, m2), dim=c(3,3,2))

#> print(arr[2,,2])
#[1] 8 5 2

#> print(arr[3,3,1])
#[1] 9

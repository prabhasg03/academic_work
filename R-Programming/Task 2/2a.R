#2a.)Find Sum,Mean and Product of given vector values:
#Program:
print("Enter Elements for Vector:")
v1=as.numeric((strsplit(readline()," "))[[1]])
print(v1)
print(c("Sum of Elements:",sum(v1)))
print(c("Mean of Elements:",mean(v1)))
print(c("Product of Elements:",prod(v1)))
#output
#[1] "Enter Elements for Vector:"

#> v1=as.numeric((strsplit(readline()," "))[[1]])
#1 2 3 4 5 6

#> print(v1)
#[1] 1 2 3 4 5 6

#> print(c("Sum of Elements:",sum(v1)))
#[1] "Sum of Elements:" "21"              

#> print(c("Mean of Elements:",mean(v1)))
#[1] "Mean of Elements:" "3.5"              

#> print(c("Product of Elements:",prod(v1)))
#[1] "Product of Elements:" "720"    

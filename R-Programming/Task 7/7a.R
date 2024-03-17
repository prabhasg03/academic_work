#TASK 7 
#Write a R program to create a data frame from four given vectors of students details. (Name, roll.no., sub_name, marks)
User.ID <- sprintf("User % d", 1:8) 
Name <- c("Jhon", "Lee", "Suzan", "Abhinav","Brain", "Emma", "David", "Alice")
gender <- c("Male", "Male", "Female", "Male","Male", "Female", "Male", "Female") 
Marks <- c(56, 76, 86, 96, 73, 87, 47, 98) 
Number <- c('111-222', '222-333', '333-444', '444-666','333-888', '000-888-777', '999-000', '222-456') 
class.df<- data.frame(User.ID, Name,gender, Marks, Number)
print(class.df)
#Output:
#   User.ID    Name gender Marks      Number
# 1 User  1    Jhon   Male    56     111-222
# 2 User  2     Lee   Male    76     222-333
# 3 User  3   Suzan Female    86     333-444
# 4 User  4 Abhinav   Male    96     444-666
# 5 User  5   Brain   Male    73     333-888
# 6 User  6    Emma Female    87 000-888-777
# 7 User  7   David   Male    47     999-000
# 8 User  8   Alice Female    98     222-456

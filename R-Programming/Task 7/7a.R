#TASK 7 
#Write a R program to create a data frame from four given vectors of students details. (Name, roll.no., sub_name, marks)
User.ID <- sprintf("User % d", 1:8) 
Name <- c("Jhon", "Lee", "Suzan", "Abhinav","Brain", "Emma", "David", "Alice")
gender <- c("Male", "Male", "Female", "Male","Male", "Female", "Male", "Female") 
Marks <- c(56, 76, 86, 96, 73, 87, 47, 98) 
Number <- c('111-222', '222-333', '333-444', '444-666','333-888', '000-888-777', '999-000', '222-456') 
class.df<- data.frame(User.ID, Name,gender, Marks, Number)
print(class.df)

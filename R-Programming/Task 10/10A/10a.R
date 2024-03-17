#Task 10
#Write a R program to read the .csv file and perform the following. 
#(a) Plot the data using using ggplot
install.packages('ggplot2')
library(ggplot2)
data(iris)
ggplot(iris, aes(x=Sepal.Length, y=Petal.Length))+geom_point()
ggplot(iris, aes(x=Sepal.Length, y=Petal.Length, col=Species, shape=Species))+geom_point()
ggplot(iris, aes(x=Sepal.Length, y=Petal.Length, col=Species))+geom_point() +geom_smooth()
ggplot(mtcars, aes(x = gear)) +geom_bar()
ggplot(mtcars, aes(hp, mpg)) + geom_point(color = "blue")+geom_line(linetype="dashed") 
stat_summary(fun.y = "mean")

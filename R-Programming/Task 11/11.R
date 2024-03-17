#TASK 11 : 
#(a)Use the R -Studio environment to code OLS models 
#(b) Review the methodology to validate the model and predict the 
#dependent variable for a set of given independent variables 
#(c) Use R graphics functions to visualize the results generated with the model 
# Simple Linear Regression
path='Salary_Data.csv'
dataset = read.csv(path)
dataset
dim(dataset)
dataset$Salary
dataset$YearsExperience
# Splitting the dataset into the
# Training set and Test set
install.packages('caTools')
library(caTools)
split = sample.split(dataset$Salary, SplitRatio = 0.7)
trainingset = subset(dataset, split == TRUE)
testset = subset(dataset, split == FALSE)

# Fitting Simple Linear Regression to the Training set
lm.r= lm(formula = Salary ~ YearsExperience,
         data = trainingset)
summary(lm.r)
coef(lm.r)
#SSE,SSR
sse=sum((fitted(lm.r)-trainingset$Salary)^2)
sse
ssr=sum((fitted(lm.r)-mean(trainingset$Salary))^2)
ssr
sst <- ssr + sse
sst
# Predicting the Test set results
ypred = predict(lm.r, newdata = testset)
ypred
summary(ypred)
install.packages("ggplot2")
library(ggplot2)
# Visualising the Training set results
ggplot() + geom_point(aes(x = trainingset$YearsExperience,
                          y = trainingset$Salary), colour = 'red') +
  geom_line(aes(x = trainingset$YearsExperience,
                y = predict(lm.r, newdata = trainingset)), colour = 'blue') +
  
  ggtitle('Salary vs Experience (Training set)') +
  xlab('Years of experience') +
  ylab('Salary')
ggplot() +geom_point(aes(x = testset$YearsExperience, y = testset$Salary),
             colour = 'red') +
  geom_line(aes(x = trainingset$YearsExperience,
                y = predict(lm.r, newdata = trainingset)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Test set)') +
  xlab('Years of experience') +
  ylab('Salary')

dataset = read.csv("stock.csv")
View(dataset)
open = dataset[,2:5]
View(open)
str(open)
library(caTools)
set.seed(123)
split=sample.split(open$Close,SplitRatio = 0.8)
training_set = subset(open,split==TRUE)
testing_set = subset(open,split==FALSE)
View(training_set)
View(testing_set)

regressor = lm(formula = Close~.,data = training_set)

y_pred = predict(regressor,newdata = testing_set)
a = testing_set$Close
b = y_pred

plot(a,type = 'p',col='blue')
lines(b,type='o',col='red')

table = data.frame(testing_set$Close,y_pred)
View(table)

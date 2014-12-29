setwd("G:\\KuaiPan\\Project\\BigDataContest\\PredictScore\\WorkSpace\\data\\train")
dir()
train <- read.table("ReScore.txt", header=TRUE, sep=",")
install.packages("ggplot2")
library(ggplot2)
qplot(ses1,ses2, data=train, main="relationship between sesmeter1 and sesmeter2", 
      xlab="rank of sesmeter 1", ylab="rank of sesmeter 2")
qplot(ses1,ses3, data=train, main="relationship between sesmeter1 and sesmeter3", 
      xlab="rank of sesmeter 1", ylab="rank of sesmeter 3")
qplot(ses2,ses3, data=train, main="relationship between sesmeter2 and sesmeter3", 
      xlab="rank of sesmeter 2", ylab="rank of sesmeter 3")
pred1 = lm(ses3 ~ ses1 + ses2, data=train)
summary(pred1)
qplot(x=seq(length(pred1$residuals)), y= pred1$residuals, 
      main="distribution of residuals", xlab="train data", ylab="residuals")
qplot(pred1$residuals, main="distribution of residuals", xlab="train data", ylab="residuals")
mean(pred1$residuals)
sd(pred1$residuals)
sum(pred1$residuals^2)

setwd("G:\\KuaiPan\\Project\\BigDataContest\\PredictScore\\WorkSpace\\data\\test")
qplot(ses1,ses2, data=test, main="relationship between sesmeter1 and sesmeter2", 
      xlab="rank of sesmeter 1", ylab="rank of sesmeter 2")
test <- read.table("ReScore.txt", header=TRUE, sep=",")
result = predict(pred1, newdata=test)
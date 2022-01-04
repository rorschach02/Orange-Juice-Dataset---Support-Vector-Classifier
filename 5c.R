### Clear the environment 
rm(list = ls())


### First we will set the directory of the R script 
setwd("C:/Users/anike/Desktop/Sem 1/EAS 506 Statistical Data Mining/Homework/Homework 5")


## Loading all the libraries 
library(ISLR)
library(corrplot)
library(MASS)
library(klaR)
library(leaps)
library(lattice)
library(ggplot2)
library(corrplot)
library(car)
library(caret)
library(class)
#install.packages("e1071")
library(e1071)



# Dataset 
data('OJ')
data1 <- OJ
dim(data1)

str(data1)

# Dividing into test and train dataset 

set.seed(1)
sample_size <- 800
train_indexes <- sample(seq_len(nrow(data1)), size = sample_size)
training_data <- data1[train_indexes ,]
testing_data <- data1[-train_indexes ,]

dim(training_data)
dim(testing_data)


# Support Vector classifier to the training data using "cost" = 0.01

svm_oj_linear <- svm(Purchase ~ ., data = training_data, kernel = "linear", cost = 0.01)
svm_oj_linear_sum <- summary(svm_oj_linear)
svm_oj_linear_sum

# Support vector classifier creates 435 support vectors out of 800 training points. Out of these, 216 belong to level MM and remaining 219 belong to level CH.


# Fitting our Support Vector Classifier to find train and test error

# Train Error 
train_pred <- predict(svm_oj_linear, training_data)

table(training_data$Purchase, train_pred)

confusion_matrix <- confusionMatrix(table(training_data$Purchase, train_pred))

confusion_matrix 

# train error:

mean(training_data$Purchase != train_pred) * 100

#Test error 
test_pred <- predict(svm_oj_linear, newdata = testing_data)
table(testing_data$Purchase, test_pred)

confusion_matrix1 <- confusionMatrix(table(testing_data$Purchase, test_pred))

confusion_matrix1

#test error:
mean(testing_data$Purchase != test_pred) * 100

# Using the tune() function to select an optimal cost. Consider values in the range 0.01 to 10.
set.seed(2)
tune_pred <- tune(svm, Purchase ~ ., data = training_data, kernel = "linear", ranges = list(cost = 10^seq(-2, 1, by = 0.25)))
tune_pred_sum <- summary(tune_pred)
tune_pred_sum

#Best optimal Cost : 1.778279

best_optimal_cost <- tune_pred$best.parameters$cost



## Support Vector classifier to the training data using "cost" = 1.778279 (Best optimal cost)
svm_best_optimal_cost <- svm(Purchase ~ ., kernel = "linear", data = training_data, cost = best_optimal_cost)
svm_best_optimal_cost_sum <- summary(svm_best_optimal_cost)
svm_best_optimal_cost_sum

# Support vector classifier creates 329 support vectors out of 800 training points. Out of these, 165 belong to level MM and remaining 164 belong to level CH.

# Train error

train_pred1 <- predict(svm_best_optimal_cost, training_data)
table(training_data$Purchase, train_pred1)

confusion_matrix2 <- confusionMatrix(table(training_data$Purchase, train_pred1))

confusion_matrix2

#Error:
mean(training_data$Purchase != train_pred1) * 100


# Test Error 
test_pred1 <- predict(svm_best_optimal_cost, newdata = testing_data)
table(testing_data$Purchase, test_pred1)

confusion_matrix3 <- confusionMatrix(table(testing_data$Purchase, test_pred1))

confusion_matrix3

#Error : 
mean(testing_data$Purchase != test_pred1) * 100 





# support vector machine with a radial kernel. 
set.seed(3)
svm_oj_radial <- svm(Purchase ~ ., data = training_data, kernel = "radial", gamma = if (is.vector(training_data)) 1 else 1 / ncol(training_data) , cost = 0.01)
svm_oj_radial_sum <- summary(svm_oj_radial)
svm_oj_radial_sum

# Support vector classifier creates 373 support vectors out of 800 training points. Out of these, 185 belong to level MM and remaining 188 belong to level CH.

# Fitting our Support Vector Classifier to find train and test error

#train error 
train_pred2 <- predict(svm_oj_radial, training_data)
table(training_data$Purchase , train_pred2)
# Error:
mean(training_data$Purchase != train_pred2) * 100
#Train Accuracy 
mean(training_data$Purchase == train_pred2) * 100


#Test Error 
test_pred2 <- predict(svm_oj_radial,newdata = testing_data)
table(testing_data$Purchase , test_pred2)
#Error: 
mean(testing_data$Purchase != test_pred2) * 100
#Accuracy 
mean(testing_data$Purchase == test_pred2) * 100 


# Now i tune the data to find the best optimal cost for radial kernel. 
set.seed(4)
tune_pred1 <- tune(svm, Purchase ~ ., data = training_data, kernel = "radial", ranges = list(cost = 10^seq(-2, 1, by = 0.25)) )
tune_pred1_sum <- summary(tune_pred1)
tune_pred1_sum

#Best Optimal Cost : 0.5623413
best_optimal_cost1 <- tune_pred1$best.parameters$cost

#Support Vector classifier to the training data using "cost" = 0.5623413 (Best optimal cost)
svm_best_optimal_cost1 <- svm(Purchase ~ ., kernel = "radial", data = training_data, cost = best_optimal_cost1)
svm_best_optimal_cost_sum1 <- summary(svm_best_optimal_cost1)
svm_best_optimal_cost_sum1

# Support vector classifier creates 397 support vectors out of 800 training points. Out of these, 197 belong to level MM and remaining 200 belong to level CH.

# Train error
train_pred3 <- predict(svm_best_optimal_cost1, training_data)
table(training_data$Purchase, train_pred3)
confusion_matrix4 <- confusionMatrix(table(training_data$Purchase, train_pred3))
confusion_matrix4

#Error:
mean(training_data$Purchase != train_pred3) * 100

# Test Error 
test_pred4 <- predict(svm_best_optimal_cost1, newdata = testing_data)
table(testing_data$Purchase, test_pred4)
confusion_matrix5 <- confusionMatrix(table(testing_data$Purchase, test_pred4))
confusion_matrix5
#Error : 
mean(testing_data$Purchase != test_pred4) * 100 

# support vector machine with a Polynomial kernel of degree 2.
set.seed(5)
svm_oj_polynomial <- svm(Purchase ~ ., data = training_data, kernel = "polynomial",degree = 2 , cost = 0.01 , scale=F)
svm_oj_polynomial_sum <- summary(svm_oj_polynomial)
svm_oj_polynomial_sum

# fitting the model to train and  test set and finding train and test error 

#train error 
train_pred4 <- predict(svm_oj_polynomial, training_data)
table(training_data$Purchase , train_pred4)
# Error:
mean(training_data$Purchase != train_pred4) * 100
#Train Accuracy 
mean(training_data$Purchase == train_pred4) * 100


#Test Error 
test_pred5 <- predict(svm_oj_polynomial,newdata = testing_data)
table(testing_data$Purchase , test_pred5)
#Error: 
mean(testing_data$Purchase != test_pred5) * 100
#Accuracy 
mean(testing_data$Purchase == test_pred5) * 100 


# Now i tune the data to find the best optimal cost for polynomial kernel with degree = 2.
set.seed(6)
tune_pred3 <- tune(svm, Purchase ~ ., data = training_data, kernel = "polynomial", degree = 2,  ranges = list(cost = 10^seq(-2, 1, by = 0.25)) )
tune_pred3_sum <- summary(tune_pred3)
tune_pred3_sum

# best optimal cost : 10
best_optimal_cost2 <- tune_pred3$best.parameters$cost
best_optimal_cost2

#Support Vector classifier to the training data using "cost" = 10 (Best optimal cost)
svm_best_optimal_cost2 <- svm(Purchase ~ ., kernel = "polynomial", degree = 2 ,  data = training_data, cost = best_optimal_cost2)
svm_best_optimal_cost_sum2 <- summary(svm_best_optimal_cost2)
svm_best_optimal_cost_sum2

# Train error
train_pred5 <- predict(svm_best_optimal_cost2, training_data)
table(training_data$Purchase, train_pred5)
#Error:
mean(training_data$Purchase != train_pred5) * 100
#Accuracy
mean(training_data$Purchase == train_pred5) * 100

# Test Error 
test_pred6 <- predict(svm_best_optimal_cost2, newdata = testing_data)
table(testing_data$Purchase, test_pred6)
#Error : 
mean(testing_data$Purchase != test_pred6) * 100 
#Accuracy 
mean(testing_data$Purchase == test_pred6) * 100 




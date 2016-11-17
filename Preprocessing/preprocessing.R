# Preprocessing

# Loading the dataset
dataset <- read.csv("Data.csv")

dataset$Age <- ifelse(is.na(dataset$Age),
                  ave(dataset$Age, FUN = function(x) mean(dataset$Age, na.rm = T)),
                  dataset$Age)

dataset$Salary <- ifelse(is.na(dataset$Salary),
                      ave(dataset$Salary, FUN = function(x) mean(dataset$Salary, na.rm = T)),
                      dataset$Salary)

# Split into training and test set
library(caTools)
set.seed(123)
split <- sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set <- dataset[split,]
test_set <- dataset[!split,]

# Feature scaling
training_set[,2:3] <- scale(training_set[,2:3])
test_set[,2:3] <- scale(test_set[,2:3])
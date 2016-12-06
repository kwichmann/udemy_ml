# Loading the dataset
dataset <- read.csv("50_Startups.csv")

# Split into training and test set
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- dataset[split,]
test_set <- dataset[!split,]

# Fit model
regressor <- lm(Profit ~ ., data = training_set)

# Predict test set results
y_pred <- predict(regressor, test_set)
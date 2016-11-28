# Loading the dataset
dataset <- read.csv("Salary_Data.csv")


# Split into training and test set
library(caTools)
set.seed(123)
split <- sample.split(dataset$Salary, SplitRatio = 2/3)
training_set <- dataset[split,]
test_set <- dataset[!split,]

# Fit model
regressor <- lm(Salary ~ YearsExperience, data = training_set)

# Predict test set results
y_pred <- predict(regressor, test_set)

# Visualize the training set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = YearsExperience, y = Salary), 
             col = "red", data = training_set) +
  geom_line(aes(x = training_set$YearsExperience,
                y = predict(regressor, training_set)), 
            col = "blue") +
  ggtitle("Salary vs. experience (Training set)") +
  xlab("Years of experience") +
  ylab("Salary in dollars")

# Visualize the test set results
ggplot() +
  geom_point(aes(x = YearsExperience, y = Salary), 
             col = "red", data = test_set) +
  geom_line(aes(x = training_set$YearsExperience,
                y = predict(regressor, training_set)), 
            col = "blue") +
  ggtitle("Salary vs. experience (Test set)") +
  xlab("Years of experience") +
  ylab("Salary in dollars")

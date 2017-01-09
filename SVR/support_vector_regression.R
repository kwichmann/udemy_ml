# SVR

# Importing the dataset
dataset <- read.csv('Position_Salaries.csv')
dataset <- dataset[2:3]

# Support Vector Regression
library(e1071)
regressor = svm(Salary ~ Level, data = dataset, type = "eps-regression")

# Visualising the polynomial model results (for higher resolution and smoother curve)
library(ggplot2)
x_grid <- seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('SVR model') +
  xlab('Level') +
  ylab('Salary')

# SVR prediction
y_pred <- predict(regressor, data.frame(Level = 6.5))

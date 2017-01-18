# Decision tree regression

# Importing the dataset
dataset <- read.csv('Position_Salaries.csv')
dataset <- dataset[2:3]

# Decision tree regression model
library(rpart)
regressor = rpart(Salary ~ Level, data = dataset)

# Visualising the decision tree regression results (for higher resolution and smoother curve)
library(ggplot2)
x_grid <- seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Decision tree regression model') +
  xlab('Level') +
  ylab('Salary')

# SVR prediction
y_pred <- predict(regressor, data.frame(Level = 6.5))
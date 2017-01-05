# Importing the dataset
dataset <- read.csv('Position_Salaries.csv')
dataset <- dataset[2:3]

# Linear regression
lin_reg <- lm(Salary ~ Level, data = dataset)

# Polynomial regression
dataset$Level2 <- dataset$Level^2
dataset$Level3 <- dataset$Level^3
poly_reg <- lm(Salary ~ ., data = dataset)

# Visualising the Regression Model results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Linear regression') +
  xlab('Level') +
  ylab('Salary')

# Visualising the polynomial model results (for higher resolution and smoother curve)
x_grid <- seq(min(dataset$Level), max(dataset$Level), 0.1)
x_poly <- data.frame(Level = x_grid, Level2 = x_grid^2, Level3 = x_grid^3)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(poly_reg, newdata = x_poly)),
            colour = 'blue') +
  ggtitle('Polynomial model') +
  xlab('Level') +
  ylab('Salary')

# Linear prediction
y_pred <- predict(lin_reg, data.frame(Level = 6.5))

# Polynomial prediction
y_pred_poly <- predict(poly_reg, data.frame(Level = 6.5, Level2 = 6.5^2, Level3 = 6.5^3))

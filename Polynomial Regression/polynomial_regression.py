# Polynomial regression

# Import libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Import dataset
dataset = pd.read_csv('Position_Salaries.csv')

X = dataset.iloc[:, 1:2].values
y = dataset.iloc[:, 2].values

# Linear regression model (for comparison)
from sklearn.linear_model import LinearRegression
lin_reg = LinearRegression()
lin_reg.fit(X, y)

# Polynomial regression model
from sklearn.preprocessing import PolynomialFeatures
poly_reg = PolynomialFeatures(degree = 4)
X_poly = poly_reg.fit_transform(X)

lin_reg_2 = LinearRegression()
lin_reg_2.fit(X_poly, y)

# Visualize linear regression
plt.scatter(X, y, color = "red")
plt.plot(X, lin_reg.predict(X), color = "blue")
plt.title("Linear model fit")
plt.xlabel("Position index")
plt.ylabel("Salary")
plt.show()

# Visualize polynomial regression
X_grid = np.arange(min(X), max(X), 0.1)
X_grid = X_grid.reshape((len(X_grid), 1))
plt.scatter(X, y, color = "red")
plt.plot(X, lin_reg_2.predict(X_poly), color = "blue")
plt.title("Polynomial model fit")
plt.xlabel("Position index")
plt.ylabel("Salary")
plt.show()

# Prediction with linear model
lin_reg.predict(6.5)

# Prediction with polynomial model
lin_reg_2.predict(poly_reg.fit_transform(6.5))

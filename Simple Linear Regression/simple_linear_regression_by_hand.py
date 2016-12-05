# Simple linear regression

# Import libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Import dataset
dataset = pd.read_csv('Salary_Data.csv')

X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 1].values

# Split into training and test sets
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 1/3, random_state = 0)

# Turn X_train into design matrix
A_train = np.column_stack((np.ones(X_train.size), X_train))

# Solve the normal equation using matrix algebra
beta_train = np.dot(np.dot(np.linalg.inv(np.dot(np.transpose(A_train), A_train)), np.transpose(A_train)), y_train)

# Prediction function
def beta_predict(x, beta):
    x = np.column_stack((np.ones(x.size), x))
    return np.dot(x, beta)

# Prediction from the test set
y_pred = beta_predict(X_test, beta_train)

# Plot the training set results
plt.scatter(X_train, y_train, color = "red")
plt.plot(X_train, beta_predict(X_train, beta_train), color = "blue")
plt.title("Salary vs. experience (Training set)")
plt.xlabel("Years of experience")
plt.ylabel("Salary in dollars")
plt.show()

# Plot the test set results
plt.scatter(X_test, y_test, color = "red")
plt.plot(X_train, beta_predict(X_train, beta_train), color = "blue")
plt.title("Salary vs. experience (Test set)")
plt.xlabel("Years of experience")
plt.ylabel("Salary in dollars")
plt.show()
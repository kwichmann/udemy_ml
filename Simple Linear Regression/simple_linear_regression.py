# Simple linear regression

# Import libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Import dataset
dataset = pd.read_csv('Salary_Data.csv')

X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 3].values

# Split into training and test sets
from sklearn.cross_validation import train_test_split
X_train, y_train, X_test, y_test = train_test_split(X, y, test_size = 0.2)
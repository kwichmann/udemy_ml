# Simple linear regression

# Import libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Import dataset
dataset = pd.read_csv('50_Startups.csv')

X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 4].values

# Encode dummy variables
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
labelencoder_X = LabelEncoder()
labelencoder_X.fit(X[:, 3])
X[:, 3] = labelencoder_X.transform(X[:, 3])

onehotencoder = OneHotEncoder(categorical_features = [3])
X = onehotencoder.fit_transform(X).toarray()

# Avoinding the dummy variable trap
X = X[:, 1:]

# Split into training and test sets
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)

# Turn X_train into design matrix
A_train = np.column_stack((np.ones(X_train.shape[0]), X_train))

# Solve the normal equation using matrix algebra
beta_train = np.dot(np.dot(np.linalg.inv(np.dot(np.transpose(A_train), A_train)), np.transpose(A_train)), y_train)

# Prediction function
def beta_predict(x, beta):
    x = np.column_stack((np.ones(x.shape[0]), x))
    return np.dot(x, beta)

# Prediction from the test set
y_pred = beta_predict(X_test, beta_train)

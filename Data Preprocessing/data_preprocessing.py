"""
This is a Data Preprocessing template

"""


# Importing Libraries

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd


# Importing Dataset

dataset=pd.read_csv('Data.csv')
X=dataset.iloc[:,:-1].values
Y=dataset.iloc[:,3].values


# Taking Care Of Missing Data

from sklearn.preprocessing import Imputer
imputer=Imputer(missing_values='NaN', strategy='mean', axis=0)
imputer=imputer.fit(X[:, 1:3])
X[:, 1:3]=imputer.transform(X[:, 1:3])


# Dummy Enconding

from sklearn.preprocessing import LabelEncoder , OneHotEncoder
le_X = LabelEncoder()
X[: , 0] = le_X.fit_transform(X[: , 0])
ohe = OneHotEncoder(categorical_features=[0])
X = ohe.fit_transform(X).toarray()

le_Y=LabelEncoder()
Y=le_Y.fit_transform(Y)


# Splitting The DataSet into Training Set and Test Set

from sklearn.cross_validation import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.2, random_state=0)


# Feature Scaling
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)

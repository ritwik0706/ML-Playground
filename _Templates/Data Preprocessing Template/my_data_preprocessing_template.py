# -*- coding: utf-8 -*-
"""
Created on Sun Aug 12 05:52:51 2018

Data Preprocessing Template
"""



# Importing Libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd


# Importing Dataset
dataset=pd.read_csv('Data.csv')
X=dataset.iloc[:,:-1].values
Y=dataset.iloc[:,3].values


# Splitting The DataSet into Training Set and Test Set
from sklearn.cross_validation import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.2, random_state=0)


# Feature Scaling
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)"""


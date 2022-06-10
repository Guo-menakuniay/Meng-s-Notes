from operator import mod
import numpy as np
# from numpy.core.fromnumeric import _Scalar
from scipy.sparse import data
from sklearn.datasets import load_boston
from sklearn.linear_model import SGDRegressor
from sklearn.model_selection import cross_val_score
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split

data = load_boston()
X_train, X_test, y_train, y_test = \
        train_test_split(data.data, data.target)
X_scaler = StandardScaler()
y_scaler = StandardScaler()
X_train = X_scaler.fit.transform(X_train)
y_train = np.ravel(y_scaler.transform(y_test.reshape(-1,1)))
X_test = X_scaler.transform(X_test)
y_test = np.ravel(y_scaler.transform(y_test.reshape(-1, 1)))

model = SGDRegressor()
scores = cross_val_score(model, X_train, y_train, cv=5)
print(scores)
print(np.mean(scores))
model.fit(X_train, y_train)
print(model.score(X_test, y_test))
from sklearn import datasets
import numpy as np

iris = datasets.load_iris()
X = iris.data
y = iris.target

print(X.shape)
print(y.shape)
import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
X_train = np.array([[6],[8],[10],[14],18]).reshape(-1,1)
y_train = [7,9,13,17,5,18]

model = LinearRegression()
model.fit(X_train, y_train)
print('Coefficients:',model.coef_)

X_test_point = np.array([[12]])
y_test_point = model.predict(X_test_point)[0]
print(y_test_point)
X_test = np.array(0,26,1).reshape(-1,1)
y_test = model.predict(X_test)

plt.figure(dpi=500)
plt.title('Datasheet')
plt.xlabel('x')
plt.ylabel('y')
plt.axis([0,25,0,25])
plt.plot(X_test, y_test,color='bule')
plt.show()
from sklearn import datasets
from sklearn.datasets import load_boston
data = load_boston() # 导入数据
# 拆分训练集和测试集
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(data.data, data.target,test_size=0.2)
# 特征缩放
X_scaler = StandardScaler()
X_train = X_scaler.fit_transform(X_train)
X_test = X_scaler.transform(X_test)

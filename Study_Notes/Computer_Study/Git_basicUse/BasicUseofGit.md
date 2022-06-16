# Basic use of Git

## GIT冲突管理

最好在git push之前使用git pull更新远端代码以防止覆盖更新的版本

在git pull检测到同一文件冲突之后，会将冲突内容如下所示打印在源文件上

```shell
<<<<<<<<<<HEAD

version1
==============
version2


>>>>>>>>>>
```

更改====两端的冲突代码，重新add和commit之后即可提交

## 删除本地的Git仓库

在对应目录下直接删除.git文件即可

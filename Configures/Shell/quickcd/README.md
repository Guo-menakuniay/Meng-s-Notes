# 通过quick.sh脚本实现简化cd路径跳转的功能[*](https://segmentfault.com/a/1190000025190817)

## 基本文件包含
1. parsecfg.sh
2. quickcd.sh
3. .liconfig/dirinfo.txt

## 基本实现

- 使用paesecfg.sh读取配置文件.liconfig/dirinfo.txt中对应的字符简写
- 使用quickcd.sh文件使用上述的字符进行cd操作

> 在MacOS中会出现quickcd.sh中命令-v的报错情况，但是不影响使用
>
> 若使用zsh shell，可以在两个sh文件中修改第一行为/bin/zsh
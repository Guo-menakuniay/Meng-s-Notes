# Shell 语法简介

## 基本介绍

### Linux Shell

- ash 与bash shell完全兼容
- kom 支持如关联数组和浮点运算等一些高级的编程特性
- tcsh 将C语言中的一些元素引入shell脚本中的shell
- zsh 结合了上述特性的高级shell

### Shell变量

在命令行直接执行env、set分别查看用户环境变量和Shell预先定义的变量

## 基本的Shell命令

## 基本的bash命令

### 基本帮助文稿

Man后跟名称用来**查询参考手册**

不记得命令名称时可通过关键字搜索手册页 man -k [keyword]

手册页也不是唯一的参考材料 info页面也可以了解相关的内容

大多是命令也可接受-help或者--help选项，用于获取帮助的更多信息

### vi命令详解

#### vi的基本概念

有三种状态

- Command Mode
- Insert Mode 
- Last Line Mode

> ESC进入Command Mode
>
> 在Command Mode下键入i进入Inset Mode
>
> 在Command Mode下键入：进入Last Line Mode

#### Command Mode下的基本操作

- $ 移动到行尾
- ^ 移动到行首
- x 删除一个字符
- X删除前面一个字符
- dd 删除光标所在行

- yy 复制光标所在行至缓冲区
- p 粘贴缓冲区的字符

#### Insert Mode下的基本操作

- set nu 列出行号
- /****  查找关键字****
- w保存文件 可以后跟文件名
- q退出 与w一起使用为保存后退出

> ​	其他的请参照[Linux——vi命令详解_在路上-CSDN博客_vi命令](https://blog.csdn.net/cyl101816/article/details/82026678)

### Linux文件与目录

#### Linux常见目录名称

![image-20211006202229290](/Users/menakuniay/Library/Application Support/typora-user-images/image-20211006202229290.png)

#### 遍历目录

切换目录命令`cd`将shell会话切换到另一个目录
当前目录工具`pwd`，显示当前路径

> - 绝对文件路径
>
>   ​	 绝对文件路径定义了在虚拟目录结构中该目录的确切位置,以虚拟目录的根目录开始,相当于目录的全名
>
>   ​		可用`cd`直接前往绝对路径地方
>
> - 相对文件路径
>
>   ​		`cd`直接前往相对路径的地方
>
>   可以在任何包含子目录的目录中使用带有相对文件路径的`cd`命令，可用两个特殊字符表示
>
>   单点符（.）表示当前目录
>
>   双点符表示当前目录的父目录

#### 文件和目录列表

`ls`命令可显示系统中有哪些文件

- `ls -F`可区分文件和目录

- `ls -a`可显示隐藏文件

- `ls -R`可显示当前目录下包含子目录中的文件

  > 选项并一定要像例子中那样分开输入:`ls –F –R`。它们可以进行如下合并:`ls –FR`

- `ls -l`输出每个文件的附加信息

  > - 文件类型
  > - 文件权限
  > - ........

- `ls -d`只列出目录本身的信息，不列出其中的内容

- `ls -i`列出文件的inode

#### 处理文件

- 创建文件

  - `touch`命令可创建空文件

- 复制文件

  - `cp source destination`指定原对象和目标对象，`destination`是新文件的文件名

    > 最好加上`-i`选项，强制shell询问是否需要覆盖已有文件

  - `cp source newpath`也可将文件复制到其他路径（绝对路径和相对路径均可）

  - `cp -R`可以在一条命令中复制整个目录的内容

- 重命名文件

  - `mv source newfileName`可以用于移动文件位置，改变的只有文件的名称或路径

- 删除文件

  - `rm -i source`习惯加入`-i`以确认要删除该文件

#### 处理目录

- 创建目录
  - `mkdir`以创建目录
  - `mkdir -p`以同时创建多个目录和子目录

- 删除目录

  - `rmdir`默认只删除空目录

    > 可用`rm -ir`向下进入目录先删除目录中的所有文件

#### 查看文件内容

- 查看文件类型

  - `file`直接查看文件类型

- 查看整个文件

  - `cat`命令显示文本文件所有数据

    > `cat -n`可以显示行号
    >
    > `cat -b`可以在有文本的行显示行号

  - `more`显示文本文件的内容，但会在每页数据之后停下来

  - `less`前者的升级版，能够识别上下键翻页

- 查看部分文件

  - `tail`显示文件最后几行的内容

    > `tail -n number`可以指定查看想要显示的行数
    >
    > `tail -f`可以使tail保持活跃状态，显示文件实时修改的内容

  - `head`显示文件开始几行的内容

### 更多的bash Shell命令

- 显示进程
  - `top`命令显示所有进程的概要信息

> ![image-20211008160019519](/Users/menakuniay/Library/Application Support/typora-user-images/image-20211008160019519.png)

- 结束进程
  - `kill`
- [更多命令](marginnote3app://note/842C6C1E-182E-4BC9-9A29-232C00284AB7)

### 查看文件空间和大小

- 一般使用命令`du -sh`来查看当前文件的文件大小
- 使用`du -h --max-depth=1`可以指定当前文件夹的文件深度
- `du -sh |sort -rh |head`可以按文件夹大小排序

### 批量更改文件文本

#### **Sed命令**[[*]](https://www.runoob.com/linux/linux-comm-sed.html)

sed命令可以批量替换多个文件中的字符串

```shell
sed [-hnV][-e<script>][-f<script文件>][文本文件]
```

> - 其中-hnV分别代表帮助文档、 仅显示script处理后的结果(?)、显示版本信息
> - -e<script>或--expression=<script> 以选项中指定的script来处理输入的文本文件
> - -f<script文件>或--file=<script文件> 以选项中指定的script文件来处理输入的文本文件
> - 相关编辑的动作说明
>   - a ：新增， a 的后面可以接字串，而这些字串会在新的一行出现(目前的下一行)～
>   - c ：取代， c 的后面可以接字串，这些字串可以取代 n1,n2 之间的行！
>   - d ：删除，因为是删除啊，所以 d 后面通常不接任何东东；
>   - i ：插入， i 的后面可以接字串，而这些字串会在新的一行出现(目前的上一行)；
>   - p ：打印，亦即将某个选择的数据印出。通常 p 会与参数 sed -n 一起运行～
>   - s ：取代，可以直接进行取代的工作哩！通常这个 s 的动作可以搭配正规表示法！例如 1,20s/old/new/g 就是啦！

*实例*

```shell
sed -e 4a\newLine testfile   #在testfile文件的第四行后添加一行，并将结果输出到标准输出
```



### 处理数据文件

- 排序数据
  - `sort` 添加`-n`命令对数字的数值进行排序
  
- 搜索数据

  - `grep [options] pattern [file]`<u>（可使用正则表达式查找）</u>
    - `grep -v`反向搜索（输出不匹配该模式的行）
    - `grep -n`显示所在行的行号
    - `grep -c`显示匹配的行的数目
    
  
- 文件压缩

  - `gzip`用以压缩文件
  - `gunzip`用以解压文件

- 归档数据

  - `tar function [options] object1 object2`

    > `tar`命令常用组合
    >
    > 创建归档文件：tar -cvf test.tar test/ tset2/
    >
    > 列出但不提取：`tar -tf test.tar`
    >
    > 提取文件并装载在一个目录中：`tar -xvf tset.tar`


# Linux文件权限与目录配置

## Linux文件权限

### Linux文件属性

![image-20211210230111634](/Users/menakuniay/Library/Application Support/typora-user-images/image-20211210230111634.png)

### 改变文件的属性和权限

- chagrp 改变文件所属的群组

- chown 改变文件拥有者

  > ![image-20211210230635767](/Users/menakuniay/Library/Application Support/typora-user-images/image-20211210230635767.png)

- 改变权限

  > 使用数字来代表各个权限,各权限的分数对照表如下
  >
  > r:4  w:2   x:1  
  >
  > ![image-20211210230913042](/Users/menakuniay/Library/Application Support/typora-user-images/image-20211210230913042.png)

  ## Linux系统目录结构

  > - /bin 存放最常用的命令
  > - /boot 存放启动Linux时使用的一些核心文件
  > - /dev 存放外部设备
  > - /home 一般以用户名命名
  > - /root 系统管理员的目录
  > - /usr 存放应用程序和文件的主目录
  > - /usr/bin 存放的是应用程序

  

# Section Numbering Rules

## 修改Section的编号方式

> 可以避免使用\section*之后出现0开头的subsection编号的情况

```Latex
\renewcommand\thesubsection{\Alph{subsection}}
```


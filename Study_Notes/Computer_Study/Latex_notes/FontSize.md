# 调整字体大小

- 在documentclass阶段可以调整全局大小，支持10pt\11pt\12pt(?)作为\normalsize大小

  > 设置字体大小的命令从小到大依次为[[1]](https://blog.csdn.net/Anne033/article/details/123676863)
  >
  > ```Latex
  > \tiny
  > \scriptsize
  > \footnotesize
  > \small
  > \normalsize
  > \large
  > \Large
  > \LARGE
  > \huge
  > \Huge
  > ```
- 对不同的部分(\section、\subsection等设置命令)

  > 包括居中在内的一系列命令都可以在里面设置
  >
  > ```Latex
  > \titleformat*{\section}{\Large\bfseries\centering}
  > ```
  >
  > 


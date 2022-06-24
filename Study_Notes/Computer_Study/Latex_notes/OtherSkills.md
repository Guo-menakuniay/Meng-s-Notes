# OtherSkills about LaTex

- Add background figure in text[[*]](https://zhuanlan.zhihu.com/p/388661523)

  ```Latex
  \usepackage{wallpaper} %使用wallpaper宏包
  
  %然后在需要添加图片的地方添加
  
  \CenterWallPaper{0.5}{back.png} %居中的背景图片，出现在文档的每一页上
  
  %\ThisCenterWallPaper     %只在当前页插入背景图片、
  %\LRCornerWallPaper       %在没一页的有下角插入背景图片、
  %\URCornerWallPaper       %在每一页的右上角插入背景图片等。
  ```
- 分段编译的使用

  ```latex
  \input{file} %直接相当于文本替换，注意：替换之后的\ref引用全文总体保持一致
  \include{file} %导入tex文件作为内容
  \includeonly{file} %在导言区使用，只有指定的文件才会被include，适合进行分段调试编译
  ```
- 加入水平线以分割

```latex
{\noindent} \centering\rule[-10pt]{0.9\linewidth}{0.15em}
%第一个参数控制距离上一段的距离
%第二个参数控制线长
%第三个参数控制线宽
```

- 在Vscode中添加Snippet

  - 在`shift+command+P`菜单中直接搜素snip即可打开

  - 给出实例和常见的snippet代码

    ```json
    {
    	// Place your snippets for latex here. Each snippet is defined under a snippet name and has a prefix, body and 
    	// description. The prefix is what is used to trigger the snippet and the body will be expanded and inserted. Possible variables are:
    	// $1, $2 for tab stops, $0 for the final cursor position, and ${1:label}, ${2:another} for placeholders. Placeholders with the 
    	// same ids are connected.
    	// Example:
    	// "Print to console": {
    	// 	"prefix": "log",
    	// 	"body": [
    	// 		"console.log('$1');",
    	// 		"$2"
    	// 	],
    	// 	"description": "Log output to console"
    	// }
    
    	//数学公式部分
    	"FracPartial": {
    		"prefix": "ppar",
    		"body": [
    			"\\frac{\\partial $1}{\\partial $2}"
    		],
    		"description": "Log output to console"
    	},
    	"Sum": {
    		"prefix": "sum",
    		"body": "\\sum_{$1 = $2}^{$3} $4",
    		"description": "Sum notation"
    	},
    	"Integration": {
    		"prefix": "int",
    		"body": "\\int_{$1}^{$2} ($3) \\mathrm{d} $4",
    		"description": "Integration notation"
    	},
    	"Differential": {
    		"prefix": "diff",
    		"body": "\\frac{\\mathrm{d} $1}{\\mathrm{d} $2}",
    		"description": "Differential notation"
    	},
    	//图片及表格插入部分
    	"Insert Normal Figure": {
    		"prefix": "insertfigure",
    		"body": [
    			"\\begin{figure}[H]",
    				"\\centering",
    				"\\includegraphics[width=$1\\linewidth]{$4}",
    				"\\caption{$2}",
    				"\\label{fig.$3}",
    				"\\end{figure}"
    		],
    		"description": "insertfigure"		
    	}
    }
    ```
- 在VSC中开启黑暗预览模式

  > 修改设置latex-workshop.view.pdf.invert的值为1生效

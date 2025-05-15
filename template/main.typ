#import "@preview/typst-template:0.1.0": *

#show: project.with(
  title: "测试标题",
  subtitle: "项目子标题",
  third_title: "第三级标题",
  author: ("作者1", "作者2"),
  date: (2024, 5, 15), // 默认自动获取 datetime.today()
  cover_style: report_types.standard, // report, report1-5... false 或 "" 表示无封面
  header_style: "simple", // "simple" 使用默认页眉，"full" 全页面页眉，"detailed" 详细页眉
  footer_style: "simple", // "simple" 使用默认页脚，"full" 全页面页脚
  show_toc: true, // 是否显示目录
  show_name: true, // 是否显示作者名
  lang: "zh", // 支持 "en" 或 "zh"，会影响日期格式和图表标题

  // 以下是实验报告封面特有的参数
  student_id: "xxxxxxxxx", // 学号
  class_name: "xxxxxxx", // 班级
  major: "计算机科学与技术", // 专业
  department: "计算机学院", // 学院
  email: "example@nuaa.edu.cn", // 邮箱
  mentor: "指导教师", // 导师
)

= 写作指南

== 基本格式

这是一个段落示例。Typst 支持*粗体*和_斜体_文本格式。中文没有真正的斜体，通常用楷体代替。您也可以使用 #emoji.rocket 表情符号和 $E = m c^2$ 行内公式。

=== 列表示例 <list-example>

无序列表：
- 第一项
- 第二项
  - 嵌套项
  - 另一个嵌套项
- 第三项

有序列表：
+ 第一步
+ 第二步
  + 子步骤 A
  + 子步骤 B
+ 第三步

== 公式和图表

=== 数学公式

行内公式示例：当 $a != 0$ 时，一元二次方程 $ax^2 + bx + c = 0$ 有解。

行间公式示例：
$
  x = (-b plus.minus sqrt(b^2 - 4a c)) / (2a)
$ <quadratic>

您可以通过 @quadratic 引用上面的公式。

=== 图表示例

#figure(
  image("assets/NUAA.svg", width: 70%),
  caption: "示例图表",
) <fig-example>

通过 @fig-example 可以引用上面的图表。

== 代码块

```python
def hello_world():
    print("Hello, World!")

# 这是一个注释
for i in range(5):
    hello_world()
```

== 表格

#figure(
  table(
    columns: 3,
    [*姓名*], [*年龄*], [*职业*],
    [张三], [25], [工程师],
    [李四], [30], [设计师],
    [王五], [28], [教师],
  ),
  caption: "示例表格",
)

= 高级功能

== 引用文献

这里可以引用参考文献 @wang2010guide 和 @kopka2004guide。

#bibliography("assets/exbib.bib")

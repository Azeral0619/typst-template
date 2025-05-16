#import "fonts.typ": 字体, 字号
#import "utils.typ": date_format

/// 报告类型常量定义
#let cover_types = (
  standard: "1", // 标准报告格式
  academic: "2", // 学术报告格式
  tutorial: "3", // 教程报告格式
  project: "4", // 项目报告格式
  thesis: "5", // 论文格式
  normal: "6", // 普通封面
)

#let render_info_label(content) = {
  rect(
    width: 100%,
    inset: 2pt,
    stroke: none,
    text(
      font: 字体.宋体,
      size: 字号.三号,
      content,
    ),
  )
}

#let render_info_value(content) = {
  rect(
    width: 125%,
    inset: 3pt,
    stroke: (
      bottom: 1pt + black,
    ),
    text(
      font: 字体.宋体,
      size: 字号.三号,
      bottom-edge: "descender",
    )[#content],
  )
}

/// 普通封面模板
///
/// 参数：
/// - title: 标题
/// - subtitle: 副标题
/// - author: 作者
/// - date: 日期，格式为 (year, month, day)
/// - lang: 语言，en 或 zh
/// - show_name: 是否显示作者名
/// - args: 其他参数
#let cover_normal(
  title: "标题",
  subtitle: "",
  author: "作者",
  date: (2023, 5, 14),
  lang: "zh",
  show_name: true,
  ..args,
) = {
  let displayed_author = if show_name { author } else { none }
  align(center)[
    #v(4em)
    #image("assets/NUAA.svg", width: 70%)
    #set par(leading: 1.5em)
    #text(title, font: 字体.宋体, size: 字号.一号, weight: "bold")
    #v(4em)
    #if subtitle != "" {
      text(subtitle, font: 字体.宋体, size: 字号.小一, weight: "bold")
      v(4em)
    }
    #v(4em)
    #text(displayed_author, font: 字体.宋体, size: 字号.三号)
    #v(1em)
    #date_format(date: date, lang: lang)
  ]
  pagebreak()
}

/// 实验报告封面模板
///
/// 参数：
/// - title: 标题
/// - subtitle: 实验题目
/// - author: 作者
/// - class_name: 班级
/// - grade: 年级
/// - department: 学院
/// - date: 日期，格式为 (year, month, day)
/// - student_id: 学号
/// - lang: 语言，en 或 zh
/// - email: 邮箱
/// - major: 专业
/// - mentor: 导师
/// - report_type: 报告类型，可用值：cover_types.standard, cover_types.academic,
///   cover_types.tutorial, cover_types.project, cover_types.thesis
/// - args: 其他参数
#let cover_report(
  title: "title",
  subtitle: "subtitle",
  author: "author",
  class_name: "class_name",
  grade: "grade",
  department: "department",
  date: (2023, 5, 14),
  student_id: "student_id",
  lang: "zh",
  email: "email@default.com",
  major: "major",
  mentor: "mentor",
  report_type: cover_types.standard,
  ..args,
) = {
  let formatted_date = date_format(date: date, lang: lang, size: 字号.三号)
  align(center + horizon)[
    #image("assets/NUAA.svg", width: 60%)
    #text(title, font: 字体.宋体, size: 字号.小一, weight: "bold")
    #v(0.5em) #if (report_type == cover_types.project or report_type == cover_types.thesis) {
      text(subtitle, font: 字体.宋体, size: 字号.二号, weight: "bold")
    }

    #if (lang == "en") {
      let title_item = (render_info_label("Project Name"), render_info_value(subtitle))
      let author_item = (render_info_label("Student Name"), render_info_value(author))
      let id_item = (render_info_label("Student ID"), render_info_value(student_id))
      let class_item = (render_info_label("Class"), render_info_value(class_name))
      let major_item = (render_info_label("Major"), render_info_value(major))
      let department_item = (render_info_label("Department"), render_info_value(department))
      let date_item = (render_info_label("Date"), render_info_value(formatted_date))
      let email_item = (render_info_label("Email"), render_info_value(email))
      let mentor_item = (render_info_label("Mentor"), render_info_value(mentor))
      // 根据报告类型显示不同的信息项
      let info_items = if report_type == cover_types.standard {
        (title_item + author_item + id_item + class_item + department_item + date_item)
      } else if report_type == cover_types.academic {
        (title_item + author_item + department_item + major_item + email_item + date_item)
      } else if report_type == cover_types.tutorial {
        (title_item + author_item + id_item + email_item + mentor_item + date_item)
      } else if report_type == cover_types.project {
        (author_item + id_item + class_item + department_item + date_item)
      } else if report_type == cover_types.thesis {
        (author_item + department_item + major_item + email_item + date_item)
      }
      grid(
        columns: (160pt, 180pt),
        rows: (40pt, 40pt),
        gutter: 3pt,
        ..info_items
      )
    } else {
      let title_item = (render_info_label("实验题目"), render_info_value(subtitle))
      let author_item = (render_info_label("学生姓名"), render_info_value(author))
      let id_item = (render_info_label("学   号"), render_info_value(student_id))
      let class_item = (render_info_label("班   级"), render_info_value(class_name))
      let major_item = (render_info_label("专   业"), render_info_value(major))
      let department_item = (render_info_label("所在学院"), render_info_value(department))
      let date_item = (render_info_label("提交日期"), render_info_value(formatted_date))
      let email_item = (render_info_label("邮   箱"), render_info_value(email))
      let mentor_item = (render_info_label("指导教师"), render_info_value(mentor))
      // 根据报告类型显示不同的信息项
      let info_items = if report_type == cover_types.standard {
        (title_item + author_item + id_item + class_item + department_item + date_item)
      } else if report_type == cover_types.academic {
        (title_item + author_item + department_item + major_item + email_item + date_item)
      } else if report_type == cover_types.tutorial {
        (title_item + author_item + id_item + email_item + mentor_item + date_item)
      } else if report_type == cover_types.project {
        (author_item + id_item + class_item + department_item + date_item)
      } else if report_type == cover_types.thesis {
        (author_item + department_item + major_item + email_item + date_item)
      }
      grid(
        columns: (120pt, 180pt),
        rows: (40pt, 40pt),
        gutter: 3pt,
        ..info_items
      )
    }
  ]
  pagebreak()
}

/// 匿名实验报告封面模板
///
/// 参数：
/// - title: 标题
/// - subtitle: 副标题
/// - third_title: 第三级标题
/// - date: 日期，格式为 (year, month, day)
/// - lang: 语言，en 或 zh
/// - args: 其他参数
#let cover_anonymous_report(
  title: "",
  subtitle: "",
  third_title: "",
  date: (2023, 5, 14),
  lang: "zh",
  ..args,
) = {
  align(center + horizon)[
    #image("assets/NUAA.svg", width: 70%)
    #v(3em)
    #text(title, font: 字体.宋体, size: 字号.小一, weight: "bold")
    #v(1em)
    #text(subtitle, font: 字体.宋体, size: 字号.小二 + 2pt)
    #v(0.5em)
    #text(third_title, font: 字体.宋体, size: 字号.小二)
    #v(0.1em)
    #date_format(date: date, lang: lang)
  ]
  pagebreak()
}

/// 根据信息显示合适的封面
///
/// 参数：
/// - infos: 包含所有封面信息的字典
#let show_cover(infos: (:)) = {
  // 无封面样式则不显示封面
  if (infos.cover_style == false or infos.cover_style == "" or infos.cover_style == none) {
    return
  }

  if infos.cover_style != cover_types.normal {
    if infos.at("show_name", default: true) {
      cover_report(report_type: infos.cover_style, ..infos) // 实验报告
    } else {
      cover_anonymous_report(..infos) // 匿名实验报告
    }
  } else {
    cover_normal(..infos) // 普通封面
  }
}

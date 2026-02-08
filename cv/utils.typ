#let primary-color = rgb("#003366")
#let text-primary = rgb("#272727")
#let text-secondary = rgb("#ffffff")

#let setup(body) = {
  set page(
    paper: "a4",
    margin: 0pt,
  )
  set text(
    font: "Arial",
    size: 11pt,
    fill: text-primary,
    lang: "cs",
  )
  body
}

#let layout(sidebar_content, main_content) = {
  grid(
    columns: (1fr, 2fr),
    rows: 100%,
    rect(
      fill: primary-color,
      width: 100%,
      height: 100%,
      inset: (x: 1cm, y: 1cm),
      text(fill: text-secondary, sidebar_content),
    ),
    rect(
      fill: white,
      width: 100%,
      height: 100%,
      inset: (x: 1cm, top: 1cm + 45pt, bottom: 1cm),
      text(fill: text-secondary, main_content),
    ),
  )
}

#let name-header(name) = {
  let firstname = name.split(" ").first()
  let lastname = name.split(" ").last()

  text(size: 30pt, weight: "bold", fill: text-primary)[
    #upper()[
      #underline(firstname, stroke: 3pt + primary-color)
    ]
  ]
  text(size: 30pt, weight: "bold", fill: primary-color)[
    #upper(lastname)
  ]
  v(5.75em)
}

#let section(title, light: false, body) = {
  let current-color = if light { text-secondary } else { text-primary }

  text(size: 14pt, weight: "bold", fill: current-color)[#upper(title)]
  v(-0.8em)
  line(length: 100%, stroke: 0.5pt + current-color)
  v(0.1em)
  text(fill: current-color)[#body]
  v(2em)
}

#let entry(content, date) = {
  grid(
    columns: (1fr, auto),
    gutter: 10pt,
    content, align(right)[#text(date)],
  )
  v(0.5em)
}

#let filter-display(items) = {
  items.filter(it => it.at("display", default: true))
}

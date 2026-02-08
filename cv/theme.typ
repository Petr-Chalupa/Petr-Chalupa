#let primary-color = rgb("#003366") // Tmavě modrá pro nadpisy
#let text-gray = rgb("#444444")

#let setup(body) = {
  set page(
    paper: "a4",
    margin: (x: 1.5cm, y: 1.5cm),
  )
  set text(
    font: "Arial", // Písmo z původního CV
    size: 10pt,
    fill: text-gray,
  )
  body
}

// Styl pro hlavní jméno
#let name-header(name) = {
  text(size: 24pt, weight: "bold", fill: primary-color)[#upper(name)]
}

// Styl pro sekce s čarou
#let cv-section(title) = {
  v(1em)
  text(size: 11pt, weight: "bold", fill: primary-color)[#upper(title)]
  v(-0.8em)
  line(length: 100%, stroke: 0.5pt + primary-color)
  v(0.5em)
}

// Pomocná funkce pro mřížku (Grid) zkušeností a vzdělání
#let entry(date, content) = {
  grid(
    columns: (100pt, 1fr),
    gutter: 10pt,
    text(date), content,
  )
  v(0.5em)
}

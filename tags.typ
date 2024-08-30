#let colortag(title: "title", color: none) = {

  return box(
    stroke: 1pt + color,
    radius: 2pt,
    width: auto
  )[
    #block(
      fill: color, 
      inset: 3pt,
    )[
      #text(fill: white, weight: "bold")[#title]
    ]
  ]
}

#let week(title) = {
  return colortag(title: "Week " + title, color: rgb(123, 31, 162))
}

#let barron(title) = {
  return colortag(title: "Barron " + title, color: rgb(0, 121, 107))
}
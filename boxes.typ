#let colorbox(title: "title", bgColor: rgb(255, 255, 255), strokeColor: luma(70), radius: 2pt, width: auto, body) = {
  return box(
    fill: bgColor,
    stroke: 1pt + strokeColor,
    radius: radius,
    width: width
  )[
    #block(
      fill: strokeColor, 
      inset: 4pt,
      radius: (top-left: radius, bottom-right: radius),
    )[
      #text(fill: white, weight: "bold")[#title]
    ]
    #block(
      width: 100%,
      inset: (x: 8pt, bottom: 8pt)
    )[
      #body
    ]
  ]
}

#let definition(body) = {
 return colorbox(
   title: "Definition",
 )[#body]
}
#let example(body) = {
  [
    #strong("Example")
    
    #body
  ]
}

#let note(body) = {
  [ 
    #strong("Note")
    
    #body
  ]
}

#let project(
    title: none,
    header-title: none,
    subtitle: none,

    university: none,
    faculty: none,
    semester: none,
    lecturer: none,

    author: none,
    email: none,

    body
) = {
    set text(font: "Fira Sans", size: 11pt)
    set par(justify: true)

    show link: underline
    show link: set text(fill: rgb(40,40,220))

    // headings
    show heading: it => context {
        let num-style = it.numbering
        if num-style == none {
            return it
        }
        let num = text(weight: "thin", numbering(num-style, ..counter(heading).at(here()))+[ \u{200b}])
        let x-offset = -1 * measure(num).width

        pad(left: x-offset, par(hanging-indent: -1 * x-offset, text(fill: black.lighten(25%), num) + [] + text(fill: black, it.body)))
    }

    // title page
    [
        #set text(size: 1.25em)

        #v(.8fr)
        #text(size: 2.5em, fill: black, strong(title)) \
        #v(0em)
        #text(size: 1.5em, fill: black.lighten(25%), subtitle)

        #semester\
        #university\
        #faculty\
        
        #text(size: 0.6em, upper(strong("Lecturer")))\
        #lecturer
        
        #text(size: 0.6em, upper(strong("Author")))\
        #author\
        #email
        
        #datetime.today().display("[year]-[month]-[day]")
        #v(0.1fr)
    ]

    // page setup
    set page(
        margin:  (top: 2.5cm, bottom: 2.5cm, right: 4cm),
        header: [
            #set text(size: 0.75em)
            #table(columns: (1fr, auto, 1fr), align: bottom, stroke: none, inset: 0pt, [
                #header-title
            ], [], [
                #show: align.with(top + right)
                #semester 
            ])
        ] + v(-0.5em) + line(length: 100%, stroke: black),
        footer: {
            set text(size: 0.75em)
            line(length: 100%, stroke: black)
            v(-0.5em)

            table(columns: (1fr, auto, 1fr),
                align: top,
                stroke: none,
                inset: 0pt,

                [],
                align(center, context {
                    str(counter(page).display())
                    [ \/ ]
                    str(counter(page).final().last())
                }),
                []
            )
        }
    )

    // table setup
    set table(
      stroke: none,
    )

    set heading(numbering: "1.")
    counter(page).update(1)
    body
}

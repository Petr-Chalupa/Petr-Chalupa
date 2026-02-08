#import "utils.typ": *

#let data = yaml("../data.yaml")

#show: setup

#let left_side = [
  #align(center)[
    #block(
      clip: true,
      radius: 50%,
      width: 120pt,
      height: 120pt,
      stroke: 2pt + white,
      image("cv.png", width: 100%, height: 100%, fit: "cover"),
    )
    #v(1em)
  ]

  #section("Kontakt", light: true)[
    #link("mailto:" + data.personal.email) \
    #data.personal.location \
    #link(data.personal.web)
  ]

  #section("Jazyky", light: true)[
    #for lang in data.languages [
      - #lang.name #if "level" in lang [(#lang.level)]
    ]
  ]

  #section("Technologie", light: true)[
    #if data.technologies.software.len() != 0 [
      *Software:* #data.technologies.software.join(", ")
    ] \
    #if data.technologies.hardware.len() != 0 [
      *Hardware:* #data.technologies.hardware.join(", ")
    ]
  ]
]

#let right_side = [
  #name-header(data.personal.name)

  #section("Pracovní zkušenosti")[
    #for exp in filter-display(data.experience) [
      #entry(
        [
          #strong(exp.company) \
          #exp.role \
          #text(size: 10pt, style: "italic")[#exp.desc]
        ],
        if exp.from == exp.to [ #exp.from ] else [ #exp.from - #exp.to ],
      )
    ]
  ]

  #section("Vzdělání")[
    #for edu in filter-display(data.education) [
      #entry(
        [
          #strong(edu.school)
          #if "degree" in edu [ (#edu.degree) ] \
          #edu.program \
          #if "major" in edu [
            #text(size: 10pt, style: "italic")[
              #edu.major
              #if "minors" in edu [ | Minor: #edu.minors.join(", ") ]
            ]
          ]
        ],
        [#edu.from - #edu.to],
      )
    ]
  ]

  #section("Aktivity")[
    #for act in filter-display(data.activities) [
      #entry(
        [
          #strong(act.name)
          #if "rank" in act [ (#act.rank) ] \
          #act.desc
        ],
        if act.from == act.to [ #act.from ] else [ #act.from - #act.to ],
      )
    ]
  ]

  #section("Úspěchy")[
    #for achievement in filter-display(data.achievements) [
      #entry(
        [#strong(achievement.name) \ #achievement.desc],
        [#achievement.year],
      )
    ]
  ]
]

#layout(left_side, right_side)

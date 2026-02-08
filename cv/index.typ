#import "theme.typ": *

#let data = yaml("../data.yaml")

#show: setup

#name-header(data.personal.name)

#data.personal.phone | #data.personal.email | #data.personal.location \
#link(data.personal.web)

#cv-section("Technologies")
*Software:* #data.technologies.software?.join(", ") \
*Hardware:* #data.technologies.hardware?.join(", ")

#cv-section("Experience")
#for job in data.experience [
  #entry(
    [#job.from – #job.to],
    [#strong(job.role) \ #job.company],
  )
]

#cv-section("Education")
#for edu in data.education [
  #entry(
    [#edu.from – #edu.to],
    [#strong(edu.program) \ #edu.school],
  )
]

#cv-section("Languages")
#for lang in data.languages [
  - #lang.name (#lang.level)
]

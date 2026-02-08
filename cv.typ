#set text(font: "Arial", size: 10pt)
#set heading(numbering: none)

#let section(title) = [
  #v(1em)
  #text(weight: "bold")[#title]
  #line(length: 100%)
]

#let data = yaml("data.yaml")



= #data.personal.name

#data.personal.email \
#data.personal.phone \
#data.personal.location

#section("Technologie")
#for t in data.technologies [
  #t,
]

#section("Praxe")
#for job in data.experience.take(5) [
  *#job.from – #job.to*
  #job.role, #job.company
]

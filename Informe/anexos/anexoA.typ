// Conf anexo
#counter(heading).update(0) // Reestablecer el contador de heading
#set heading(outlined: true, numbering: (..n) => {[Anexo #numbering("A.", ..n)]})

#show heading.where(level: 1): it => [
  #set text(24pt)
  #block("Anexo " + context counter(heading).display("A"))
  #block(it.body)
  #v(1em)
]
#show heading.where(level: 2): it => [
  #set text(18pt)
  #block(context counter(heading).display("A.1") + " " + it.body)
  #v(0.5em)
]



= titulo anexo 1
#lorem(400)

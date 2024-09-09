#let conf(
    doc,
) = {
  set page(numbering: "1") // Activar numeración con números no romanos
  counter(page).update(1) // Reestablecer el contador de páginas

  // Formato headings para segunda parte
  set heading(numbering: "1.1.", outlined: true)
  // Headings nivel 1 grandes con capitulo
  show heading.where(level: 1): it => [
    #v(3em)
    #set text(25pt)
    #block("Capítulo " + context counter(heading).display("1"))
    #v(0.75em)
    #block(it.body)
    #v(2em)
  ]
  // Headings nivel 2 medianos
  show heading.where(level: 2): it => [
    #set text(18pt)
    #block(context counter(heading).display("1.1") + " " + it.body)
    #v(0.5em)
  ]
  // Headings nivel 3 chiquitos
  show heading.where(level: 3): it => [
    #set text(14pt)
    #block(context counter(heading).display("1.1") + " " + it.body)
    #v(0.5em)
  ]

  // Resetear counter figuras por capiutulo
  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(figure.where(kind: raw)).update(0)
    it
  }
  set math.equation(numbering: num =>
    "(" + (str(counter(heading).get().at(0)) + "." + str(num)) + ")"
  )
  set figure(numbering: num =>
    str(counter(heading).get().at(0)) + "." + str(num)
  )

  doc
}
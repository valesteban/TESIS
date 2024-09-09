#import "inicio/portada.typ": portada
#import "conf.typ": conf

#show: portada.with(
    titulo: "RESILIENCIA DE LA CALIDAD DE SERVICIO DE INTERNET FRENTE A FALLOS DE LOS NODOS FÍSICOS",
    autor: "VICENTE DOMINGO CRISTÓBAL VIDELA DONOSO",
    profe: "IVANA BACHMANN ESPINOZA",
)

// Resumen
#include "inicio/resumen.typ"
#pagebreak()

// Dedicatoria
#align(right + horizon, [_dedicatoria._ \ ])
#pagebreak()

// Agradecimientos
#include "inicio/agradecimientos.typ"
#pagebreak()

// Indice
#[
#show outline.entry.where(
  level: 1
): it => {
  [#v(12pt, weak: true) \ ]
  text(weight: "bold", it)
}
#outline(indent: auto)]
#pagebreak()

#[
#show outline.entry.where(
  level: 1
): it => {
  [#v(4pt, weak: true) \ ]
  it
}
// Indice tablas
#outline(
  title: [Índice de Tablas],
  target: figure.where(kind: table),
)
#pagebreak()

// Indice monos
#outline(
  title: [Índice de Ilustraciones],
  target: figure.where(kind: image),
)]

// Configuración para documento principal
#show: conf

// Inicio documento

// Capitulo 1: Introducción
#include "capitulos/1-introduccion.typ"
#pagebreak()

// Capitulo 2: Background/Estado del arte
#include "capitulos/2-estadoDelArte.typ"
#pagebreak()


#figure(
  image("imagenes/puma.jpg", width: 90%),
  caption: [El gatito más bello del mundo.],
) <puma>

#pagebreak()


// Bibliografía
#show heading.where(level: 1): it => [
  #set text(24pt)
  #block(it.body)
  #v(1em)
]
#bibliography(
    "bibliografia.bib",
    title: "Bibliografía",
    style: "ieee",
)
#pagebreak()

// Anexos
#include "anexos/anexoA.typ"
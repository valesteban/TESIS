#let logos = (
    escudo: "logos/escudoU2014.svg",
    fcfm: "logos/fcfm.svg"
)

#let portada(
    titulo: none,
    autor: none,
    profe: none,
    doc,
) = {
    // Formato de página
    set page(
        paper: "us-letter",
        number-align: center,
        numbering: none,
    )
    // Formato de texto
    set text(
        lang: "es",
        font: "New Computer Modern",
        size: 12pt,
    )
    // Formato citas
    set cite(style: "council-of-science-editors")
    // Formato de headings para primera parte
    set heading(outlined: false)
    show heading.where(level: 1): it => [
      #set text(24pt)
      #block(it.body)
      #v(1em)
    ]

    // Header portada
    let header = [
        #set text(size: 13pt)
        #stack(dir: ltr, spacing: 15pt,
            [],
            align(bottom+left, box(width: 1.35cm, image(logos.escudo))),
            align(bottom+left, stack(dir: ttb, spacing: 5pt,
                text("UNIVERSIDAD DE CHILE"),
                text("FACULTAD DE CIENCIAS FÍSICAS Y MATEMÁTICAS"),
                text("DEPARTAMENTO DE CIENCIAS DE LA COMPUTACIÓN"),
                ),
            )
        )
    ]

    // Variables portada
    let _tesis = [TESIS PARA OPTAR AL GRADO DE \ MAGÍSTER EN COMPUTACIÓN]
    let _memoria = [MEMORIA PARA OPTAR AL TÍTULO DE \ INGENIERO EN COMPUTACIÓN]
    let _nombre_comision = [NOMBRE UNO \ NOMBRE DOS \ NOMBRE TRES]

    let _guia = "PROFESORA GUÍA:"
    let _comision = "MIEMBROS DE LA COMISIÓN:"

    let _ciudad = "SANTIAGO DE CHILE"
    let _anno = [#datetime.today().year()]

    let portada = align(center)[
        #stack(dir: ttb, spacing: 0.5fr,
            ..(
            1fr,
            titulo,
            1fr,
            _tesis,
            _memoria,
            1fr,
            autor,
            1.5fr,
            [#_guia \ #profe],
            1fr,
            [#_comision \ #_nombre_comision],
            2fr,
            [#_ciudad \ #_anno]
            ),
        )
    ]
    // Portada
    header
    portada

    // Comienza el documento, con las partes preliminares, en página i
    set page(
        numbering: "i",
        margin: (left: 3cm, top: 4cm, rest: 2cm,),
    ) // Activar numeración de páginas y márgenes
    set par(
        justify: true,
        first-line-indent: 15pt,
    ) // Formato de párrafos
    show par: set block(spacing: 2em) // Espacio entre párrafos
    pagebreak() // Salto de página
    counter(page).update(1) // Reestablecer el contador de páginas
    doc
}
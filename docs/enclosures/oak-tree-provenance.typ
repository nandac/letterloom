// Global Styles
#set page(margin: 25mm)
#set text(size: 11pt, font: "Libertinus Serif")
#set par(spacing: 1.5em)
#set strong(delta: 200)

//Customize appearance
#show raw: set text(font: "DejaVu Sans Mono")
#show raw.where(block: true): set block(fill: rgb("#faebd7"), inset: 1em, radius: 0.5em, width: 100%)
#show link: set text(fill: blue)

// Text Element configuration
#show heading.where(level: 1): h1 => {
  set block(above: 2em, below: 1.5em)
  set text(weight: "bold")
  h1
}

#show heading.where(level: 2): h2 => {
  set block(above: 2em, below: 1.5em)
  set text(weight: "bold")
  h2
}

#show heading.where(level: 3): h3 => {
  set block(above: 2em, below: 1.5em)
  set text(weight: "bold")
  h3
}

// Table and figure configuration
#show table.header: set text(weight: "bold")
#show figure: set block(breakable: true)

#align(center)[= Oak Tree Provenance Statement]

Location: Dimbleby Estate \
Species: English Oak (Quercus robur) \
Date: 14 March 2026 \

The oak trees on The Dimbleby Estate are of native English provenance, characteristic of traditional estate woodland in this region of Middle Upton, Bristol. Historical records and planting patterns indicate that these oaks were established as part of the original estate landscape design, dating from approximately the mid to late 17th century.

The trees are believed to have been grown from locally collected acorns, in keeping with 17th-century estate practice, which favoured the use of indigenous seed sources to preserve regional genetic integrity and ensure adaptation to local soil and climatic conditions.

The oaks display the typical form and habit of Quercus robur, with growth characteristics consistent with long-established native stands. Their lineage contributes to the ecological and historical continuity of the Dimbleby Estate's landscape and represents a living record of its natural heritage.

Prepared by: Mr Jethro Tull \
Position: Head Groundsman \
For: The Dimbleby Estate

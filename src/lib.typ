#let construct-custom-footer(
  footer: none,
  footer-font: none,
  footer-font-size: none,
  link-color: none
) = {
  let custom-footer = grid()

  // Footers are optional
  if footer != () {
    if type(footer) != array {
      footer = (footer, )
    }

    // If footer is provided, construct a grid with one row
    // and the number of columns equal to the number of footer items
    custom-footer = grid(
      columns: footer.len(),
      rows: 1,
      gutter: 20pt,
      ..footer.map(
        foot => [
          // Specific styling for links, emails and strings
          #if foot.type == "link" {
            text(
              link(foot.content),
              font: footer-font,
              size: footer-font-size,
              fill: link-color
            )
          } else if foot.type == "email" {
            text(
              link("mailto:" + foot.content),
              font: footer-font,
              size: footer-font-size,
              fill: link-color
            )
          } else if foot.type == "string" {
            text(foot.content, font: footer-font,  size: footer-font-size)
          } else {
            text(foot.content, font: footer-font,  size: footer-font-size)
          }
        ]
      )
    )
  }

  return custom-footer
}

#let construct-page-numbering(number-pages: none) = {
  let page-numbering = grid()

  // Page numbering is optional
  if number-pages == true {
    // Page numbering starts on the second page
    page-numbering = grid(
      context(
        if here().page() > 1 {
          counter(page).display("1")
        }
      )
    )
  }

  return page-numbering
}

#let construct-signatures(signatures: none) = {
  // Signatures are optional in cases where the letter may be
  // of an informal nature
  if signatures != () {
    // Convert the signatures variable to an array in cases
    // where only one signature is given
    if type(signatures) != array {
      signatures = (signatures, )
    }

    // Grid accommodates _up to_ three signatures and signatory names
    grid(
      columns: signatures.len(),
      rows: 2,
      column-gutter: 60pt,
      ..signatures.map(signatory => [
        #signatory.signature
        #signatory.name
      ])
    )
  }
}

#let construct-enclosures(enclosures: none, enclosures-title: none) = {
  // Enclosures are optional
  if enclosures != () {
    set enum(indent: 15pt)
    enclosures-title

    // Convert the enclosures variable to an array in cases
    // where only one enclosure is given
    if type(enclosures) != array {
      enclosures = (enclosures, )
    }

    // Enclosures are displayed as a list
    for enclosure in enclosures {
      enum.item(text(enclosure))
    }
  }
}

#let construct-figures(
  figures: none, caption-font: none, caption-font-size: none
) = {
  // Figures are optional
  if figures != () {
    // Convert the figures variable to an array in cases
    // where only one figure is given
    if type(figures) != array {
      figures = (figures, )
    }

    show figure.caption: set text(font: caption-font, size: caption-font-size)
    for fig in figures {
      figure(fig.image, caption: fig.caption)
    }
  }
}

#let easy-letter(
  from: (
    name: none,
    address: none
  ),
  to: (
    name: none,
    address: none,
  ),
  from-alignment: right,
  attn-name: none,
  date: none,
  subject: none,
  salutation: none,
  closing: none,
  signatures: (),
  enclosures: (),
  enclosures-title: "encl:",
  cc: none,
  figures: (),
  footer: (),
  number-pages: false,
  paper-size: "a4",
  margins: (top: 20mm, left: 20mm, bottom: 20mm, right: 20mm),
  main-font: "Libertinus Serif",
  main-font-size: 11pt,
  footer-font: "DejaVu Sans Mono",
  footer-font-size: 7pt,
  caption-font: "Libertinus Serif",
  caption-font-size: 9pt,
  footnote-font: "Libertinus Serif",
  footnote-font-size: 8pt,
  paragraph: (
    leading: 0.8em, // Space between adjacent lines in a paragraph; tuned to the font used
    spacing: 1.8em, // Space between paragraphs
  ),
  link-color: blue,
  doc
) = {
  let custom-footer = construct-custom-footer(
    footer: footer,
    footer-font: footer-font,
    footer-font-size:
    footer-font-size,
    link-color: link-color
  )

  let page-numbering = construct-page-numbering(number-pages: number-pages)

  // Page settings
  set page(
    paper: paper-size,
    margin: margins,
    footer: align(center, custom-footer + page-numbering),
  )

  // Text settings
  set text(
    font: main-font,
    size: main-font-size,
  )

  // Paragraph spacing
  set par(
    leading: paragraph.leading, // Space between adjacent lines in a paragraph
    spacing: paragraph.spacing, // Space between paragraphs
  )

  // Color links to the desired color
  show link: set text(fill: link-color)

  // Sender's name, address, and date block at top right
  align(from-alignment, block(below: 10pt)[
    #set align(left)
    #from.name
    #linebreak()
    #from.address
    #linebreak()
    #v(2pt)
    #date
])

  // Attention name (optional)
  if attn-name != none {
    text("Attn: " + attn-name)
  }
  linebreak()

  // Receiver's name and address
  set align(left)
  to.name
  linebreak()
  to.address
  linebreak()

  v(5pt)

  // Recipient's salutation e.g. Dear Sir/Madam etc.
  text(salutation)

  linebreak()
  v(5pt)

  // Subject in semibold, smallcaps; font should support these features
  text(weight: "bold", smallcaps(subject))

  // Body of letter
  doc

  linebreak()
  v(5pt)

  // Closing e.g. Yours sincerely etc.
  text(closing)

  linebreak()

  construct-signatures(signatures: signatures)

  // Carbon copy (optional)
  if cc != none {
    text("cc: " + cc)
  }

  v(5pt)

  // Use footnote.entry rather than footnote
  show footnote.entry: set text(font: footnote-font, size: footnote-font-size)

  construct-enclosures(enclosures: enclosures, enclosures-title: enclosures-title)
  construct-figures(
    figures: figures, caption-font: caption-font, caption-font-size: caption-font-size
  )
}

#import "validate-inputs.typ": *
#import "construct-outputs.typ": *

#let letterloom(
  from: none,
  to: none,
  from-alignment: right,
  attn-name: none,
  date: none,
  subject: none,
  salutation: none,
  closing: none,
  signatures: none,
  enclosures: none,
  enclosures-title: "encl:",
  cc: none,
  figures: none,
  footer: none,
  number-pages: false,
  paper-size: "a4",
  margins: auto,
  main-font: "Libertinus Serif",
  main-font-size: 11pt,
  footer-font: "DejaVu Sans Mono",
  footer-font-size: 7pt,
  caption-font: "Libertinus Serif",
  caption-font-size: 9pt,
  footnote-alignment: left,
  footnote-font: "Libertinus Serif",
  footnote-font-size: 8pt,
  par-leading: 0.8em, // Space between adjacent lines in a paragraph; tuned to the font used
  par-spacing: 1.8em, // Space between paragraphs
  link-color: blue,
  doc
) = {
  // Validate font sizes
  validate-length(length-value: main-font-size, field-name: "main-font-size")
  validate-length(length-value: footer-font-size, field-name: "footer-font-size")
  validate-length(length-value: caption-font-size, field-name: "caption-font-size")
  validate-length(length-value: footnote-font-size, field-name: "footnote-font-size")

  // Validate paragraph spacing and leading
  validate-length(length-value: par-leading, field-name: "par-leading")
  validate-length(length-value: par-spacing, field-name: "par-spacing")

  // Validate the sender's contact details
  validate-contact(contact: from, contact-type: "from")

  // Validate the recipient's contact details
  validate-contact(contact: to, contact-type: "to")

  // Validate the date
  validate-string(string-data: date, field-name: "date")

  // Validate salutation
  validate-string(string-data: salutation, field-name: "salutation")

  // Validate closing
  validate-string(string-data: closing, field-name: "closing")

  // Validate signatures
  validate-signatures(signatures: signatures)

  // Validate all optional variables
  // If attention name is given, validate it
  if attn-name != none {
    validate-string(string-data: attn-name, field-name: "attn-name")
  }

  // If carbon copy is given, validate it
  if cc != none {
    validate-string(string-data: cc, field-name: "cc")
  }

  // Footer is optional
  let custom-footer = construct-custom-footer(
    footer: footer,
    footer-font: footer-font,
    footer-font-size:
    footer-font-size,
    link-color: link-color
  )

  // Page numbering is optional
  let page-numbering = construct-page-numbering(number-pages: number-pages)

  // Page settings
  set page(
    paper: paper-size,
    margin: margins,
    footer: align(center, custom-footer + page-numbering)
  )

  // Text settings
  set text(
    font: main-font,
    size: main-font-size
  )

  // Paragraph spacing
  set par(
    leading: par-leading, // Space between adjacent lines in a paragraph
    spacing: par-spacing // Space between paragraphs
  )

  // Color links to the desired color
  show link: set text(fill: link-color)

  // Align the footnote separator to the desired alignment
  set footnote.entry(separator: align(footnote-alignment, line(length: 30% + 0pt, stroke: 0.5pt)))

  // Align footnotes to the desired alignment
  show footnote.entry: it => {
    set align(footnote-alignment)
    set text(font: footnote-font, size: footnote-font-size)
    it
  }

  // Sender's name, address, and date block at top right
  align(from-alignment, block[
    #set align(left)
    #from.name
    #linebreak()
    #from.address
    #linebreak()
    #v(2pt)
    #date
  ])

  // Attention name (optional)
  // if attn-name != none {
  //   text("Attn: " + attn-name)
  // }

  // Receiver's name and address
  block[
    #v(5pt)
    #set align(left)
    #if attn-name != none {
      text("Attn: " + attn-name)
      linebreak()
    }
    #to.name
    #linebreak()
    #to.address
    #linebreak()
  ]

  v(5pt)

  // Recipient's salutation e.g. Dear Sir/Madam etc.
  text(salutation)

  linebreak()
  v(5pt)

  // Subject
  text(subject)

  // Body of letter
  doc

  linebreak()
  v(5pt)

  // Closing e.g. Yours sincerely etc.
  text(closing)

  // Signatures
  construct-signatures(signatures: signatures)

  v(10pt)

  // Carbon copy (optional)
  if cc != none {
    text("cc: " + cc)
    linebreak()
    linebreak()
  }

  construct-enclosures(enclosures: enclosures, enclosures-title: enclosures-title)
  construct-figures(
    figures: figures, caption-font: caption-font, caption-font-size: caption-font-size
  )
}

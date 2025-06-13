#import "validate.typ": *
#import "construct.typ": *

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
  footnote-alignment: left,
  footnote-font: "Libertinus Serif",
  footnote-font-size: 8pt,
  paragraph: (
    leading: 0.8em, // Space between adjacent lines in a paragraph; tuned to the font used
    spacing: 1.8em, // Space between paragraphs
  ),
  link-color: blue,
  doc
) = {
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
    leading: paragraph.leading, // Space between adjacent lines in a paragraph
    spacing: paragraph.spacing // Space between paragraphs
  )

  // Align the footnote separator to the desired alignment
  set footnote.entry(separator: align(footnote-alignment, line(length: 30% + 0pt, stroke: 0.5pt)))

  // Color links to the desired color
  show link: set text(fill: link-color)

  // Align footnotes to the desired alignment
  show footnote.entry: it => {
    set align(footnote-alignment)
    set text(font: footnote-font, size: footnote-font-size)
    it
  }

  // Validating all mandatory variables
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

  // Validate all optional variables
  // If attention name is given, validate it
  if attn-name != none {
    validate-string(string-data: attn-name, field-name: "attn-name")
  }

  // If carbon copy is given, validate it
  if cc != none {
    validate-string(string-data: cc, field-name: "cc")
  }

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

  // Subject
  text(subject)

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

  construct-enclosures(enclosures: enclosures, enclosures-title: enclosures-title)
  construct-figures(
    figures: figures, caption-font: caption-font, caption-font-size: caption-font-size
  )
}

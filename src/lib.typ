/// letterloom Core Module
///
/// This module provides the main interface and layout logic for generating
/// professional letters using the letterloom package. It orchestrates
/// input validation, document structure, and formatting, and exposes the main
/// `letterloom` function for end users and templates.
///
/// Features:
/// - Validates and formats sender/recipient information
/// - Supports custom salutations, closings, signatures, and enclosures
/// - Configurable fonts, spacing, alignment, and page settings
/// - Modular design for easy extension and customization
#import "validate-inputs.typ": validate-inputs
#import "construct-outputs.typ": *

/// Generates a formatted letter according to the letterloom specification.
///
/// Parameters:
/// - from: Sender's contact information (dictionary with name and address)
/// - to: Recipient's contact information (dictionary with name and address)
/// - date: Letter date (string or content)
/// - salutation: Opening greeting (string or content)
/// - subject: Letter subject line (string or content)
/// - closing: Closing phrase (string or content)
/// - signatures: List of signatories (array or single dictionary)
/// - attn-name: Optional attention line (string or content)
/// - cc: Optional list of cc recipients (array or string/content)
/// - enclosures: Optional list of enclosures (array or string/content)
/// - enclosures-title: Optional enclosures header (string, default "encl:")
/// - footer: Optional footer information
/// - number-pages: Enable page numbering (boolean)
/// - paper-size: Paper size (string, default "a4")
/// - margins: Page margins (auto or length)
/// - main-font, main-font-size, footer-font, footer-font-size, etc.: Font settings
/// - par-leading, par-spacing: Paragraph spacing settings
/// - from-alignment, footnote-alignment: Alignment settings
/// - link-color: Hyperlink color
/// - doc: Main letter body content
///
/// Returns:
/// - A fully formatted letter document ready for rendering or export.
#let letterloom(
  from: none,
  to: none,
  date: none,
  salutation: none,
  subject: none,
  closing: none,
  signatures: none,
  attn-name: none,
  cc: none,
  enclosures: none,
  enclosures-title: "encl:",
  footer: none,
  paper-size: "a4",
  margins: auto,
  par-leading: 0.8em,
  par-spacing: 1.8em,
  number-pages: false,
  main-font: "Libertinus Serif",
  main-font-size: 11pt,
  footer-font: "DejaVu Sans Mono",
  footer-font-size: 9pt,
  footnote-font: "Libertinus Serif",
  footnote-font-size: 7pt,
  from-alignment: right,
  footnote-alignment: left,
  link-color: blue,
  doc
) = {
  // Validate all inputs
  validate-inputs(
    from: from,
    to: to,
    date: date,
    salutation: salutation,
    subject: subject,
    closing: closing,
    signatures: signatures,
    attn-name: attn-name,
    cc: cc,
    enclosures: enclosures,
    enclosures-title: enclosures-title,
    footer: footer,
    par-leading: par-leading,
    par-spacing: par-spacing,
    number-pages: number-pages,
    main-font-size: main-font-size,
    footer-font-size: footer-font-size,
    footnote-font-size: footnote-font-size,
    from-alignment: from-alignment,
    footnote-alignment: footnote-alignment,
    link-color: link-color,
  )

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
    spacing: par-spacing  // Space between paragraphs
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

  // Sender's name, address, and date block
  align(from-alignment, block[
    #set align(left)
    #from.name
    #linebreak()
    #from.address
    #linebreak()
    #v(2pt)
    #date
  ])

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

  // Salutation
  text(salutation)

  linebreak()
  v(5pt)

  // Subject
  text(subject)

  // Body of letter
  doc

  linebreak()
  v(5pt)

  // Closing
  text(closing)

  // Signatures
  construct-signatures(signatures: signatures)

  v(10pt)

  // cc (optional)
  construct-cc(cc: cc)

  // Enclosures (optional)
  construct-enclosures(enclosures: enclosures, enclosures-title: enclosures-title)
}

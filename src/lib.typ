/// letterloom Core Module
///
/// This module provides the main interface and layout logic for generating
/// professional letters using the letterloom package. It orchestrates
/// input validation, document structure, and formatting, and exposes the main
/// `letterloom` function for end users and templates.
#import "validate-inputs.typ": validate-inputs
#import "construct-outputs.typ": *

/// Generates a formatted letter according to the letterloom specification.
#let letterloom(
  from-name: none,
  from-address: none,
  to-name: none,
  to-address: none,
  date: none,
  salutation: none,
  subject: none,
  closing: none,
  signatures: none,
  required-fields: ("from-name", "from-address", "to-name", "to-address", "date", "salutation", "subject", "closing", "signatures"),
  signature-alignment: left,
  attn-name: none,
  attn-label: "Attn:",
  attn-position: "above",
  cc: none,
  cc-label: "cc:",
  enclosures: none,
  enclosures-label: "encl:",
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
  date-alignment: right,
  footnote-alignment: left,
  link-color: blue,
  doc
) = {
  // Validate all inputs
  validate-inputs(
    from-name: from-name,
    from-address: from-address,
    to-name: to-name,
    to-address: to-address,
    date: date,
    salutation: salutation,
    subject: subject,
    closing: closing,
    signatures: signatures,
    required-fields: required-fields,
    signature-alignment: signature-alignment,
    attn-name: attn-name,
    attn-label: attn-label,
    attn-position: attn-position,
    cc: cc,
    cc-label: cc-label,
    enclosures: enclosures,
    enclosures-label: enclosures-label,
    footer: footer,
    par-leading: par-leading,
    par-spacing: par-spacing,
    number-pages: number-pages,
    main-font-size: main-font-size,
    footer-font-size: footer-font-size,
    footnote-font-size: footnote-font-size,
    from-alignment: from-alignment,
    date-alignment: date-alignment,
    footnote-alignment: footnote-alignment,
    link-color: link-color,
  )

  // Shadow fields not in required-fields with none so rendering guards suppress them
  let from-name      = if "from-name"   in required-fields { from-name }   else { none }
  let from-address   = if "from-address" in required-fields { from-address } else { none }
  let to-name        = if "to-name"      in required-fields { to-name }     else { none }
  let to-address     = if "to-address"   in required-fields { to-address }  else { none }
  let date           = if "date"         in required-fields { date }        else { none }
  let salutation     = if "salutation"   in required-fields { salutation }  else { none }
  let subject        = if "subject"      in required-fields { subject }     else { none }
  let closing        = if "closing"      in required-fields { closing }     else { none }
  let signatures     = if "signatures"   in required-fields { signatures }  else { none }

  // Construct the custom footer (optional)
  let custom-footer = construct-custom-footer(
    footer: footer,
    footer-font: footer-font,
    footer-font-size: footer-font-size,
    link-color: link-color
  )

  // Construct the page numbering (optional)
  let page-numbering = construct-page-numbering(number-pages: number-pages)

  // Set the page settings
  set page(
    paper: paper-size,
    margin: margins,
    footer: align(center, custom-footer + page-numbering)
  )

  // Set the text settings
  set text(
    font: main-font,
    size: main-font-size
  )

  // Set the paragraph spacing
  set par(
    leading: par-leading, // Space between adjacent lines in a paragraph
    spacing: par-spacing  // Space between paragraphs
  )

  // Color links to the desired color
  show link: set text(fill: link-color)

  // Set the footnote separator
  set footnote.entry(separator: align(footnote-alignment, line(length: 30% + 0pt, stroke: 0.5pt)))

  // Set the footnote alignment and text settings
  show footnote.entry: it => {
    set align(footnote-alignment)
    set text(font: footnote-font, size: footnote-font-size)
    it
  }

  // Sender's name and address block
  if from-name != none or from-address != none {
    align(from-alignment, block[
      #set align(if from-alignment == center { center } else { left })
      #if from-name != none {
        from-name
        if from-address != none { linebreak() }
      }
      #if from-address != none { from-address }
    ])
  }

  // Date block — when date-alignment matches from-alignment and the sender block is
  // present, match its width so the left edges align
  if date != none {
    if date-alignment == from-alignment and (from-name != none or from-address != none) {
      context {
        let from-content = if from-name != none and from-address != none {
          block[#from-name #linebreak() #from-address]
        } else if from-name != none {
          block[#from-name]
        } else {
          block[#from-address]
        }
        let from-width = measure(from-content).width
        align(date-alignment, block(width: from-width)[
          #set align(if date-alignment == center { center } else { left })
          #v(2pt)
          #date
        ])
      }
    } else {
      align(date-alignment, block[
        #set align(if date-alignment == center { center } else { left })
        #v(2pt)
        #date
      ])
    }
  }

  // Construct the attention line (optional)
  let attn = none
  if attn-name != none {
    attn = attn-label + " " + attn-name
  }

  // Receiver's name, address and optional attention line
  if to-name != none or to-address != none or attn != none {
    block[
      #v(5pt)
      #set align(left)
      #if attn-position == "above" and attn != none {
        text(attn)
        linebreak()
      }
      #if to-name != none {
        to-name
        if to-address != none or (attn-position == "below" and attn != none) { linebreak() }
      }
      #if to-address != none {
        to-address
        if attn-position == "below" and attn != none { linebreak() }
      }
      #if attn-position == "below" and attn != none {
        text(attn)
      }
    ]
  }

  // Salutation
  if salutation != none {
    v(5pt)
    text(salutation)
    linebreak()
    v(5pt)
  }

  // Subject
  if subject != none {
    text(subject)
  }

  // Body of letter
  doc

  // Closing
  if closing != none {
    v(5pt)
    text(closing)
  }

  // Construct and display the signatures
  if signatures != none {
    construct-signatures(signatures: signatures, signature-alignment: signature-alignment)
  }

  // Construct and display the cc (optional)
  construct-cc(cc: cc, cc-label: cc-label)

  // Construct and display the enclosures (optional)
  construct-enclosures(enclosures: enclosures, enclosures-label: enclosures-label)
}

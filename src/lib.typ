#let easy-letter(
  sender: (
    name: none,
    address: none
  ),
  receiver: (
    name: none,
    address: none,
  ),
  attn-name: none,
  date: none,
  subject: none,
  salutation: none,
  closing: none,
  signatures: (),
  enclosures: (),
  enclosures_title: "encl",
  cc: none,
  figures: (),
  footer: (),
  number-pages: false,
  paper-size: "a4",
  margins: (top: 20mm, left: 20mm, bottom: 20mm, right: 20mm),
  main-font: "libertinus serif",
  main-font-size: 11pt,
  footer-font: "libertinus serif",
  footer-font-size: 7pt,
  caption-font: "libertinus serif",
  caption-font-size: 9pt,
  footnote-font: "libertinus serif",
  footnote-font-size: 8pt,
  paragraph: (
    leading: 0.8em, // Space between adjacent lines in a paragraph; tuned to the font used
    spacing: 1.8em, // Space between paragraphs
  ),
  link-color: blue,
  doc
) = {
  let custom-footer = grid()
  let page-numbering = grid()

  if footer != () {
    custom-footer = grid(
      columns: footer.len(),
      rows: 1,
      gutter: 20pt,
      ..footer.map(foot => [
        // Specific styling for links, emails and strings
        #if foot.type == "link" {
          text(link(foot.content), font: footer-font,  size: footer-font-size, fill: link-color)
        }
        #if foot.type == "email" {
          text(link("mailto:" + foot.content), font: footer-font, size: footer-font-size, fill: link-color)
        }
        #if foot.type == "string" {
          text(foot.content, font: footer-font,  size: footer-font-size)
        }
      ])
    )
  }

  // Page numbering starts on the second page
  if number-pages == true {
    page-numbering = grid(
      context(
        if here().page() > 1 {
          counter(page).display("1")
        }
      )
    )
  }

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
    leading: paragraph.leading, // Space between adjacent lines in a paragraph; tuned to the font used
    spacing: paragraph.spacing, // Space between paragraphs
  )

  // Links are colored maroon
  show link: set text(fill: link-color)

  // Use footnote.entry rather than footnote
  show footnote.entry: set text(font: footnote-font, size: footnote-font-size)

  // Sender's name and address block at top right
  set align(right)
  sender.name
  linebreak()
  sender.address

  // Date of letter
  set align(right)
  date

  // Receiver's name and address
  set align(left)
  receiver.name
  linebreak()
  receiver.address
  linebreak()
  attn-name

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

  // Grid accommodates _up to_ three signatures and signatory names
  if signatures != () {
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

   // Carbon copy (optional)
  if cc != none {
    text("cc: " + cc)
  }

  v(5pt)

  // Enclosures (optional)
  if enclosures != () {
    set enum(indent: 15pt)
    text("encl: ")

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

  // Figures (optional)
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

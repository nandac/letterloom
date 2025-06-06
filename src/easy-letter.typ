#let easy-letter(
  sender: (
    name: none,
    address: none
  ),
  receiver: (
    name: none,
    address: none,
  ),
  date: none,
  subject: none,
  salutation: none,
  closing: none,
  signatures: (),
  enclosures: (),
  cc: none,
  figures: (),
  footer: (),
  number_pages: false,
  paper_size: "a4",
  margins: (top: 20mm, left: 20mm, bottom: 20mm, right: 20mm),
  main_font: (font: "Noto Serif", size: 11pt),
  footer_font: (font: "Fira Mono", size: 7pt),
  caption_font: (font: "Source Sans Pro", size: 9pt),
  footnote_font: (font: "Noto Serif", size: 8pt),
  paragraph: (
    leading: 0.8em, // Space between adjacent lines in a paragraph; tuned to the font used
    spacing: 1.8em, // Space between paragraphs
  ),
  link_color: blue,
  doc
) = {
  let custom_footer = grid()
  let page_numbering = grid()

  if footer != () {
    custom_footer = grid(
      columns: footer.len(),
      rows: 1,
      gutter: 20pt,
      ..footer.map(foot => [
        // Specific styling for links, emails and strings
        #if foot.type == "link" {
          text(link(foot.content), font: footer_font.font,  size: footer_font.size, fill: link_color)
        }
        #if foot.type == "email" {
          text(link("mailto:" + foot.content), font: footer_font.font,  size: footer_font.size, fill: link_color)
        }
        #if foot.type == "string" {
          text(foot.content, font: footer_font.font,  size: footer_font.size)
        }
      ])
    )
  }

  // Page numbering starts on the second page
  if number_pages == true {
    page_numbering = grid(
      context(
        if here().page() > 1 {
          counter(page).display("1")
        }
      )
    )
  }

  // Page settings
  set page(
    paper: paper_size,
    margin: margins,
    footer: align(center, custom_footer + page_numbering),
  )

  // Text settings
  set text(
    font: main_font.font,
    size: main_font.size,
  )

  // Paragraph spacing
  set par(
    leading: paragraph.leading, // Space between adjacent lines in a paragraph; tuned to the font used
    spacing: paragraph.spacing, // Space between paragraphs
  )

  // Links are colored maroon
  show link: set text(fill: link_color)

  // Use footnote.entry rather than footnote
  show footnote.entry: set text(font: footnote_font.font, size: footnote_font.size)

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

  v(5pt)

  // Recipient's salutation e.g. Dear Sir/Madam etc.
  text(salutation)

  linebreak()
  v(5pt)

  // Subject in semibold, smallcaps; font should support these features

  text(weight: "semibold", smallcaps(subject))

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
    for enclosure in enclosures {
      enum.item(
        text(enclosure)
      )
    }
  }

  // Figures (optional)
  if figures != () {
    show figure.caption: set text(font: caption_font.font, size: caption_font.size)
    for fig in figures {
      figure(fig.image, caption: fig.caption)
    }
  }
}

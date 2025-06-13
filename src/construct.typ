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

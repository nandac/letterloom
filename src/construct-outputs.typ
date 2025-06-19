#let construct-custom-footer(
  footer: none,
  footer-font: none,
  footer-font-size: none,
  link-color: none
) = {
  let custom-footer = grid()

  // Footers are optional
  if footer != none and footer != () {
    // Convert the footer variable to an array in cases
    // where only one footer item is given
    if type(footer) != array {
      footer = (footer, )
    }

    // If a footer is provided, construct a grid with one row
    // and the number of columns equal to the number of footer items
    custom-footer = grid(
      columns: footer.len(),
      rows: 1,
      gutter: 20pt,
      ..footer.map(
        it => [
          #if it.at("footer-type", default: "string") == "url" {
            // Specific styling for urls
            text(
              link(it.footer-text),
              font: footer-font,
              size: footer-font-size,
              fill: link-color
            )
          } else if it.at("footer-type", default: "string") == "email" {
            // Specific styling for emails
            text(
              link("mailto:" + it.footer-text),
              font: footer-font,
              size: footer-font-size,
              fill: link-color
            )
          } else if it.at("footer-type", default: "string") == "string" {
            // Strings are rendered as given
            text(it.footer-text, font: footer-font, size: footer-font-size)
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
  let sigs-per-row = 3
  let blank-space = none

  // Convert the signatures variable to an array in cases
  // where only one signature is given
  if type(signatures) != array {
    signatures = (signatures, )
  }

  // Accommodates one or more signatures rendered as
  // a grid with three signatures per row
  grid(
    columns: 1,
    rows: auto,
    row-gutter: 10pt,
    align: start + horizon,
    // Split the signatures sent in into items of length 3
    ..signatures.chunks(sigs-per-row).map(sigs => {
      grid(
        columns: (1fr, ) * sigs-per-row,
        align: center,
        rows: 2,
        row-gutter: 10pt,
        column-gutter: 40pt,
        // If a row does not contain 3 signatures pad the
        // remaining cells with a blank-space
        ..sigs.map(signatory =>
        signatory.at("signature", default: rect(height: 40pt, stroke: none))) + (blank-space, ) * (sigs-per-row - sigs.len()),
        ..sigs.map(signatory => signatory.name) + (blank-space, ) * (sigs-per-row - sigs.len()),
      )
    })
  )
}

#let construct-enclosures(enclosures: none, enclosures-title: none) = {
  // Enclosures are optional
  if enclosures != none and enclosures != () {
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
  if figures != none and figures != () {
    // Convert the figures variable to an array in cases
    // where only one figure is given
    if type(figures) != array {
      figures = (figures, )
    }

    show figure.caption: set text(font: caption-font, size: caption-font-size)
    for fig in figures {
      // A figure need not have a caption
      figure(fig.image, caption: fig.at("caption", default: none))
    }
  }
}

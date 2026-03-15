/// Output Construction Module
///
/// This module provides layout and construction functions for various
/// letter components including signatures, cc recipients, enclosures,
/// custom footers, and page numbering. It handles the visual presentation
/// and formatting of these elements according to the letterloom specification.

/// Constructs a signature grid layout for one or more signatories.
#let construct-signatures(signatures: none, signature-alignment: left) = {
  // Set the number of signatures per row to 3 to handle 3 or more signatures
  let sigs-per-row = 3

  // Blank placeholder for empty grid cells when there are fewer than sigs-per-row
  let blank-space = none

  // Normalize to array when a single signature is given
  if type(signatures) != array {
    signatures = (signatures, )
  }

  // In cases where we have less than 3 signatures,
  // we set the number of signatures per row to the number of signatures given
  if signatures.len() < 3 {
    sigs-per-row = signatures.len()
  }

  if signatures.len() > 1 {
    signature-alignment = left
  }

  // Construct the signature table
  grid(
    columns: 1,
    rows: auto,
    row-gutter: 10pt,
    align: left,
    // Construct the signature inner grid
    ..signatures.chunks(sigs-per-row).map(sigs => {
      grid(
        columns: (1fr, ) * sigs-per-row,
        align: signature-alignment,
        rows: 2,
        row-gutter: 10pt,
        column-gutter: 40pt,
        // Signature images row
        ..sigs.map(signatory =>
          signatory.at(
            "signature", default: rect(height: 40pt, stroke: none)
            )
          ) + (blank-space, ) * (sigs-per-row - sigs.len()),
        // Names, affiliation row
        ..sigs.map(signatory => stack(
            spacing: 10pt,
            signatory.name,
            signatory.at("title", default: none),
            signatory.at("affiliation", default: none)
          )) + (blank-space, ) * (sigs-per-row - sigs.len()),
      )
    })
  )
}

/// Constructs an enumerated list of cc recipients (optional).
#let construct-cc(cc: none, cc-label: none) = {
  if cc != none {
    set enum(indent: 15pt)

    // Display the label
    cc-label

    if type(cc) != array {
      cc = (cc, )
    }

    // Display each recipient as an enumerated item
    for cc-recipient in cc {
      enum.item(text(cc-recipient))
    }
  }
}

/// Constructs an enumerated list of enclosures (optional).
#let construct-enclosures(enclosures: none, enclosures-label: none) = {
  if enclosures != none {
    set enum(indent: 15pt)

    // Display the label
    enclosures-label

    if type(enclosures) != array {
      enclosures = (enclosures, )
    }

    // Normalize to (title, content or none) so we can handle both "title" and (title, content)
    let items = enclosures.map(enclosure => if type(enclosure) == array {
      (enclosure.at(0), enclosure.at(1, default: none))
    } else {
      (enclosure, none)
    })

    // Display description of each enclosure as an enumerated item
    for (title, _) in items {
      enum.item(text(title))
    }

    // Display each enclosure attachment on a separate page when content is given
    for (title, content) in items {
      if content != none {
        pagebreak()
        figure(content, caption: text(title))
      }
    }
  }
}


/// Constructs a custom footer grid with specific styling for urls and emails (optional).
#let construct-custom-footer(
  footer: none,
  footer-font: "DejaVu Sans Mono",
  footer-font-size: 7pt,
  link-color: blue
) = {
  if footer not in (none, ()) {
    // Handle the case where only one footer item is given
    if type(footer) != array {
      footer = (footer, )
    }

    // Construct the footer grid
    grid(
      columns: footer.len(),
      rows: 1,
      gutter: 20pt,
      ..footer.map(footer-item => {
        let footer-type = footer-item.at("footer-type", default: "string")
        let footer-text = footer-item.at("footer-text")

        if footer-type == "url" {
          // Construct the footer text for URLs
          text(
            link(footer-text),
            font: footer-font,
            size: footer-font-size,
            fill: link-color
          )
        } else if footer-type == "email" {
          // Construct the footer text for emails
          text(
            link("mailto:" + footer-text),
            font: footer-font,
            size: footer-font-size,
            fill: link-color
          )
        } else {
          // Default to string type
          text(footer-text, font: footer-font, size: footer-font-size)
        }
      })
    )
  } else {
    grid()
  }
}

/// Constructs page numbering display for multi-page letters (optional).
#let construct-page-numbering(number-pages: false) = {
  if number-pages {
    // Construct the page numbering grid
    grid(
      context(
        // Display the page number from the second page onwards
        if here().page() > 1 {
          counter(page).display("1")
        }
      )
    )
  } else {
    grid()
  }
}

/// Output Construction Module
///
/// This module provides layout and construction functions for various
/// letter components including footers, page numbering, signatures,
/// and enclosures. It handles the visual presentation and formatting
/// of these elements according to the letterloom specification.
///
/// Functions:
/// - construct-custom-footer: Creates footer grid
/// - construct-page-numbering: Handles page numbering display
/// - construct-signatures: Arranges signatures in a grid layout
/// - construct-enclosures: Formats enclosures as an enumerated list
///
/// All functions are designed to work with the main letterloom function
/// and provide consistent styling and spacing throughout the document.

/// Constructs a signature grid layout for one or more signatories.
///
/// Parameters:
/// - signatures: Array or single signature dictionary with name and optional signature fields
///
/// Layout:
/// - Arranges signatures in a grid with 3 signatures per row
/// - Each signature row contains signature image (top) and name (bottom)
/// - Empty cells are filled with blank space if row is not full
/// - Uses 40pt column gutter and 10pt row gutter for spacing
///
/// Returns:
/// - A grid layout containing all signatures with proper spacing and alignment
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
        align: left,
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

/// Constructs an enumerated list of enclosures.
///
/// Parameters:
/// - enclosures: Optional array or single enclosure string/content
/// - enclosures-title: Title text for the enclosures section (default: "encl:")
///
/// Behavior:
/// - If enclosures are provided, displays them as an enumerated list
/// - Uses 15pt indentation for the enumeration
/// - Handles both single enclosure and multiple enclosures
/// - If no enclosures provided, nothing is rendered
///
/// Returns:
/// - An enumerated list of enclosures with title, or nothing if no enclosures
#let construct-enclosures(enclosures: none, enclosures-title: "encl:") = {
  // Enclosures are optional
  if enclosures not in (none, ()) {
    set enum(indent: 15pt)
    enclosures-title

    if type(enclosures) != array {
      // Handle the case where only one enclosure is given
      enclosures = (enclosures, )
    }

    // Enclosures are displayed as an enumerated list
    for enclosure in enclosures {
      enum.item(text(enclosure))
    }
  }
}

/// Constructs a custom footer grid with specific styling for urls and emails.
///
/// Parameters:
/// - footer: Optional array or single footer dictionary with footer-text and optional footer-type
/// - footer-font: Font family for footer text (default: "DejaVu Sans Mono")
/// - footer-font-size: Font size for footer text (default: 7pt)
/// - link-color: Color for hyperlinks in footer (default: blue)
///
/// Footer types supported:
/// - "url": Creates a clickable link with the footer-text as URL
/// - "email": Creates a mailto link with the footer-text as email address
/// - "string": Renders footer-text as plain text (default)
///
/// Returns:
/// - A grid containing the footer elements, or an empty grid if no footer provided
#let construct-custom-footer(
  footer: none,
  footer-font: "DejaVu Sans Mono",
  footer-font-size: 7pt,
  link-color: blue
) = {
  // Create an empty grid to store the footer
  let custom-footer = grid()

  // Footers are optional
  if footer not in (none, ()) {
    // Handle the case where only one footer item is given
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

/// Constructs page numbering display for multi-page letters.
///
/// Parameters:
/// - number-pages: Boolean flag to enable/disable page numbering (default: false)
///
/// Behavior:
/// - If number-pages is true, displays page numbers starting from page 2
/// - If number-pages is false, returns an empty grid
///
/// Returns:
/// - A grid containing the page number display, or an empty grid if disabled
#let construct-page-numbering(number-pages: false) = {
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

/// letterloom Core Module
///
/// This module provides the main interface and layout logic for generating
/// professional letters using the letterloom package. It orchestrates
/// input validation, document structure, and formatting, and exposes the main
/// `letterloom` function for end users and templates.
///
#import "validate-inputs.typ": validate-inputs
#import "construct-outputs.typ": *

/// Generates a formatted letter according to the letterloom specification.
///
/// This function creates a complete letter document with proper formatting,
/// validation, and layout. It handles all aspects of letter generation from
/// input validation to final document structure.
///
/// ## Required Parameters
///
/// #doc: content - Main letter body content (positional parameter)
///
/// ## Contact Information
///
/// #from: dict - Sender's contact information
///   - #name: Required string or content (sender's name)
///   - #address: Required string or content (sender's address)
///
/// #to: dict - Recipient's contact information
///   - #name: Required string or content (recipient's name)
///   - #address: Required string or content (recipient's address)
///
/// ## Letter Content
///
/// #date: str | content - Letter date (e.g., "January 15, 2024")
/// #salutation: str | content - Opening greeting (e.g., "Dear Jane,")
/// #subject: str | content - Letter subject line
/// #closing: str | content - Closing phrase (e.g., "Sincerely,")
///
/// ## Optional Components
///
/// #signatures: array | dict - List of signatories or single signatory
///   - #name: Required string or content (signatory's name)
///   - #signature: Optional image or content (signature image)
///
/// #attn-line: dict | none - Optional attention line
///   - #name: Required string or content (attention recipient)
///   - #label: Optional string (defaults to "Attn:")
///   - #position: Optional string, "above" or "below" (defaults to "above")
///
/// #cc: dict | none - Optional cc recipients
///   - #cc-list: Required array of strings/content (cc recipients)
///   - #label: Optional string or content (defaults to "cc:")
///
/// #enclosures: dict | none - Optional enclosures
///   - #encl-list: Required array of strings/content (enclosure items)
///   - #label: Optional string or content (defaults to "encl:")
///
/// #footer: array | none - Optional footer information
///   - Array of footer dictionaries with #footer-text and #footer-type fields
///
/// ## Page and Document Settings
///
/// #paper-size: str - Paper size (default: "a4")
/// #margins: auto | length - Page margins (default: auto)
/// #number-pages: bool - Enable page numbering (default: false)
///
/// ## Typography Settings
///
/// #main-font: str - Main document font (default: "Libertinus Serif")
/// #main-font-size: length - Main font size (default: 11pt)
/// #footer-font: str - Footer font (default: "DejaVu Sans Mono")
/// #footer-font-size: length - Footer font size (default: 9pt)
/// #footnote-font: str - Footnote font (default: "Libertinus Serif")
/// #footnote-font-size: length - Footnote font size (default: 7pt)
///
/// ## Spacing and Layout
///
/// #par-leading: length - Space between lines in paragraphs (default: 0.8em)
/// #par-spacing: length - Space between paragraphs (default: 1.8em)
/// #from-alignment: alignment - Sender block alignment (default: right)
/// #footnote-alignment: alignment - Footnote alignment (default: left)
/// #link-color: color - Hyperlink color (default: blue)
///
/// ## Behavior
///
/// 1. **Input Validation**: All parameters are validated before processing
/// 2. **Document Setup**: Page settings, typography, and styling are configured
/// 3. **Layout Construction**: Letter components are arranged in standard format
/// 4. **Optional Elements**: CC, enclosures, footers, and page numbering are added if provided
/// 5. **Content Integration**: User-provided content is integrated into the letter structure
///
/// ## Error Handling
///
/// - Validation errors are thrown with descriptive messages
/// - Missing required fields result in clear error messages
/// - Invalid data types or formats are caught and reported
/// - Graceful handling of optional components
///
/// ## Returns
///
/// A fully formatted letter document ready for rendering with Typst.
///
#let letterloom(
  from: none,
  to: none,
  date: none,
  salutation: none,
  subject: none,
  closing: none,
  signatures: none,
  attn-line: none,
  cc: none,
  enclosures: none,
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
    attn-line: attn-line,
    cc: cc,
    enclosures: enclosures,
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

  // Attention line is optional construct it if it is given
  let attn = none
  let attn-position = none
  if attn-line not in (none, ()) {
    attn = attn-line.at("label", default: "Attn:") + " " + attn-line.at("name")
    attn-position = attn-line.at("position", default: "above")
  }

  // Receiver's name, address and optional attention line
  block[
    #v(5pt)
    #set align(left)
    #if attn-position == "above" {
      text(attn)
      linebreak()
    }
    #to.name
    #linebreak()
    #to.address
    #linebreak()
    #if attn-position == "below" {
      text(attn)
      linebreak()
    }
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
  construct-enclosures(enclosures: enclosures)
}

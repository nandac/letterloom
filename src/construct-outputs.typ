/// Output Construction Module
///
/// This module provides layout and construction functions for various
/// letter components including signatures, cc recipients, enclosures,
/// custom footers, and page numbering. It handles the visual presentation
/// and formatting of these elements according to the letterloom specification.
///
/// ## Module Organization
///
/// The module is organized into functional categories:
/// - **Signature Construction**: Grid layouts for multiple signatories
/// - **List Construction**: Enumerated lists for cc recipients and enclosures
/// - **Footer Construction**: Custom footer grids with link styling
/// - **Page Numbering**: Multi-page letter numbering display
///
/// ## Design Philosophy
///
/// All construction functions follow these principles:
/// - **Consistent Spacing**: Uses standardized gutters and margins
/// - **Flexible Input**: Handles both single items and arrays gracefully
/// - **Graceful Degradation**: Returns empty content when no data provided
/// - **Type Safety**: Validates input types and provides sensible defaults
/// - **Visual Hierarchy**: Maintains consistent typography and alignment
///
/// ## Usage Pattern
///
/// Construction functions are typically called by the main letterloom function
/// after input validation. They transform validated data structures into
/// properly formatted Typst content blocks.
///
/// #example
/// ```typ
/// #import "src/lib.typ": letterloom
///
/// #letterloom(
///   none,
///   from: (name: "John Doe", email: "john@example.com"),
///   to: (name: "Jane Smith", email: "jane@example.com"),
///   subject: "Test Letter",
///   closing: "Sincerely",
///   signatures: (
///     (name: "John Doe", signature: image("sig.png")),
///     (name: "Jane Smith"),
///   ),
///   cc: (cc-list: ("alice@example.com", "bob@example.com")),
///   enclosures: (encl-list: ("resume.pdf", "cover.pdf")),
/// )
/// ```

// =============================================================================
// SIGNATURE CONSTRUCTION
// =============================================================================

/// Constructs a signature grid layout for one or more signatories.
///
/// ## Parameters
///
/// #signatures: Array of signature dictionaries or single signature dictionary
///
/// Each signature dictionary should contain:
/// - #name: Required string or content block (the signatory's name)
/// - #signature: Optional signature image or content (defaults to empty rectangle)
///
/// ## Layout Behavior
///
/// - Arranges signatures in a grid with 3 signatures per row maximum
/// - Each signature row contains signature image (top) and name (bottom)
/// - Empty cells are filled with blank space if row is not full
/// - Uses 40pt column gutter and 10pt row gutter for consistent spacing
/// - Aligns signatures to the left with proper visual hierarchy
///
/// ## Input Handling
///
/// - Automatically converts single signature to array format
/// - Splits signatures into chunks of 3 for grid layout
/// - Creates a 2-row grid for each chunk (signature + name)
/// - Pads incomplete rows with blank space for visual consistency
///
/// ## Returns
///
/// A grid layout containing all signatures with proper spacing and alignment.
/// If no signatures provided, returns an empty grid.
///
/// ## Examples
///
/// ### Single Signature
/// ```typ
/// #let signature = (name: "John Doe", signature: image("john-sig.png"))
/// #construct-signatures(signature)
/// ```
///
/// ### Multiple Signatures
/// ```typ
/// #let signatures = (
///   (name: "John Doe", signature: image("john-sig.png")),
///   (name: "Jane Smith", signature: image("jane-sig.png")),
///   (name: "Bob Wilson", signature: image("bob-sig.png")),
///   (name: "Alice Brown", signature: image("alice-sig.png")),
/// )
/// #construct-signatures(signatures)
/// ```
///
/// ### Signature Without Image
/// ```typ
/// #let signature = (name: "John Doe")
/// #construct-signatures(signature)
/// ```
#let construct-signatures(signatures: none) = {
  let sigs-per-row = 3
  let blank-space = none

  // Handle the case where only one signature is given
  if type(signatures) != array {
    signatures = (signatures, )
  }

  grid(
    columns: 1,
    rows: auto,
    row-gutter: 10pt,
    align: start + horizon,
    ..signatures.chunks(sigs-per-row).map(sigs => {
      grid(
        columns: (1fr, ) * sigs-per-row,
        align: left,
        rows: 2,
        row-gutter: 10pt,
        column-gutter: 40pt,
        // Signature images row
        ..sigs.map(signatory =>
          signatory.at("signature", default: rect(height: 40pt, stroke: none))) +
          (blank-space, ) * (sigs-per-row - sigs.len()),
        // Names row
        ..sigs.map(signatory => signatory.name) +
          (blank-space, ) * (sigs-per-row - sigs.len()),
      )
    })
  )
}

// =============================================================================
// LIST CONSTRUCTION FUNCTIONS
// =============================================================================

/// Constructs an enumerated list of cc recipients.
///
/// ## Parameters
///
/// #cc: Optional dictionary with cc-list field and optional label field
///
/// The cc dictionary should contain:
/// - #cc-list: Required array of strings/content blocks (the cc recipients)
/// - #label: Optional string or content block (defaults to "cc:")
///
/// ## Behavior
///
/// - If cc recipients are provided, displays them as an enumerated list
/// - Uses 15pt indentation for the enumeration for visual hierarchy
/// - Handles both single recipient and array of recipients automatically
/// - If no cc recipients are provided, nothing is rendered
/// - Applies consistent typography and spacing
///
/// ## Input Normalization
///
/// - Converts single recipient to array format internally
/// - Validates cc-list field exists and is not empty
/// - Uses default label if none provided
///
/// ## Returns
///
/// An enumerated list of cc recipients with title, or nothing if no cc recipients.
///
/// ## Examples
///
/// ### Multiple Recipients
/// ```typ
/// #let cc = (
///   cc-list: ("alice@example.com", "bob@example.com", "charlie@example.com"),
///   label: "cc:",
/// )
/// #construct-cc(cc)
/// ```
///
/// ### Single Recipient
/// ```typ
/// #let cc = (
///   cc-list: "alice@example.com",
///   label: "cc:",
/// )
/// #construct-cc(cc)
/// ```
///
/// ### Custom Label
/// ```typ
/// #let cc = (
///   cc-list: ("alice@example.com", "bob@example.com"),
///   label: "carbon copy:",
/// )
/// #construct-cc(cc)
/// ```
#let construct-cc(cc: none) = {
  if cc not in (none, ()) {
    set enum(indent: 15pt)

    // Display the label
    cc.at("label", default: "cc:")

    // Get and normalize the cc-list
    let cc-list = cc.at("cc-list")
    if type(cc-list) != array {
      cc-list = (cc-list, )
    }

    // Display each recipient as an enumerated item
    for cc-recipient in cc-list {
      enum.item(text(cc-recipient))
    }
  }
}

/// Constructs an enumerated list of enclosures.
///
/// ## Parameters
///
/// #enclosures: Optional dictionary with encl-list field and optional label field
///
/// The enclosures dictionary should contain:
/// - #encl-list: Required array of strings/content blocks (the enclosure items)
/// - #label: Optional string or content block (defaults to "encl:")
///
/// ## Behavior
///
/// - If enclosures are provided, displays them as an enumerated list
/// - Uses 15pt indentation for the enumeration for visual hierarchy
/// - Handles both single item and array of items automatically
/// - If no enclosures provided, nothing is rendered
/// - Applies consistent typography and spacing
///
/// ## Input Normalization
///
/// - Converts single item to array format internally
/// - Validates items field exists and is not empty
/// - Uses default label if none provided
///
/// ## Returns
///
/// An enumerated list of enclosures with title, or nothing if no enclosures.
///
/// ## Examples
///
/// ### Multiple Items
/// ```typ
/// #let enclosures = (
///   encl-list: ("resume.pdf", "cover-letter.pdf", "references.pdf"),
///   label: "encl:",
/// )
/// #construct-enclosures(enclosures)
/// ```
///
/// ### Single Item
/// ```typ
/// #let enclosures = (
///   encl-list: "resume.pdf",
///   label: "encl:",
/// )
/// #construct-enclosures(enclosures)
/// ```
///
/// ### Custom Label
/// ```typ
/// #let enclosures = (
///   encl-list: ("resume.pdf", "cover-letter.pdf"),
///   label: "encl:",
/// )
/// #construct-enclosures(enclosures)
/// ```
#let construct-enclosures(enclosures: none) = {
  if enclosures not in (none, ()) {
    set enum(indent: 15pt)

    // Display the label
    enclosures.at("label", default: "encl:")

    // Get and normalize the items
    let items = enclosures.at("encl-list")
    if type(items) != array {
      items = (items, )
    }

    // Display each item as an enumerated item
    for item in items {
      enum.item(text(item))
    }
  }
}

// =============================================================================
// FOOTER CONSTRUCTION
// =============================================================================

/// Constructs a custom footer grid with specific styling for urls and emails.
///
/// ## Parameters
///
/// #footer: Array of footer dictionaries or single footer dictionary
/// #footer-font: Font family for footer text (default: "DejaVu Sans Mono")
/// #footer-font-size: Font size for footer text (default: 7pt)
/// #link-color: Color for hyperlinks in footer (default: blue)
///
/// Each footer dictionary should contain:
/// - #footer-text: Required string or content block (the footer content)
/// - #footer-type: Optional string, one of "url", "email", or "string" (defaults to "string")
///
/// ## Footer Types
///
/// - **"url"**: Creates a clickable link with the footer-text as URL
/// - **"email"**: Creates a mailto link with the footer-text as email address
/// - **"string"**: Renders footer-text as plain text (default)
///
/// ## Behavior
///
/// - Creates a grid with one row and columns equal to the number of footer items
/// - Applies different styling based on footer-type for proper visual distinction
/// - Uses 20pt gutter between footer elements for consistent spacing
/// - Returns empty grid if no footer provided
/// - Automatically converts single footer item to array format
///
/// ## Styling
///
/// - Uses monospace font for consistent alignment and professional appearance
/// - Applies link color to clickable elements (urls and emails)
/// - Maintains consistent font size across all footer elements
///
/// ## Returns
///
/// A grid containing the footer elements with proper styling, or an empty grid if no footer provided.
///
/// ## Examples
///
/// ### Mixed Footer Types
/// ```typ
/// #let footer = (
///   (footer-text: "https://example.com", footer-type: "url"),
///   (footer-text: "contact@example.com", footer-type: "email"),
///   (footer-text: "© 2024 Company", footer-type: "string"),
/// )
/// #construct-custom-footer(footer)
/// ```
///
/// ### Single Footer Item
/// ```typ
/// #let footer = (footer-text: "https://example.com", footer-type: "url")
/// #construct-custom-footer(footer)
/// ```
///
/// ### Custom Styling
/// ```typ
/// #let footer = (
///   (footer-text: "contact@example.com", footer-type: "email"),
///   (footer-text: "© 2024 Company", footer-type: "string"),
/// )
/// #construct-custom-footer(
///   footer,
///   footer-font: "Times New Roman",
///   footer-font-size: 8pt,
///   link-color: red,
/// )
/// ```
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

    grid(
      columns: footer.len(),
      rows: 1,
      gutter: 20pt,
      ..footer.map(footer-item => {
        let footer-type = footer-item.at("footer-type", default: "string")
        let footer-text = footer-item.at("footer-text")

        if footer-type == "url" {
          text(
            link(footer-text),
            font: footer-font,
            size: footer-font-size,
            fill: link-color
          )
        } else if footer-type == "email" {
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

// =============================================================================
// PAGE NUMBERING CONSTRUCTION
// =============================================================================

/// Constructs page numbering display for multi-page letters.
///
/// ## Parameters
///
/// #number-pages: Boolean flag to enable/disable page numbering (default: false)
///
/// ## Behavior
///
/// - If number-pages is true, displays page numbers starting from page 2
/// - If number-pages is false, returns an empty grid
/// - Uses Typst's built-in page counter for automatic numbering
/// - Only shows page numbers on pages after the first page
///
/// ## Page Numbering Logic
///
/// - Page 1 (first page) never shows a page number
/// - Page 2 and subsequent pages show their respective page numbers
/// - Uses Arabic numerals (1, 2, 3, etc.) for page numbering
/// - Integrates with Typst's page counter system
///
/// ## Returns
///
/// A grid containing the page number display, or an empty grid if disabled.
///
/// ## Examples
///
/// ### Enable Page Numbering
/// ```typ
/// #construct-page-numbering(true)
/// ```
///
/// ### Disable Page Numbering
/// ```typ
/// #construct-page-numbering(false)
/// ```
///
/// ### In Letter Context
/// ```typ
/// #letterloom(
///   none
///   from: (name: "John Doe"),
///   to: (name: "Jane Smith"),
///   subject: "Long Letter",
///   closing: "Sincerely",
///   // ... other fields ...
///   number-pages: true,
/// )
/// ```
#let construct-page-numbering(number-pages: false) = {
  if number-pages {
    grid(
      context(
        if here().page() > 1 {
          counter(page).display("1")
        }
      )
    )
  } else {
    grid()
  }
}

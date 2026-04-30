/// Output Construction Module
///
/// This module provides layout and construction functions for all letter
/// components: letterhead, sender, date, recipient, salutation, subject,
/// closing, signatures, cc, enclosures, custom footers, and page numbering.

/// Places the letterhead flush with (or inset from) the physical page edges on
/// page 1. Inline place with negative dx/dy escapes the margin box; a
/// compensating v() pushes the sender block below the image.
///
/// - letterhead (none or dictionary): A dictionary with the following keys:
///   - file (bytes, required): Bytes loaded via read("path", encoding: none).
///   - width (auto, length, ratio, or relative, optional): Image width. Defaults
///     to auto, filling the full page width minus any margin.
///   - height (length, optional): Image height. Defaults to auto (proportional).
///   - margin (length or dictionary, optional): Inset from each page edge.
///     Accepts shorthand keys: top, bottom, left, right, x, y, rest.
///   - alignment (alignment, optional): One of left, center, or right.
///     Defaults to center.
/// -> content
#let construct-letterhead(letterhead: none) = {
  if letterhead != none {
    // context{} gives access to page.margin and par.spacing at layout time
    context {
      let m = page.margin
      let ps = par.spacing

      // page.margin is auto when not explicitly set; Typst computes it as
      // 2.5/21 of the page's shorter dimension (2.5 cm for A4, ~2.57 cm for US letter)
      let default-m = 2.5 / 21 * calc.min(page.width, page.height)

      // Extract just the top and left margins — needed to shift the image back
      // to the physical page edge via place()'s dx/dy offsets
      let top-m = if m == auto { default-m } else if type(m) == dictionary { m.top } else { m }
      let left-m = if m == auto { default-m } else if type(m) == dictionary { m.left } else { m }

      // Unpack the user-supplied letterhead dictionary
      let lh-image = letterhead.file
      let lh-width = letterhead.at("width", default: auto)
      let lh-height = letterhead.at("height", default: auto)
      let lh-margin = letterhead.at("margin", default: none)
      let lh-alignment = letterhead.at("alignment", default: center)

      // Normalise lh-margin into a per-side dictionary (lhm) regardless of
      // whether the user supplied none, a single length, or a per-side dict.
      // The lookup order for each side is: explicit side key → axis key (x/y) → rest → 0pt
      let lhm = if lh-margin == none {
        (top: 0pt, bottom: 0pt, left: 0pt, right: 0pt)
      } else if type(lh-margin) == length {
        (top: lh-margin, bottom: lh-margin, left: lh-margin, right: lh-margin)
      } else {
        let fallback = lh-margin.at("rest", default: 0pt)
        (
          top: lh-margin.at("top", default: lh-margin.at("y", default: fallback)),
          bottom: lh-margin.at("bottom", default: lh-margin.at("y", default: fallback)),
          left: lh-margin.at("left", default: lh-margin.at("x", default: fallback)),
          right: lh-margin.at("right", default: lh-margin.at("x", default: fallback)),
        )
      }

      // layout() resolves page.width to a plain length so that arithmetic with
      // the lhm values (also plain lengths) never produces a relative type
      layout(_ => {
        // Drawable width between the letterhead's own left and right margins
        let available = page.width - lhm.left - lhm.right

        // Resolve the user's width spec (auto / ratio / relative / plain length)
        // to a concrete pixel-equivalent length
        let img-width = if lh-width == auto {
          available
        } else if type(lh-width) == ratio {
          lh-width * available
        } else if type(lh-width) == relative {
          lh-width.ratio * available + lh-width.length
        } else {
          lh-width
        }

        // Build the image element; omit height so Typst scales it proportionally
        // unless the user explicitly provided one
        let lh-img = if lh-height == auto {
          image(lh-image, width: img-width)
        } else {
          image(lh-image, width: img-width, height: lh-height)
        }

        // Measure the rendered image height so we can compute the vertical advance below
        let lh-img-height = measure(lh-img).height

        // Compute the horizontal offset (dx) from the content area's left edge
        // back to where the image should start on the physical page.
        // -left-m moves to the physical left edge; lhm.left re-applies the
        // letterhead's own left margin; the alignment term shifts within the remainder.
        let dx = if lh-alignment == center {
          -left-m + lhm.left + (available - img-width) / 2
        } else if lh-alignment == right {
          -left-m + lhm.left + available - img-width
        } else {
          -left-m + lhm.left // left alignment
        }

        // Place the image absolutely at the top-left of the physical page,
        // shifted inward by the letterhead's own margins (dy = -top-m + lhm.top)
        place(top + left, dx: dx, dy: -top-m + lhm.top, lh-img)

        // Emit vertical space so body content starts below the letterhead.
        // advance = how far the letterhead extends below the content area's top edge.
        // Subtracting ps cancels the par.spacing Typst would otherwise add between
        // this block and the next (construct-sender).
        // When advance <= 0pt the letterhead fits entirely inside the page margin,
        // so we only need to cancel par.spacing.
        let advance = lh-img-height + lhm.top + lhm.bottom - top-m
        v(if advance > 0pt { advance - ps } else { -ps })
      })
    }
  }
}

/// Constructs the sender name and address block.
///
/// - from-name (none, str, or content): Sender's name.
/// - from-address (none, str, or content): Sender's address.
/// - from-alignment (alignment): Horizontal alignment of the block.
/// -> content
#let construct-sender(from-name: none, from-address: none, from-alignment: right) = {
  if from-name != none or from-address != none {
    align(from-alignment, block[
      // The outer align() positions the block on the page; reset text alignment
      // inside so multi-line addresses always read left-to-right within the block
      // (center stays center; left and right both use left for the internal text)
      #set align(if from-alignment == center { center } else { left })
      #if from-name != none {
        from-name
        // Insert a line break between name and address only when both are present
        if from-address != none { linebreak() }
      }
      #if from-address != none { from-address }
    ])
  }
}

/// Constructs the date block.
///
/// When date-alignment matches from-alignment and a sender block is present,
/// the date block is sized to the sender block's width so their left edges align.
///
/// - date (none, str, or content): The letter date.
/// - date-alignment (alignment): Horizontal alignment of the date.
/// - from-alignment (alignment): Alignment used for the sender block.
/// - from-name (none, str, or content): Sender name, used for width matching.
/// - from-address (none, str, or content): Sender address, used for width matching.
/// -> content
#let construct-date(
  date: none,
  date-alignment: right,
  from-alignment: right,
  from-name: none,
  from-address: none,
) = {
  if date != none {
    if date-alignment == from-alignment and (from-name != none or from-address != none) {
      // When the date shares the same alignment side as the sender block, constrain
      // the date block to the sender block's width so their left edges line up.
      // context{} is required to call measure() at layout time.
      context {
        // Reconstruct the sender content just for measurement — not rendered here
        let from-content = if from-name != none and from-address != none {
          block[#from-name #linebreak() #from-address]
        } else if from-name != none {
          block[#from-name]
        } else {
          block[#from-address]
        }
        let from-width = measure(from-content).width
        align(date-alignment, block(width: from-width)[
          // Mirror the same inner alignment rule used in construct-sender
          #set align(if date-alignment == center { center } else { left })
          #v(0.2em) // Small visual gap between block top and date text
          #date
        ])
      }
    } else {
      // Alignments differ — no width matching needed, just place the date block
      align(date-alignment, block[
        #set align(if date-alignment == center { center } else { left })
        #v(0.2em)
        #date
      ])
    }
  }
}

/// Constructs the recipient block with name, address, and optional attention line.
///
/// - to-name (none, str, or content): Recipient's name.
/// - to-address (none, str, or content): Recipient's address.
/// - attn-name (none, str, or content): Attention recipient name.
/// - attn-label (str or content): Label prepended to the attention name.
/// - attn-position (str): "above" or "below" the recipient address.
/// -> content
#let construct-recipient(
  to-name: none,
  to-address: none,
  attn-name: none,
  attn-label: "Attn:",
  attn-position: "above",
) = {
  // Pre-build the attention line string; none when attn-name is absent
  let attn = if attn-name != none { attn-label + " " + attn-name } else { none }

  if to-name != none or to-address != none or attn != none {
    block[
      #v(0.5em) // Visual gap above the recipient block; em-based so it scales with main-font-size
      #set align(left) // Recipient address always left-aligned regardless of page layout
      // "above" position: attention line precedes the name and address
      #if attn-position == "above" and attn != none {
        text(attn)
        linebreak()
      }
      #if to-name != none {
        to-name
        // Insert a line break after the name only when more content follows below it
        if to-address != none or (attn-position == "below" and attn != none) { linebreak() }
      }
      #if to-address != none {
        to-address
        // Insert a line break after the address only when the attn line comes below
        if attn-position == "below" and attn != none { linebreak() }
      }
      // "below" position: attention line follows the name and address
      #if attn-position == "below" and attn != none {
        text(attn)
      }
    ]
  }
}

/// Constructs the salutation line.
///
/// - salutation (none, str, or content): The opening greeting.
/// -> content
#let construct-salutation(salutation: none) = {
  if salutation != none {
    v(0.5em) // Gap above the salutation to visually separate it from the subject line; em-based
    text(salutation)
    linebreak()
    v(0.5em) // Gap below the salutation before the letter body begins; em-based
  }
}

/// Constructs the subject line.
///
/// - subject (none, str, or content): The letter subject.
/// -> content
#let construct-subject(subject: none) = {
  if subject != none {
    text(subject)
  }
}

/// Constructs the closing line.
///
/// - closing (none, str, or content): The closing phrase.
/// -> content
#let construct-closing(closing: none) = {
  if closing != none {
    v(0.5em) // Gap above the closing phrase to separate it from the letter body; em-based
    text(closing)
  }
}

/// Constructs a signature grid layout for one or more signatories.
///
/// Signatures are packed into rows of up to three columns using a greedy
/// algorithm. For each signature the width of its widest line (name, title, or
/// affiliation) is measured at layout time. Signatures are added to the current
/// row as long as the total row width — the sum of measured widths plus one
/// gutter between each adjacent pair — does not exceed the available content
/// width and the row has fewer than three signatures. When a signature does not
/// fit, a new row is started. `signature-alignment` applies only to rows that
/// contain a single signature; rows with multiple signatures are left-aligned.
///
/// Each signature dictionary must contain:
/// - `name` (str or content, required): The signatory's display name.
/// - `affiliation` (str or content, optional): Any text to display below the
///   name — title, role, organization, or a combination.
/// - `signature` (content, optional): Signature image, typically an `image`.
///   When omitted, a blank space of fixed height is reserved for a
///   physical signature.
///
/// - signatures (array): One or more signature dictionaries. A single
///   dictionary is accepted and normalized to a one-element array internally.
/// - signature-alignment (alignment): Horizontal alignment applied only when
///   a row contains exactly one signature.
/// -> content
#let construct-signatures(signatures: none, signature-alignment: left) = {
  let col-gutter = 40pt

  // Normalize a single dictionary to a one-element array
  if type(signatures) != array {
    signatures = (signatures,)
  }

  // context{} gives access to page.margin; layout() resolves page.width to a
  // plain length so arithmetic with margin values never produces a relative type
  context {
    let m = page.margin
    // page.margin is auto when not set; Typst computes it as 2.5/21 of the
    // shorter page dimension (2.5 cm for A4, ~2.57 cm for US letter)
    let default-m = 2.5 / 21 * calc.min(page.width, page.height)
    let left-m = if m == auto { default-m } else if type(m) == dictionary { m.left } else { m }
    let right-m = if m == auto { default-m } else if type(m) == dictionary { m.right } else { m }

    layout(_ => {
      // Total width available for signature columns including gutters
      let available = page.width - left-m - right-m

      // Measure each signature's natural width as the widest of its text lines.
      // [#item] wraps both str and content uniformly for measure().
      let sig-widths = signatures.map(sig => {
        let items = (sig.name,)
        let affiliation = sig.at("affiliation", default: none)
        if affiliation != none { items.push(affiliation) }
        items.map(item => measure([#item]).width).fold(0pt, calc.max)
      })

      // Also measure the actual signature image widths to ensure they fit
      let img-widths = signatures.map(sig => {
        let sig-content = sig.at("signature", default: rect(height: 40pt, stroke: none))
        measure(sig-content).width
      })

      // Column widths during bin-packing use the max of text and image width
      // This ensures the bin-packing doesn't pack more than will actually fit
      let col-actual-widths = sig-widths.zip(img-widths).map(((tw, iw)) => calc.max(tw, iw))

      // Greedy bin-packing: add each signature to the current row when
      // row-width + gutter + new-width <= available and row has < 3 sigs;
      // otherwise flush the current row and start a new one.
      // A signature wider than the full available width still gets its own row.
      let rows = ()
      let current-row = ()
      let current-width = 0pt

      for (sig, w) in signatures.zip(col-actual-widths) {
        if current-row.len() == 0 {
          // Always place the first signature of a new row unconditionally
          current-row.push(sig)
          current-width = w
        } else if current-row.len() < 3 and current-width + col-gutter + w <= available * 1.05 {
          // Fits: add to current row; row total grows by gutter + new width.
          // The 5% tolerance on available accounts for leading whitespace in
          // content blocks that measure() includes, slightly inflating widths.
          current-row.push(sig)
          current-width = current-width + col-gutter + w
        } else {
          // Does not fit: flush current row and start a new one
          rows.push(current-row)
          current-row = (sig,)
          current-width = w
        }
      }
      // Flush the final row
      if current-row.len() > 0 { rows.push(current-row) }

      // Outer grid: one entry per packed row
      grid(
        columns: 1,
        rows: auto,
        row-gutter: 1em,
        align: left,
        ..rows.map(row => {
          let n = row.len()

          // Get the column widths for this row (already measured to be max of text + image)
          let row-col-widths = row.map(sig => {
            let idx = signatures.position(s => s.name == sig.name)
            col-actual-widths.at(idx)
          })

          // Measure image heights using their natural, unconstrained size
          let max-img-height = row.map(sig => {
            let sig-content = sig.at("signature", default: rect(height: 40pt, stroke: none))
            measure(sig-content).height
          }).fold(0pt, calc.max)

          grid(
            columns: row-col-widths,
            // top + left prevents shorter cells from being vertically centred,
            // which would leave apparent space where a missing field would be
            align: if n == 1 { signature-alignment + top } else { top + left },
            column-gutter: col-gutter,
            ..row.map(signatory => {
              let affiliation = signatory.at("affiliation", default: none)
              // Build the text items: name always present, affiliation only
              // when non-empty so no blank line is left for absent fields
              let text-items = (signatory.name,)
              if affiliation not in (none, "", []) { text-items.push(affiliation) }
              // Image box uses 100% to fill the column, which is now guaranteed
              // to be at least as wide as the signature's natural width, preventing
              // squeezing while allowing text to display without wrapping
              stack(
                spacing: 1em,
                box(width: 100%, height: max-img-height, signatory.at("signature", default: rect(height: 40pt, stroke: none))),
                stack(spacing: 1em, ..text-items),
              )
            }),
          )
        })
      )
    })
  }
}

/// Constructs a labelled list of carbon copy recipients.
///
/// A single recipient (str or content) is accepted and normalized to a
/// one-element array internally. When exactly one recipient is given, it is
/// rendered as an undecorated list item. When multiple recipients are given,
/// they are rendered as an enumerated list. Passing `none` suppresses the
/// section entirely.
///
/// - cc (none, str, content, or array): One or more cc recipients.
/// - cc-label (str or content): Label displayed before the recipient list.
/// -> content
#let construct-cc(cc: none, cc-label: "cc:") = {
  if cc != none {
    // Hoist the indent setting so it applies to all enum items emitted in this block
    set enum(indent: 1.4em)

    v(0.5em) // Gap above the cc section; em-based so it scales with main-font-size

    // Display the label
    cc-label

    // Normalize a single string/content value to a one-element array
    if type(cc) != array {
      cc = (cc,)
    }

    if cc.len() == 1 {
      // Single recipient: use a list with an empty marker to get the indent
      // without a bullet point or number
      set list(indent: 1.4em, marker: "")
      list.item(text(cc.first()))
    } else {
      // Multiple recipients: numbered enumerated list
      for cc-recipient in cc {
        enum.item(text(cc-recipient))
      }
    }
  }
}

/// Constructs a labelled list of enclosures and embeds attached files.
///
/// The enclosure list is rendered first, followed by each file attachment on
/// its own page. A single enclosure dictionary is accepted and normalized to a
/// one-element array internally. When exactly one enclosure is given, it is
/// rendered as an undecorated list item. When multiple enclosures are given,
/// they are rendered as an enumerated list. Passing `none` suppresses the
/// section entirely.
///
/// Each enclosure dictionary must contain:
/// - `description` (str or content, required): Label shown in the enclosure
///   list.
/// - `file` (bytes, optional): File content loaded via
///   `read("path", encoding: none)`. When present, the file is rendered on a
///   dedicated page after the letter body.
/// - `pages` (int, optional): Number of pages to render starting from page 1.
///   Defaults to `1`.
/// - `margin` (length or dictionary, optional): Page margin for the embedded
///   file. Defaults to `0mm` on all sides when omitted.
///
/// - enclosures (none or array): One or more enclosure dictionaries.
/// - enclosures-label (str or content): Label displayed before the enclosure
///   list.
/// -> content
#let construct-enclosures(enclosures: none, enclosures-label: "encl:") = {
  if enclosures != none {
    // Hoist the indent setting so it applies to all enum items emitted in this block
    set enum(indent: 1.4em)

    v(0.5em) // Gap above the enclosures section; em-based so it scales with main-font-size

    // Display the label
    enclosures-label

    // Normalize a bare dictionary to a one-element array
    if type(enclosures) != array {
      enclosures = (enclosures,)
    }

    // Single enclosure: undecorated list item; multiple: enumerated list
    if enclosures.len() == 1 {
      set list(indent: 1.4em, marker: "")
      list.item(text(enclosures.first().description))
    } else {
      for enclosure in enclosures {
        enum.item(text(enclosure.description))
      }
    }

    // Render each attached file on its own page after the letter body
    for enclosure in enclosures {
      let file = enclosure.at("file", default: none)
      if file != none {
        let raw-margin = enclosure.at("margin", default: 0mm)
        // Expand shorthand keys so every side is explicit — prevents unspecified
        // sides from inheriting the outer letter page margins
        let margin = if type(raw-margin) == dictionary {
          let fallback = raw-margin.at("rest", default: 0mm)
          (
            top: raw-margin.at("top", default: raw-margin.at("y", default: fallback)),
            bottom: raw-margin.at("bottom", default: raw-margin.at("y", default: fallback)),
            left: raw-margin.at("left", default: raw-margin.at("x", default: fallback)),
            right: raw-margin.at("right", default: raw-margin.at("x", default: fallback)),
          )
        } else { raw-margin }
        let page-count = enclosure.at("pages", default: 1)
        {
          // Scoped set page so only the attachment pages use this margin,
          // not the letter pages
          set page(margin: margin)
          for i in range(1, page-count + 1) {
            image(file, page: i, width: 100%)
            // Insert a page break between pages; omit after the last to avoid a blank page
            if i < page-count { pagebreak() }
          }
        }
      }
    }
  }
}

/// Constructs a centred footer grid with styled URL and email hyperlinks.
///
/// Each footer element is rendered in a single-row grid with equal column
/// widths separated by a fixed gutter. URL and email entries are rendered as
/// clickable hyperlinks in `link-color`; all other entries are rendered as
/// plain text. Passing `none` or an empty array returns an empty grid
/// placeholder so that the footer area remains consistent.
///
/// Each footer element dictionary must contain:
/// - `footer-text` (str or content, required): The text to display.
/// - `footer-type` (str, optional): One of `"url"`, `"email"`, or
///   `"string"`. URL and email values are wrapped in a `link`. Defaults to
///   `"string"`.
///
/// - footer (none or array): One or more footer element dictionaries. A single
///   dictionary is accepted and normalized to a one-element array internally.
/// - footer-font (str): Font family applied to all footer text.
/// - footer-font-size (length): Font size applied to all footer text.
/// - link-color (color): Fill color applied to hyperlinked footer entries.
/// -> content
#let construct-custom-footer(
  footer: none,
  footer-font: "DejaVu Sans Mono",
  footer-font-size: 9pt,
  link-color: blue,
) = {
  // `not in (none, ())` handles both a missing footer and an explicitly empty array
  if footer not in (none, ()) {
    // Normalize a single dictionary to a one-element array
    if type(footer) != array {
      footer = (footer,)
    }

    // Equal-width columns, one per item, separated by a fixed gutter
    grid(
      columns: footer.len(),
      rows: 1,
      gutter: 20pt,
      ..footer.map(footer-item => {
        let footer-type = footer-item.at("footer-type", default: "string")
        let footer-text = footer-item.at("footer-text")

        if footer-type == "url" {
          // link() with a single string argument uses the string as both
          // the href and the visible display text
          text(
            link(footer-text),
            font: footer-font,
            size: footer-font-size,
            fill: link-color,
          )
        } else if footer-type == "email" {
          // Prepend the mailto: scheme so the OS opens the default mail client
          text(
            link("mailto:" + footer-text),
            font: footer-font,
            size: footer-font-size,
            fill: link-color,
          )
        } else {
          // Plain string — no hyperlink
          text(footer-text, font: footer-font, size: footer-font-size)
        }
      })
    )
  } else {
    // Return an empty grid so the footer row height is consistent whether
    // or not a custom footer is provided
    grid()
  }
}

/// Constructs a page number display shown from the second page onwards.
///
/// When `number-pages` is `true`, the current page number is rendered using
/// the default Arabic numeral style on every page after the first. When
/// `number-pages` is `false`, an empty grid placeholder is returned so that
/// the footer layout remains consistent regardless of whether numbering is
/// enabled.
///
/// - number-pages (bool): When `true`, page numbers are displayed from the
///   second page onwards.
/// -> content
#let construct-page-numbering(number-pages: false) = {
  if number-pages {
    grid(
      context(
        // Suppress the number on page 1 — the letter heading already makes
        // it clear which page is first
        if here().page() > 1 {
          // display("1") renders the counter in Arabic numerals
          counter(page).display("1")
        }
      )
    )
  } else {
    // Return an empty grid placeholder so the footer layout is consistent
    // regardless of whether page numbering is enabled
    grid()
  }
}

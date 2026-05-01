#import "@preview/letterloom:3.0.0": *
#import "highlight-type.typ": highlight-type

// Global Styles
#set page(margin: 25mm)
#set text(size: 11pt, font: "Libertinus Serif")
#set par(spacing: 1.5em)
#set strong(delta: 200)

// Customize appearance
#show raw: set text(font: "DejaVu Sans Mono")
#show raw.where(block: true): set block(fill: rgb("#faebd7"), inset: 1em, radius: 0.5em, width: 100%)
#show link: set text(fill: blue)

// Text Element configuration
#show heading.where(level: 1): h1 => {
  set block(above: 2em, below: 1.5em)
  set text(weight: "bold")
  h1
}

#show heading.where(level: 2): h2 => {
  set block(above: 2em, below: 1.5em)
  set text(weight: "bold")
  h2
}

#show heading.where(level: 3): h3 => {
  set block(above: 2em, below: 1.5em)
  set text(weight: "bold")
  h3
}

// Table and figure configuration
#show table.header: set text(weight: "bold")
#show figure: set block(breakable: true)

// End of setup

// Shared demo data used across inline parameter previews
#let _dn = "The Dimbleby Family"
#let _da = [The Dimbleby Estate \ Bristol BS16 1GU]
#let _dd = "01 January 1970"

// Grey placeholder bar representing a single line of text
#let _ph(w: 60%, h: 2.5mm) = rect(width: w, height: h, fill: luma(215), stroke: none, radius: 1pt)

// Taller grey placeholder representing a body paragraph
#let _body-ph = rect(width: 100%, height: 4.5mm, fill: luma(215), stroke: none, radius: 1pt)

// Renders letter constructs at reduced scale inside a framed preview box
#let lp(width: 82mm, factor: 55%, leading: 0.8em, spacing: 1.8em, body) = box(
  stroke: 0.5pt + luma(170),
  radius: 3pt,
  inset: 0pt,
  clip: true,
  scale(
    factor,
    reflow: true,
    block(
      width: width,
      inset: (x: 6mm, y: 5mm),
      {
        set text(font: "Libertinus Serif", size: 11pt)
        set par(leading: leading, spacing: spacing)
        set align(left)
        body
      }
    )
  )
)

// Focused preview box: renders one parameter's value at full width.
#let _preview(body) = block(
  width: 100%,
  breakable: false,
  fill: luma(250),
  stroke: 0.5pt + luma(180),
  radius: 3pt,
  inset: (x: 8mm, y: 5mm),
  {
    set text(font: "Libertinus Serif", size: 11pt)
    set par(leading: 0.8em, spacing: 1.8em)
    body
  }
)

= `letterloom v3.0.0`

Meet `letterloom`, a highly customizable and user-friendly template designed to streamline the creation of professional correspondence. Whether you are drafting a formal business proposal or a personal note, `letterloom` ensures your letters are consistently polished, elegant, and tailored to your exact preferences.

== Key Features

- *Multiple Signatures:* Seamlessly support single or multiple signatures, complete with optional titles and affiliations.

- *Custom Letterheads:* Easily integrate branded letterheads with flexible layout and positioning options.

- *Smart Enclosures:* List attached documents within the letter, and optionally embed them as appended pages.

- *Customizable Labels:* Fully adapt labels and text to suit your needs.

- *Configurable Fields:* Gain complete control over your document structure—every required field can be toggled as optional.

== How It Works

Out of the box, `letterloom` adheres to the strict conventions of formal English business correspondence, intelligently structuring the sender address, date, recipient, subject, body, closing, and signatures. However, it also grants you ultimate control over typography, alignment, and optional elements.

The package handles all vertical spacing, page geometry, and letterhead placement automatically. This ensures a flawless, consistent layout regardless of your content's length or the paper size used.

== Requirements

Typst 0.14.0 or higher is required to use this package.

== Usage

Each parameter is documented below with its type, default value, and usage.

=== Getting Started

To create a new `letterloom` project run the following command in your terminal:

```bash
typst init @preview/letterloom:3.0.0
```

Alternatively, you may create a new project directly in the #link("https://typst.app/app?template=letterloom&version=3.0.0")[Typst webapp].

For a full-featured example see the #link(label("comprehensive-example"))[Comprehensive Example] section.

=== Required Parameters

All the fields below are required by default. To omit any of them, see the #link(<required-fields>)[`required-fields`] parameter.

#v(5pt)

*`from-name`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)

The sender's name.

#text(size: 10pt)[*Examples:*]
```typ
// String
from-name: "The Dimbleby Family"
```

#_preview(align(right)[The Dimbleby Family])

```typ
// Content block
from-name: text(weight: "bold")[The Dimbleby Family]
```

#_preview(align(right, text(weight: "bold")[The Dimbleby Family]))


#v(5pt)

*`from-address`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)

The sender's address.

#v(10pt)

#text(size: 10pt)[*Examples:*]
```typ
// String
from-address: "The Dimbleby Estate"
```

#_preview(align(right, [The Dimbleby Estate]))


```
// Content block
from-address: [
  The Dimbleby Estate \
  Cheswick Village \
  Middle Upton \
  Bristol BS16 1GU
]
```

#_preview(align(right, block[
  #set align(left)
  The Dimbleby Estate \
  Cheswick Village \
  Middle Upton \
  Bristol BS16 1GU
]))

*Note:* By default, the sender's name and address are right-aligned. You may change this using the #link(<from-alignment>)[`from-alignment`] parameter.

#v(5pt)

*`to-name`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)

The recipient's name.

#text(size: 10pt)[*Examples:*]
```typ
// String
to-name: "Evergreen Tree Surgeons"
```

#_preview[
  Evergreen Tree Surgeons
]

```
// Content block
to-name: text(weight: "bold")[Evergreen Tree Surgeons]
```

#_preview[
  #text(weight: "bold")[Evergreen Tree Surgeons]
]

#v(5pt)

*`to-address`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)

The recipient's address.

#text(size: 10pt)[*Examples:*]
```typ
// String
to-address: "Midtown Lane"
```

#_preview[
  Midtown Lane
]

```
// Content block
to-address: [
  Midtown Lane \
  Cheswick Village \
  Stoke Gifford \
  Bristol BS16 1GU
]
```

#_preview(align(left, block[
  #set align(left)
  Midtown Lane \
  Cheswick Village \
  Stoke Gifford \
  Bristol BS16 1GU
]))

#v(5pt)

*`date`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

The letter's date.

#text(size: 10pt)[*Examples:*]
```typ
// Simple string format
date: "01 January 1970"
```

#_preview[
  #align(right)[01 January 1970]
]

```
// Dynamic date using Typst's datetime functions
date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]")
```

#_preview[
  #align(right)[#datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]")]
]

*Note:* By default, the letter's date is right-aligned. You may change this using the #link(<date-alignment>)[`date-alignment`] parameter.

For custom formatting options, refer to #link("https://typst.app/docs/reference/foundations/datetime/#format")[Typst's datetime formatting documentation].

#v(5pt)

*`salutation`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

The opening greeting.

#text(size: 10pt)[*Examples:*]
```typ
// Standard business greeting
salutation: "Dear Mr Hawthorne,"
```

#_preview[
  Dear Mr Hawthorne,
]

```
// Styled salutation with formatting
salutation: text(weight: "bold")[Dear Mr Hawthorne,]
```

#_preview[
  #text(weight: "bold")[Dear Mr Hawthorne,]
]

#v(5pt)

*`subject`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

The subject line.

#text(size: 10pt)[*Examples:*]
```typ
// Simple subject
subject: "Pruning of Heritage Oak Trees in the Dimbleby Estate"
```

#_preview[
  Pruning of Heritage Oak Trees in the Dimbleby Estate
]


```
// Styled subject with formatting
subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")]
```

#_preview[
  #smallcaps[*Pruning of Heritage Oak Trees in the Dimbleby Estate*]
]

#v(5pt)

*`closing`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

The closing phrase.

#text(size: 10pt)[*Examples:*]
```typ
// Formal business closing phrase
closing: "Yours sincerely,"
```

#_preview[
  Yours sincerely,
]

```
// Styled closing with formatting
closing: text(weight: "bold")[Yours sincerely,]
```

#_preview[
  #text(weight: "bold")[Yours sincerely,]
]

#v(5pt)

*`signatures`* #h(15pt) #highlight-type.array

Specifies a list of signatures as an array of dictionaries, where each dictionary has the following keys:

#table(
  columns: 3,
  column-gutter: 10pt,
  row-gutter: 5pt,
  rows: 1,
  stroke: none,
  inset: 3pt,
  [`name`], [#highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)], [The signatory's name.],
  [`signature`],
  [#highlight-type.content #h(5pt) _optional_],
  [A #link("https://typst.app/docs/reference/visualize/image/")[Typst `image(...)`] call pointing to the signature image file. When omitted, a blank space is reserved for a physical signature.],
  [`affiliation`],
  [#highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt) _optional_],
  [The signatory's title, role, and/or affiliation.]
)

#text(size: 10pt)[*Example:*]
```typ
// Single signature with name and signature image
signatures: (
  (
    name: "Lord Albus Dimbleby",
    signature: image("images/albus-sig.png"),
  ),
)
```

#_preview[
  #stack(dir: ttb, spacing: 10pt,
    box(width: 50mm, clip: true, image("images/albus-sig.png")),
    [Lord Albus Dimbleby],
  )
]

*Note:* For a single signature, use #link(<signature-alignment>)[`signature-alignment`] to control placement; ignored when multiple signatures are given.

```typ
// Multiple signatures with names and signature images
signatures: (
  (
    name: "Lord Albus Dimbleby",
    signature: image("images/albus-sig.png"),
  ),
  (
    name: "Lady Abigail Dimbleby",
    signature: image("images/abigail-sig.png"),
  ),
  (
    name: "Sir Austin Dimbleby",
    signature: image("images/austin-sig.png"),
  ),
)
```

#_preview[
  #let _sig = (name, img) => stack(dir: ttb, spacing: 10pt,
    box(width: 36mm, clip: true, img),
    [#name],
  )

  #grid(
    columns: (auto, auto, auto),
    gutter: 24pt,
    _sig("Lord Albus Dimbleby", image("images/albus-sig.png")),
    _sig("Lady Abigail Dimbleby", image("images/abigail-sig.png")),
    _sig("Sir Austin Dimbleby", image("images/austin-sig.png")),
  )
]

See the #link(label("signature-handling"))[Signature Handling] section for the full reference and examples.

=== Optional Parameters

The following optional parameters enable you to add additional fields like a letterhead image, an attention line, a list of cc recipients, a list of enclosures, and a footer to your letter if desired.

#v(5pt)

#[#metadata("") <letterhead>]
*`letterhead`* #h(15pt) #highlight-type.dictionary

Places a letterhead image flush with the edges of the physical page.
#table(
  columns: 3,
  column-gutter: 10pt,
  row-gutter: 5pt,
  rows: 7,
  stroke: none,
  inset: 3pt,
  [`file`],
  [#highlight-type.bytes],
  [#link("https://typst.app/docs/reference/data-loading/read/")[Typst read function] specifying the path to the file and encoding.],

  [`width`],
  [#highlight-type.length #h(5pt) or #h(5pt) #highlight-type.ratio #h(5pt) or #h(5pt) #highlight-type.relative #h(5pt) _optional_],
  [Width of the image. Defaults to the full available width.],

  [`height`],
  [#highlight-type.length #h(5pt) _optional_],
  [Height of the image. Scales proportionally with `width` when omitted.],

  [`image-inset`],
  [#highlight-type.length #h(5pt) or #h(5pt) #highlight-type.dictionary #h(5pt) _optional_],
  [Inset applied to the letterhead. Defaults to `0mm` on all sides.],

  [`image-alignment`],
  [#highlight-type.alignment #h(5pt) _optional_],
  [Horizontal alignment of the letterhead. Defaults to `center`. Ignored when `sender-position` is set.],

  [`sender-position`],
  [#highlight-type.alignment #h(5pt) _optional_],
  [Places the sender address alongside or centered below the letterhead.],

  [`bottom-gap`],
  [#highlight-type.length #h(5pt) _optional_],
  [Space between the sender address and the letter content below when `sender-position` is `center`. Defaults to #link(<par-spacing>)[`par-spacing`].],
)

#text(size: 10pt)[*Default:* #h(5pt) #highlight-type.none-type]

#text(size: 10pt)[*Examples:*]
```typ
// Full-width letterhead with no margins (default behavior)
letterhead: (
  file: read("images/letterhead.png", encoding: none),
)

// Partial-width letterhead centered with spacing around it
letterhead: (
  file: read("images/letterhead.png", encoding: none),
  width: 60%,
  image-inset: (top: 5mm, bottom: 3mm, rest: 8mm),
  image-alignment: center,
)

// Fixed-width letterhead with uniform inset
letterhead: (
  file: read("images/letterhead.png", encoding: none),
  width: 120mm,
  image-inset: 5mm,
  image-alignment: right,
)
```

#let _lhp(body) = block(
  width: 46mm, height: 40mm, clip: true, fill: white,
  stroke: 0.5pt + luma(170), radius: 2pt, body
)
#let _lh-lines() = stack(dir: ttb, spacing: 2pt,
  rect(width: 24mm, height: 2pt, fill: luma(200), stroke: none, radius: 1pt),
  rect(width: 18mm, height: 2pt, fill: luma(200), stroke: none, radius: 1pt),
  rect(width: 28mm, height: 3pt, fill: luma(200), stroke: none, radius: 1pt),
  rect(width: 20mm, height: 2pt, fill: luma(200), stroke: none, radius: 1pt),
)
#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 10pt,
    align: center,

    stack(dir: ttb, spacing: 5pt,
      _lhp({
        place(top + left, rect(width: 46mm, height: 10mm, fill: luma(215), stroke: none))
        place(top + left, dx: 4mm, dy: 13mm, _lh-lines())
      }),
      text(size: 8pt, fill: luma(100))[Full width, flush]
    ),

    stack(dir: ttb, spacing: 5pt,
      _lhp({
        place(top + left, dx: 9mm, dy: 2mm,
          rect(width: 28mm, height: 9mm, fill: luma(215), stroke: none))
        place(top + left, dx: 4mm, dy: 14mm, _lh-lines())
      }),
      text(size: 8pt, fill: luma(100))[60%, centered]
    ),

    stack(dir: ttb, spacing: 5pt,
      _lhp({
        place(top + left, dx: 17mm, dy: 2mm,
          rect(width: 27mm, height: 9mm, fill: luma(215), stroke: none))
        place(top + left, dx: 4mm, dy: 14mm, _lh-lines())
      }),
      text(size: 8pt, fill: luma(100))[Right-aligned]
    ),
  )
]

*Note:*  The letterhead is rendered only on the first page.

For working examples of each `sender-position` variant and notes on usage, see the #link(label("letterhead-layouts"))[Letterhead Layout] section.

#v(5pt)

*`attn-name`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)

The attention line recipient's name.

#text(size: 10pt)[*Default:* #h(5pt) #highlight-type.none-type]

#text(size: 10pt)[*Example:*]
```typ
attn-name: "Mr Basil Hawthorne"
```

#_preview[
  Attn: Mr Basil Hawthorne
]

#v(5pt)

*`attn-label`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)

The label printed before the attention line name.

#text(size: 10pt)[*Default:* `"Attn:"`]

#text(size: 10pt)[*Example:*]
```typ
attn-label: "À l'attention de"
```

#_preview[
  À l'attention de #text(fill: luma(175))[M. Basil Hawthorne]
]

#v(5pt)

*`attn-position`* #h(15pt) #highlight-type.str

Whether to place the attention line above or below the recipient's address.

#text(size: 10pt)[*Default:* `"above"`]

#text(size: 10pt)[*Example:*]
```typ
attn-position: "below"
```

#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 8pt,
    align: top,
    align(left)[
      #_preview[
        #stack(dir: ttb, spacing: 10pt,
          [Attn: Mr Basil Hawthorne],
          text(fill: gray)[Evergreen Tree Surgeons],
          text(fill: gray)[Midtown Lane],
          text(fill: gray)[Cheswick Village],
          text(fill: gray)[Stoke Gifford],
          text(fill: gray)[Bristol BS16 1GU],
        )
      ]
      #v(4pt)
      #align(center)[#text(size: 9pt, fill: luma(100))[`above` (default)]]
    ],
    align(left)[
      #_preview[
        #stack(dir: ttb, spacing: 10pt,
          text(fill: gray)[Evergreen Tree Surgeons],
          text(fill: gray)[Midtown Lane],
          text(fill: gray)[Cheswick Village],
          text(fill: gray)[Stoke Gifford],
          text(fill: gray)[Bristol BS16 1GU],
          [Attn: Mr Basil Hawthorne],
        )
      ]
      #v(4pt)
      #align(center)[#text(size: 9pt, fill: luma(100))[`below`]]
    ],
  )
]

#v(5pt)

*`cc`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt) or #h(5pt) #highlight-type.array

Lists carbon copy (cc) recipients as a single string or content block, or an array of them.

#text(size: 10pt)[*Default:* #h(5pt) #highlight-type.none-type]

#text(size: 10pt)[*Examples:*]
```typ
// Single cc recipient
cc: "Mr Jethro Tull"

// Multiple cc recipients
cc: (
  "Mr Jethro Tull",
  "Ms Sarah Green",
  "Dr Robert Brown",
)
```

#_preview[
  #construct-cc(cc: ("Mr Jethro Tull", "Ms Sarah Green", "Dr Robert Brown"))
]

*Note:* The list of cc recipients is placed after the signature(s) but before the list of enclosures.

#v(5pt)

*`cc-label`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)

The label printed before the cc list.

#text(size: 10pt)[*Default:* `"cc:"`]

#text(size: 10pt)[*Examples:*]
```typ
// String
cc-label: "Cc:"

// Content block
cc-label: text(weight: "bold")[cc:]
```

#_preview[
  #stack(dir: ttb, spacing: 3pt,
    [Cc:],
    pad(left: 1.4em, _ph(w: 35%)),
    pad(left: 1.4em, _ph(w: 45%)),
    pad(left: 1.4em, _ph(w: 28%)),
  )
]

#v(5pt)

*`enclosures`* #h(15pt) #highlight-type.array

A list of enclosures an array of dictionaries with the following keys:

#table(
  columns: 3,
  column-gutter: 10pt,
  row-gutter: 5pt,
  rows: 4,
  stroke: none,
  inset: 3pt,
  [`description`],
  [#highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content],
  [Label shown in the enclosures list.],

  [`file`],
  [#highlight-type.bytes #h(5pt) _optional_],
  [#link("https://typst.app/docs/reference/data-loading/read/")[Typst read function] specifying the path to the file and encoding. When omitted, only the description is rendered.],

  [`pages`],
  [#highlight-type.int #h(5pt) _optional_],
  [Number of pages to render starting from page 1. Defaults to `1` which will only render the first page.],

  [`page-inset`],
  [#highlight-type.length #h(5pt) or #h(5pt) #highlight-type.dictionary #h(5pt) _optional_],
  [Page margin for the embedded file. Defaults to `0mm` on all sides when omitted.],
)

#text(size: 10pt)[*Default:* #h(5pt) #highlight-type.none-type]

#text(size: 10pt)[*Examples:*]
```typ
// Single enclosure (description only)
enclosures: (description: "Provenance of the Oak trees on the Dimbleby Estate.")

// Multiple enclosures (descriptions only)
enclosures: (
  (description: "Provenance of the Oak trees on the Dimbleby Estate."),
  (description: "Photographs of storm damaged Oak trees."),
  (description: "Insurance claim form."),
)

// With embedded files (read bytes so paths resolve in your document)
enclosures: (
  (
    description: "Provenance of the Oak trees on the Dimbleby Estate.",
    file: read("enclosures/oak-tree-provenance.pdf", encoding: none),
    pages: 3,
  ),
  (
    description: "Photographs of storm damaged Oak trees.",
    file: read("enclosures/storm-damaged-oak-tree.jpg", encoding: none),
    page-inset: (top: 20mm),
  ),
)
```

#_preview[
  #construct-enclosures(
    enclosures: (
      (description: "Provenance of the Oak trees on the Dimbleby Estate."),
      (description: "Photographs of storm damaged Oak trees."),
      (description: "Insurance claim form."),
    ),
  )
]

*Note:* Enclosures are listed after the letter closing or after a list of cc recipients if specified.

For embedding files directly into the letter, see the #link(label("enclosures-embedded"))[Enclosures with Embedded Documents] section.

#v(5pt)

*`enclosures-label`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)

The label printed before the enclosures list.

#text(size: 10pt)[*Default:* `"encl:"`]

#text(size: 10pt)[*Examples:*]
```typ
// String
enclosures-label: "enclosures:"

// Content block
enclosures-label: text(weight: "bold")[encl:]
```

#_preview[
  #stack(dir: ttb, spacing: 3pt,
    [enclosures:],
    pad(left: 1.4em, _ph(w: 75%)),
    pad(left: 1.4em, _ph(w: 55%)),
    pad(left: 1.4em, _ph(w: 30%)),
  )
]

#v(5pt)

*`footer`* #h(15pt) #highlight-type.array

An array of footer elements — URLs, email addresses, or plain text.

#table(
  columns: 3,
  column-gutter: 10pt,
  row-gutter: 5pt,
  rows: 2,
  stroke: none,
  inset: 3pt,
  [`footer-text`], [#highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)], [The footer text.],
  [`footer-type`],
  [#highlight-type.str #h(5pt) _optional_],
  [The type of footer element: `"url"`, `"email"` or `"string"`. When set to `"url"` or `"email"`, the text is rendered as a clickable hyperlink. When omitted or set to `"string"`, the text is rendered as plain text.],
)

#text(size: 10pt)[*Default:* #h(5pt) #highlight-type.none-type]

#text(size: 10pt)[*Example:*]
```typ
footer: (
  (
    // Displayed as is
    footer-text: "+44-117-555-5555",
  ),
  (
    // Displayed as a mailto: link
    footer-text: "dimblebyfamily@dimbleby.org",
    footer-type: "email",
  ),
  (
    // Displayed as a web link
    footer-text: "https://dimbleby.org",
    footer-type: "url",
  )
)
```

#_preview[
  #align(center)[
    #construct-custom-footer(
      footer: (
        (footer-text: "+44-117-555-5555"),
        (footer-text: "dimblebyfamily@dimbleby.org", footer-type: "email"),
        (footer-text: "https://dimbleby.org", footer-type: "url"),
      ),
    )
  ]
]

*Note:* The footer is placed at the bottom of the letter above the page number if enabled and is center-aligned.

#v(5pt)

#[#metadata("") <required-fields>]
*`required-fields`* #h(15pt) #highlight-type.array

An array of field name strings controlling which fields are active. Fields absent from the array are silently suppressed with no space left in the layout.

Valid values:

- `"from-name"`
- `"from-address"`
- `"to-name"`
- `"to-address"`
- `"date"`
- `"salutation"`
- `"subject"`
- `"closing"`
- `"signatures"`

#text(size: 10pt)[*Default:* `("from-name", "from-address", "to-name", "to-address", "date", "salutation", "subject", "closing", "signatures")`]

#text(size: 10pt)[*Examples:*]
```typ
// Omit the subject line
required-fields: (
  "from-name", "from-address",
  "to-name", "to-address",
  "date", "salutation", "closing", "signatures",
),

// Minimal letter — no salutation, subject, or closing
required-fields: (
  "from-name", "from-address",
  "to-name", "to-address",
  "date", "signatures",
),

// Date and sender omitted (e.g. reply with sender details in letterhead)
required-fields: (
  "to-name", "to-address",
  "salutation", "subject", "closing", "signatures",
),
```

*Note:* Fields included in the array must be given a value, or validation will fail.

=== Document Settings

Controls paper size, margins, spacing, and page numbering.

#v(5pt)

*`paper-size`* #h(15pt) #highlight-type.str

The paper size.

#text(size: 10pt)[*Default:* `"a4"`]

#text(size: 10pt)[*Examples:*]
```typ
paper-size: "a4" // A4 (210 × 297 mm)
paper-size: "us-letter" // US Letter (8.5 × 11 in)
paper-size: "legal" // Legal (8.5 × 14 in)
```

For more information, see #link("https://typst.app/docs/reference/layout/page/#parameters-paper")[Typst's documentation on paper sizes].

#v(5pt)

#[#metadata("") <margins>]
*`margins`* #h(15pt) #highlight-type.auto-type #h(5pt) or #h(5pt) #highlight-type.relative #h(5pt) or #h(5pt) #highlight-type.dictionary

The page margins.

#text(size: 10pt)[*Default:* #h(5pt) #highlight-type.auto-type]

#text(size: 10pt)[*Examples:*]
```typ
// Automatic margins (default)
margins: auto

// Uniform margins
margins: 20mm

// Custom margins
margins: (top: 20mm, left: 20mm, bottom: 20mm, right: 20mm)

// Asymmetric margins
margins: (top: 25mm, left: 30mm, bottom: 25mm, right: 30mm)
```

*Note:* The default setting of #h(5pt) #highlight-type.auto-type #h(5pt) results in a 25 mm margin for A4 paper.

Refer to #link("https://typst.app/docs/reference/layout/page/#parameters-margin")[Typst's margin documentation] for more information.

#v(5pt)

*`par-leading`* #h(15pt) #highlight-type.length

Line spacing within paragraphs.

#text(size: 10pt)[*Default:* `0.8em`]

#text(size: 10pt)[*Examples:*]
```typ
par-leading: 0.8em // Tight spacing
par-leading: 1.0em // Normal spacing
par-leading: 1.2em // Loose spacing
```

#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 8pt,
    align: top,
    align(center)[
      #lp(leading: 0.8em)[
        We are writing to request you to visit the estate to assess the Heritage Oak Trees that have stood the test of time.
      ]
      #v(4pt)
      #text(size: 9pt, fill: luma(100))[`0.8em` (default)]
    ],
    align(center)[
      #lp(leading: 1.0em)[
        We are writing to request you to visit the estate to assess the Heritage Oak Trees that have stood the test of time.
      ]
      #v(4pt)
      #text(size: 9pt, fill: luma(100))[`1.0em`]
    ],
    align(center)[
      #lp(leading: 1.2em)[
        We are writing to request you to visit the estate to assess the Heritage Oak Trees that have stood the test of time.
      ]
      #v(4pt)
      #text(size: 9pt, fill: luma(100))[`1.2em`]
    ],
  )
]

*Note:* Adjust this value to complement the chosen font and font size.

#v(5pt)

#[#metadata("") <par-spacing>]
*`par-spacing`* #h(15pt) #highlight-type.length

Spacing between paragraphs.

#text(size: 10pt)[*Default:* `1.8em`]

#text(size: 10pt)[*Examples:*]
```typ
par-spacing: 1.5em // Compact paragraphs
par-spacing: 1.8em // Standard spacing
par-spacing: 2.0em // Relaxed spacing
```

#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 8pt,
    align: top,
    align(center)[
      #lp(spacing: 1.5em)[
        We are writing to request you to visit the estate.

        Your task would be to render the grove safe.
      ]
      #v(4pt)
      #text(size: 9pt, fill: luma(100))[`1.5em` (compact)]
    ],
    align(center)[
      #lp(spacing: 1.8em)[
        We are writing to request you to visit the estate.

        Your task would be to render the grove safe.
      ]
      #v(4pt)
      #text(size: 9pt, fill: luma(100))[`1.8em` (default)]
    ],
    align(center)[
      #lp(spacing: 2.0em)[
        We are writing to request you to visit the estate.

        Your task would be to render the grove safe.
      ]
      #v(4pt)
      #text(size: 9pt, fill: luma(100))[`2.0em` (relaxed)]
    ],
  )
]

*Note:* Modify this value to match the font and font size for optimal readability.

#v(5pt)

*`number-pages`* #h(15pt) #highlight-type.bool

Enable page numbering from the second page onwards.

#text(size: 10pt)[*Default:* `false`]

#text(size: 10pt)[*Examples:*]
```typ
number-pages: true // Page numbers from the second page onwards
```

#_preview[
  #stack(dir: ttb, spacing: 3pt, _body-ph, _body-ph)

  #align(center)[
    #construct-custom-footer(
      footer: (
        (footer-text: "+44-117-555-5555"),
        (footer-text: "dimblebyfamily@dimbleby.org", footer-type: "email"),
        (footer-text: "https://dimbleby.org", footer-type: "url"),
      ),
    )
    #text(size: 9pt, font: "DejaVu Sans Mono")[2]
  ]
]

*Note:* Page numbers are centered at the bottom of the page below the footer if one is specified.

=== Typographical Settings

Controls the fonts and font sizes used throughout the letter.

#v(5pt)

*`main-font`* #h(15pt) #highlight-type.str

Sets the font used for the main body of the letter.

#text(size: 10pt)[*Default:* `"Libertinus Serif"`]

#text(size: 10pt)[*Examples:*]
```typ
main-font: "Libertinus Serif" // Default serif font
main-font: "Noto Serif" // Google's Noto Serif
main-font: "Times New Roman" // Classic serif
main-font: "Arial" // Sans-serif option
```

#v(5pt)

*`main-font-size`* #h(15pt) #highlight-type.length

Sets the font size for the main body.

#text(size: 10pt)[*Default:* `11pt`]

#text(size: 10pt)[*Examples:*]
```typ
main-font-size: 10pt // Smaller text
main-font-size: 11pt // Standard size
main-font-size: 12pt // Larger text
```

#v(5pt)

*`footnote-font`* #h(15pt) #highlight-type.str

Sets the font used for footnotes.

#text(size: 10pt)[*Default:* `"Libertinus Serif"`]

#text(size: 10pt)[*Examples:*]
```typ
footnote-font: "Libertinus Serif" // Match main font
footnote-font: "Noto Serif" // Alternative serif
footnote-font: "DejaVu Sans" // Sans-serif option
```

#v(5pt)

*`footnote-font-size`* #h(15pt) #highlight-type.length

Sets the font size for footnotes.

#text(size: 10pt)[*Default:* `7pt`]

#text(size: 10pt)[*Examples:*]
```typ
footnote-font-size: 6pt // Very small
footnote-font-size: 7pt // Standard size
footnote-font-size: 8pt // Larger footnotes
```

#v(5pt)

*`footer-font`* #h(15pt) #highlight-type.str

Sets the font used for the footer.

#text(size: 10pt)[*Default:* `"DejaVu Sans Mono"`]

#text(size: 10pt)[*Examples:*]
```typ
footer-font: "DejaVu Sans Mono" // Monospace default
footer-font: "Fira Mono" // Modern monospace
footer-font: "Courier New" // Classic monospace
footer-font: "Arial" // Sans-serif option
```

#v(5pt)

*`footer-font-size`* #h(15pt) #highlight-type.length

Sets the font size for the footer.

#text(size: 10pt)[*Default:* `9pt`]

#text(size: 10pt)[*Examples:*]
```typ
footer-font-size: 8pt // Smaller footer
footer-font-size: 9pt // Standard size
footer-font-size: 10pt // Larger footer
```

=== Layout Settings

Controls alignment of letter elements and hyperlink color.

#v(5pt)

#[#metadata("") <date-alignment>]
*`date-alignment`* #h(15pt) #highlight-type.alignment

Sets the alignment of the letter's date.

#text(size: 10pt)[*Default:* `right`]

#text(size: 10pt)[*Examples:*]
```typ
date-alignment: left // Left-aligned date
date-alignment: right // Right-aligned date (default)
date-alignment: center // Center-aligned date
```

#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 8pt,
    align: top,
    align(center)[
      #lp[
        #construct-sender(from-name: _dn, from-address: _da, from-alignment: right)
        #construct-date(date: _dd, date-alignment: left, from-alignment: right, from-name: _dn, from-address: _da)
      ]
      #v(4pt)
      #text(size: 9pt, fill: luma(100))[`left`]
    ],
    align(center)[
      #lp[
        #construct-sender(from-name: _dn, from-address: _da, from-alignment: right)
        #construct-date(date: _dd, date-alignment: center, from-alignment: right, from-name: _dn, from-address: _da)
      ]
      #v(4pt)
      #text(size: 9pt, fill: luma(100))[`center`]
    ],
    align(center)[
      #lp[
        #construct-sender(from-name: _dn, from-address: _da, from-alignment: right)
        #construct-date(date: _dd, date-alignment: right, from-alignment: right, from-name: _dn, from-address: _da)
      ]
      #v(4pt)
      #text(size: 9pt, fill: luma(100))[`right` (default)]
    ],
  )
]

*Note:* When `date-alignment` matches #link(<from-alignment>)[`from-alignment`] and a sender is present in the normal flow, the date block is width-matched to the sender block so their edges align.

This coupling does not apply when `letterhead.sender-position: center`, where the sender is part of the letterhead and the date aligns independently.


#[#metadata("") <from-alignment>]
*`from-alignment`* #h(15pt) #highlight-type.alignment

Sets the alignment of the sender's name and address.

#text(size: 10pt)[*Default:* `right`]

#text(size: 10pt)[*Examples:*]
```typ
from-alignment: left // Left-aligned sender
from-alignment: right // Right-aligned sender (default)
from-alignment: center // Center-aligned sender
```

#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 8pt,
    align: top,
    align(center)[
      #lp[
        #construct-sender(from-name: _dn, from-address: _da, from-alignment: left)
        #construct-date(date: _dd, date-alignment: left, from-alignment: left, from-name: _dn, from-address: _da)
      ]
      #v(4pt)
      #text(size: 9pt, fill: luma(100))[`left`]
    ],
    align(center)[
      #lp[
        #construct-sender(from-name: _dn, from-address: _da, from-alignment: center)
        #construct-date(date: _dd, date-alignment: center, from-alignment: center, from-name: _dn, from-address: _da)
      ]
      #v(4pt)
      #text(size: 9pt, fill: luma(100))[`center`]
    ],
    align(center)[
      #lp[
        #construct-sender(from-name: _dn, from-address: _da, from-alignment: right)
        #construct-date(date: _dd, date-alignment: right, from-alignment: right, from-name: _dn, from-address: _da)
      ]
      #v(4pt)
      #text(size: 9pt, fill: luma(100))[`right` (default)]
    ],
  )
]

*Note:* When `letterhead.sender-position` is set, this parameter is overridden. See the #link(label("letterhead-layouts"))[Letterhead Layout] section for full details.

#v(5pt)

*`footnote-alignment`* #h(15pt) #highlight-type.alignment

Specifies the alignment of the footnote separator and footnotes.

#text(size: 10pt)[*Default:* `left`]

#text(size: 10pt)[*Examples:*]
```typ
footnote-alignment: left // Left-aligned footnotes (default)
footnote-alignment: right // Right-aligned footnotes
footnote-alignment: center // Center-aligned footnotes
```

#let _fn-preview(a) = lp[
  #_body-ph
  #v(0.5em)
  #align(a)[
    #line(length: 30%, stroke: 0.5pt)
    #text(size: 9pt)[#super[1] The Dimbleby Estate, Cheswick Village, Bristol BS16 1GU.]
  ]
]

#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 8pt,
    align: top,
    align(center)[
      #_fn-preview(left)
      #v(4pt)
      #text(size: 9pt, fill: luma(100))[`left` (default)]
    ],
    align(center)[
      #_fn-preview(center)
      #v(4pt)
      #text(size: 9pt, fill: luma(100))[`center`]
    ],
    align(center)[
      #_fn-preview(right)
      #v(4pt)
      #text(size: 9pt, fill: luma(100))[`right`]
    ],
  )
]

#v(5pt)

#[#metadata("") <signature-alignment>]
*`signature-alignment`* #h(15pt) #highlight-type.alignment

Specifies the alignment of the signature if only one signature is specified.

#text(size: 10pt)[*Default:* `left`]

#text(size: 10pt)[*Examples:*]
```typ
signature-alignment: left // Left-aligned signature (default)
signature-alignment: right // Right-aligned signature
signature-alignment: center // Center-aligned signature
```

// construct-signatures reads page.width so alignment is relative to the full page,
// not the preview box. Use a hand-built replica instead so alignment is visible.
#let _sig-preview(a) = lp[
  #v(0.5em)
  Yours sincerely,
  #align(a, pad(top: 1.5em, stack(dir: ttb, spacing: 2pt,
    box(width: 36mm, height: 16mm, clip: true, image("images/albus-sig.png")),
    [Lord Albus Dimbleby],
  )))
]

#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 8pt,
    align: top,
    align(center)[
      #_sig-preview(left)
      #v(4pt)
      #text(size: 9pt, fill: luma(100))[`left` (default)]
    ],
    align(center)[
      #_sig-preview(center)
      #v(4pt)
      #text(size: 9pt, fill: luma(100))[`center`]
    ],
    align(center)[
      #_sig-preview(right)
      #v(4pt)
      #text(size: 9pt, fill: luma(100))[`right`]
    ],
  )
]

#v(5pt)

*`link-color`* #h(15pt) #highlight-type.color

Determines the color of hyperlinks in the letter.

#text(size: 10pt)[*Default:* `blue`]

#text(size: 10pt)[*Examples:*]
```typ
link-color: blue // Typst's blue #0074d9 (default)
link-color: maroon // Typst's maroon #85144b
link-color: rgb(46, 111, 64) // Forest Green
```

#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 8pt,
    align: top,
    align(center)[
      #lp[
        Contact us at #text(fill: blue)[dimbleby.org] or by post.
      ]
      #v(4pt)
      #text(size: 9pt, fill: luma(100))[`blue` (default)]
    ],
    align(center)[
      #lp[
        Contact us at #text(fill: maroon)[dimbleby.org] or by post.
      ]
      #v(4pt)
      #text(size: 9pt, fill: luma(100))[`maroon`]
    ],
    align(center)[
      #lp[
        Contact us at #text(fill: rgb(46, 111, 64))[dimbleby.org] or by post.
      ]
      #v(4pt)
      #text(size: 9pt, fill: luma(100))[`Forest Green`]
    ],
  )
]

Refer to #link("https://typst.app/docs/reference/visualize/color/#summary")[Typst's documentation on colors] for additional details.

== Signature Handling <signature-handling>

=== Multiple Signatures

Signatures are arranged in rows of up to three, filled left-to-right. A signature that would overflow the available width starts a new row; there is no hard limit on the number of signatories. Name baselines are aligned within each row regardless of whether a signature image or affiliation is present. #link(<signature-alignment>)[`signature-alignment`] is ignored when more than one signature is given.


```typ
signatures: (
  (
    name: "Lord Albus Dimbleby",
    signature: image("images/albus-sig.png"),
  ),
  (
    name: "Lady Abigail Dimbleby",
    signature: image("images/abigail-sig.png"),
  ),
  (
    name: "Sir Austin Dimbleby",
    signature: image("images/austin-sig.png"),
  ),
)
```

#_preview[
  #let _sig = (name, img) => stack(dir: ttb, spacing: 0pt,
    box(width: 36mm, height: 16mm, clip: true, img),
    [#name],
  )
  #_ph(w: 43%)

  #grid(
    columns: (auto, auto, auto),
    gutter: 24pt,
    _sig("Lord Albus Dimbleby", image("images/albus-sig.png")),
    _sig("Lady Abigail Dimbleby", image("images/abigail-sig.png")),
    _sig("Sir Austin Dimbleby", image("images/austin-sig.png")),
  )
]


=== Long Affiliations

When an affiliation is long it expands the signature block vertically. All blocks in the same row grow to match the tallest entry so name baselines stay aligned. Use `\` to break affiliation text onto separate lines:

```typ
signatures: (
  (
    name: "Sir Austin Dimbleby",
    affiliation: [
      Knight Commander of the British Empire \
      Chairman, Dimbleby Estate \
      General Secretary, Dimbleby Family Trust \
      Senior Fellow, Royal Institute of Horticulture \
    ],
    // no signature provided so empty space is reserved
  ),
  (
    name: "Lord Albus Dimbleby",
    // short affiliation — block expands to match Sir Austin Dimbleby's height
    affiliation: [
      Chairman, Dimbleby Family Trust
    ],
  ),
)
```

#_preview[
  #_ph(w: 43%)

  #grid(
    columns: (auto, auto),
    gutter: 24pt,
    stack(dir: ttb, spacing: 2pt,
      rect(width: 36mm, height: 16mm, fill: luma(240), stroke: 0.3pt + luma(180), radius: 1pt),
      [
        Sir Austin Dimbleby \
        Knight Commander of the British Empire \
        Chairman, Dimbleby Estate \
        General Secretary, Dimbleby Family Trust \
        Senior Fellow, Royal Institute of Horticulture \
      ],
    ),
    stack(dir: ttb, spacing: 2pt,
      box(width: 36mm, height: 16mm, clip: true, image("images/albus-sig.png")),
      [
        Lord Albus Dimbleby \
        Chairman, Dimbleby Family Trust
      ],
    ),
  )
]

== Letterhead Layout <letterhead-layouts>

The `letterhead` parameter supports four distinct layouts. The first is the default when `sender-position` is omitted. The other three are controlled by the `sender-position` key.

#let _lhl(body) = block(
  width: 46mm, height: 55mm, clip: true, fill: white,
  stroke: 0.5pt + luma(170), radius: 2pt, body
)
#let _sender-lines() = stack(dir: ttb, spacing: 2pt,
  rect(width: 18mm, height: 2pt, fill: luma(200), stroke: none, radius: 1pt),
  rect(width: 14mm, height: 2pt, fill: luma(200), stroke: none, radius: 1pt),
  rect(width: 16mm, height: 2pt, fill: luma(200), stroke: none, radius: 1pt),
  rect(width: 12mm, height: 2pt, fill: luma(200), stroke: none, radius: 1pt),
)
#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr),
    row-gutter: 12pt,
    column-gutter: 10pt,
    align: center,

    stack(dir: ttb, spacing: 5pt,
      _lhl({
        place(top + left, rect(width: 46mm, height: 10mm, fill: luma(215), stroke: none))
        place(top + left, dx: 24mm, dy: 13mm, _sender-lines())
        place(top + left, dx: 4mm, dy: 25mm, _lh-lines())
      }),
      text(size: 8pt, fill: luma(100))[Default]
    ),

    stack(dir: ttb, spacing: 5pt,
      _lhl({
        place(top + left, rect(width: 22mm, height: 17mm, fill: luma(215), stroke: none))
        place(top + left, dx: 25mm, dy: 2mm, _sender-lines())
        place(top + left, dx: 4mm, dy: 21mm, _lh-lines())
      }),
      text(size: 8pt, fill: luma(100))[`sender-position: right`]
    ),

    stack(dir: ttb, spacing: 5pt,
      _lhl({
        place(top + left, dx: 24mm, rect(width: 22mm, height: 17mm, fill: luma(215), stroke: none))
        place(top + left, dx: 4mm, dy: 2mm, _sender-lines())
        place(top + left, dx: 4mm, dy: 21mm, _lh-lines())
      }),
      text(size: 8pt, fill: luma(100))[`sender-position: left`]
    ),

    stack(dir: ttb, spacing: 5pt,
      _lhl({
        place(top + left, dx: 9mm, dy: 2mm,
          rect(width: 28mm, height: 9mm, fill: luma(215), stroke: none))
        place(top + left, dx: 13mm, dy: 13mm, stack(dir: ttb, spacing: 2pt,
          rect(width: 20mm, height: 2pt, fill: luma(200), stroke: none, radius: 1pt),
          rect(width: 16mm, height: 2pt, fill: luma(200), stroke: none, radius: 1pt),
          rect(width: 18mm, height: 2pt, fill: luma(200), stroke: none, radius: 1pt),
        ))
        place(top + left, dx: 4mm, dy: 26mm, _lh-lines())
      }),
      text(size: 8pt, fill: luma(100))[`sender-position: center`]
    ),
  )
]

=== Default

The full-width letterhead image is placed flush with the physical page edges. This is the default when the `sender-position` is omitted.

```typ
letterhead: (
  file: read("images/letterhead.png", encoding: none),
  image-inset: (top: 5mm, rest: 8mm),   // optional inset from page edges
  image-alignment: center,              // left, center (default), or right
)
```

=== Sender Alongside: `right`

The letterhead image is placed flush to the left page edge. The sender address fills the remaining column to the right at the same vertical position.

```typ
letterhead: (
  file: read("images/letterhead.png", encoding: none),
  width: 65mm,           // required in practice — sets the column split
  sender-position: right,
)
```

- `image-alignment` is ignored.
- Specify `width`; omitting it defaults to full content width, leaving no room for the sender.

=== Sender Alongside: `left`

The letterhead image is placed flush to the right page edge. The sender address fills the remaining column to the left.

```typ
letterhead: (
  file: read("images/letterhead.png", encoding: none),
  width: 65mm,
  sender-position: left,
)
```

- `image-alignment` is ignored.

=== Sender Centered Below: `center`

The letterhead image is placed flush and centered. The sender address is placed absolutely below it, also centered, forming a single decorative header block. The letter content (date, recipient, body) starts below both.

```typ
letterhead: (
  file: read("images/letterhead.png", encoding: none),
  width: 120mm,
  sender-position: center,
  bottom-gap: 8mm,       // space between sender and content; defaults to par-spacing
),
```

- `image-alignment` is ignored; the image is always centered.
- `bottom-gap` is specific to this layout; it has no effect on the other three.
- The date is decoupled from the sender — #link(<date-alignment>)[`date-alignment`] and #link(<from-alignment>)[`from-alignment`] do not interact.

=== Notes and Caveats

- *Use `read()`, not `image()`.* The `file` key expects raw bytes loaded via `read("path", encoding: none)`. Passing a Typst `image()` call will produce a type error.

- *Setting both `width` and `height` may distort the image.* If the values do not match the image's natural aspect ratio, the image will be stretched or compressed. Omit `height` to let it scale proportionally with `width`.

- *Percentage widths are relative to available width.* A `width` of `100%` fills the page width minus the letterhead's left and right `image-inset`, not the full physical page width. To span the full page width with no inset, omit `width` entirely or set `image-inset` to `0mm`.

- *Auto page margins.* When the #link(<margins>)[`margins`] parameter is left at its default of `auto`, letterloom derives the page margin using Typst's formula: 2.5/21 of the page's shorter dimension. If you set custom page margins, the letterhead placement adjusts automatically.

- *Custom inset with asymmetric sides.* When using a dictionary for `image-inset` (e.g. `image-inset: (top: 5mm, rest: 8mm)`), the `rest` key sets the fallback for any sides not explicitly listed.

- *Image format support.* PNG, JPEG, SVG, and GIF are supported. Passing a file in an unsupported format will result in a Typst compile error.

== Embedding Enclosures <enclosures-embedded>

Enclosures are listed after the signatures. When a `file` key is provided the document is embedded on a dedicated page immediately following the letter body.

=== Description-Only Enclosures

When no `file` parameter is provided, the enclosure appears only as a line item in the enclosures list:

```typ
enclosures: (
  (description: "Provenance of the Oak trees on the Dimbleby Estate."),
  (description: "Insurance claim form."),
)
```

=== Attaching a File

Load the file as bytes using `read("path", encoding: none)`. The file is rendered on its own page(s) after the letter.

```typ
enclosures: (
  (
    description: "Photograph of storm damaged Oak trees.",
    file: read("enclosures/storm-damaged-oak-tree.jpg", encoding: none),
  ),
)
```

=== Rendering Multiple Pages

By default only the first page of a PDF is embedded. Use `pages` to render more:

```typ
enclosures: (
  (
    description: "Heritage Oak provenance statement.",
    file: read("enclosures/heritage-oak-provenance-statement.pdf", encoding: none),
    pages: 3,    // renders pages 1–3
  ),
)
```

To find the page count of a PDF, you may use the `pdfinfo` command from the #link("https://poppler.freedesktop.org")[Poppler] library: `pdfinfo document.pdf | grep Pages`.

=== Per-Enclosure Page Inset

Each enclosure can carry its own page inset, either as a uniform length or a dictionary of sides:

```typ
enclosures: (
  (
    description: "Photograph of storm damaged Oak trees.",
    file: read("enclosures/storm-damaged-oak-tree.jpg", encoding: none),
    page-inset: 15mm,                        // uniform on all sides
  ),
)
```

Valid dictionary keys: `top`, `bottom`, `left`, `right`, `x`, `y`, `rest`.

=== Mixed List

Description-only and file-attached enclosures can be mixed freely:

```typ
enclosures: (
  (description: "Insurance claim form (complete and return)."),
  (
    description: "Photographs of storm-damaged Oak trees.",
    file: read("enclosures/storm-damaged-oak-tree.jpg", encoding: none),
    page-inset: (top: 20mm),
  ),
  (
    description: "Heritage Oak provenance statement.",
    file: read("enclosures/heritage-oak-provenance-statement.pdf", encoding: none),
    pages: 2,
  ),
)
```

A working demonstration of enclosures is shown in the #link(label("comprehensive-example"))[Comprehensive Example] section.

== Comprehensive Example <comprehensive-example>

The following example illustrates most of the key features of the `letterloom` template explained above. It is not intended as a template for real-world use but rather as a demonstration of how the various parameters interact in practice to produce a complex, richly formatted letter.

```typ
#import "@preview/letterloom:3.0.0": *

#show: letterloom.with(
  // Sender's contact information (name and address)
  from-name: "The Dimbleby Family",
  from-address: [
    The Dimbleby Estate \
    Cheswick Village \
    Middle Upton \
    Bristol BS16 1GU
  ],

  // Recipient's contact information (name and address)
  to-name: "Evergreen Tree Surgeons",
  to-address: [
    Midtown Lane \
    Cheswick Village \
    Stoke Gifford \
    Bristol BS16 1GU
  ],

  // Attention line for specific recipient (optional)
  attn-name: "Mr Basil Hawthorne",

  // Letter date (automatically set to today's date)
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),

  // Opening greeting
  salutation: "Dear Mr Hawthorne,",

  // Letter subject line
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],

  // Closing phrase
  closing: "Sincerely yours,",

  // List of signatures with their name, optional signature image and affiliation
  signatures: (
    (
      name: "Lord Albus Dimbleby",
      signature: image("images/albus-sig.png", width: 50mm),
    ),
    (
      name: "Lady Abigail Dimbleby",
      signature: image("images/abigail-sig.png", width: 50mm),
    ),
    (
      name: "Sir Austin Dimbleby",
      signature: image("images/austin-sig.png", width: 50mm),
    ),
  ),

  // Letterhead (optional)
  letterhead: (
    file: read("images/letterhead.png", encoding: none),
    image-inset: (bottom: 2mm, rest: 5mm),
  ),

  // List of cc recipients (optional)
  cc: "Mr Jethro Tull",

  // List of enclosures (optional)
  enclosures: (
    (
      description: "Photograph of storm damaged Oak trees.",
      file: read("enclosures/storm-damaged-oak-tree.jpg", encoding: none),
      page-inset: 20mm,
    ),
    (
      description: "Provenance of the Oak trees on the Dimbleby Estate.",
      file: read("enclosures/oak-tree-provenance.pdf", encoding: none),
      pages: 3,
    ),
  ),

  // Custom footer information (optional)
  footer: (
    (
      footer-text: "+44-117-555-5555",
    ),
    (
      footer-text: "dimblebyfamily@dimbleby.org",
      footer-type: "email",
    ),
    (
      footer-text: "https://dimbleby.org",
      footer-type: "url",
    ),
  ),

  // Paper size (default: "a4")
  paper-size: "a4",

  // Page margins (default: auto)
  margins: (top: 20mm, left: 20mm, bottom: 20mm, right: 20mm),

  // Enable page numbering (default: false)
  number-pages: false,

  // Main font (default: "Libertinus Serif")
  main-font: "Libertinus Serif",

  // Main font size (default: 11pt)
  main-font-size: 11pt,

  // Footnote font (default: "Libertinus Serif")
  footnote-font: "Libertinus Serif",

  // Footnote font size (default: 7pt)
  footnote-font-size: 7pt,

  // Footer font (default: "DejaVu Sans Mono")
  footer-font: "DejaVu Sans Mono",

  // Footer font size (default: 9pt)
  footer-font-size: 9pt,

  // Footnote alignment (default: left)
  footnote-alignment: right,

  // Link color (default: blue)
  link-color: maroon,
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678, to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.
```

#show: letterloom.with(
  // Sender's contact information (name and address)
  from-name: "The Dimbleby Family",
  from-address: [
    The Dimbleby Estate \
    Cheswick Village \
    Middle Upton \
    Bristol BS16 1GU
  ],

  // Recipient's contact information (name and address)
  to-name: "Evergreen Tree Surgeons",
  to-address: [
    Midtown Lane \
    Cheswick Village \
    Stoke Gifford \
    Bristol BS16 1GU
  ],

  // Attention line for specific recipient (optional)
  attn-name: "Mr Basil Hawthorne",

  // Letter date (automatically set to today's date)
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),

  // Opening greeting
  salutation: "Dear Mr Hawthorne,",

  // Letter subject line
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],

  // Closing phrase
  closing: "Sincerely yours,",

  // List of signatures with their name, optional signature image and affiliation
  signatures: (
    (
      name: "Lord Albus Dimbleby",
      signature: image("images/albus-sig.png", width: 50mm),
    ),
    (
      name: "Lady Abigail Dimbleby",
      signature: image("images/abigail-sig.png", width: 50mm),
    ),
    (
      name: "Sir Austin Dimbleby",
      signature: image("images/austin-sig.png", width: 50mm),
    ),
  ),

  // Letterhead (optional)
  letterhead: (
    file: read("images/letterhead.png", encoding: none),
    image-inset: (bottom: 2mm, rest: 5mm),
  ),

  // List of cc recipients (optional)
  cc: "Mr Jethro Tull",

  // List of enclosures (optional)
  enclosures: (
    (
      description: "Photograph of storm damaged Oak trees.",
      file: read("enclosures/storm-damaged-oak-tree.jpg", encoding: none),
      page-inset: 20mm,
    ),
    (
      description: "Heritage Oak Provenance Statement.",
      file: read("enclosures/heritage-oak-provenance-statement.pdf", encoding: none),
      pages: 3,
    ),
  ),

  // Custom footer information (optional)
  footer: (
    (
      footer-text: "+44-117-555-5555",
    ),
    (
      footer-text: "dimblebyfamily@dimbleby.org",
      footer-type: "email",
    ),
    (
      footer-text: "https://dimbleby.org",
      footer-type: "url",
    ),
  ),

  // Paper size (default: "a4")
  paper-size: "a4",

  // Page margins (default: auto)
  margins: (top: 20mm, left: 20mm, bottom: 20mm, right: 20mm),

  // Enable page numbering (default: false)
  number-pages: false,

  // Main font (default: "Libertinus Serif")
  main-font: "Libertinus Serif",

  // Main font size (default: 11pt)
  main-font-size: 11pt,

  // Footnote font (default: "Libertinus Serif")
  footnote-font: "Libertinus Serif",

  // Footnote font size (default: 7pt)
  footnote-font-size: 7pt,

  // Footer font (default: "DejaVu Sans Mono")
  footer-font: "DejaVu Sans Mono",

  // Footer font size (default: 9pt)
  footer-font-size: 9pt,

  // Footnote alignment (default: left)
  footnote-alignment: right,

  // Link color (default: blue)
  link-color: maroon,
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678, to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.

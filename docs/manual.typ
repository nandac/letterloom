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
      },
    ),
  ),
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
  },
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

The template handles all vertical spacing, page geometry, and letterhead placement automatically. This ensures a flawless, consistent layout regardless of your content's length or the paper size used.

== Requirements

This package requires Typst 0.14.0 or higher.

== Usage

Every parameter is documented below, detailing its accepted data type, default value, and practical application.

=== Getting Started

To initialize a new `letterloom` project locally, run the following command in your terminal:

```bash
typst init @preview/letterloom:3.0.0
```

Alternatively, you can create a new project directly in the #link("https://typst.app/app?template=letterloom&version=3.0.0")[Typst Web App].

For a complete, full-featured demonstration, please refer to the #link(label("comprehensive-example"))[Comprehensive Example] section.

=== Required Parameters

By default, all fields listed below are mandatory. To override this behavior and omit specific fields, please refer to the #link(<required-fields>)[`required-fields`] parameter.

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
  [The signatory's title, role, and/or affiliation.],
)

#text(size: 10pt)[*Examples:*]
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
  #stack(dir: ttb, spacing: 10pt, box(width: 50mm, clip: true, image("images/albus-sig.png")), [Lord Albus Dimbleby])
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
  #let _sig = (name, img) => stack(dir: ttb, spacing: 10pt, box(width: 36mm, clip: true, img), [#name])

  #grid(
    columns: (auto, auto, auto),
    gutter: 24pt,
    _sig("Lord Albus Dimbleby", image("images/albus-sig.png")),
    _sig("Lady Abigail Dimbleby", image("images/abigail-sig.png")),
    _sig("Sir Austin Dimbleby", image("images/austin-sig.png")),
  )
]

For full details and examples, see the #link(label("signature-handling"))[Signature Handling] section.

=== Optional Parameters

The following parameters allow you to further customize your letter by adding features such as a letterhead, an attention line, CC recipients, enclosures, or a footer.

#v(5pt)

#[#metadata("") <letterhead>]
*`letterhead`* #h(15pt) #highlight-type.dictionary

Places the provided letterhead on the first page of the letter.

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

  [`sender-valign`],
  [#highlight-type.alignment #h(5pt) _optional_],
  [Vertical alignment of the sender address relative to the image when `sender-position` is `left` or `right`. Accepts `top`, `horizon`, or `bottom`. Defaults to `horizon` (vertically centred). Has no effect when `sender-position` is `center` or omitted.],
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
  width: 46mm,
  height: 40mm,
  clip: true,
  fill: white,
  stroke: 0.5pt + luma(170),
  radius: 2pt,
  body,
)
#let _lh-lines() = stack(
  dir: ttb,
  spacing: 2pt,
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

    stack(
      dir: ttb,
      spacing: 5pt,
      _lhp({
        place(top + left, rect(width: 46mm, height: 10mm, fill: luma(215), stroke: none))
        place(top + left, dx: 4mm, dy: 13mm, _lh-lines())
      }),
      text(size: 8pt, fill: luma(100))[Full-width],
    ),

    stack(
      dir: ttb,
      spacing: 5pt,
      _lhp({
        place(top + left, dx: 9mm, dy: 2mm, rect(width: 28mm, height: 9mm, fill: luma(215), stroke: none))
        place(top + left, dx: 4mm, dy: 14mm, _lh-lines())
      }),
      text(size: 8pt, fill: luma(100))[Partial-width],
    ),

    stack(
      dir: ttb,
      spacing: 5pt,
      _lhp({
        place(top + left, dx: 17mm, dy: 2mm, rect(width: 27mm, height: 9mm, fill: luma(215), stroke: none))
        place(top + left, dx: 4mm, dy: 14mm, _lh-lines())
      }),
      text(size: 8pt, fill: luma(100))[Fixed-width],
    ),
  )
]

For working examples of each `sender-position` variant and additional notes on usage, see the #link(label("letterhead-layouts"))[Letterhead Layout] section.

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
 // Placed above the recipient's address (default)
attn-position: "above"
```

#_preview[
  #stack(
    dir: ttb,
    spacing: 10pt,
    [Attn: Mr Basil Hawthorne],
    text(fill: gray)[Evergreen Tree Surgeons],
    text(fill: gray)[Midtown Lane],
    text(fill: gray)[Cheswick Village],
    text(fill: gray)[Stoke Gifford],
    text(fill: gray)[Bristol BS16 1GU],
  )
]

```typ
attn-position: "below" // Placed below the recipient's address
```

#_preview[
  #stack(
    dir: ttb,
    spacing: 10pt,
    text(fill: gray)[Evergreen Tree Surgeons],
    text(fill: gray)[Midtown Lane],
    text(fill: gray)[Cheswick Village],
    text(fill: gray)[Stoke Gifford],
    text(fill: gray)[Bristol BS16 1GU],
    [Attn: Mr Basil Hawthorne],
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
```

#_preview[
  #align(left)[
    #construct-cc(cc: "Mr Jethro Tull")
  ]
]

```typ
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

The label printed before the list of cc recipients.

#text(size: 10pt)[*Default:* `"cc:"`]

#text(size: 10pt)[*Examples:*]
```typ
// String
cc-label: "Cc:"
```

#_preview[
  Cc:
  #set text(fill: luma(140))
  #set list(indent: 1.4em, marker: "")
  - Mr Jethro Tull
  - Ms Sarah Green
  - Dr Robert Brown
]

```typ
// Content block
cc-label: text(weight: "bold")[cc:]
```

#_preview[
  *cc:*
  #set text(fill: luma(140))
  #set list(indent: 1.4em, marker: "")
  - Mr Jethro Tull
  - Ms Sarah Green
  - Dr Robert Brown
]

#v(5pt)

*`enclosures`* #h(15pt) #highlight-type.array

A list of enclosures defined as an array of dictionaries.

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
```

#_preview[
  #construct-enclosures(
    enclosures: (
      (description: "Provenance of the Oak trees on the Dimbleby Estate."),
    ),
  )
]

```typ
// Multiple enclosures (descriptions only)
enclosures: (
  (description: "Provenance of the Oak trees on the Dimbleby Estate."),
  (description: "Photographs of storm damaged Oak trees."),
  (description: "Insurance claim form."),
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
```

#_preview[
  enclosures:
  #set text(fill: luma(140))
  #set enum(indent: 1.4em)
  + Provenance of the Oak trees on the Dimbleby Estate.
  + Photographs of storm damaged Oak trees.
  + Insurance claim form.
]

```
// Content block
enclosures-label: text(weight: "bold")[encl:]
```

#_preview[
  *encl:*
  #set text(fill: luma(140))
  #set enum(indent: 1.4em)
  + Provenance of the Oak trees on the Dimbleby Estate.
  + Photographs of storm damaged Oak trees.
  + Insurance claim form.
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

Controls which of the default mandatory fields are active. Any field omitted from this array is silently suppressed and occupies no layout space.

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

#text(
  size: 10pt,
)[*Default:* `("from-name", "from-address", "to-name", "to-address", "date", "salutation", "subject", "closing", "signatures")`]

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

These parameters control the foundational layout of your letter, allowing you to configure paper size, margins, spacing, and page numbering.

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
      #text(size: 9pt, fill: luma(100))[Tight spacing: `0.8em` (default)]
    ],
    align(center)[
      #lp(leading: 1.0em)[
        We are writing to request you to visit the estate to assess the Heritage Oak Trees that have stood the test of time.
      ]
      #text(size: 9pt, fill: luma(100))[Normal spacing: `1.0em`]
    ],
    align(center)[
      #lp(leading: 1.2em)[
        We are writing to request you to visit the estate to assess the Heritage Oak Trees that have stood the test of time.
      ]
      #text(size: 9pt, fill: luma(100))[Loose spacing: `1.2em`]
    ],
  )
]

*Note:* The right value depends on your font, size, and personal taste. Refer to #link("https://typst.app/docs/reference/model/par/#parameters-leading")[Typst's par documentation] for details.

#v(5pt)

#[#metadata("") <par-spacing>]
*`par-spacing`* #h(15pt) #highlight-type.length

Spacing between paragraphs.

#text(size: 10pt)[*Default:* `1.8em`]

#text(size: 10pt)[*Examples:*]
```typ
par-spacing: 1.5em // Compact paragraphs
par-spacing: 1.8em // Standard spacing (default)
par-spacing: 2.0em // Relaxed spacing
```

#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 8pt,
    row-gutter: 4pt,
    align: center,
    lp(spacing: 1.5em)[
      We are writing to request you to visit the estate.

      Your task would be to render the grove safe.

      Kindly contact Mr Jethro Tull to arrange a visit.
    ],
    lp(spacing: 1.8em)[
      We are writing to request you to visit the estate.

      Your task would be to render the grove safe.

      Kindly contact Mr Jethro Tull to arrange a visit.
    ],
    lp(spacing: 2.0em)[
      We are writing to request you to visit the estate.

      Your task would be to render the grove safe.

      Kindly contact Mr Jethro Tull to arrange a visit.
    ],

    block(above: 0pt, text(size: 9pt, fill: luma(100))[Compact paragraphs: `1.5em`]),
    block(above: 0pt, text(size: 9pt, fill: luma(100))[Standard spacing: `1.8em` (default)]),
    block(above: 0pt, text(size: 9pt, fill: luma(100))[Relaxed spacing: `2.0em`]),
  )
]

Note: The right value depends on your font, size, and personal taste. Refer to #link("https://typst.app/docs/reference/model/par/#parameters-spacing")[Typst's par documentation] for details.

#v(5pt)

*`number-pages`* #h(15pt) #highlight-type.bool

Enable page numbering from the second page onwards.

#text(size: 10pt)[*Default:* `false`]

#text(size: 10pt)[*Examples:*]
```typ
number-pages: true // Page numbers from the second page onwards
```

#_preview[
  #align(center)[
    #text(fill: luma(140))[#construct-custom-footer(
      footer: (
        (footer-text: "+44-117-555-5555"),
        (footer-text: "dimblebyfamily@dimbleby.org"),
        (footer-text: "https://dimbleby.org"),
      ),
    )]
    #text(size: 9pt, font: "DejaVu Sans Mono")[2]
  ]
]

*Note:* Page numbers are centered at the bottom of the page below the footer if one is specified.

=== Typographical Settings

These parameters govern the visual presentation of your text, allowing you to define custom font families, base sizes, and other stylistic elements used throughout the document.

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
date-alignment: right // Right-aligned date (default)
date-alignment: center // Center-aligned date
date-alignment: left // Left-aligned date
```

#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 8pt,
    align: top,
    align(center)[
      #lp[
        #construct-date(date: _dd, date-alignment: right, from-alignment: right, from-name: _dn, from-address: _da)
      ]
      #text(size: 9pt, fill: luma(100))[Right-aligned date (default)]
    ],
    align(center)[
      #lp[
        #construct-date(date: _dd, date-alignment: center, from-alignment: right, from-name: _dn, from-address: _da)
      ]
      #text(size: 9pt, fill: luma(100))[Center-aligned date]
    ],
    align(center)[
      #lp[
        #construct-date(date: _dd, date-alignment: left, from-alignment: right, from-name: _dn, from-address: _da)
      ]
      #text(size: 9pt, fill: luma(100))[Left-aligned date]
    ],
  )
]

*Note:* When `date-alignment` matches #link(<from-alignment>)[`from-alignment`] and a sender is present in the normal flow, the date block is width-matched to the sender block so their edges align. When `letterhead.sender-position` is set, the sender moves into the letterhead and the date aligns independently of the sender.

#[#metadata("") <from-alignment>]
*`from-alignment`* #h(15pt) #highlight-type.alignment

Sets the alignment of the sender's name and address.

#text(size: 10pt)[*Default:* `right`]

#text(size: 10pt)[*Examples:*]
```typ
from-alignment: right // Right-aligned sender (default)
from-alignment: center // Center-aligned sender
from-alignment: left // Left-aligned sender
```

#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 8pt,
    align: top,
    align(center)[
      #lp[
        #construct-sender(from-name: _dn, from-address: _da, from-alignment: right)
      ]
      #text(size: 9pt, fill: luma(100))[Right-aligned sender (default)]
    ],
    align(center)[
      #lp[
        #construct-sender(from-name: _dn, from-address: _da, from-alignment: center)
      ]
      #text(size: 9pt, fill: luma(100))[Center-aligned sender]
    ],
    align(center)[
      #lp[
        #construct-sender(from-name: _dn, from-address: _da, from-alignment: left)
      ]
      #text(size: 9pt, fill: luma(100))[Left-aligned sender]
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
      #text(size: 9pt, fill: luma(100))[Left-aligned footnote (default)]
    ],
    align(center)[
      #_fn-preview(center)
      #text(size: 9pt, fill: luma(100))[Center-aligned footnote]
    ],
    align(center)[
      #_fn-preview(right)
      #text(size: 9pt, fill: luma(100))[Right-aligned footnote]
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
  #align(a, stack(dir: ttb, spacing: 10pt, box(width: 50mm, clip: true, image("images/albus-sig.png")), block(
    width: 50mm,
    align(a)[Lord Albus Dimbleby],
  )))
]

#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 8pt,
    align: top,
    align(center)[
      #_sig-preview(left)
      #text(size: 9pt, fill: luma(100))[Left-aligned signature (default)]
    ],
    align(center)[
      #_sig-preview(center)
      #text(size: 9pt, fill: luma(100))[Center-aligned signature]
    ],
    align(center)[
      #_sig-preview(right)
      #text(size: 9pt, fill: luma(100))[Right-aligned signature]
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
link-color: rgb(46, 111, 64) // Custom SVG color Forest Green
```

#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 8pt,
    align: top,
    align(center)[
      #lp(factor: 75%, width: 60mm)[
        Contact us at #text(fill: blue)[dimbleby.org].
      ]
      #text(size: 9pt, fill: luma(100))[ Typst's blue: `#0074d9` (default)]
    ],
    align(center)[
      #lp(factor: 75%, width: 60mm)[
        Contact us at #text(fill: maroon)[dimbleby.org].
      ]
      #text(size: 9pt, fill: luma(100))[ Typst's maroon: `#85144b` ]
    ],
    align(center)[
      #lp(factor: 75%, width: 60mm)[
        Contact us at #text(fill: rgb(46, 111, 64))[dimbleby.org].
      ]
      #text(size: 9pt, fill: luma(100))[Custom SVG color: `Forest Green`]
    ],
  )
]

Refer to #link("https://typst.app/docs/reference/visualize/color/#summary")[Typst's documentation on colors] for additional details.

== Signature Handling <signature-handling>

=== Multiple Signatures

Signatures are organized in rows with a maximum of three signatures each, filling from left to right. When the available width is exceeded, the signatures wrap to a new row. There is no limit to the total number of signatories.

- *Baseline Alignment:* Within each row, name baselines are always aligned, regardless of whether a signature image or affiliation is present.

- *Parameter Behavior:* The #link(<signature-alignment>)[`signature-alignment`] parameter is automatically ignored whenever more than one signature is present.

#text(size: 10pt)[*Example:*]
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
  #let _sig = (name, img) => stack(dir: ttb, spacing: 10pt, box(width: 36mm, clip: true, img), [#name])

  #grid(
    columns: (auto, auto, auto),
    gutter: 24pt,
    _sig("Lord Albus Dimbleby", image("images/albus-sig.png")),
    _sig("Lady Abigail Dimbleby", image("images/abigail-sig.png")),
    _sig("Sir Austin Dimbleby", image("images/austin-sig.png")),
  )
]

=== Managing Long Affiliations

When an affiliation exceeds the standard length, the signature block automatically expands vertically to accommodate the text.

- *Dynamic Row Height:* To maintain consistent alignment, all signature blocks within a single row will scale to match the height of the tallest entry. This ensures that the name baselines remain perfectly level across the entire row.

- *Manual Line Breaks:*You can explicitly define line breaks within an affiliation by using the backslash (\) character. The `letterloom` template will respect these linebreaks, automatically calculating the necessary width and adjusting the arrangement of subsequent signatures to maintain the specified order.

#text(size: 10pt)[*Example:*]
```typ
signatures: (
  (
    name: "Lord Albus Dimbleby",
    signature: image("albus-sig.png", width: 40mm),
    affiliation: [
      Earl of Cheswick \
      Chairman of the Dimbleby Family Charitable Trust \
      President of the Royal Horticultural Society \
    ],
  ),
  (
    name: "Lady Abigail Dimbleby",
    signature: image("abigail-sig.png", width: 40mm),
    affiliation: [
      Countess of Cheswick
    ],
    // shorter affiliation — block expands to match Lord Albus's height
  ),
  (
    name: "Sir Austin Dimbleby",
    signature: image("austin-sig.png", width: 40mm),
    affiliation: [
      Knight Commander of the Order of the British Empire \
      Chairman of the Dimbleby Estate \
      Secretary of the Dimbleby Family Charitable Trust \
      Senior Fellow of the Royal Geographical Society \
    ],
    // wide affiliation forces this onto its own row
  ),
)
```

#_preview[
  #stack(
    spacing: 1em,
    grid(
      columns: (auto, auto),
      column-gutter: 24pt,
      align: top + left,
      stack(
        spacing: 1em,
        box(width: 40mm, image("images/albus-sig.png", width: 40mm)),
        stack(
          spacing: 1em,
          [Lord Albus Dimbleby],
          [
            Earl of Cheswick \
            Chairman of the Dimbleby Family Charitable Trust \
            President of the Royal Horticultural Society \
          ],
        ),
      ),
      stack(
        spacing: 1em,
        box(width: 40mm, image("images/abigail-sig.png", width: 40mm)),
        stack(
          spacing: 1em,
          [Lady Abigail Dimbleby],
          [Countess of Cheswick],
        ),
      ),
    ),
    stack(
      spacing: 1em,
      box(width: 40mm, image("images/austin-sig.png", width: 40mm)),
      stack(
        spacing: 1em,
        [Sir Austin Dimbleby],
        [
          Knight Commander of the Order of the British Empire \
          Chairman of the Dimbleby Estate \
          Secretary of the Dimbleby Family Charitable Trust \
          Senior Fellow of the Royal Geographical Society \
        ],
      ),
    ),
  )
]

== Letterhead Layout <letterhead-layouts>

The `letterloom` template offers four distinct letterhead layouts. The default full-width layout is applied when the sender-position parameter is omitted, while the other three are controlled by specifying `sender-position` as `left`, `right`, or `center`.

All layouts support adding spacing to the letterhead using the `image-inset` parameter.

#let _lhl(body) = block(
  width: 46mm,
  height: 55mm,
  clip: true,
  fill: white,
  stroke: 0.5pt + luma(170),
  radius: 2pt,
  body,
)
#let _sender-lines() = stack(
  dir: ttb,
  spacing: 2pt,
  rect(width: 18mm, height: 2pt, fill: luma(200), stroke: none, radius: 1pt),
  rect(width: 14mm, height: 2pt, fill: luma(200), stroke: none, radius: 1pt),
  rect(width: 16mm, height: 2pt, fill: luma(200), stroke: none, radius: 1pt),
  rect(width: 12mm, height: 2pt, fill: luma(200), stroke: none, radius: 1pt),
)

=== Full-Width

The full-width letterhead image is placed flush with the physical edges of the page. This is the default when the `sender-position` is omitted.

#text(size: 10pt)[*Example:*]

```typ
// Full-width letterhead with sender lines in default position
letterhead: (
  file: read("images/letterhead.png", encoding: none),
  image-alignment: center,
)
```

#block(breakable: false, width: 100%)[
  #align(center)[
    #_lhl({
      place(top + left, rect(width: 46mm, height: 10mm, fill: luma(215), stroke: none))
      place(top + left, dx: 24mm, dy: 13mm, _sender-lines())
      place(top + left, dx: 4mm, dy: 25mm, _lh-lines())
    })
  ]
]

=== Sender Alongside: Right

The letterhead image is placed flush to the left edge of the page. The sender address fills the remaining column to the right, vertically centred relative to the image by default.

#text(size: 10pt)[*Example:*]

```typ
// Letterhead with sender alongside on the right, vertically centred (default)
letterhead: (
  file: read("images/letterhead.png", encoding: none),
  width: 65mm, // required in practice — sets the column split
  sender-position: right,
  sender-valign: horizon, // top, horizon (default), or bottom
)
```

#block(breakable: false, width: 100%)[
  #align(center)[
    #_lhl({
      place(top + left, rect(width: 22mm, height: 17mm, fill: luma(215), stroke: none))
      place(top + left, dx: 25mm, dy: 6mm, _sender-lines())
      place(top + left, dx: 4mm, dy: 21mm, _lh-lines())
    })
  ]
]

- `image-alignment` is ignored.
- Specify `width`; omitting it defaults to full content width, leaving no room for the sender.
- `sender-valign` controls the vertical position of the sender relative to the image: `top`, `horizon` (default), or `bottom`.

=== Sender Alongside: Left

The letterhead image is placed flush to the right edge of the page. The sender address fills the remaining column to the left, vertically centred relative to the image by default.

#text(size: 10pt)[*Example:*]

```typ
// Letterhead with sender alongside on the left, vertically centred (default)
letterhead: (
  file: read("images/letterhead.png", encoding: none),
  width: 65mm,
  sender-position: left,
  sender-valign: horizon, // top, horizon (default), or bottom
)
```

#block(breakable: false, width: 100%)[
  #align(center)[
    #_lhl({
      place(top + left, dx: 24mm, rect(width: 22mm, height: 17mm, fill: luma(215), stroke: none))
      place(top + left, dx: 4mm, dy: 6mm, _sender-lines())
      place(top + left, dx: 4mm, dy: 21mm, _lh-lines())
    })
  ]
]

- `image-alignment` is ignored.
- `sender-valign` controls the vertical position of the sender relative to the image: `top`, `horizon` (default), or `bottom`.

=== Sender Centered Below

The letterhead image is placed flush and centered. The sender address is placed absolutely below it, also centered, forming a single decorative header block. The letter content (date, recipient, body) starts below both.

#text(size: 10pt)[*Example:*]

```typ
// Letterhead with sender centered below
letterhead: (
  file: read("images/letterhead.png", encoding: none),
  width: 120mm,
  sender-position: center,
  bottom-gap: 8mm, // space between sender and content; defaults to par-spacing
)
```

#block(breakable: false, width: 100%)[
  #align(center)[
    #_lhl({
      place(top + left, dx: 9mm, dy: 2mm, rect(width: 28mm, height: 9mm, fill: luma(215), stroke: none))
      place(top + left, dx: 13mm, dy: 13mm, stack(dir: ttb, spacing: 2pt, rect(width: 20mm, height: 2pt, fill: luma(200), stroke: none, radius: 1pt), rect(width: 16mm, height: 2pt, fill: luma(200), stroke: none, radius: 1pt), rect(width: 18mm, height: 2pt, fill: luma(200), stroke: none, radius: 1pt)))
      place(top + left, dx: 4mm, dy: 26mm, _lh-lines())
    })
  ]
]

- `image-alignment` is ignored; the image is always centered.
- `bottom-gap` controls the space between the sender address and the letter content below; it has no effect on the other three layouts.
- The date is decoupled from the sender — `date-alignment` and `from-alignment` do not interact.

=== Notes and Caveats

- *Use `read()`, not `image()`:* The file key expects raw bytes loaded via `read("path", encoding: none)`. Passing a Typst `image()` call will produce a type error.

- *Aspect ratio:* Setting both `width` and `height` may distort the image. If the values do not match the image's natural aspect ratio, the image will be stretched or compressed. Omit `height` to let it scale proportionally with `width`.

- *Percentage widths:* Percentage widths are relative to the available width. A width of 100% fills the page width minus the letterhead's left and right `image-inset`, not the full physical page width. To span the full page width with no inset, omit `width` entirely or set `image-inset` to `0mm`.

- *Auto page margins:* When the #link(<margins>)[`margins`] parameter is left at its default of `auto`, letterloom derives the page margin using Typst's formula: 2.5/21 of the page's shorter dimension. If you set custom page margins, the letterhead placement adjusts automatically.

- *Custom inset with asymmetric sides:* When using a dictionary for `image-inset` (e.g., `(top: 5mm, rest: 8mm)`), the `rest` key sets the fallback for any sides not explicitly listed.

- *Image format support:* PNG, JPEG, SVG, and GIF are supported. Passing a file in an unsupported format will result in a Typst compile error.

== Embedding Enclosures <enclosures-embedded>

When a `file` key is provided, the document is embedded on a dedicated page appended to the letter. The sections below detail the available options for file-embedded enclosures.

=== Embedding Files

To append the actual document to your letter, load the file as bytes using `read("path", encoding: none)`. The file will be rendered on a new page following the letter body.

#text(size: 10pt)[*Example:*]

```typ
// Enclosures with embedded files
enclosures: (
  (
    description: "Photograph of storm damaged Oak trees.",
    file: read("enclosures/storm-damaged-oak-tree.jpg", encoding: none),
  ),
)
```

=== Multi-Page PDFs

By default, only the first page of an embedded PDF is rendered. Use the pages key to specify how many pages to include.

#text(size: 10pt)[*Example:*]

```typ
// Enclosure with multiple pages from a PDF file
enclosures: (
  (
    description: "Heritage Oak provenance statement.",
    file: read("enclosures/heritage-oak-provenance-statement.pdf", encoding: none),
    pages: 3, // renders pages 1–3
  ),
)
```

*Terminal Tip:* To quickly find the page count of a PDF, you can use the `pdfinfo` command from the #link("https://poppler.freedesktop.org")[Poppler] library: `pdfinfo document.pdf | grep Pages`.

=== Page Insets

You can customize the margins for each embedded enclosure using `page-inset`. This accepts either a uniform length or a dictionary to target specific sides (valid keys: `top`, `bottom`, `left`, `right`, `x`, `y`, `rest`).

#text(size: 10pt)[*Example:*]

```typ
// Enclosure with custom page insets
enclosures: (
  (
    description: "Photograph of storm damaged Oak trees.",
    file: read("enclosures/storm-damaged-oak-tree.jpg", encoding: none),
    page-inset: 15mm, // uniform on all sides
  ),
)
```

=== Mixed List

You can freely mix description-only line items and embedded files within the same list.

#text(size: 10pt)[*Example:*]

```typ
// Mixed list of enclosures with descriptions and embedded files
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

A fully working demonstration of enclosures can be found in the #link(label("comprehensive-example"))[Comprehensive Example] section.

== Comprehensive Example <comprehensive-example>

The example below demonstrates the core capabilities of the `letterloom` template in action.

*Note:* This is not intended as a ready-to-use template for everyday correspondence. Instead, it serves as a technical showcase, illustrating how various parameters interact to produce a complex, richly formatted letter.


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

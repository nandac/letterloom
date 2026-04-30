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

= `letterloom v3.0.0`

== Introduction

The `letterloom` package is a user-friendly and customizable template designed to streamline the creation of professional-looking letters. Whether for personal or business correspondence, it eliminates the challenges of traditional typesetting tools like LaTeX while delivering polished and elegant results.

*Key Features:*
- *Multiple Signatures:* Effortlessly include one or more signatures for joint communications or approvals.

- *Letterhead:* Place a branded letterhead image flush with the page edges on the first page.

- *Enclosures:* Clearly list and optionally attach additional documents included with the letter.

- *Customizable Footnotes:* Add informative footnotes with flexible formatting options.

- *Internationalization Support:* Customize labels and text for different languages and regions.

*Benefits:*
- Simplifies the letter-writing process with an intuitive template.

- Eliminates the steep learning curve of tools like LaTeX.

- Delivers professional-quality output without requiring technical expertise.

- Supports multilingual documents with customizable labels.

Regardless of whether you are preparing a formal business correspondence, or crafting a personal letter, `letterloom` makes creating visually appealing documents both straightforward and efficient.

== Requirements

Typst 0.14.0 or higher is required to use this package.

== Usage

Each parameter is documented below with its type, default value, and examples.

=== Getting Started

Here is a simple example showing the essential arguments needed to use the `letterloom` package:

```typ
#import "@preview/letterloom:3.0.0": *

#show: letterloom.with(
  // Sender's contact information (name and address)
  from-name: "Sender's Name",
  from-address: [
    Sender's Address
  ],

  // Recipient's contact information (name and address)
  to-name: "Receiver's Name",
  to-address: [
    Receiver's Address
  ],

  // Letter date (automatically set to today's date)
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),

  // Opening greeting
  salutation: "Dear Receiver's Name,",

  // Letter subject line
  subject: "Subject",

  // Closing phrase
  closing: "Yours sincerely,",

  // List of signatures with their name, optional signature image and affiliation
  signatures: (
    (
      name: "Sender's Name",
    ),
  ),
)

// Write the body of your letter here
```

=== Creating a New Letter Project

To create a new letter project run the following command in your terminal:

```bash
typst init @preview/letterloom:3.0.0
```

This will generate a ready-to-use letter project in your current directory.

Alternatively, you may create a new project directly in the #link("https://typst.app/app?template=letterloom&version=3.0.0")[Typst webapp].

=== Required Parameters

All nine fields below are required by default. To omit any of them, use `required-fields` — see #link(<field-configuration>)[Field Configuration] for details.

#v(5pt)

*`from-name`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)

The sender's name.

#text(size: 10pt)[*Examples:*]
```typ
// String
from-name: "The Dimbleby Family"

// Content block
from-name: text(weight: "bold")[The Dimbleby Family]
```

#v(5pt)

*`from-address`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)

The sender's address.

#v(10pt)

#text(size: 10pt)[*Examples:*]
```typ
// String
from-address: "The Dimbleby Estate"

// Content block
from-address: [
  The Dimbleby Estate \
  Cheswick Village \
  Middle Upton \
  Bristol BS16 1GU
]
```

*Note:* By default, the sender's name and address are right-aligned. You may change this using the `from-alignment` parameter.

#v(5pt)

*`to-name`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)

The recipient's name.

#text(size: 10pt)[*Examples:*]
```typ
// String
to-name: "Evergreen Tree Surgeons"

// Content block
to-name: text(weight: "bold")[Evergreen Tree Surgeons]
```

#v(5pt)

*`to-address`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)

The recipient's address.

#text(size: 10pt)[*Examples:*]
```typ
// String
to-address: "Midtown Lane"

// Content block
to-address: [
  Midtown Lane \
  Cheswick Village \
  Stoke Gifford \
  Bristol BS16 1GU
]
```

#v(5pt)

*`date`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

The letter's date.

#text(size: 10pt)[*Examples:*]
```typ
// Simple string format
date: "01 January 1970"

// Dynamic date using Typst's datetime functions
date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]")

// Custom formatted date
date: datetime.today().display("[weekday repr:long], [day] [month repr:long] [year]")
```

For custom formatting options, refer to #link("https://typst.app/docs/reference/foundations/datetime/#format")[Typst's datetime formatting documentation].

*Note:* By default, the letter's date is right-aligned. You may change this using the `date-alignment` parameter.

#v(5pt)

*`salutation`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

The opening greeting.

#text(size: 10pt)[*Examples:*]
```typ
// Standard business greeting
salutation: "Dear Mr Hawthorne,"

// Formal greeting
salutation: "To Whom It May Concern,"

// Personal greeting
salutation: "Dear John,"
```

#v(5pt)

*`subject`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

The subject line.

#text(size: 10pt)[*Examples:*]
```typ
// Simple subject
subject: "Pruning of Heritage Oak Trees in the Dimbleby Estate"

// Styled subject with formatting
subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")]

// Subject with emphasis
subject: [Re: #emph[Urgent] Tree Maintenance Request]
```

#v(5pt)

*`closing`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

The closing phrase.

#text(size: 10pt)[*Examples:*]
```typ
// Formal business closing phrase
closing: "Yours sincerely,"

// Less formal closing phrase
closing: "Best regards,"

// Personal closing phrase
closing: "With warm personal regards,"
```

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
  [`affiliation`],
  [#highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt) _optional_],
  [The signatory's title, role, and affiliation as free-form content. Use `\` to place each item on its own line.],

  [`signature`],
  [#highlight-type.content #h(5pt) _optional_],
  [#link("https://typst.app/docs/reference/visualize/image/")[Typst image function] specifying the location of the signature image. If omitted, a blank space is reserved for a physical signature.],
)

#text(size: 10pt)[*Examples:*]
```typ
// Single signature
signatures: (
  (
    name: "Lord Albus Dimbleby",
    signature: image("images/albus-sig.png"),
  )
)

// Single signature with affiliation
signatures: (
  (
    name: "Sir Austin Dimbleby",
    affiliation: [
      Knight Commander of the Order of the British Empire \
      Senior Advisor, International Relations \
      Chairman, Global Trade Council
    ],
  ),
)

// Multiple signatures
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
    // No signature image - space left for physical signature
  )
)
```

*Note:* If only one signature is given, the `signature-alignment` parameter may be used to align the signature to the left, right, or center of the page. This parameter is ignored if multiple signatures are specified.

When multiple signatures are provided, they are arranged automatically in rows of up to three, filling left-to-right. A signature that would overflow the available page width is placed on a new row. Name baselines are aligned horizontally within each row regardless of whether a signature image or affiliation is present.

=== Field Configuration <field-configuration>

The `required-fields` parameter controls which core fields are rendered in the letter. Excluding a field from the list suppresses it entirely — no blank space is left in its place — making it straightforward to produce letters that omit elements such as a subject line or closing phrase.

#v(5pt)

*`required-fields`* #h(15pt) #highlight-type.array

Controls which core fields are rendered in the letter.

The valid field names are:

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
// Omit the subject line and closing from the letter
required-fields: (
  "from-name", "from-address",
  "to-name", "to-address",
  "date", "salutation", "signatures",
),

// Minimal letter with no salutation, subject, or closing
required-fields: (
  "from-name", "from-address",
  "to-name", "to-address",
  "date", "signatures",
),
```

=== Optional Parameters

The following optional parameters enable you to add additional fields like a letterhead image, an attention line, a list of cc recipients, a list of enclosures, and a footer to your letter if desired.

#v(5pt)

*`letterhead`* #h(15pt) #highlight-type.dictionary

Places a letterhead image flush with the physical page edges. The letterhead is rendered on the first page only. Subsequent pages are unaffected and use the normal page margins throughout.

#table(
  columns: 3,
  column-gutter: 10pt,
  row-gutter: 5pt,
  rows: 5,
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
  [Height of the image. When omitted, height scales proportionally from the width.],

  [`margin`],
  [#highlight-type.length #h(5pt) or #h(5pt) #highlight-type.dictionary #h(5pt) _optional_],
  [Inset applied between the physical page edge and the image. Defaults to `0mm` on all sides.],

  [`alignment`], [#highlight-type.alignment #h(5pt) _optional_], [Horizontal alignment. Defaults to `center`.],
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
  margin: (top: 5mm, bottom: 3mm, rest: 8mm),
  alignment: center,
)

// Fixed-width letterhead with uniform margin
letterhead: (
  file: read("images/letterhead.png", encoding: none),
  width: 120mm,
  margin: 5mm,
  alignment: right,
)
```

*Notes and caveats:*

- *Use `read()`, not `image()`.* The `file` key expects raw bytes loaded via `read("path", encoding: none)`. Passing a Typst `image()` call will produce a type error.

- *Setting both `width` and `height` may distort the image.* If the values do not match the image's natural aspect ratio, the image will be stretched or compressed. Omit `height` to let it scale proportionally from `width`.

- *Percentage widths are relative to available width.* A `width` of `100%` fills the page width minus the letterhead's left and right margins, not the full physical page width. To span the full page width with no margin, omit `width` entirely or set `margin` to `0mm`.

- *Auto page margins.* When `margin` is left at its default of `auto`, letterloom derives the page margin using Typst's formula: 2.5/21 of the page's shorter dimension. If you set custom `margin`, the letterhead placement adjusts automatically.

- *Custom margins with asymmetric sides.* When using a dictionary for `margin` (e.g. `margin: (top: 5mm, rest: 8mm)`), the `rest` key sets the fallback for any sides not explicitly listed.

- *Image format support.* PNG, JPEG, SVG, and GIF are supported. Passing a file in an unsupported format will result in a Typst compile error.

#v(5pt)

*`attn-name`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)

The attention line recipient's name.

#text(size: 10pt)[*Default:* #h(5pt) #highlight-type.none-type]

#text(size: 10pt)[*Example:*]
```typ
attn-name: "Mr Basil Hawthorne"
```

#v(5pt)

*`attn-label`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)

The label printed before the attention line name.

#text(size: 10pt)[*Default:* `"Attn:"`]

#text(size: 10pt)[*Example:*]
```typ
attn-label: "À l'attention de"
```

#v(5pt)

*`attn-position`* #h(15pt) #highlight-type.str

Whether to place the attention line above or below the recipient's address.

#text(size: 10pt)[*Default:* `"above"`]

#text(size: 10pt)[*Example:*]
```typ
attn-position: "below"
```

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

#v(5pt)

*`enclosures`* #h(15pt) #highlight-type.array

An array of enclosure dictionaries, listed after the letter closing. When a file is provided, it is embedded on a dedicated page after the letter body. Each dictionary has the following keys:

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

  [`margin`],
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
    margin: (top: 20mm),
  ),
)
```

*Note:* To find the page count of a PDF, you may use the `pdfinfo` command from the #link("https://poppler.freedesktop.org")[Poppler] library: `pdfinfo document.pdf | grep Pages`.

#v(5pt)

*`enclosures-label`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)

The label printed before the enclosures list.

#text(size: 10pt)[*Default:* `"encl:"`]

#text(size: 10pt)[*Examples:*]
```typ
// String
enclosures-label: "P.J.:"

// Content block
enclosures-label: text(weight: "bold")[encl:]
```

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

*Note:* The footer is placed at the bottom of the letter above the page number if enabled and is center-aligned.

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

Refer to #link("https://typst.app/docs/reference/layout/page/#parameters-margin")[Typst's margin documentation] for more information.

*Note:* The default setting of #h(5pt) #highlight-type.auto-type #h(5pt) results in a 25 mm margin for A4, the package's default paper size.

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

*Note:* Adjust this value to complement the chosen font and font size.

#v(5pt)

*`par-spacing`* #h(15pt) #highlight-type.length

Spacing between paragraphs.

#text(size: 10pt)[*Default:* `1.8em`]

#text(size: 10pt)[*Examples:*]
```typ
par-spacing: 1.5em // Compact paragraphs
par-spacing: 1.8em // Standard spacing
par-spacing: 2.0em // Relaxed spacing
```

*Note:* Modify this value to match the font and font size for optimal readability.

#v(5pt)

*`number-pages`* #h(15pt) #highlight-type.bool

Enables page numbering, starting from the second page.

#text(size: 10pt)[*Default:* `false`]

#text(size: 10pt)[*Examples:*]
```typ
number-pages: false // No page numbers
number-pages: true // Page numbers from the second page onwards
```

*Note:* Page numbers are centered at the bottom of the page, below the footer if one is specified.

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

*`date-alignment`* #h(15pt) #highlight-type.alignment

Sets the alignment of the letter's date.

#text(size: 10pt)[*Default:* `right`]

#text(size: 10pt)[*Examples:*]
```typ
date-alignment: left // Left-aligned date
date-alignment: right // Right-aligned date (default)
date-alignment: center // Center-aligned date
```

*`from-alignment`* #h(15pt) #highlight-type.alignment

Sets the alignment of the sender's name and address.

#text(size: 10pt)[*Default:* `right`]

#text(size: 10pt)[*Examples:*]
```typ
from-alignment: left // Left-aligned sender
from-alignment: right // Right-aligned sender (default)
from-alignment: center // Center-aligned sender
```

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

#v(5pt)

*`signature-alignment`* #h(15pt) #highlight-type.alignment

Specifies the alignment of the signature if only one signature is specified. If multiple signatures are specified this parameter is ignored.

#text(size: 10pt)[*Default:* `left`]

#text(size: 10pt)[*Examples:*]
```typ
signature-alignment: left // Left-aligned signature (default)
signature-alignment: right // Right-aligned signature
signature-alignment: center // Center-aligned signature
```
#v(5pt)

*`link-color`* #h(15pt) #highlight-type.color

Determines the color of hyperlinks in the letter.

#text(size: 10pt)[*Default:* `blue`]

#text(size: 10pt)[*Examples:*]
```typ
link-color: blue // Typst's blue #0074d9 (default)
link-color: maroon // Typst's maroon #85144b
link-color: rgb(0, 100, 200) // Custom RGB color
```

Refer to #link("https://typst.app/docs/reference/visualize/color/#summary")[Typst's documentation on colors] for additional details.

== Comprehensive Letter Example

The following example illustrates several key features of the `letterloom` package and explains how they can be applied in practice.

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
    margin: (bottom: 2mm, rest: 5mm),
  ),

  // List of cc recipients (optional)
  cc: "Mr Jethro Tull",

  // List of enclosures (optional)
  enclosures: (
    (
      description: "Photograph of storm damaged Oak trees.",
      file: read("enclosures/storm-damaged-oak-tree.jpg", encoding: none),
      margin: 20mm,
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
    margin: (bottom: 2mm, rest: 5mm),
  ),

  // List of cc recipients (optional)
  cc: "Mr Jethro Tull",

  // List of enclosures (optional)
  enclosures: (
    (
      description: "Photograph of storm damaged Oak trees.",
      file: read("enclosures/storm-damaged-oak-tree.jpg", encoding: none),
      margin: 20mm,
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

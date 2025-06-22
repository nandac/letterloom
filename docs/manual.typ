#import "@preview/letterloom:0.1.0": *
#import "highlight-type.typ": highlight-type

// Global Styles
#set page(margin: 25mm)
#set text(size: 11pt, font: "Noto Serif")
#set par(spacing: 1.5em)
#set strong(delta: 200) // Set bold to semibold

//Customize appearance
#show raw: set text(font: "Fira Mono", size: 1.2em)
#show raw.where(block: true): set block(fill: rgb("#faebd7"), inset: 1em, radius: 0.5em, width: 100%)
#show link: set text(fill: blue, font: "Source Sans Pro", size: 12pt)

// Text Element configuration
#show heading.where(level: 1): h1 => {
  set block(above: 2em, below: 1.5em)
  set text(weight: "semibold")
  h1
}

#show heading.where(level: 2): h2 => {
  set block(above: 2em, below: 1.5em)
  set text(weight: "semibold")
  h2
}

#show heading.where(level: 3): h3 => {
  set block(above: 2em, below: 1.5em)
  set text(weight: "semibold")
  h3
}

// Table and figure configuration
#show table.header: set text(weight: "semibold")
#show figure: set block(breakable: true)

// End of setup

= The `letterloom` package

== Introduction

The `letterloom` package is a user-friendly, highly customizable template for creating professional letters with ease. Designed for both personal and business correspondence, it eliminates the complexities of traditional typesetting tools like LaTeX while facilitating a polished, professional output.

*Key Features:*
- Multiple Signatures: Easily include one or more signatures to accommodate joint communications or approvals.

- Customizable Footnotes: Add informative footnotes with options for personalized formatting.

- Enclosures and Attachments: Clearly list additional documents included with the letter.

*Benefits:*
- Simplifies the letter-writing process with an easy to use template.

- Avoids the steep learning curve associated with tools like LaTeX.

- Ensures professional-quality output without technical expertise.

Whether crafting a formal business correspondence or a personal letter, `letterloom` makes creating visually appealing documents straightforward and efficient.

== Usage

Below is an example demonstrating how to create a letter using the `letterloom` package with the minimum required arguments:

```typ
#import "@preview/letterloom:0.1.0": *

#show: letterloom.with(
  from: (
    name: "The Dimbleby Family",
    address: [The Lodge \
              Cheswick Village \
              Middle Upton \
              Bristol BS16 1GU]
  ),
  to: (
    name: "Evergreen Tree Surgeons",
    address: [Midtown Lane \
              Cheswick Village \
              Stoke Gifford \
              Bristol BS16 1GU]
  ),
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
  salutation: "Dear Mr Hawthorne",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  closing: "Sincerely yours,",
  signatures: (
    (
      name: "Lord Albus Dimbleby",
      signature: image("images/albus-sig.png")
    ),
    (
      name: "Lady Abigail Dimbleby",
      signature: image("images/abigail-sig.png")
    ),
    (
      name: "Sir Austin Dimbleby",
      signature: image("images/austin-sig.png")
    )
  )
)

// Write the body of your letter here
```

The `letterloom` package provides several customization options to help tailor your letter for specific needs. In the following sections, we will explore all available parameters in detail, showcasing their usage with examples on how to specify them. In cases where Typst provides multiple ways to configure an option, links have been provided to the relevant section in the #link("https://typst.app/docs/")[Typst documentation].

=== Mandatory Parameters

- *`from`* #h(15pt) #highlight-type.dictionary

  Sender's name and address, provided as a dictionary with the following keys:
  #table(
    columns: 3,
    column-gutter: 10pt,
    rows: 2,
    stroke: none,
    inset: 5pt,
    [`name`], [#highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)], [The sender's name.],
    [`address`], [#highlight-type.content], [The sender's address.],
  )

  *Example:*
  ```typ
  from: (
    name: "The Dimbleby Family",
    address: [The Lodge \
              Cheswick Village \
              Middle Upton \
              Bristol BS16 1GU]
  )
  ```

  *Note:* The sender's name and address are aligned to the right by default. This can be changed using the `from-alignment` parameter.

- *`to`* #h(15pt) #highlight-type.dictionary

  Receiver's name and address, provided as a dictionary with the following keys:
  #table(
    columns: 3,
    column-gutter: 10pt,
    rows: 2,
    stroke: none,
    inset: 5pt,
    [`name`], [#highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)], [The receiver's name.],
    [`address`], [#highlight-type.content], [The receiver's address.],
  )

  *Example:*
  ```typ
  to: (
    name: "Evergreen Tree Surgeons",
    address: [Midtown Lane \
              Cheswick Village \
              Stoke Gifford \
              Bristol BS16 1GU]
  )
  ```

- *`date`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

  Date of the letter.

  *Examples:*
  ```typ
  date: "01 January 1970"
  ```
  or
  ```typ
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]")
  ```

  Refer to #link("https://typst.app/docs/reference/foundations/datetime/#format")[Typst's documentation on datetime formatting] for more details on how to format the date to your liking.

- *`salutation`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

  Salutation or greeting in the letter.

  *Example:*
  ```typ
  salutation: "Dear Mr Hawthorne,"
  ```

- *`subject`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

  Subject of the letter.

  *Example:*
  ```typ
  subject: "Pruning of Heritage Oak Trees in the Dimbleby Estate"
  ```

- *`closing`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

  Closing line of the letter.

  *Example:*
  ```typ
  closing: "Yours sincerely,"
  ```

- *`signatures`* #h(15pt) #highlight-type.array

  An array of dictionaries representing the signatures of the letter's signatories. Each dictionary contains the following keys:

  #table(
    columns: 3,
    column-gutter: 10pt,
    rows: 2,
    stroke: none,
    inset: 5pt,
    [`name`], [#highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)], [The name of the signatory.],
    [`signature`], [#highlight-type.function #h(5pt) _optional_], [The image function for the signatory's signature. If omitted a space is left for a physical signature.],
  )

  *Example:*
  ```typ
  signatures: (
    (
      name: "Lord Albus Dimbleby",
      signature: image("images/albus-sig.png")
    ),
    (
      name: "Lady Abigail Dimbleby",
      signature: image("images/abigail-sig.png")
    )
    (
      name: "Sir Austin Dimbleby"
    )
  )
  ```

=== Optional Parameters

- *`attn-name`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

  Attention line for a specific recipient.

  *Default:* #h(5pt) #highlight-type.none-type

  *Example:*
  ```typ
  attn-name: "Mr Basil Hawthorne"
  ```

- *`cc`* #h(15pt) #highlight-type.array

  List of cc recipients.

  *Default:* #h(5pt) #highlight-type.none-type

  *Example:*
  ```typ
  cc: "Mr Jethro Tull"
  ```

- *`enclosures`* #h(15pt) #highlight-type.array

  List of enclosures.

  *Default:* #h(5pt) #highlight-type.none-type

  *Example:*
  ```typ
  enclosures: (
    "Provenance of the Oak trees on the Dimbleby Estate."
  )
  ```

- *`enclosures-title`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

  Title for the list of enclosures, allowing localization.

  *Default:* `"encl:"`

  *Example:*
  ```typ
  enclosures-title: "இணைப்புகள்:" // Enclosures in Tamil
  ```

- *`footer`* #h(15pt) #highlight-type.array

  List of footer elements, each containing:

  #table(
    columns: 3,
    column-gutter: 10pt,
    rows: 2,
    stroke: none,
    inset: 5pt,
    [`footer-text`], [#highlight-type.str #h(5pt)], [The footer text.],
    [`footer-type`], [#highlight-type.str #h(5pt)], [The type of footer element either `"url"`, `"email"`, or `"string"`. If the footer type is specified as `url` or `email` it will be rendered as a clickable hyperlink. The default footer type is `"string"`.],
  )

  *Default:* #h(5pt) #highlight-type.none-type

  *Example:*
  ```text
  footer =  (
    (
      footer-text: "+44-117-555-5555"
    ),
    (
      footer-text: "dimblebyfamily@dimbleby.org",
      footer-type: "email"
    ),
    (
      footer-text: "https://dimbleby.org",
      footer-type: "url"
    )
  )
  ```

  *Note:* Footers are always aligned center.



=== Optional Page Configuration Settings

- *`paper-size`* #h(15pt) #highlight-type.str

  Standard paper size to set width and height.

  *Default:* `"a4"`

  *Example:*
  ```typ
  paper-size: "us-letter"
  ```

  Refer to #link("https://typst.app/docs/reference/layout/page/#parameters-paper)")[Typst's documentation on paper sizes] for details on available paper sizes.

- *`margins`* #h(15pt) #highlight-type.auto-type #h(5pt) or #h(5pt) #highlight-type.relative #h(5pt) or #h(5pt) #highlight-type.dictionary

  Page's margins.

  *Default:* #h(5pt) #highlight-type.auto-type

  *Example:*
  ```typ
  margins: (top: 20mm, left: 20mm, bottom: 20mm, right: 20mm)
  ```

  Refer to  #link("https://typst.app/docs/reference/layout/page/#parameters-margin")[Typst's margin documentation] for details on how to set margins.

- *`par-leading`* #h(15pt) #highlight-type.length

  Line spacing within paragraphs.

  *Default:* `0.8em`

  *Example:*
  ```typ
  par-leading: 1.0em
  ```

- *`par-spacing`* #h(15pt) #highlight-type.length

  Spacing between paragraphs.

  *Default:* `1.8em`

  *Example:*
  ```typ
  par-spacing: 2.0em
  ```

- *`number-pages`* #h(15pt) #highlight-type.bool

  Enable/disable page numbering. Page numbers start from the second page.

  *Default:* `false`

  *Example:*
  ```typ
  number-pages: true
  ```

  *Note:* Page numbers are always aligned center.

=== Optional Font Settings

- *`main-font`* #h(15pt) #highlight-type.str

  Font used for the letter's main body.

  *Default:* `"Libertinus Serif"`

  *Example:*
  ```typ
  main-font: "Noto Serif"
  ```

- *`main-font-size`* #h(15pt) #highlight-type.length

  Font size for the letter's main body.

  *Default:* `11pt`

  *Example:*
  ```typ
  main-font-size: 12pt
  ```

- *`footnote-font`* #h(15pt) #highlight-type.str

  Font used for footnotes.

  *Default:* `"Libertinus Serif"`

  *Example:*
  ```typ
  footnote-font: "Noto Serif"
  ```

- *`footnote-font-size`* #h(15pt) #highlight-type.length

  Font size for footnotes.

  *Default:* `8pt`

  *Example:*
  ```typ
  footnote-font-size: 9pt
  ```

- *`footer-font`* #h(15pt) #highlight-type.str

  Font used for the letter's footer.

  *Default:* `"DejaVu Sans Mono"`

  *Example:*
  ```typ
  footer-font: "Fira Mono"
  ```

- *`footer-font-size`* #h(15pt) #highlight-type.length

  Font size for the letter's footer.

  *Default:* `7pt`

  *Example:*
  ```typ
  footer-font-size: 8pt
  ```

=== Optional Alignment Settings and Link Colors

- *`from-alignment`* #h(15pt) #highlight-type.alignment

  Alignment of the sender's address.

  *Default:* `right`

  *Example:*
  ```typ
  from-alignment: left
  ```

- *`footnote-alignment`* #h(15pt) #highlight-type.alignment

  Alignment of the footnote separator and footnotes.

  *Default:* `left`

  *Example:*
  ```typ
  footnote-alignment: right
  ```

- *`link-color`* #h(15pt) #highlight-type.color

  Color of hyperlinks in the letter.

  *Default:* `blue`

  *Example:*
  ```typ
  link-color: maroon
  ```

  Refer to #link("https://typst.app/docs/reference/visualize/color/#summary")[Typst's color documentation] for more details on how to specify colors.

== Comprehensive `letterloom` Example and Output

Below, we present a comprehensive example demonstrating the capabilities of the `letterloom` package. For clarity and reference, the final rendered result is also included.

```typ
// Not strictly necessary but it is nice to have figure captions in a smaller font size
#show figure.caption: set text(font: "Source Sans Pro", size: 9pt)

#show: letterloom.with(
  // Sender
  from: (
    name: "The Dimbleby Family",
    address: [The Lodge \
              Cheswick Village \
              Middle Upton \
              Bristol BS16 1GU]
  ),

  // Receiver
  to: (
    name: "Evergreen Tree Surgeons",
    address: [Midtown Lane \
              Cheswick Village \
              Stoke Gifford \
              Bristol BS16 1GU]
  ),

  // Attention
  attn-name: "Mr Basil Hawthorne",

  // Date
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),

  // Salutation
  salutation: "Dear Mr Hawthorne,",

  // Subject
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],

  // Closing
  closing: "Sincerely yours,",

  // Signatures
  signatures: (
    (
      name: "Lord Albus Dimbleby",
      signature: image("images/albus-sig.png")
    ),
    (
      name: "Lady Abigail Dimbleby",
      signature: image("images/abigail-sig.png")
    ),
    (
      name: "Sir Austin Dimbleby",
      signature: image("images/austin-sig.png")
    )
  ),

  // Carbon Copy
  cc: (
    "Mr Jethro Tull"
  ),

  // Enclosures
  enclosures: (
    "Provenance of the Oak trees on the Dimbleby Estate."
  ),

  // Footer
  footer: (
    (
      footer-text: "+44-117-555-5555"
    ),
    (
      footer-text: "dimblebyfamily@dimbleby.org",
      footer-type: "email"
    ),
    (
      footer-text: "https://dimbleby.org",
      footer-type: "url"
    )
  ),

  // Footer Font
  footer-font: "Fira Mono",

  // Footer Font Size
  footer-font-size: 7pt,

  // Number Pages
  number-pages: false,

  // Paper Size
  paper-size: "a4",

  // Margins
  margins: (top: 20mm, left: 20mm, bottom: 20mm, right: 20mm),

  // Main Font
  main-font: "Noto Serif",

  // Main Font Size
  main-font-size: 11pt,

  // Footnote Font
  footnote-font: "Noto Serif",

  // Footnote Font Size
  footnote-font-size: 7pt,

  // Footnote Alignment
  footnote-alignment: right,

  // Link Color
  link-color: maroon,
)

We are writing to request you to visit The Lodge at the Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

#figure(
  image("images/storm-damaged-oak-tree.jpg", width: 80%),
  caption: [Storm Damaged Oak Tree.#footnote[This image was generated using #link("https://deepai.org/machine-learning-model/text2img")[DeepAI's image generator].]]
)

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678. to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.
```

// Set the link style so that it is not overridden by our global styles set above
#show link: set text(font: "Fira Mono", size: 7pt)

// Not strictly necessary but it is nice to have figure captions in a smaller font size
#show figure.caption: set text(font: "Source Sans Pro", size: 9pt)

#show: letterloom.with(
  // Sender
  from: (
    name: "The Dimbleby Family",
    address: [The Lodge \
              Cheswick Village \
              Middle Upton \
              Bristol BS16 1GU]
  ),

  // Receiver
  to: (
    name: "Evergreen Tree Surgeons",
    address: [Midtown Lane \
              Cheswick Village \
              Stoke Gifford \
              Bristol BS16 1GU]
  ),

  // Attention
  attn-name: "Mr Basil Hawthorne",

  // Date
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),

  // Salutation
  salutation: "Dear Mr Hawthorne,",

  // Subject
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],

  // Closing
  closing: "Sincerely yours,",

  // Signatures
  signatures: (
    (
      name: "Lord Albus Dimbleby",
      signature: image("images/albus-sig.png")
    ),
    (
      name: "Lady Abigail Dimbleby",
      signature: image("images/abigail-sig.png")
    ),
    (
      name: "Sir Austin Dimbleby",
      signature: image("images/austin-sig.png")
    )
  ),

  // Carbon Copy
  cc: (
    "Mr Jethro Tull"
  ),

  // Enclosures
  enclosures: (
    "Provenance of the Oak trees on the Dimbleby Estate."
  ),

  // Footer
  footer: (
    (
      footer-text: "+44-117-555-5555"
    ),
    (
      footer-text: "dimblebyfamily@dimbleby.org",
      footer-type: "email"
    ),
    (
      footer-text: "https://dimbleby.org",
      footer-type: "url"
    )
  ),

  // Footer Font
  footer-font: "Fira Mono",

  // Footer Font Size
  footer-font-size: 7pt,

  // Number Pages
  number-pages: false,

  // Paper Size
  paper-size: "a4",

  // Margins
  margins: (top: 20mm, left: 20mm, bottom: 20mm, right: 20mm),

  // Main Font
  main-font: "Noto Serif",

  // Main Font Size
  main-font-size: 11pt,

  // Footnote Font
  footnote-font: "Noto Serif",

  // Footnote Font Size
  footnote-font-size: 7pt,

  // Footnote Alignment
  footnote-alignment: right,

  // Link Color
  link-color: maroon,
)

We are writing to request you to visit The Lodge at the Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

#figure(
  image("images/storm-damaged-oak-tree.jpg", width: 80%),
  caption: [Storm Damaged Oak Tree.#footnote[This image was generated using #link("https://deepai.org/machine-learning-model/text2img")[DeepAI's image generator].]]
)

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678. to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.

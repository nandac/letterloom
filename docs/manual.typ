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

- Figures and Figure Captions: Incorporate and label figures seamlessly for illustrated correspondence.

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
  salutation: "Gentlemen,",
  subject: "Pruning of Heritage Oak Trees in the Dimbleby Estate",
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

We are writing to request you to visit The Lodge at the Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678. to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.
```

The `letterloom` package provides extensive customization options to help tailor your letters to specific needs. In the following sections, we will explore all mandatory and optional parameters in detail, showcasing their usage with examples on how to specify them. In cases where there are multiple ways to configure an option, links have been provided to the relevant section in #link("https://typst.app/docs/")[Typst's documentation].

=== Required Parameters

- *`from`* #h(15pt) #highlight-type.dictionary

  The sender's name and address, provided as a dictionary with the following keys:
  #table(
    columns: 3,
    column-gutter: 10pt,
    rows: 2,
    stroke: none,
    inset: 5pt,
    [`name`], [#highlight-type.str], [The sender's name.],
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

- *`to`* #h(15pt) #highlight-type.dictionary

  The receiver's name and address, provided as a dictionary with the following keys:
  #table(
    columns: 3,
    column-gutter: 10pt,
    rows: 2,
    stroke: none,
    inset: 5pt,
    [`name`], [#highlight-type.str], [The receiver's name.],
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

  The date of the letter.

  *Examples:*
  ```typ
  date: "01 January 1970"
  ```
  or
  ```typ
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]")
  ```

  Refer to #link("https://typst.app/docs/reference/foundations/datetime/#format")[Typst's documentation on datetime formatting] for more details on how to format the date to your liking.

- *`salutation`* #h(15pt) #highlight-type.str or #h(5pt) #highlight-type.content

  The salutation or greeting in the letter.

  *Example:*
  ```typ
  salutation: "Gentlemen,"
  ```

- *`subject`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

  The subject of the letter.

  *Example:*
  ```typ
  subject: "Pruning of Heritage Oak Trees in the Dimbleby Estate"
  ```

- *`closing`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

  The closing line of the letter.

  *Example:*
  ```typ
  closing: "Sincerely yours,"
  ```

- *`signatures`* #h(15pt) #highlight-type.array

  An array of dictionaries representing the signatures of the letter's signatories. Each dictionary contains the following keys:

  #table(
    columns: 3,
    column-gutter: 10pt,
    rows: 2,
    stroke: none,
    inset: 5pt,
    [`name`], [#highlight-type.str], [The name of the signatory.],
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

- *`paper-size`* #h(15pt) #highlight-type.str

  The paper size of the letter.

  *Default:* `"a4"`

  *Example:*
  ```typ
  paper-size: "us-letter"
  ```

  Refer to #link("https://typst.app/docs/reference/layout/page/#parameters-paper)")[Typst's documentation on paper sizes] for more details on the paper sizes available.

- *`margins`* #h(15pt) #highlight-type.auto-type #h(5pt) or #h(5pt) #highlight-type.relative #h(5pt) or #h(5pt) #highlight-type.dictionary

  Custom margins for the letter.

  *Default:* #h(5pt) #highlight-type.auto-type

  *Example:*
  ```typ
  margins: (top: 20mm, left: 20mm, bottom: 20mm, right: 20mm)
  ```

  Refer to  #link("https://typst.app/docs/reference/layout/page/#parameters-margin")[Typst's margin documentation] for more details on how to set margins.

- *`number-pages`* #h(15pt) #highlight-type.bool

  Whether to include page numbers starting from the second page.

  *Default:* `false`

  *Example:*
  ```typ
  number-pages: true
  ```

- *`par-leading`* #h(15pt) #highlight-type.length

  The line spacing within paragraphs.

  *Default:* `0.8em`

  *Example:*
  ```typ
  par-leading: 1.0em
  ```

- *`par-spacing`* #h(15pt) #highlight-type.length

  The spacing between paragraphs.

  *Default:* `1.8em`

  *Example:*
  ```typ
  par-spacing: 2.0em
  ```

- *`main-font`* #h(15pt) #highlight-type.str

  The primary font used in the letter.

  *Default:* `"Libertinus Serif"`

  *Example:*
  ```typ
  main-font: "Noto Serif"
  ```

- *`main-font-size`* #h(15pt) #highlight-type.length

  The font size used for the body of the letter.

  *Default:* `11pt`

  *Example:*
  ```typ
  main-font-size: 12pt
  ```

- *`caption-font`* #h(15pt) #highlight-type.str

  The font used for figure captions in the letter.

  *Default:* `"Libertinus Serif"`

  *Example:*
  ```typ
  caption-font: "Source Sans Pro"
  ```

- *`caption-font-size`* #h(15pt) #highlight-type.length

  The font size used for figure captions in the letter.

  *Default:* `9pt`

  *Example:*
  ```typ
  caption-font-size: 10pt
  ```

- *`footnote-font`* #h(15pt) #highlight-type.str

  The font used for footnotes in the letter.

  *Default:* `"Libertinus Serif"`

  *Example:*
  ```typ
  footnote-font: "Noto Serif"
  ```

- *`footnote-font-size`* #h(15pt) #highlight-type.length

  The font size used for footnotes in the letter.

  *Default:* `8pt`

  *Example:*
  ```typ
  footnote-font-size: 9pt
  ```

- *`footnote-alignment`* #h(15pt) #highlight-type.alignment

  The alignment of the footnote separator and footnotes.

  *Default:* `left`

  *Example:*
  ```typ
  footnote-alignment: right
  ```

- *`footer-font`* #h(15pt) #highlight-type.str

  The font used for the footer of the letter.

  *Default:* `"DejaVu Sans Mono"`

  *Example:*
  ```typ
  footer-font: "Fira Mono"
  ```

- *`footer-font-size`* #h(15pt) #highlight-type.length

  The font size for the footer of the letter.

  *Default:* `7pt`

  *Example:*
  ```typ
  footer-font-size: 8pt
  ```

- *`link-color`* #h(15pt) #highlight-type.color

  The color of hyperlinks in the letter.

  *Default:* `blue`

  *Example:*
  ```typ
  link-color: maroon
  ```

  Refer to #link("https://typst.app/docs/reference/visualize/color/#summary")[Typst's color documentation] for more details on how to specify colors.

- *`from-alignment`* #h(15pt) #highlight-type.alignment

  The alignment of the sender's address.

  *Default:* `right`

  *Example:*
  ```typ
  from-alignment: left
  ```

- *`attn-name`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

  Attention name to direct the correspondence to the relevant person or department.

  *Default:* #h(5pt) #highlight-type.none-type

  *Example:*
  ```typ
  attn-name: "Mr Basil Hawthorne"
  ```

- *`cc`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

  The name of the carbon copy recipient.

  *Default:* #h(5pt) #highlight-type.none-type

  *Example:*
  ```typ
  cc: "Mr Jethro Tull"
  ```

- *`enclosures`* #h(15pt) #highlight-type.array

  An array containing elements of type #h(5pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt) that describes each enclosure.

  *Default:* #h(5pt) #highlight-type.none-type

  *Example:*
  ```typ
  enclosures: (
    "Photograph of storm damaged oak tree."
  )
  ```

- *`enclosures-title`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

  The title for the list of enclosures, allowing localization.

  *Default:* `"encl:"`

  *Example:*
  ```typ
  enclosures-title: "இணைப்புகள்:" // Enclosures in Tamil
  ```

- *`figures`* #h(15pt) #highlight-type.array

  A list of figures with the following keys:

  #table(
    columns: 3,
    column-gutter: 10pt,
    rows: 2,
    stroke: none,
    inset: 5pt,
    [`figure-content`], [#highlight-type.function #h(5pt)], [An `image`, `table` or `raw` function.],
    [`figure-caption`], [#highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt) _optional_], [The caption for the figure.],
  )

  *Default:* #h(5pt) #highlight-type.none-type

  *Example:*
  ```typ
  figures = (
    (
      image: image("images/storm-damaged-oak-tree.jpg", width: 80%),
      caption: "Storm Damaged Oak Tree."
    )
  )
  ```

  *Note:* Figures are always placed at the end of the letter as they are considered to be enclosures.

- *`footer`* #h(15pt) #highlight-type.array

  A list of footer elements, each containing:

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

== Comprehensive `letterloom` Example and Output

Below, we present a comprehensive example demonstrating the capabilities of the `letterloom` package. This example showcases how to create a detailed and professionally styled letter by leveraging the package's features. For clarity and reference, the final rendered result is also included.

```typ
#import "@preview/letterloom:0.1.0": *

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
  // Enclosures
  enclosures: (
    "Photograph of storm damaged oak tree."
  ),
  // Carbon Copy
  cc: "Mr Jethro Tull",
  // Figures
  figures: (
    (
      figure-content: image("images/storm-damaged-oak-tree.jpg", width: 80%),
      figure-caption: [Storm Damaged Oak Tree.#footnote[This image was generated using #link("https://deepai.org/machine-learning-model/text2img")[DeepAI's image generator].]]
    )
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
  // Caption Font
  caption-font: "Source Sans Pro",
  // Caption Font Size
  caption-font-size: 9pt,
  // Footnote Font
  footnote-font: "Noto Serif",
  // Footnote Font Size
  footnote-font-size: 7pt,
  // Footnote Alignment
  footnote-alignment: right,
  // Link Color
  link-color: maroon
)

We are writing to request you to visit The Lodge at the Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678. to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.
```

// Set the link style to what is set in the letterloom package so that it
// is no overridden by our global styles set above
#show link: set text(font: "Fira Mono", size: 7pt)

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
  // Enclosures
  enclosures: (
    "Photograph of storm damaged oak tree."
  ),
  // Carbon Copy
  cc: "Mr Jethro Tull",
  // Figures
  figures: (
    (
      figure-content: image("images/storm-damaged-oak-tree.jpg", width: 80%),
      figure-caption: [Storm Damaged Oak Tree.#footnote[This image was generated using #link("https://deepai.org/machine-learning-model/text2img")[DeepAI's image generator].]]
    )
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
  // Caption Font
  caption-font: "Source Sans Pro",
  // Caption Font Size
  caption-font-size: 9pt,
  // Footnote Font
  footnote-font: "Noto Serif",
  // Footnote Font Size
  footnote-font-size: 7pt,
  // Footnote Alignment
  footnote-alignment: right,
  // Link Color
  link-color: maroon
)

We are writing to request you to visit The Lodge at the Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678. to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.

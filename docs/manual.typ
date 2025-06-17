#import "@preview/letterloom:0.1.0": *
// Global Styles
#set page(margin: 25mm)
#set text(size: 11pt, font: "Noto Serif")
#set par(spacing: 1.5em)
#set strong(delta: 200) // Set bold to semibold

//Customize appearance
#show raw: set text(font: "Fira Mono", size: 1.2em)
#show raw.where(block: true): set block(fill: rgb("#faebd7"), inset: 1em, radius: 0.5em, width: 100%)
#show link: set text(fill: blue, font: "Source Sans Pro", size: 12pt)
// #show ref: set text(fill: blue, font: "Source Sans Pro", size: 12pt)

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

The `letterloom` package is a user-friendly, highly customizable template for creating professional letters with ease. Designed for both personal and business correspondence, it eliminates the complexities of traditional typesetting tools like LaTeX while maintaining a polished, professional output.

*Key Features:*
- Multiple Signatures: Easily include one or more signatures to accommodate joint communications or approvals.

- Customizable Footnotes: Add informative footnotes with options for personalized formatting.

- Figures and Figure Captions: Incorporate and label figures seamlessly for detailed correspondence.

- Enclosures and Attachments: Clearly list additional documents included with the letter.

*Benefits:*
- Simplifies the letter-writing process with an easy to use template.

- Avoids the steep learning curve associated with tools like LaTeX.

- Ensures professional-quality output without technical expertise.

Whether crafting formal business letters or personal correspondence, `letterloom` makes creating visually appealing documents straightforward and efficient.

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
      name: "Lord Albus Dimbleby"
      signature: image("images/albus-sig.png")
    ),
    (
      name: "Lady Abigail Dimbleby"
      signature: image("images/abigail-sig.png")
    ),
    (
      name: "Sir Austin Dimbleby",
      signature: image("images/austin-sig.png")
    )
  )
)

Text of the letter goes here.
```

The `letterloom` package provides extensive customization options to help tailor your letters to specific needs. In the following sections, we will explore all mandatory and optional parameters in detail, showcasing their usage with examples to demonstrate their effects on the letter's appearance and functionality.

=== Required Parameters

- *`from`* #h(15pt) #highlight(fill: rgb("fce0ff"), radius: 4pt, extent: 4pt)[`dictionary`]

  The sender's name and address, provided as a dictionary with the following keys:
  #table(
    columns: 3,
    column-gutter: 10pt,
    rows: 2,
    stroke: none,
    inset: 5pt,
    [`name`], [#highlight(fill: rgb("#d1ffe2"), radius: 4pt, extent: 4pt)[`str`]], [The sender's name.],
    [`address`], [#highlight(fill: rgb("#a6ebe5"), radius: 4pt, extent: 4pt)[`content`]], [The sender's address.],
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

- *`to`* #h(15pt) #highlight(fill: rgb("fce0ff"), radius: 4pt, extent: 4pt)[`dictionary`]

  The receiver's name and address, provided as a dictionary with the following keys:
  #table(
    columns: 3,
    column-gutter: 10pt,
    rows: 2,
    stroke: none,
    inset: 5pt,
    [`name`], [#highlight(fill: rgb("#d1ffe2"), radius: 4pt, extent: 4pt)[`str`]], [The receiver's name.],
    [`address`], [#highlight(fill: rgb("#a6ebe5"), radius: 4pt, extent: 4pt)[`content`]], [The receiver's address.],
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

- *`date`* #h(15pt) #highlight(fill: rgb("#d1ffe2"), radius: 4pt, extent: 4pt)[`str`]

  The date of the letter.

  *Examples:*
  ```typ
  date: "01 January 1970"
  ```
  or
  ```typ
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]")
  ```

- *`salutation`* #h(15pt) #highlight(fill: rgb("#d1ffe2"), radius: 4pt, extent: 4pt)[`str`]

  The salutation or greeting in the letter.

  *Example:*
  ```typ
  salutation: "Gentlemen,"
  ```

- *`subject`* #h(15pt) #highlight(fill: rgb("#d1ffe2"), radius: 4pt, extent: 4pt)[`str`]

  The subject of the letter.

  *Example:*
  ```typ
  subject: "Pruning of Heritage Oak Trees in the Dimbleby Estate"
  ```

- *`closing`* #h(15pt) #highlight(fill: rgb("#d1ffe2"), radius: 4pt, extent: 4pt)[`str`]

  The closing line of the letter.

  *Example:*
  ```typ
  closing: "Sincerely yours,"
  ```

- *`signatures`* #h(15pt) #highlight(fill: rgb("#fce0ff"), radius: 4pt, extent: 4pt)[`array`]

  An array of dictionaries representing the signatures of the letter's signatories. Each dictionary contains the following keys:

  #table(
    columns: 3,
    column-gutter: 10pt,
    rows: 2,
    stroke: none,
    inset: 5pt,
    [`name`], [#highlight(fill: rgb("#d1ffe2"), radius: 4pt, extent: 4pt)[`str`]], [The name of the signatory.],
    [`signature`], [#highlight(fill: rgb("#d1d4fd"), radius: 4pt, extent: 4pt)[`function`] #h(5pt) _optional_], [The image function for the signatory's signature. If omitted, space is left for a physical signature.],
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

- *`enclosures`* #h(15pt) #highlight(fill: rgb("#fce0ff"), radius: 4pt, extent: 4pt)[`array`]

  A list of descriptions for enclosures.

  *Example:*
  ```typ
  enclosures: (
    "Photograph of storm damaged oak tree."
  )
  ```

- *`enclosures-title`* #h(15pt) #highlight(fill: rgb("#d1ffe2"), radius: 4pt, extent: 4pt)[`str`]

  The title for the list of enclosures, allowing localization. Defaults to `"encl:"`.

  *Example:*
  ```typ
  enclosures-title: "இணைப்புகள்:" // Enclosures in Tamil
  ```

- *`figures`* #h(15pt) #highlight(fill: rgb("#fce0ff"), radius: 4pt, extent: 4pt)[`array`]

  A list of figures with the following keys:

  #table(
    columns: 3,
    column-gutter: 10pt,
    rows: 2,
    stroke: none,
    inset: 5pt,
    [`image`], [#highlight(fill: rgb("#d1d4fd"), radius: 4pt, extent: 4pt)[`function`] #h(5pt)], [The image function for the figure.],
    [`caption`], [#highlight(fill: rgb("#d1ffe2"), radius: 4pt, extent: 4pt)[`str`] #h(5pt) _optional_], [The caption for the figure.],
  )

  *Example:*
  ```typ
  figures = (
    (
      image: image("images/storm-damaged-oak-tree.jpg", width: 80%),
      caption: "Storm Damaged Oak Tree."
    )
  )
  ```

- *`footer`* #h(15pt) #highlight(fill: rgb("#fce0ff"), radius: 4pt, extent: 4pt)[`array`]

  A list of footer elements, each containing:

  #table(
    columns: 3,
    column-gutter: 10pt,
    rows: 2,
    stroke: none,
    inset: 5pt,
    [`text`], [#highlight(fill: rgb("#d1ffe2"), radius: 4pt, extent: 4pt)[`str`] #h(5pt)], [The footer text.],
    [`type`], [#highlight(fill: rgb("#d1ffe2"), radius: 4pt, extent: 4pt)[`str`] #h(5pt)], [The type of footer element (`"url"`, `"email"`, or `"string"`). Defaults to `"string"`.],
  )

  *Example:*
  ```typ
  footer =  (
    (
      text: "+44-117-555-5555"
    ),
    (
      text: "dimblebyfamily@dimbleby.org",
      type: "email"
    ),
    (
      text: "https://dimbleby.org",
      type: "url"
    )
  )
  ```

- *`number-pages`* #h(15pt) #highlight(fill: rgb("#ffecbf"), radius: 4pt, extent: 4pt)[`bool`]

  Whether to include page numbers starting from the second page. Defaults to `false`.

  *Example:*
  ```typ
  number-pages: true
  ```

- *`from-alignment`* #h(15pt) #highlight(fill: rgb("#a6eaff"), radius: 4pt, extent: 4pt)[`alignment`]

  The alignment of the sender's address. Defaults to `right`.

  *Example:*
  ```typ
  from-alignment: left
  ```

- *`paper-size`* #h(15pt) #highlight(fill: rgb("#d1ffe2"), radius: 4pt, extent: 4pt)[`str`]

  The paper size of the letter. Defaults to `"a4"`.

  Refer to #link("https://typst.app/docs/reference/layout/page/#parameters-paper)")[Typst's documentation on paper sizes] for more details on the paper sizes available.

  *Example:*
  ```typ
  paper-size: "us-letter"
  ```

- *`margins`* #h(15pt) #highlight(fill: rgb("#ffd1ca"), radius: 4pt, extent: 4pt)[`auto`] #h(5pt) or #h(5pt) #highlight(fill: rgb("#ffecbf"), radius: 4pt, extent: 4pt)[`relative`] #h(5pt) or #h(5pt) #highlight(fill: rgb("#fce0ff"), radius: 4pt, extent: 4pt)[`dictionary`]

  Custom margins for the letter. Defaults to #h(5pt) #highlight(fill: rgb("#ffd1ca"), radius: 4pt, extent: 4pt)[`auto`].

  Refer to  #link("https://typst.app/docs/reference/layout/page/#parameters-margin")[Typst's margin documentation] for more details on how to set margins.

  *Example:*
  ```typ
  margins: (top: 20mm, left: 20mm, bottom: 20mm, right: 20mm)
  ```

- *`par-leading`* #h(15pt) #highlight(fill: rgb("#ffecbf"), radius: 4pt, extent: 4pt)[`length`]

  The line spacing within paragraphs. Defaults to `0.8em`.

  *Example:*
  ```typ
  par-leading: 1.0em
  ```

- *`par-spacing`* #h(15pt) #highlight(fill: rgb("#ffecbf"), radius: 4pt, extent: 4pt)[`length`]

  The spacing between paragraphs. Defaults to `1.8em`.

  *Example:*
  ```typ
  par-spacing: 2.0em
  ```

- *`main-font`* #h(15pt) #highlight(fill: rgb("#d1ffe2"), radius: 4pt, extent: 4pt)[`str`]

  The primary font used in the letter. Defaults to `"Libertinus Serif"`.

  *Example:*
  ```typ
  main-font: "Noto Serif"
  ```

- *`main-font-size`* #h(15pt) #highlight(fill: rgb("#ffecbf"), radius: 4pt, extent: 4pt)[`length`]

  The font size used for the body of the letter. Defaults to `11pt`.

  *Example:*
  ```typ
  main-font-size: 12pt
  ```

- *`caption-font`* #h(15pt) #highlight(fill: rgb("#d1ffe2"), radius: 4pt, extent: 4pt)[`str`]

  The font used for figure captions in the letter. Defaults to `"Libertinus Serif"`.

  *Example:*
  ```typ
  caption-font: "Source Sans Pro"
  ```

- *`caption-font-size`* #h(15pt) #highlight(fill: rgb("#ffecbf"), radius: 4pt, extent: 4pt)[`length`]

  The font size used for figure captions in the letter. Defaults to `9pt`.

  *Example:*
  ```typ
  caption-font-size: 10pt
  ```

- *`footnote-font`* #h(15pt) #highlight(fill: rgb("#d1ffe2"), radius: 4pt, extent: 4pt)[`str`]

  The font used for footnotes in the letter. Defaults to `"Libertinus Serif"`.

  *Example:*
  ```typ
  footnote-font: "Noto Serif"
  ```

- *`footnote-font-size`* #h(15pt) #highlight(fill: rgb("#ffecbf"), radius: 4pt, extent: 4pt)[`length`]

  The font size used for footnotes in the letter. Defaults to `8pt`.

  *Example:*
  ```typ
  footnote-font-size: 9pt
  ```

- *`footer-font`* #h(15pt) #highlight(fill: rgb("#d1ffe2"), radius: 4pt, extent: 4pt)[`str`]

  The font used for the footer of the letter. Defaults to `"DejaVu Sans Mono"`.

  *Example:*
  ```typ
  footer-font: "Fira Mono"
  ```

- *`footer-font-size`* #h(15pt) #highlight(fill: rgb("#ffecbf"), radius: 4pt, extent: 4pt)[`length`]

  The font size for the footer of the letter. Defaults to `7pt`.

  *Example:*
  ```typ
  footer-font-size: 8pt
  ```

- *`link-color`* #h(15pt) #highlight(fill: gradient.linear(angle: 7deg, (rgb("#7cd5ff"), 0%), (rgb("#a6fbca"), 33%), (rgb("#fff37c"), 66%), (rgb("#ffa49d"), 100%)), radius: 4pt, extent: 4pt)[`color`]

  The color of hyperlinks in the letter. Defaults to `blue`.

  Refer to #link("https://typst.app/docs/reference/visualize/color/#summary")[Typst's color documentation] for more details on how to specify colors.

  *Example:*
  ```typ
  link-color: maroon
  ```

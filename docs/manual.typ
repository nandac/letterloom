#import "@preview/letterloom:0.1.0": *
// Global Styles
#set page(margin: 25mm)
#set text(size: 11pt, font: "Noto Serif")
#set par(spacing: 1.5em)

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
#show table.cell.where(y: 0): smallcaps
#show table.cell.where(y: 0): strong
#show figure: set block(breakable: true)

// End of setup

= The `letterloom` package

== Introduction

The `letterloom` package is a user-friendly, highly customizable template for creating professional letters with ease. Designed for both personal and business correspondence, it eliminates the complexities of traditional typesetting tools like LaTeX while maintaining a polished, professional output.

#text(weight: "semibold")[Key Features:]
- Multiple Signatures: Easily include one or more signatures to accommodate joint communications or approvals.

- Customizable Footnotes: Add informative footnotes with options for personalized formatting.

- Figures and Figure Captions: Incorporate and label figures seamlessly for detailed correspondence.

- Enclosures and Attachments: Clearly list additional documents included with the letter.

#text(weight: "semibold")[Benefits:]
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

  The name and address of the sender sent in as a dictionary with the following keys:
  - `name` #h(5pt) #highlight(fill: rgb("#d1ffe2"), radius: 4pt, extent: 4pt)[`str`] #h(5pt) the name of the sender.
  - `address` #h(5pt) #highlight(fill: rgb("#a6ebe5"), radius: 4pt, extent: 4pt)[`content`] #h(5pt) the address of the sender.

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

  The name and address of the receiver sent in as a dictionary with the following keys:
  - `name` #h(5pt) #highlight(fill: rgb("#d1ffe2"), radius: 4pt, extent: 4pt)[`str`] #h(5pt) the name of the receiver.
  - `address` #h(5pt) #highlight(fill: rgb("#a6ebe5"), radius: 4pt, extent: 4pt)[`content`] #h(5pt) the address of the receiver.

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

  ```typ
  date: "01 January 1970"
  ```
  or
  ```typ
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]")
  ```

- *`salutation`* #h(15pt) #highlight(fill: rgb("#d1ffe2"), radius: 4pt, extent: 4pt)[`str`]

  The salutation of the letter.

  ```typ
  salutation: "Gentlemen,"
  ```

- *`subject`* #h(15pt) #highlight(fill: rgb("#d1ffe2"), radius: 4pt, extent: 4pt)[`str`]

  The subject of the letter.

  ```typ
  subject: "Pruning of Heritage Oak Trees in the Dimbleby Estate"
  ```

- *`closing`* #h(15pt) #highlight(fill: rgb("#d1ffe2"), radius: 4pt, extent: 4pt)[`str`]

  The closing of the letter.

  ```typ
  closing: "Sincerely yours,"
  ```

- *`signatures`* #h(15pt) #highlight(fill: rgb("#fce0ff"), radius: 4pt, extent: 4pt)[`array`]

  The signatures are an array of dictionaries where each dictionary has the following keys:
  - `name` #h(5pt) #highlight(fill: rgb("#d1ffe2"), radius: 4pt, extent: 4pt)[`str`] #h(5pt) the name of the signatory.
  - `signature` #h(5pt) #highlight(fill: rgb("#ffd1ca"), radius: 4pt, extent: 4pt)[`none`] #h(5pt) or #h(5pt) #highlight(fill: rgb("#d1d4fd"), radius: 4pt, extent: 4pt)[`function`] #h(5pt) optionally contains the image of the signatory's signature as an image function object. If a signature image is not provided a space will be left for the signature above the signatory's name.

  ```typ
  signatures = (
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
  ```

=== Optional Parameters

- *`enclosures`* #h(15pt) #h(5pt) #highlight(fill: rgb("#ffd1ca"), radius: 4pt, extent: 4pt)[`none`] #h(5pt) or #h(5pt) #highlight(fill: rgb("#fce0ff"), radius: 4pt, extent: 4pt)[`array`] #h(5pt)

  The enclosures are an array of strings where each string is a description of an enclosure or attachment.

  ```typ
  enclosures = (
    "Photograph of storm damaged oak tree."
  )
  ```

- `enclosures_title: str`

  The title of the enclosures or attachments list. This allows the title of the enclosure list to be changed from the default `encl:` which is useful when the language of the letter is not English.

  Default: `encl:`

  Example:
  ```typ
  enclosures-title: "இணைப்புகள்:" // Tamil for enclosures or attachments
  ```

- `from-alignment: alignment`

  The alignment of the sender's name and address in the letter.

  Default: `right`

  Example:
  ```typ
  from-alignment: left
  ```





- `figures: array`

  The figures or images related to the letter sent in as an array of dictionaries with the following keys:
  - `image: function image` the image of the figure.
  - `caption: str` the caption of the figure.

  Default: `()`

  Example:
  ```typ
  figures = (
    (
      image: image("images/storm-damaged-oak-tree.jpg", width: 80%),
      caption: "Storm Damaged Oak Tree."
    )
  )
  ```

- `footer: array`

  The footer of the letter sent in as an array of dictionaries with the following keys:
  - `content: str` the content of the footer.
  - `type: str` data type one of `string`, `email` or `link`.

  Default: `()`

  Example:
  ```typ
  footer =  (
    (
      content: "+44-117-555-5555",
      type: "string"
    ),
    (
      content: "dimblebyfamily@dimbleby.org",
      type: "email"
    ),
    (
      content:"https://dimbleby.org",
      type: "link"
    )
  )
  ```

- `number-pages: bool`

  Whether to number the pages of the letter sent in as a boolean. Pages are numbered only from the second page onwards.

  Default: `false`

  Example:
  ```typ
  number-pages: true
  ```

- `paper-size: str`

  The paper size of the letter. Any of the paper sizes supported by Typst may be used.

  Default: `a4`

  Example:
  ```typ
  paper-size: "a4"
  ```

- `margins: dict`

  The margins of the letter sent in as a dictionary with the following keys:
  - `top: float` the top margin of the letter.
  - `left: float` the left margin of the letter.
  - `bottom: float` the bottom margin of the letter.
  - `right: float` the right margin of the letter.

  Default: `(top: 20mm, left: 20mm, bottom: 20mm, right: 20mm)`

  Example:
  ```typ
  margins: (top: 20mm, left: 20mm, bottom: 20mm, right: 20mm)
  ```

- `main-font: str`

  The font used for the main body of the letter.

  Default: `Libertinus Serif`

  Example:
  ```typ
  main-font: "Noto Serif"
  ```

- `main-font-size: length`

  The font size for the main body of the letter.

  Default: `11pt`

  Example:
  ```typ
  main-font-size: 11pt
  ```

- `footer-font: str`

  The font used for the footer of the letter.

  Default: `DejaVu Sans Mono`

  Example:
  ```typ
  footer-font: "Fira Mono"
  ```

- `footer-font-size: length`

  The font size for the footer of the letter.

  Default: `7pt`

  Example:
  ```typ
  footer-font-size: 7pt
  ```

- `caption-font: str`

  The font used for the captions of figures in the letter.

  Default: `Libertinus Serif`

  Example:
  ```typ
  caption-font: "Source Sans Pro"
  ```

- `caption-font-size: length`

  The font size for the captions of figures in the letter.

  Default: `9pt`

  Example:
  ```typ
  caption-font-size: 9pt
  ```

- `footnote-font: str`

  The font used for the footnotes in the letter.

  Default: `Libertinus Serif`


  Example:
  ```typ
  footnote-font: "Noto Serif"
  ```

- `footnote-font-size: length`

  The font size for the footnotes in the letter.

  Default: `8pt`

  Example:
  ```typ
  footnote-font-size: 8pt
  ```

- `footnote-alignment: alignment`

  The alignment of footnotes in the letter.

  Default: `left`

  Example:
  ```typ
  footnote-alignment: right
  ```

- `paragraph: dict`

  The paragraph spacing and leading for the letter sent in as a dictionary with the following keys:
  - `leading: float` the leading of the paragraphs.
  - `spacing: float` the spacing between paragraphs.

  Default: `(leading: 0.8em, spacing: 1.8em)`

  Example:
  ```typ
  paragraph: (leading: 0.8em, spacing: 1.8em)
  ```

- `link-color: str`

  The color of hyperlinks in the letter.

  Default: `blue`

  Example:
  ```typ
  link-color: maroon
  ```

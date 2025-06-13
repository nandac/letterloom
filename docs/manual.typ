#import "@preview/easy-letter:0.1.0": *
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

= The `easy-letter` package

== Introduction
The `easy-letter` package is a versatile and intuitive module designed to simplify the process of creating professional letters. It supports features such as multiple signatures, embedded images, footnotes, and enclosures, making it an ideal choice for both personal and business correspondence.

While traditional typesetting systems like LaTeX offer similar capabilities, they can be daunting for newcomers due to their complex syntax and steep learning curve. For users who are not familiar with such tools, crafting a polished document can quickly become a time-consuming and frustrating task.

The `easy-letter` package addresses these challenges by providing an accessible and customizable solution. With its user-friendly template, it empowers users to create visually appealing letters with ease, eliminating the need to grapple with intricate typesetting commands. Whether you are writing a formal business letter or personal correspondence, `easy-letter` ensures a streamlined experience without compromising on quality or professionalism.

== Usage

The following example demonstrates how to generate a letter using the `easy-letter` package with the minimum required options:

```typ
#import "@preview/easy-letter:0.1.0": *

#show: easy-letter.with(
  sender: (
    name: "My Name",
    address: [My Address \
              My Town \
              My County \
              My Postcode]
  ),
  receiver: (
    name: "Your Name",
    address: [Your Address \
              Your Town \
              Your County \
              Your Postcode]
  ),
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
  salutation: "Dear Name,",
  subject: "Subject of Letter",
  closing: "Yours sincerely,"
)

The text of your letter should be added here.
```

The `easy-letter` package has a number of parameters that can be used to customize the appearance of the letter. The following sections will describe the full range of mandatory and optional parameters available to the `easy-letter` package.

=== Required Parameters

- `from: dictionary`

  The name and address of the sender sent in as a dictionary with the following keys:
  - `name: str` the name of the sender.
  - `address: str` the address of the sender.

  Example:
  ```typ
  from: (
    name: "The Dimbleby Family",
    address: [The Lodge \
              Cheswick Village \
              Middle Upton \
              Bristol BS16 1GU]
  )
  ```

- `to: dictionary`

  The name and address of the receiver sent in as a dictionary with the following keys:
  - `name: str` the name of the receiver.
  - `address: str` the address of the receiver.

  Example:
  ```typ
  to: (
    name: "Evergreen Tree Surgeons",
    address: [Midtown Lane \
              Cheswick Village \
              Stoke Gifford \
              Bristol BS16 1GU]
  )
  ```

- `date: str`

  The date of the letter. Any string or datetime string may be used.

  Example:
  ```typ
  date: "01 January 1970"
  ```
  or
  ```typ
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]")
  ```

- `salutation: str`

  The salutation of the letter.

  Example:
  ```typ
  salutation: "Gentlemen,"
  ```

- `subject: str`

  The subject of the letter sent in as a string.

  Example:
  ```typ
  subject: "Pruning of Heritage Oak Trees in the Dimbleby Estate"
  ```

- `closing: str`

  The closing of the letter sent in as a string.

  Example:
  ```typ
  closing: "Yours sincerely,"
  ```

=== Optional Parameters

- `from-alignment: alignment`

  The alignment of the sender's name and address in the letter.

  Default: `right`

  Example:
  ```typ
  from-alignment: left
  ```

- `signatures: array`

  The signatures of the letter sent in as a list of dictionaries with the following keys:
  - `name: str` the name of the signatory.
  - `signature: function image` the image of the signatory's signature.

  *Note:* The number of signatures is limited to three.

  Default: `()`

  Example:
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

- `enclosures: array`

  List of enclosures or attachments related to the letter. Each item in the list is a string.

  Default: `()`

  Example:
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

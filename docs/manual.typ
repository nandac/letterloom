#import "@preview/letterloom:0.1.0": *
#import "highlight-type.typ": highlight-type

// Global Styles
#set page(margin: 25mm)
#set text(size: 11pt, font: "Noto Serif")
#set par(spacing: 1.5em)

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

The `letterloom` package is a user-friendly and customizable template designed to streamline the creation of professional letters. Whether for personal or business correspondence, it eliminates the challenges of traditional typesetting tools like LaTeX while delivering polished and professional results.

*Key Features:*
- *Multiple Signatures:* Effortlessly include one or more signatures for joint communications or approvals.

- *Customizable Footnotes:* Add informative footnotes with flexible formatting options.

- *Enclosures and Attachments:* Clearly specify additional documents included with the letter.

*Benefits:*
- Simplifies the letter-writing process with an intuitive template.

- Eliminates the steep learning curve of tools like LaTeX.

- Delivers professional-quality output without requiring technical expertise.

Whether you're preparing formal business correspondence or crafting a personal letter, `letterloom` makes creating visually appealing documents both straightforward and efficient.

== Usage

The `letterloom` package offers several customization options, enabling you to tailor your letters to suit various needs.

In the sections that follow, we will delve into each parameter in detail, accompanied with an example of how to use it.

=== Getting Started

To get started, here is a straightforward example showcasing the minimum required arguments for using the `letterloom` package.

```typ
#import "@preview/letterloom:0.1.0": *

#show: letterloom.with(
  // Sender's contact information (name and address)
  from: (
    name: "Sender's Name",
    address: [Sender's Address]
  ),

  // Recipient's contact information (name and address)
  to: (
    name: "Receiver's Name",
    address: [Receiver's Address]
  ),

  // Letter date (automatically set to today's date)
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),

  // Opening greeting (e.g., "Dear Mr Hawthorne,")
  salutation: "Dear Receiver's Name,",

  // Letter subject line
  subject: "Subject",

  // Closing phrase (e.g., "Yours sincerely,")
  closing: "Yours sincerely,",

  // List of signatories with their names
  signatures: (
    (
      name: "Sender's Name",
      // signature: image() // Add your signature image here
    )
  ),
)

// Write the body of your letter here
```

=== Mandatory Parameters

This section delves into the mandatory parameters of the `letterloom` package, which define key elements of a letter, including the sender, recipient, date, and signature.

#v(10pt)

*`from`* #h(15pt) #highlight-type.dictionary

Specifies the sender's name and address in a dictionary format with the following keys:

#table(
  columns: 3,
  column-gutter: 10pt,
  rows: 2,
  stroke: none,
  inset: 5pt,
  [`name`], [#highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)], [The sender's name.],
  [`address`], [#highlight-type.content], [The sender's address.],
)

```typ
from: (
  name: "The Dimbleby Family",
  address: [The Lodge \
            Cheswick Village \
            Middle Upton \
            Bristol BS16 1GU]
)
```

*Note:* The sender's address is aligned to the right by default, but you can adjust it using the `from-alignment` parameter.

#v(10pt)

*`to`* #h(15pt) #highlight-type.dictionary

Defines the recipient's name and address in a dictionary format with the following keys:

#table(
  columns: 3,
  column-gutter: 10pt,
  rows: 2,
  stroke: none,
  inset: 5pt,
  [`name`], [#highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)], [The receiver's name.],
  [`address`], [#highlight-type.content], [The receiver's address.],
)

```typ
to: (
  name: "Evergreen Tree Surgeons",
  address: [Midtown Lane \
            Cheswick Village \
            Stoke Gifford \
            Bristol BS16 1GU]
)
```

#v(10pt)

*`date`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

Specifies the letter's date in either string or content format.

```typ
date: "01 January 1970"
```
or
```typ
date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]")
```

For custom formatting options, refer to #link("https://typst.app/docs/reference/foundations/datetime/#format")[Typst's datetime formatting documentation].

#v(10pt)

*`salutation`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

Sets the greeting for the letter in string or content format.

```typ
salutation: "Dear Mr Hawthorne,"
```

#v(10pt)

*`subject`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

Specifies the subject line of the letter in string or content format.

```typ
subject: "Pruning of Heritage Oak Trees in the Dimbleby Estate"
```

#v(10pt)

*`closing`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

Defines the closing phrase for the letter in string or content format.

```typ
closing: "Yours sincerely,"
```

#v(10pt)

*`signatures`* #h(15pt) #highlight-type.array

An array of dictionaries representing the signatories. Each dictionary may include the following keys:

#table(
  columns: 3,
  column-gutter: 10pt,
  rows: 2,
  stroke: none,
  inset: 5pt,
  [`name`], [#highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)], [The name of the signatory.],
  [`signature`], [#highlight-type.function #h(5pt) _optional_], [The image function for the signatory's signature. If omitted a space is left for a physical signature.],
)

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

The following optional parameters enable you to add additional fields like a list of cc recipients, an attention line, and a list of enclosures to your letter.

#v(10pt)

*`attn-name`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

Specifies the attention line for a specific recipient.

#text(size: 10pt)[Default: #h(5pt) #highlight-type.none-type]

```typ
attn-name: "Mr Basil Hawthorne"
```

#v(10pt)

*`cc`* #h(15pt) #highlight-type.array

Lists recipients for carbon copy (cc).

#text(size: 10pt)[Default: #h(5pt) #highlight-type.none-type]

```typ
cc: "Mr Jethro Tull"
```

#v(10pt)

*`enclosures`* #h(15pt) #highlight-type.array

Specifies additional documents included with the letter.

#text(size: 10pt)[Default: #h(5pt) #highlight-type.none-type]

```typ
enclosures: (
  "Provenance of the Oak trees on the Dimbleby Estate."
)
```

#v(10pt)

*`enclosures-title`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

Specifies the title for the list of enclosures, allowing localization.

#text(size: 10pt)[Default: `"encl:"`]

```typ
enclosures-title: "இணைப்புகள்:" // Enclosures in Tamil
```

#v(10pt)

*`footer`* #h(15pt) #highlight-type.array

An array specifying footer elements, including text, URLs, and email links.

#table(
  columns: 3,
  column-gutter: 10pt,
  rows: 2,
  stroke: none,
  inset: 5pt,
  [`footer-text`], [#highlight-type.str #h(5pt)], [The footer text.],
  [`footer-type`], [#highlight-type.str #h(5pt)], [The type of footer element either `"url"`, `"email"`, or `"string"`. If the footer type is specified as `url` or `email` it will be rendered as a clickable hyperlink. The default footer type is `"string"`.],
)

#text(size: 10pt)[Default: #h(5pt) #highlight-type.none-type]

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

*Note:* Footer content is center-aligned by default.

=== Page Settings

The following parameters allow you to customize the layout of the letter. Each parameter has a default value, which can be overridden to suit your preferences.

#v(10pt)

*`paper-size`* #h(15pt) #highlight-type.str

Specifies the paper size for the letter.

#text(size: 10pt)[Default: `"a4"`]

```typ
paper-size: "us-letter"
```

For additional details, refer to #link("https://typst.app/docs/reference/layout/page/#parameters-paper")[Typst's documentation on paper sizes].

#v(10pt)

*`margins`* #h(15pt) #highlight-type.auto-type #h(5pt) or #h(5pt) #highlight-type.relative #h(5pt) or #h(5pt) #highlight-type.dictionary

Sets the margins of the letter.

#text(size: 10pt)[Default: #h(5pt) #highlight-type.auto-type]

#text(size: 10pt)[The default value of #h(5pt) #highlight-type.auto-type #h(5pt) sets the margins automatically to 2.5/21 times the smaller dimension of the page. This results in a 25mm margin for an A4 page.]

```typ
margins: (top: 20mm, left: 20mm, bottom: 20mm, right: 20mm)
```

Refer to #link("https://typst.app/docs/reference/layout/page/#parameters-margin")[Typst's margin documentation] for more information.

#v(10pt)

*`par-leading`* #h(15pt) #highlight-type.length

Defines the line spacing within paragraphs.

#text(size: 10pt)[Default: `0.8em`]

```typ
par-leading: 1.0em
```

#v(10pt)

*`par-spacing`* #h(15pt) #highlight-type.length

Determines the spacing between paragraphs.

#text(size: 10pt)[Default: `1.8em`]

```typ
par-spacing: 2.0em
```

#v(10pt)

*`number-pages`* #h(15pt) #highlight-type.bool

Enables or disables page numbering, starting from the second page.

#text(size: 10pt)[Default: `false`]

```typ
number-pages: true
```

*Note:* Page numbers are always center-aligned.

=== Font Settings

These parameters allow you to customize the fonts used throughout the letter. Each parameter has a default font setting that can be changed as needed.

#v(10pt)

*`main-font`* #h(15pt) #highlight-type.str

Sets the font used for the main body of the letter.

#text(size: 10pt)[Default: `"Libertinus Serif"`]

```typ
main-font: "Noto Serif"
```

#v(10pt)

*`main-font-size`* #h(15pt) #highlight-type.length

Sets the font size for the main body.

#text(size: 10pt)[Default: `11pt`]

```typ
main-font-size: 12pt
```

#v(10pt)

*`footnote-font`* #h(15pt) #highlight-type.str

Sets the font used for footnotes.

#text(size: 10pt)[Default: `"Libertinus Serif"`]

```typ
footnote-font: "Noto Serif"
```

#v(10pt)

*`footnote-font-size`* #h(15pt) #highlight-type.length

Sets the font size for footnotes.

#text(size: 10pt)[Default: `7pt`]

```typ
footnote-font-size: 8pt
```

#v(10pt)

*`footer-font`* #h(15pt) #highlight-type.str

Sets the font used for the footer.

#text(size: 10pt)[Default: `"DejaVu Sans Mono"`]

```typ
footer-font: "Fira Mono"
```

#v(10pt)

*`footer-font-size`* #h(15pt) #highlight-type.length

Sets the font size for the footer.

#text(size: 10pt)[Default: `9pt`]

```typ
footer-font-size: 10pt
```

=== Additional Settings

These parameters provide options to align specific elements and change the color of hyperlinks.

#v(10pt)

*`from-alignment`* #h(15pt) #highlight-type.alignment

Sets the alignment of the sender's address.

#text(size: 10pt)[Default: `right`]

```typ
from-alignment: left
```

#v(10pt)

*`footnote-alignment`* #h(15pt) #highlight-type.alignment

Specifies the alignment of the footnote separator and footnotes.

#text(size: 10pt)[Default: `left`]

```typ
footnote-alignment: right
```

#v(10pt)

*`link-color`* #h(15pt) #highlight-type.color

Determines the color of hyperlinks in the letter.

#text(size: 10pt)[Default: `blue`]

```typ
link-color: maroon
```

Refer to #link("https://typst.app/docs/reference/visualize/color/#summary")[Typst's documentation on colors] for additional details.

== Complete Example

Here, we provide a comprehensive example that uses the full range of features offered by the `letterloom` package. To aid understanding, the final rendered result is included for reference.

```typ
#show: letterloom.with(
  // Sender's contact information (name and address)
  from: (
    name: "The Dimbleby Family",
    address: [The Lodge \
              Cheswick Village \
              Middle Upton \
              Bristol BS16 1GU]
  ),

  // Recipient's contact information (name and address)
  to: (
    name: "Evergreen Tree Surgeons",
    address: [Midtown Lane \
              Cheswick Village \
              Stoke Gifford \
              Bristol BS16 1GU]
  ),

  // Letter date (automatically set to today's date)
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

  // Attention line for specific recipient (optional)
  attn-name: "Mr Basil Hawthorne",

  // List of cc recipients (optional)
  cc: (
    "Mr Jethro Tull"
  ),

  // List of enclosures (optional)
  enclosures: (
    "Provenance of the Oak trees on the Dimbleby Estate."
  ),

  // Custom footer information (optional)
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

  // Paper size (default: "a4")
  paper-size: "a4",

  // Page margins (default: auto)
  margins: (top: 20mm, left: 20mm, bottom: 20mm, right: 20mm),

  // Enable page numbering (default: false)
  number-pages: false,

  // Main font (default: "Libertinus Serif")
  main-font: "Noto Serif",

  // Main font size (default: 11pt)
  main-font-size: 11pt,

  // Footnote font (default: "Libertinus Serif")
  footnote-font: "Noto Serif",

  // Footnote font size (default: 7pt)
  footnote-font-size: 7pt,

  // Footer font (default: "DejaVu Sans Mono")
  footer-font: "Fira Mono",

  // Footer font size (default: 9pt)
  footer-font-size: 9pt,

  // Footnote alignment (default: left)
  footnote-alignment: right,

  // Link color (default: blue)
  link-color: maroon,
)

We are writing to request you to visit The Lodge at the Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

#show figure.caption: set text(font: "Source Sans Pro", size: 10pt)
#figure(
  image("images/storm-damaged-oak-tree.jpg", width: 80%),
  caption: [Storm Damaged Oak Tree.#footnote[This image was generated using #link("https://deepai.org/machine-learning-model/text2img")[DeepAI's image generator].]]
)

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678. to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.
```

// Set the following styles so that the styles defined by the template are not
// overridden by the global styles set in this document
#show link: set text(font: "Fira Mono", size: 9pt)
#show footnote.entry: it => {
  show link: set text(font: "Fira Mono", size: 7pt)
  it
}

#show: letterloom.with(
  // Sender's contact information (name and address)
  from: (
    name: "The Dimbleby Family",
    address: [The Lodge \
              Cheswick Village \
              Middle Upton \
              Bristol BS16 1GU]
  ),

  // Recipient's contact information (name and address)
  to: (
    name: "Evergreen Tree Surgeons",
    address: [Midtown Lane \
              Cheswick Village \
              Stoke Gifford \
              Bristol BS16 1GU]
  ),

  // Letter date (automatically set to today's date)
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

  // Attention line for specific recipient (optional)
  attn-name: "Mr Basil Hawthorne",

  // List of cc recipients (optional)
  cc: (
    "Mr Jethro Tull"
  ),

  // List of enclosures (optional)
  enclosures: (
    "Provenance of the Oak trees on the Dimbleby Estate."
  ),

  // Custom footer information (optional)
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

  // Paper size (default: "a4")
  paper-size: "a4",

  // Page margins (default: auto)
  margins: (top: 20mm, left: 20mm, bottom: 20mm, right: 20mm),

  // Enable page numbering (default: false)
  number-pages: false,

  // Main font (default: "Libertinus Serif")
  main-font: "Noto Serif",

  // Main font size (default: 11pt)
  main-font-size: 11pt,

  // Footnote font (default: "Libertinus Serif")
  footnote-font: "Noto Serif",

  // Footnote font size (default: 7pt)
  footnote-font-size: 7pt,

  // Footer font (default: "DejaVu Sans Mono")
  footer-font: "Fira Mono",

  // Footer font size (default: 9pt)
  footer-font-size: 9pt,

  // Footnote alignment (default: left)
  footnote-alignment: right,

  // Link color (default: blue)
  link-color: maroon,
)

We are writing to request you to visit The Lodge at the Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

#show figure.caption: set text(font: "Source Sans Pro", size: 10pt)
#figure(
  image("images/storm-damaged-oak-tree.jpg", width: 80%),
  caption: [Storm Damaged Oak Tree.#footnote[This image was generated using #link("https://deepai.org/machine-learning-model/text2img")[DeepAI's image generator].]]
)

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678. to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.

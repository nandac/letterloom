#import "@preview/letterloom:1.0.0": *
#import "highlight-type.typ": highlight-type

// Global Styles
#set page(margin: 25mm)
#set text(size: 11pt, font: "Libertinus Serif")
#set par(spacing: 1.5em)
#set strong(delta: 200)

//Customize appearance
#show raw: set text(font: "DejaVu Sans Mono")
#show raw.where(block: true): set block(fill: rgb("#faebd7"), inset: 1em, radius: 0.5em, width: 100%)
#show link: set text(fill: blue)

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

= `letterloom 1.0.0`

== Introduction

The `letterloom` package is a user-friendly and customizable template designed to streamline the creation of professional-looking letters. Whether for personal or business correspondence, it eliminates the challenges of traditional typesetting tools like LaTeX while delivering polished and elegant results.

*Key Features:*
- *Multiple Signatures:* Effortlessly include one or more signatures for joint communications or approvals.

- *Customizable Footnotes:* Add informative footnotes with flexible formatting options.

- *Enclosures and Attachments:* Clearly list additional documents included with the letter.

- *Internationalization Support:* Customize labels and text for different languages and regions.


*Benefits:*
- Simplifies the letter-writing process with an intuitive template.

- Eliminates the steep learning curve of tools like LaTeX.

- Delivers professional-quality output without requiring technical expertise.

- Supports multilingual documents with customizable labels.

Regardless of whether you are preparing a formal business correspondence, or crafting a personal letter, `letterloom` makes creating visually appealing documents both straightforward and efficient.

== Usage

The `letterloom` package offers extensive customization options, enabling you to tailor your letters to suit various needs and preferences.

In the sections that follow, we will explore each parameter in detail, accompanied by practical examples demonstrating their usage.

=== Getting Started

To get started, here is a simple example demonstrating the essential arguments needed to use the `letterloom` package:

```typ
#import "@preview/letterloom:1.0.0": *

#show: letterloom.with(
  // Sender's contact information (name and address)
  from-name: "Sender's Name",
  from-address: [Sender's Address],

  // Recipient's contact information (name and address)
  to-name: "Receiver's Name",
  to-address: [Receiver's Address],

  // Letter date (automatically set to today's date)
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),

  // Opening greeting
  salutation: "Dear Receiver's Name,",

  // Letter subject line
  subject: "Subject",

  // Closing phrase
  closing: "Yours sincerely,",

  // List of signatories with their names and optional signature image title and affiliation
  signatures: (
    (
      name: "Sender's Name",
    ),
  ),
)

// Write the body of your letter here
```

=== Required Parameters

This section covers the required parameters of the `letterloom` package, which define the essential elements of the letter including the sender, recipient, date, and signature.

#v(5pt)

*`from-name`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)

Specifies the sender's name either as a string or content block.

#text(size: 10pt)[#text(size: 10pt)[*Example:*]]
```typ
// String
from-name: "The Dimbleby Family"

// Content block
from-name: text(weight: "bold")[The Dimbleby Family]
```

*Note:* By default, the sender's name and sender's address is right-aligned. You can change this using the `from-alignment` parameter, which will also align the `date` field to match the selected alignment.

#v(5pt)

*`from-address`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)

Specifies the sender's address either as a string or content block.

#v(10pt)

#text(size: 10pt)[#text(size: 10pt)[*Example:*]]
```typ
// String
from-address: "The Lodge"

// Content block
from-address: [The Lodge \
               Cheswick Village \
               Middle Upton \
               Bristol BS16 1GU]
```

*Note:* By default, the sender's name and sender's address is right-aligned. You can change this using the `from-alignment` parameter, which will also align the `date` field to match the selected alignment.

#v(5pt)

*`to-name`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)

Specifies the recipient's name either as a string or content block.

#text(size: 10pt)[*Example:*]
```typ
// String
to-name: "Evergreen Tree Surgeons"

// Content block
to-name: text(weight: "bold")[Evergreen Tree Surgeons]
```

#v(5pt)

*`to-address`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)

Specifies the recipient's address either as a string or content block.

#text(size: 10pt)[*Example:*]
```typ
// String
to-address: "Midtown Lane"

// Content block
to-address: [Midtown Lane \
             Cheswick Village \
             Stoke Gifford \
             Bristol BS16 1GU]
```

#v(5pt)

*`date`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

Specifies the letter's date either as a string or content block.

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

#v(5pt)

*`salutation`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

Specifies the greeting for the letter either as a string or content block.

#text(size: 10pt)[*Examples:*]
```typ
// Standard business salutation
salutation: "Dear Mr Hawthorne,"

// Formal salutation
salutation: "To Whom It May Concern,"

// Personal salutation
salutation: "Dear John,"
```

#v(5pt)

*`subject`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content

Specifies the subject line of the letter either as a string or content block.

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

Specifies the closing phrase of the letter either as a string or content block.

#text(size: 10pt)[*Examples:*]
```typ
// Formal business closing
closing: "Yours sincerely,"

// Less formal closing
closing: "Best regards,"

// Personal closing
closing: "With warm personal regards,"
```

#v(5pt)

*`signatures`* #h(15pt) #highlight-type.array

Specifies a list of signatories as an array of dictionaries, where each dictionary represents a signatory with the following keys:

#table(
  columns: 3,
  column-gutter: 10pt,
  row-gutter: 5pt,
  rows: 1,
  stroke: none,
  inset: 3pt,
  [`name`], [#highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)], [The signatory's name.],
  [`title`], [#highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt) _optional_], [The signatory's title.],
  [`affiliation`], [#highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt) _optional_], [The signatory's affiliation.],
  [`signature`], [#highlight-type.function #h(5pt) _optional_], [#link("https://typst.app/docs/reference/visualize/image/")[Typst image function] specifying the location of the signature image. If omitted, a blank space is reserved for a physical signature.],
)

#text(size: 10pt)[*Examples:*]
```typ
// Single signature
signatures: (
  (
    name: "Lord Albus Dimbleby",
    signature: image("images/albus-sig.png")
  )
)

// Single signature with title and affiliation
signatures: (
  (
    name: "Sir Austin Dimbleby",
    title: "Knight Commander of the Order of the British Empire",
    affiliation: [
      Senior Advisor, International Relations \
      Chairman, Global Trade Council \
    ],
  ),
)

// Multiple signatures
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
    name: "Sir Austin Dimbleby"
    // No signature image - space left for physical signature
  )
)
```

*Note:* If only one signature is given, the `signature-alignment` parameter can be used to align the signature to the left, right, or center of the page. This parameter is ignored if multiple signatures are specified.

=== Optional Parameters

The following optional parameters enable you to add additional fields like an attention line, a list of cc recipients, a list of enclosures, and a footer to your letter if desired.

#v(5pt)

*`attn-name`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)

Specifies the name of the recipient of the attention line either as a string or content block.

#text(size: 10pt)[*Example:*]
```typ
attn-name: "Mr Basil Hawthorne"
```

#v(5pt)

*`attn-label`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)

Specifies the label for the attention line either as a string or content block.

#text(size: 10pt)[*Default:* `"Attn:"`]

#text(size: 10pt)[*Example:*]
```typ
attn-label: "À l'attention de"
```

#v(5pt)

*`attn-position`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)

Specifies the position of the attention line depending on whether it is placed `"above"` or `"below"` the recipient's address.

#text(size: 10pt)[*Default:* `"above"`]

#text(size: 10pt)[*Example:*]
```typ
attn-position: "below"
```

#v(5pt)

*`cc`* #h(15pt) #highlight-type.array

Lists carbon copy (cc) recipients as an array of strings.

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

Specifies the label for the cc recipients list either as a string or content block.

#text(size: 10pt)[*Default:* `"cc:"`]

#text(size: 10pt)[*Example:*]
```typ
// String
cc-label: "Cc:"

// Content block
cc-label: text(weight: "bold")[cc:]
```

#v(5pt)

*`enclosures`* #h(15pt) #highlight-type.array

Lists additional documents included with the letter as an array of strings.

#text(size: 10pt)[*Default:* #h(5pt) #highlight-type.none-type]

#text(size: 10pt)[*Examples:*]
```typ
// Single enclosure
enclosures: "Provenance of the Oak trees on the Dimbleby Estate."

// Multiple enclosures
enclosures: (
  "Provenance of the Oak trees on the Dimbleby Estate.",
  "Photographs of storm damage.",
  "Insurance claim form.",
)
```

#v(5pt)

*`enclosures-label`* #h(15pt) #highlight-type.str #h(5pt) or #h(5pt) #highlight-type.content #h(5pt)

Specifies the label for the enclosures list either as a string or content block.

#text(size: 10pt)[*Default:* `"encl:"`]

#text(size: 10pt)[*Example:*]
```typ
// String
enclosures-label: "P.J.:"

// Content block
enclosures-label: text(weight: "bold")[encl:]
```

#v(5pt)

*`footer`* #h(15pt) #highlight-type.array

Specifies a list of footer elements such as URLs, email addresses and arbitrary text as an array of dictionaries.

#table(
  columns: 3,
  column-gutter: 10pt,
  row-gutter: 5pt,
  rows: 2,
  stroke: none,
  inset: 3pt,
  [`footer-text`], [#highlight-type.str #h(5pt)], [The footer text.],
  [`footer-type`], [#highlight-type.str #h(5pt)], [The type of footer element: `"url"`, `"email"` or `"string"`. If specified as `"url"` or `"email"`, it will be rendered as a clickable hyperlink. Defaults to `"string"`.],
)

#text(size: 10pt)[*Default:* #h(5pt) #highlight-type.none-type]

#text(size: 10pt)[*Example:*]
```typ
footer: (
  (
    // Displayed as is
    footer-text: "+44-117-555-5555"
  ),
  (
    // Displayed as a mailto: link
    footer-text: "dimblebyfamily@dimbleby.org",
    footer-type: "email"
  ),
  (
    // Displayed as a web link
    footer-text: "https://dimbleby.org",
    footer-type: "url"
  )
)
```

*Note:* The footer is placed at the bottom of the letter above the page number if enabled and is center-aligned.

=== Document Settings

Customize the letter's document settings using the parameters below. Each parameter includes a default value, which can be adjusted to fit your needs.

#v(5pt)

*`paper-size`* #h(15pt) #highlight-type.str

Specifies the paper size for the letter.

#text(size: 10pt)[*Default:* `"a4"`]

#text(size: 10pt)[*Examples:*]
```typ
paper-size: "a4"        // A4 (210 × 297 mm)
paper-size: "us-letter" // US Letter (8.5 × 11 in)
paper-size: "legal"     // Legal (8.5 × 14 in)
```

For more information, see #link("https://typst.app/docs/reference/layout/page/#parameters-paper")[Typst's documentation on paper sizes].

#v(5pt)

*`margins`* #h(15pt) #highlight-type.auto-type #h(5pt) or #h(5pt) #highlight-type.relative #h(5pt) or #h(5pt) #highlight-type.dictionary

Defines the margins of the letter.

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

*Note:* The default setting of #h(5pt) #highlight-type.auto-type #h(5pt) results in a 25 mm margin for the A4 paper size.

#v(5pt)

*`par-leading`* #h(15pt) #highlight-type.length

Adjusts the line spacing within paragraphs.

#text(size: 10pt)[*Default:* `0.8em`]

#text(size: 10pt)[*Examples:*]
```typ
par-leading: 0.8em  // Tight spacing
par-leading: 1.0em  // Normal spacing
par-leading: 1.2em  // Loose spacing
```

*Note:* Adjust this value to complement the chosen font and font size.

#v(5pt)

*`par-spacing`* #h(15pt) #highlight-type.length

Controls the spacing between paragraphs.

#text(size: 10pt)[*Default:* `1.8em`]

#text(size: 10pt)[*Examples:*]
```typ
par-spacing: 1.5em  // Compact paragraphs
par-spacing: 1.8em  // Standard spacing
par-spacing: 2.0em  // Relaxed spacing
```

*Note:* Modify this value to match the font and font size for optimal readability.

#v(5pt)

*`number-pages`* #h(15pt) #highlight-type.bool

Toggles page numbering. If enabled, numbering starts from the second page.

#text(size: 10pt)[*Default:* `false`]

#text(size: 10pt)[*Examples:*]
```typ
number-pages: false  // No page numbers
number-pages: true   // Page numbers from the second page onwards
```

*Note:* Page numbers are centered at the bottom of the page, below the footer if one is specified.

=== Typography Settings

These parameters allow you to customize the fonts used throughout the letter. Each parameter has a default font setting that can be changed as needed.

#v(5pt)

*`main-font`* #h(15pt) #highlight-type.str

Sets the font used for the main body of the letter.

#text(size: 10pt)[*Default:* `"Libertinus Serif"`]

#text(size: 10pt)[*Examples:*]
```typ
main-font: "Libertinus Serif"  // Default serif font
main-font: "Noto Serif"        // Google's Noto Serif
main-font: "Times New Roman"   // Classic serif
main-font: "Arial"             // Sans-serif option
```

#v(5pt)

*`main-font-size`* #h(15pt) #highlight-type.length

Sets the font size for the main body.

#text(size: 10pt)[*Default:* `11pt`]

#text(size: 10pt)[*Examples:*]
```typ
main-font-size: 10pt  // Smaller text
main-font-size: 11pt  // Standard size
main-font-size: 12pt  // Larger text
```

#v(5pt)

*`footnote-font`* #h(15pt) #highlight-type.str

Sets the font used for footnotes.

#text(size: 10pt)[*Default:* `"Libertinus Serif"`]

#text(size: 10pt)[*Examples:*]
```typ
footnote-font: "Libertinus Serif"  // Match main font
footnote-font: "Noto Serif"        // Alternative serif
footnote-font: "DejaVu Sans"       // Sans-serif option
```

#v(5pt)

*`footnote-font-size`* #h(15pt) #highlight-type.length

Sets the font size for footnotes.

#text(size: 10pt)[*Default:* `7pt`]

#text(size: 10pt)[*Examples:*]
```typ
footnote-font-size: 6pt   // Very small
footnote-font-size: 7pt   // Standard size
footnote-font-size: 8pt   // Larger footnotes
```

#v(5pt)

*`footer-font`* #h(15pt) #highlight-type.str

Sets the font used for the footer.

#text(size: 10pt)[*Default:* `"DejaVu Sans Mono"`]

#text(size: 10pt)[*Examples:*]
```typ
footer-font: "DejaVu Sans Mono"  // Monospace default
footer-font: "Fira Mono"         // Modern monospace
footer-font: "Courier New"       // Classic monospace
footer-font: "Arial"             // Sans-serif option
```

#v(5pt)

*`footer-font-size`* #h(15pt) #highlight-type.length

Sets the font size for the footer.

#text(size: 10pt)[*Default:* `9pt`]

#text(size: 10pt)[*Examples:*]
```typ
footer-font-size: 8pt   // Smaller footer
footer-font-size: 9pt   // Standard size
footer-font-size: 10pt  // Larger footer
```

=== Layout Settings

These parameters provide options to align specific elements and change the color of hyperlinks.

#v(5pt)

*`from-alignment`* #h(15pt) #highlight-type.alignment

Sets the alignment of the sender's address and date.

#text(size: 10pt)[*Default:* `right`]

#text(size: 10pt)[*Examples:*]
```typ
from-alignment: left    // Left-aligned sender address
from-alignment: right   // Right-aligned sender address (default)
from-alignment: center  // Center-aligned sender address
```

#v(5pt)

*`footnote-alignment`* #h(15pt) #highlight-type.alignment

Specifies the alignment of the footnote separator and footnotes.

#text(size: 10pt)[*Default:* `left`]

#text(size: 10pt)[*Examples:*]
```typ
footnote-alignment: left   // Left-aligned footnotes (default)
footnote-alignment: right  // Right-aligned footnotes
footnote-alignment: center // Center-aligned footnotes
```

#v(5pt)

*`signature-alignment`* #h(15pt) #highlight-type.alignment

Specifies the alignment of the signature if only one signature is specified. If multiple signatures are specified this parameter is ignored.

#text(size: 10pt)[*Default:* `left`]

#text(size: 10pt)[*Examples:*]
```typ
signature-alignment: left   // Left-aligned signature (default)
signature-alignment: right  // Right-aligned signature
signature-alignment: center // Center-aligned signature
```
#v(5pt)

*`link-color`* #h(15pt) #highlight-type.color

Determines the color of hyperlinks in the letter.

#text(size: 10pt)[*Default:* `blue`]

#text(size: 10pt)[*Examples:*]
```typ
link-color: blue             // Typst's blue #0074d9 (default)
link-color: maroon           // Typst's maroon #85144b
link-color: rgb(0, 100, 200) // Custom RGB color
```

Refer to #link("https://typst.app/docs/reference/visualize/color/#summary")[Typst's documentation on colors] for additional details.

== Example Letter

This example highlights a number of features provided by the `letterloom` package and demonstrates how to use them.

```typ
#import "@preview/letterloom:1.0.0": *

#show: letterloom.with(
  // Sender's contact information (name and address)
  from-name: "The Dimbleby Family",
  from-address: [The Lodge \
                 Cheswick Village \
                 Middle Upton \
                 Bristol BS16 1GU],

  // Recipient's contact information (name and address)
  to-name: "Evergreen Tree Surgeons",
  to-address: [Midtown Lane \
               Cheswick Village \
               Stoke Gifford \
               Bristol BS16 1GU],

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

  // List of signatories with their names and optional signature image title and affiliation
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
  ),

  // List of cc recipients (optional)
  cc: "Mr Jethro Tull",

  // List of enclosures (optional)
  enclosures: "Provenance of the Oak trees on the Dimbleby Estate.",

  // Custom footer information (optional)
  footer: (
    (
      footer-text: "+44-117-555-5555",
    ),
    (
      footer-text: "dimblebyfamily@dimbleby.org",
      footer-type: "email"
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

We are writing to request you to visit The Lodge at the Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

#show figure.caption: set text(font: "Libertinus Serif", size: 10pt)
#figure(
  image("images/storm-damaged-oak-tree.jpg", width: 80%),
  caption: [Storm Damaged Oak Tree.#footnote[This image was generated using #link("https://deepai.org/machine-learning-model/text2img")[DeepAI's image generator].]]
)

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678, to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.
```

#show: letterloom.with(
  // Sender's contact information (name and address)
  from-name: "The Dimbleby Family",
  from-address: [The Lodge \
                 Cheswick Village \
                 Middle Upton \
                 Bristol BS16 1GU],

  // Recipient's contact information (name and address)
  to-name: "Evergreen Tree Surgeons",
  to-address: [Midtown Lane \
               Cheswick Village \
               Stoke Gifford \
               Bristol BS16 1GU],

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

  // List of signatories with their names and optional signature image title and affiliation
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
  ),

  // List of cc recipients (optional)
  cc: "Mr Jethro Tull",

  // List of enclosures (optional)
  enclosures: "Provenance of the Oak trees on the Dimbleby Estate.",

  // Custom footer information (optional)
  footer: (
    (
      footer-text: "+44-117-555-5555",
    ),
    (
      footer-text: "dimblebyfamily@dimbleby.org",
      footer-type: "email"
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

We are writing to request you to visit The Lodge at the Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

#show figure.caption: set text(font: "Libertinus Serif", size: 10pt)
#figure(
  image("images/storm-damaged-oak-tree.jpg", width: 80%),
  caption: [Storm Damaged Oak Tree.#footnote[This image was generated using #link("https://deepai.org/machine-learning-model/text2img")[DeepAI's image generator].]]
)

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678, to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.

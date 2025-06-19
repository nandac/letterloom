#import "@preview/letterloom:0.1.0": *

#show: letterloom.with(
  // Sender
  from: (
    name: "Sender's Name",
    address: [Sender's Address]
  ),
  // Receiver
  to: (
    name: "Receiver's Name",
    address: [Receiver's Address]
  ),
  // Alignment of the sender's address
  from-alignment: right,
  // Attention name
  attn-name: none,
  // Date
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
  // Salutation
  salutation: "Dear Receiver's Name,",
  // Subject
  subject: "Subject",
  // Closing
  closing: "Yours sincerely,",
  // Signatures
  signatures: (
    (
      name: "Sender's Name",
      // signature: image() // Add your signature image here
    )
  ),
  // Enclosures
  enclosures: none,
  // Enclosures title
  enclosures-title: "encl:",
  // Carbon copy
  cc: none,
  // Figures
  figures: none,
  // Footer
  footer: none,
  // Number pages from the second page onwards
  number-pages: false,
  // Paper size
  paper-size: "a4",
  // Margins
  margins: auto,
  // Main font
  main-font: "Libertinus Serif",
  // Main font size
  main-font-size: 11pt,
  // Footer font
  footer-font: "DejaVu Sans Mono",
  // Footer font size
  footer-font-size: 7pt,
  // Caption font
  caption-font: "Libertinus Serif",
  // Caption font size
  caption-font-size: 9pt,
  // Footnote alignment
  footnote-alignment: left,
  // Footnote font
  footnote-font: "Libertinus Serif",
  // Footnote font size
  footnote-font-size: 8pt,
  // Paragraph leading
  par-leading: 0.8em,
  // Paragraph spacing
  par-spacing: 1.8em,
  // Link color
  link-color: blue
)

// Write the body of your letter here

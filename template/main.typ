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

  // Uncomment the following options to customize the letter

  // from-alignment: right, // Alignment of the sender's address
  // attn-name: none, // Add the name of the person you want to address your letter to
  // enclosures: none, // Add enclosures to your letter
  // enclosures-title: "encl:", // Change the title of the enclosures
  // cc: none, // Add the person you want cc your letter to
  // figures: none, // Add figures to your letter
  // footer: none, // Add a footer to your letter
  // number-pages: false, // Number pages from the second page onwards
  // paper-size: "a4", // Paper size
  // margins: auto, // Margins
  // main-font: "Libertinus Serif", // Main font for the body of the letter
  // main-font-size: 11pt, // Main font size for the body of the letter
  // footer-font: "DejaVu Sans Mono", // Footer font
  // footer-font-size: 7pt, // Footer font size
  // caption-font: "Libertinus Serif", // Caption font
  // caption-font-size: 9pt, // Caption font size
  // footnote-alignment: left, // Footnote alignment
  // footnote-font: "Libertinus Serif", // Footnote font
  // footnote-font-size: 8pt, // Footnote font size
  // par-leading: 0.8em, // Paragraph leading
  // par-spacing: 1.8em, // Paragraph spacing
  // link-color: blue // Link color
)

// Write the body of your letter here

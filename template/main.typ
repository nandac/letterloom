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

  // List of signatures — add name, optional image, and optional affiliation
  signatures: (
    (
      name: "Sender's Name",
      // signature: image("images/sender-sig.png"),
      // affiliation: "Job Title",
    ),
  ),

  // Letterhead image (optional)
  // letterhead: (
  //   file: read("images/letterhead.png", encoding: none),
  //   // width: 60%,
  //   // image-inset: (top: 5mm, rest: 0mm),
  //   // image-alignment: center,
  // ),

  // Attention line (optional)
  // attn-name: "Receiver's Name",

  // Carbon copy recipients (optional)
  // cc: ("Name One", "Name Two"),

  // Enclosures (optional)
  // enclosures: (
  //   (description: "Document title"),
  // ),

  // Footer (optional)
  // footer: (
  //   (footer-text: "+00-000-000-0000"),
  //   (footer-text: "email@example.com", footer-type: "email"),
  //   (footer-text: "https://example.com", footer-type: "url"),
  // ),

  // Page numbering from page 2 onwards (optional)
  // number-pages: true,
)

// Write the body of your letter here

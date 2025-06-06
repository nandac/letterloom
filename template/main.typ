#import "@preview/easy-letter:0.1.0": easy-letter

// Sender
#let sender = (
  name: "The Dimbleby Family",
  address: "The Lodge
Cheswick Village
Middle Upton
Bristol BS16 1GU"
)

// Receiver
#let receiver = (
  name: "Evergreen Tree Surgeons",
  address: "Midtown Lane
Cheswick Village
Stoke Gifford
Bristol BS16 1GU"
)

// Supports a maximum of three signatures
#let signatures = (
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

#let enclosures = (
  "Photograph of storm damage to an oak tree."
)

#let figures = (
  (
    image: image("images/storm-damage-597217_1280.jpg", width: 80%),
    caption: [Storm Damaged Oak Tree.#footnote[Image courtesy of user 127071 at #link("https://pixabay.com/photos/storm-damage-oak-tree-break-597217/")[Pixabay].]]
  )
)

#let footer =  (
  // Type is one of string, email or link
  (
    content: "+44-117-555-5555",
    type: "string",
  ),
  (
    content: "dimblebyfamily@dimbleby.org",
    type: "email",
  ),
  (
    content:"https://dimbleby.org",
    type: "link",
  ),
)

#show: easy-letter.with(
  sender: sender,
  receiver: receiver,
  date: datetime.today().display("[year]-[month]-[day]"),
  salutation: "Gentlemen,",
  subject: "Pruning of Heritage Oak Trees in the Dimbleby Estate",
  closing: "Sincerely yours,",
  signatures: signatures,
  enclosures: enclosures,
  cc: "Mr Jethro Tull",
  figures: figures,
  footer: footer,
  link-color: maroon,
  number-pages: true
)

We are writing to request you to visit The Lodge at the Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678. to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.

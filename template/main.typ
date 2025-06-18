#import "@preview/letterloom:0.1.0": *

// Sender
#let from = (
  name: "The Dimbleby Family",
  address: [The Lodge \
            Cheswick Village \
            Middle Upton \
            Bristol BS16 1GU]
)

// Receiver
#let to = (
  name: "Evergreen Tree Surgeons",
  address: [Midtown Lane \
            Cheswick Village \
            Stoke Gifford \
            Bristol BS16 1GU]
)

// Supports a maximum of three signatures
#let signatures = (
  (
    name: "Lord Albus Dimbleby",
    signature: image("../images/albus-sig.png")
  ),
  (
    name: "Lady Abigail Dimbleby",
    signature: image("../images/abigail-sig.png")
  ),
  (
    name: "Sir Austin Dimbleby",
    signature: image("../images/austin-sig.png")
  )
)

#let enclosures = (
  "Photograph of storm damaged oak tree."
)

#let figures = (
  (
    image: image("../images/storm-damaged-oak-tree.jpg", width: 80%),
    caption: [Storm Damaged Oak Tree.#footnote[This image was generated using #link("https://deepai.org/machine-learning-model/text2img")[DeepAI's image generator].]]
  )
)

#let footer =  (
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

#show: letterloom.with(
  from: from,
  to: to,
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
  salutation: "Gentlemen,",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  closing: "Sincerely yours,",
  signatures: signatures,
  enclosures: enclosures,
  cc: "Mr Jethro Tull",
  figures: figures,
  footer: footer,
  footer-font: "Fira Mono",
  footer-font-size: 7pt,
  number-pages: true,
  footnote-alignment: right,
  main-font: "Noto Serif",
  main-font-size: 11pt,
  caption-font: "Source Sans Pro",
  caption-font-size: 9pt,
  footnote-font: "Noto Serif",
  footnote-font-size: 7pt,
  link-color: maroon
)

We are writing to request you to visit The Lodge at the Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678. to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.

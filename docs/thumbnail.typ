#import "@preview/letterloom:0.1.0": *

#set page(height: auto, margin: 5mm)

// Style thumbnail for light and dark theme
#let theme = sys.inputs.at("theme", default: "light")
#set page(fill: black) if theme == "dark"
#set text(white) if theme == "dark"

#show: letterloom.with(
  //Sender's contact information (name and address)
  from: (
    name: "The Dimbleby Family",
    address: [The Lodge \
              Cheswick Village \
              Middle Upton \
              Bristol BS16 1GU]
  ),
  //Recipient's contact information (name and address)
  to: (
    name: "Evergreen Tree Surgeons",
    address: [Midtown Lane \
              Cheswick Village \
              Stoke Gifford \
              Bristol BS16 1GU]
  ),
  // Letter date (automatically set to today's date)
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
  // Opening greeting
  salutation: "Dear Mr Hawthorne",
  // Letter subject line
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  // Closing phrase
  closing: "Sincerely yours,",
  // List of signatories with their names
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
    ),
  ),
)

// Letter content
We are writing to request you to visit The Lodge at the Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678, to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.

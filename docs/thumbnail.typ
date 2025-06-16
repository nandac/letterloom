#import "@preview/letterloom:0.1.0": *

#set page(height: auto, margin: 5mm, fill: none)

// style thumbnail for light and dark theme
#let theme = sys.inputs.at("theme", default: "light")
#set text(white) if theme == "dark"

#show: letterloom.with(
  from: (
    name: "Sender Name",
    address: [Sender Address]
  ),
  to: (
    name: "Receiver Name",
    address: [Receiver Address]
  ),
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
  salutation: "Dear Name,",
  subject: "Subject of Letter",
  closing: "Yours sincerely,",
  signatures: (
    (
      name: "Sender Name"
    )
  )
)

The text of your letter should be added here.

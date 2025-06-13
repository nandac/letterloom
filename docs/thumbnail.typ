#import "/src/lib.typ" as easy-letter: *

#set page(height: auto, margin: 5mm, fill: none)

// style thumbnail for light and dark theme
#let theme = sys.inputs.at("theme", default: "light")
#set text(white) if theme == "dark"

#show: easy-letter.with(
  from: (
    name: "My Name",
    address: [My Address \
              My Town \
              My County \
              My Postcode]
  ),
  to: (
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

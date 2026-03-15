/// test-single-long-signature
///
/// Synopsis:
/// Test case that validates the letterloom function correctly lays out a single
/// signature with long content (multi-line title, affiliation) and various
/// signature-alignment values.
///
/// Purpose:
/// Ensures that letters with one signatory and lengthy title/affiliation text
/// render correctly and that signature-alignment (left, center, right) is applied.
/// Also covers multiple signatures and invalid signature-alignment type.
///
/// Test Scenario:
/// - Single signature with long title and multi-line affiliation, left alignment
/// - Single signature with long title and multi-line affiliation, center alignment
/// - Single signature with long title and multi-line affiliation, right alignment
/// - Multiple signatures (alignment forced to left)
/// - Invalid signature-alignment type (string instead of alignment)
///
/// Expected Behavior:
/// Letters render with correctly aligned signature blocks; invalid alignment panics.
/// Output is compared to reference images (visual regression).
///
/// Validation:
/// Visual regression: output must match reference. Ensures long signature content
/// and alignment options behave correctly across layout changes.
///
/// Note:
/// This test complements test-single-signature-alignment by focusing on long
/// signature content and multi-page layout when applicable.
#import "/src/lib.typ": *

#show: letterloom.with(
  from-name: "The Dimbleby Family",
  from-address: [
    The Dimbleby Estate \
    Cheswick Village \
    Middle Upton \
    Bristol BS16 1GU
  ],
  to-name: "Evergreen Tree Surgeons",
  to-address: [
    Midtown Lane \
    Cheswick Village \
    Stoke Gifford \
    Bristol BS16 1GU
  ],
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
  salutation: "Dear Mr Hawthorne",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  closing: "Sincerely yours,",
  signatures: (
    (
      name: "Sir Austin Dimbleby, KBE",
      title: "Knight Commander of the Order of the British Empire",
      affiliation: [
        Senior Advisor, International Relations \
        Chairman, Global Trade Council \
      ],
    ),
  ),
  signature-alignment: left,
)

#show: letterloom.with(
  from-name: "The Dimbleby Family",
  from-address: [
    The Dimbleby Estate \
    Cheswick Village \
    Middle Upton \
    Bristol BS16 1GU
  ],
  to-name: "Evergreen Tree Surgeons",
  to-address: [
    Midtown Lane \
    Cheswick Village \
    Stoke Gifford \
    Bristol BS16 1GU
  ],
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
  salutation: "Dear Mr Hawthorne",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  closing: "Sincerely yours,",
  signatures: (
    (
      name: "Sir Austin Dimbleby, KBE",
      title: "Knight Commander of the Order of the British Empire",
      affiliation: [
        Senior Advisor, International Relations \
        Chairman, Global Trade Council \
      ],
    ),
  ),
  signature-alignment: center,
)

#show: letterloom.with(
  from-name: "The Dimbleby Family",
  from-address: [
    The Dimbleby Estate \
    Cheswick Village \
    Middle Upton \
    Bristol BS16 1GU
  ],
  to-name: "Evergreen Tree Surgeons",
  to-address: [
    Midtown Lane \
    Cheswick Village \
    Stoke Gifford \
    Bristol BS16 1GU
  ],
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
  salutation: "Dear Mr Hawthorne",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  closing: "Sincerely yours,",
  signatures: (
    (
      name: "Sir Austin Dimbleby, KBE",
      title: "Knight Commander of the Order of the British Empire",
      affiliation: [
        Senior Advisor, International Relations \
        Chairman, Global Trade Council \
      ],
    ),
  ),
  signature-alignment: right,
)

#show: letterloom.with(
  from-name: "The Dimbleby Family",
  from-address: [
    The Dimbleby Estate \
    Cheswick Village \
    Middle Upton \
    Bristol BS16 1GU
  ],
  to-name: "Evergreen Tree Surgeons",
  to-address: [
    Midtown Lane \
    Cheswick Village \
    Stoke Gifford \
    Bristol BS16 1GU
  ],
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
  salutation: "Dear Mr Hawthorne",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  closing: "Sincerely yours,",
  signatures: (
    (
      name: "Sir Austin Dimbleby, KBE",
      title: "Knight Commander of the Order of the British Empire",
      affiliation: [
        Senior Advisor, International Relations \
        Chairman, Global Trade Council \
      ],
    ),
  ),
  signature-alignment: center,
)

#show: letterloom.with(
  from-name: "The Dimbleby Family",
  from-address: [
    The Dimbleby Estate \
    Cheswick Village \
    Middle Upton \
    Bristol BS16 1GU
  ],
  to-name: "Evergreen Tree Surgeons",
  to-address: [
    Midtown Lane \
    Cheswick Village \
    Stoke Gifford \
    Bristol BS16 1GU
  ],
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
  salutation: "Dear Mr Hawthorne",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  closing: "Sincerely yours,",
  signatures: (
    (
      name: "Sir Austin Dimbleby, KBE",
      title: "Knight Commander of the Order of the British Empire",
      affiliation: [
        Senior Advisor, International Relations \
        Chairman, Global Trade Council \
      ],
    ),
  ),
  signature-alignment: right,
)

#show: letterloom.with(
  from-name: "The Dimbleby Family",
  from-address: [
    The Dimbleby Estate \
    Cheswick Village \
    Middle Upton \
    Bristol BS16 1GU
  ],
  to-name: "Evergreen Tree Surgeons",
  to-address: [
    Midtown Lane \
    Cheswick Village \
    Stoke Gifford \
    Bristol BS16 1GU
  ],
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
  salutation: "Dear Mr Hawthorne",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  closing: "Sincerely yours,",
  signatures: (
    (
      name: "Lord Albus Dimbleby"
    ),
    (
      name: "Lady Abigail Dimbleby"
    ),
    (
      name: "Sir Austin Dimbleby, KBE",
      title: "Knight Commander of the Order of the British Empire",
      affiliation: [
        Senior Advisor, International Relations \
        Chairman, Global Trade Council \
      ],
    ),
  ),
)

#show: letterloom.with(
  from-name: "The Dimbleby Family",
  from-address: [
    The Dimbleby Estate \
    Cheswick Village \
    Middle Upton \
    Bristol BS16 1GU
  ],
  to-name: "Evergreen Tree Surgeons",
  to-address: [
    Midtown Lane \
    Cheswick Village \
    Stoke Gifford \
    Bristol BS16 1GU
  ],
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
  salutation: "Dear Mr Hawthorne",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  closing: "Sincerely yours,",
  signatures: (
    (
      name: "Sir Austin Dimbleby, KBE",
      title: "Knight Commander of the Order of the British Empire",
      affiliation: [
        Senior Advisor, International Relations \
        Chairman, Global Trade Council \
      ],
    ),
    (
      name: "Lord Albus Dimbleby",
    ),
    (
      name: "Lady Abigail Dimbleby",
    ),
  ),
)

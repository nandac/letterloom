/// test-single-long-affiliation
///
/// Synopsis:
/// Rendering test that validates correct layout of signatures with long
/// affiliation text across all signature-alignment values and multi-signatory
/// arrangements where one signatory carries a long affiliation.
///
/// Purpose:
/// Ensures that lengthy affiliation text (4-line affiliation with signature
/// image, or 2-line affiliation without image) renders correctly and that the
/// signature-alignment parameter is applied as expected for single signatures.
/// Also verifies that multi-signatory rows handle one signatory with a long
/// affiliation regardless of their position in the list.
///
/// Test Scenarios:
/// 1. Single signature with 4-line affiliation and signature image,
///    signature-alignment: left
/// 2. Single signature with 2-line affiliation (no image),
///    signature-alignment: center
/// 3. Single signature with 2-line affiliation (no image),
///    signature-alignment: right
/// 4. Single signature with 2-line affiliation (no image),
///    signature-alignment: center
/// 5. Single signature with 2-line affiliation (no image),
///    signature-alignment: right
/// 6. Three signatories: two without affiliation followed by one with
///    2-line affiliation (default signature-alignment)
/// 7. Three signatories: one with 2-line affiliation followed by two
///    without affiliation (default signature-alignment)
///
/// Expected Behavior:
/// All scenarios produce visual output compared against reference images.
/// Signature blocks align correctly for each signature-alignment value.
/// In multi-signatory rows, all name baselines remain level regardless of
/// which signatory carries the long affiliation.
///
/// Validation:
/// Visual regression only — output must match reference images.
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
      signature: image("../../docs/images/austin-sig.png", width: 50mm),
      affiliation: [
        Knight Commander of the British Empire \
        Chairman, Dimbleby Estate \
        General Secretary, Dimbleby Family Trust \
        Senior Fellow, Royal Institute of Horticulture \
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

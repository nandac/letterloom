/// test-footnote-alignment
///
/// Synopsis:
/// Test case that validates the letterloom function correctly positions the
/// footnote separator line and footnote text according to footnote-alignment.
///
/// Purpose:
/// Ensures that the footnote.entry show rule in lib.typ applies footnote-alignment
/// to both the separator line and the footnote body text for all three supported
/// alignment values.
///
/// Test Scenarios:
/// - Scenario 1: footnote-alignment: left (default) — separator and text flush left
/// - Scenario 2: footnote-alignment: center — separator and text centred
/// - Scenario 3: footnote-alignment: right — separator and text flush right
///
/// Expected Behavior:
/// The footnote separator line and body text shift horizontally according to
/// the alignment value. The letter body and other elements are unaffected.
///
/// Validation:
/// Visual regression: output must match reference images.
#import "/src/lib.typ": *

// Scenario 1: footnote-alignment left (default)
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
  date: "01 January 1970",
  salutation: "Dear Mr Hawthorne,",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  closing: "Sincerely yours,",
  signatures: (
    (name: "Lord Albus Dimbleby"),
  ),
  footnote-alignment: left,
)

We are writing to request you to visit The Dimbleby Estate#footnote[The estate is a Grade II listed property.] in Cheswick Village to assess a stand of lordly Heritage Oak Trees#footnote[Quercus robur, estimated age 300 years.] that have stood the test of time.

Thank you kindly.

// Scenario 2: footnote-alignment center
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
  date: "01 January 1970",
  salutation: "Dear Mr Hawthorne,",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  closing: "Sincerely yours,",
  signatures: (
    (name: "Lord Albus Dimbleby"),
  ),
  footnote-alignment: center,
)

We are writing to request you to visit The Dimbleby Estate#footnote[The estate is a Grade II listed property.] in Cheswick Village to assess a stand of lordly Heritage Oak Trees#footnote[Quercus robur, estimated age 300 years.] that have stood the test of time.

Thank you kindly.

// Scenario 3: footnote-alignment right
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
  date: "01 January 1970",
  salutation: "Dear Mr Hawthorne,",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  closing: "Sincerely yours,",
  signatures: (
    (name: "Lord Albus Dimbleby"),
  ),
  footnote-alignment: right,
)

We are writing to request you to visit The Dimbleby Estate#footnote[The estate is a Grade II listed property.] in Cheswick Village to assess a stand of lordly Heritage Oak Trees#footnote[Quercus robur, estimated age 300 years.] that have stood the test of time.

Thank you kindly.

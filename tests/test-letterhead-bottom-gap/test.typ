/// test-letterhead-bottom-gap
///
/// Synopsis:
/// Test case that validates the letterloom function correctly applies bottom-gap
/// to control the space between the centered letterhead block and the letter
/// content below it.
///
/// Purpose:
/// Ensures that letterhead.bottom-gap overrides the default par-spacing value
/// used to separate the combined letterhead header (image + sender) from the
/// first letter element (date, recipient). Applies only to sender-position: center.
///
/// Test Scenarios:
/// - Scenario 1: bottom-gap: 5mm — tighter than the default par-spacing
/// - Scenario 2: bottom-gap: 20mm — significantly larger gap
///
/// Expected Behavior:
/// The space below the sender block visibly differs between scenarios. Date and
/// recipient start further down in scenario 2 than in scenario 1.
///
/// Validation:
/// Visual regression: output must match reference images.
#import "/src/lib.typ": *

// Scenario 1: small bottom-gap
#show: letterloom.with(
  letterhead: (
    file: read("/docs/images/letterhead.png", encoding: none),
    width: 120mm,
    sender-position: center,
    bottom-gap: 5mm,
  ),
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
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees")],
  closing: "Sincerely yours,",
  signatures: ((name: "Lord Albus Dimbleby"),),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees.

Thank you kindly.

// Scenario 2: large bottom-gap
#show: letterloom.with(
  letterhead: (
    file: read("/docs/images/letterhead.png", encoding: none),
    width: 120mm,
    sender-position: center,
    bottom-gap: 20mm,
  ),
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
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees")],
  closing: "Sincerely yours,",
  signatures: ((name: "Lord Albus Dimbleby"),),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees.

Thank you kindly.

/// test-enclosures-page-inset
///
/// Synopsis:
/// Test case that validates the letterloom function correctly applies page-inset
/// to the pages of an attached enclosure file.
///
/// Purpose:
/// Ensures that construct-enclosures normalises both a uniform length and a
/// per-side dictionary into the correct four-side margin for the attached page,
/// and that unspecified sides default to 0mm rather than inheriting the letter
/// page margins.
///
/// Test Scenarios:
/// - Scenario 1: uniform page-inset: 15mm applied to a JPEG attachment
/// - Scenario 2: per-side page-inset dictionary with top: 25mm, rest: 10mm
///
/// Expected Behavior:
/// Scenario 1: the attached image has equal 15mm margins on all sides.
/// Scenario 2: the attached image has a 25mm top margin and 10mm on the other
/// three sides.
///
/// Validation:
/// Visual regression: output must match reference images across both pages of
/// each scenario (letter page + attachment page).
#import "/src/lib.typ": *

// Scenario 1: uniform page-inset
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
  enclosures: (
    (
      description: "Photograph of storm damaged Oak trees.",
      file: read("/docs/enclosures/storm-damaged-oak-tree.jpg", encoding: none),
      page-inset: 15mm,
    ),
  ),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees. Please find a photograph of the storm damage enclosed herewith.

Thank you kindly.

// Scenario 2: per-side page-inset dictionary
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
  enclosures: (
    (
      description: "Photograph of storm damaged Oak trees.",
      file: read("/docs/enclosures/storm-damaged-oak-tree.jpg", encoding: none),
      page-inset: (top: 25mm, rest: 10mm),
    ),
  ),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees. Please find a photograph of the storm damage enclosed herewith.

Thank you kindly.

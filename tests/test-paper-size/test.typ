/// test-paper-size
///
/// Synopsis:
/// Test case that validates the letterloom function correctly renders letters
/// on non-default paper sizes.
///
/// Purpose:
/// Ensures that the paper-size parameter is passed through to Typst's page
/// geometry correctly, producing pages with the expected physical dimensions.
/// The reference images will have visibly different heights and widths from
/// the default A4 tests.
///
/// Test Scenarios:
/// - Scenario 1: paper-size: "us-letter" (215.9 × 279.4 mm — wider and shorter than A4)
/// - Scenario 2: paper-size: "a5" (148 × 210 mm — half the height of A4)
///
/// Expected Behavior:
/// Each scenario produces a page with the correct physical dimensions for its
/// paper size. Letter content reflows to fit the available text width.
///
/// Validation:
/// Visual regression: output must match reference images. Reference image
/// dimensions will differ from A4 tests.
#import "/src/lib.typ": *

// Scenario 1: US Letter
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
  paper-size: "us-letter",
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week.

Thank you kindly.

// Scenario 2: A5
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
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees")],
  closing: "Sincerely yours,",
  signatures: (
    (name: "Lord Albus Dimbleby"),
  ),
  paper-size: "a5",
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time.

Thank you kindly.

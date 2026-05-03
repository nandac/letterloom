/// test-letterhead-height
///
/// Synopsis:
/// Test case that validates the letterloom function correctly applies an
/// explicit height to the letterhead image, overriding proportional scaling.
///
/// Purpose:
/// Ensures that letterhead.height constrains the image to a fixed height
/// regardless of the image's natural aspect ratio. At full width, the natural
/// height of the test image would be taller; with height: 20mm the image is
/// cropped to exactly that height (Typst image fit: "cover" default).
///
/// Test Scenarios:
/// - Scenario 1: height: 20mm with default full width — short fixed-height banner
/// - Scenario 2: height: 20mm with width: 60% — fixed height, partial width
///
/// Expected Behavior:
/// The letterhead zone is exactly 20mm tall in both scenarios. Content starts
/// below the fixed-height image in the normal flow.
///
/// Validation:
/// Visual regression: output must match reference images.
#import "/src/lib.typ": *

// Scenario 1: fixed height, full width
#show: letterloom.with(
  letterhead: (
    file: read("/docs/images/letterhead.png", encoding: none),
    height: 20mm,
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

// Scenario 2: fixed height, partial width
#show: letterloom.with(
  letterhead: (
    file: read("/docs/images/letterhead.png", encoding: none),
    width: 60%,
    height: 20mm,
    image-alignment: center,
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

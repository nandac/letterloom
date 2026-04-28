/// test-letterhead-alignment
///
/// Synopsis:
/// Rendering test that validates letterhead width, margin, and alignment
/// options work correctly together.
///
/// Purpose:
/// Ensures that a partial-width letterhead is correctly positioned using
/// center alignment within the margin-inset area, and that the compensating
/// vertical space accounts for the margin correctly.
///
/// Test Scenario:
/// - letterhead.width: 60% (partial width, narrower than page)
/// - letterhead.margin: (top: 5mm, bottom: 3mm, rest: 8mm)
/// - letterhead.alignment: center
///
/// Expected Behavior:
/// The letterhead image is centered horizontally within the area defined by
/// the page width minus the letterhead margin, inset 5mm from the top and
/// 8mm from each side. Letter content begins below the image with correct
/// vertical clearance.
///
/// Validation:
/// Output is compared to reference images to detect regressions in
/// partial-width placement, margin inset, and center alignment.
#import "/src/lib.typ": *

#show: letterloom.with(
  letterhead: (
    file: read("/docs/images/letterhead.png", encoding: none),
    width: 60%,
    margin: (top: 5mm, bottom: 3mm, rest: 8mm),
    alignment: center,
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

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678, to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.

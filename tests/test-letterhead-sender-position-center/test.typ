/// test-letterhead-sender-position-center
///
/// Synopsis:
/// Rendering test that validates the sender-position: center layout, where the
/// letterhead image is centered and the sender address is placed below it also
/// centered, forming a single decorative header block.
///
/// Purpose:
/// Ensures that construct-letterhead correctly stacks the image and sender when
/// sender-position is center, that bottom-gap controls the space between the
/// sender and the letter content below, and that date-alignment and
/// from-alignment are decoupled from the centered sender block.
///
/// Test Scenario:
/// - letterhead.file is a valid PNG loaded via read()
/// - letterhead.width: 80mm (partial-width centered image)
/// - letterhead.sender-position: center
/// - letterhead.image-inset: (top: 5mm, rest: 5mm)
/// - letterhead.bottom-gap: 8mm (explicit gap between sender and content)
///
/// Expected Behavior:
/// - Page 1: letterhead image centered; sender name and address centered
///   directly below the image with 8mm gap before letter content begins;
///   date, recipient, and body flow normally below the header block
/// - Page 2+: no letterhead; normal margins apply throughout
///
/// Validation:
/// Output is compared to reference images to detect regressions in centered
/// stacking, bottom-gap spacing, and decoupled date/sender alignment.
#import "/src/lib.typ": *

#show: letterloom.with(
  letterhead: (
    file: read("/docs/images/letterhead-small.png", encoding: none),
    width: 80mm,
    sender-position: center,
    image-inset: (top: 5mm, rest: 5mm),
    bottom-gap: 8mm,
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

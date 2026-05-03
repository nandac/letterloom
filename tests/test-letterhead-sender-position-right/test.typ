/// test-letterhead-sender-position-right
///
/// Synopsis:
/// Rendering test that validates the sender-position: right layout, where the
/// letterhead image sits flush against the left page edge and the sender address
/// fills the remaining column to the right, vertically centred relative to the
/// image (default sender-valign: horizon).
///
/// Purpose:
/// Ensures that construct-letterhead correctly splits the header row when
/// sender-position is right, placing the image in a left-bounded column of the
/// specified width and the sender in the remaining right-side space, centred
/// vertically against the image height.
///
/// Test Scenario:
/// - letterhead.file is a valid PNG loaded via read()
/// - letterhead.width: 65mm (sets the column split)
/// - letterhead.sender-position: right
/// - letterhead.image-inset: (top: 10mm, rest: 5mm)
/// - letterhead.sender-valign: horizon (default)
///
/// Expected Behavior:
/// - Page 1: letterhead image occupies the left 65mm; sender name and address
///   appear to the right, vertically centred relative to the image; letter
///   content (date, recipient, body) flows below both
/// - Page 2+: no letterhead; normal margins apply throughout
///
/// Validation:
/// Output is compared to reference images to detect regressions in the
/// side-by-side column layout and sender vertical alignment.
#import "/src/lib.typ": *

#show: letterloom.with(
  letterhead: (
    file: read("/docs/images/letterhead-small.png", encoding: none),
    width: 65mm,
    sender-position: right,
    image-inset: (top: 10mm, rest: 5mm),
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

/// test-letterhead-sender-position-left-bottom
///
/// Synopsis:
/// Rendering test that validates the sender-position: left, sender-valign: bottom
/// layout, where the sender address is aligned to the bottom edge of the
/// letterhead image.
///
/// Purpose:
/// Ensures that sender-valign: bottom correctly places the sender block flush with
/// the bottom of the image when sender-position is left, rather than the default
/// vertically centred placement.
///
/// Test Scenario:
/// - letterhead.file is a valid PNG loaded via read()
/// - letterhead.width: 65mm (sets the column split)
/// - letterhead.sender-position: left
/// - letterhead.sender-valign: bottom
/// - letterhead.image-inset: (top: 10mm, rest: 5mm)
///
/// Expected Behavior:
/// - Page 1: sender name and address appear on the left, aligned to the bottom
///   edge of the image; letterhead image occupies the right 65mm; letter content
///   (date, recipient, body) flows below both
/// - Page 2+: no letterhead; normal margins apply throughout
///
/// Validation:
/// Output is compared to reference images to detect regressions in
/// bottom-aligned sender placement alongside a left-position letterhead.
#import "/src/lib.typ": *

#show: letterloom.with(
  letterhead: (
    file: read("/docs/images/letterhead-small.png", encoding: none),
    width: 65mm,
    sender-position: left,
    sender-valign: bottom,
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

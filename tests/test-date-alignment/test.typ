/// test-date-alignment
///
/// Synopsis:
/// Test case that validates the letterloom function correctly positions the
/// date field independently from the sender address block using date-alignment.
///
/// Purpose:
/// Ensures that date-alignment controls the horizontal position of the date
/// block separately from from-alignment, and that the measure-based left-edge
/// alignment is bypassed when the two alignment values differ.
///
/// Test Scenario:
/// - from-alignment is right (sender block appears on the right)
/// - date-alignment is left (date appears on the left, independent of sender)
///
/// Expected Behavior:
/// The function successfully generates a letter where the sender address is
/// right-aligned and the date is left-aligned, demonstrating that the two
/// fields are independently positioned.
///
/// Validation:
/// Exercises the date-alignment code path in lib.typ where date-alignment
/// differs from from-alignment, bypassing the width-matching measure logic
/// and using a plain align block instead.
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
  salutation: "Dear Mr Hawthorne,",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  closing: "Sincerely yours,",
  signatures: (
    (name: "Lord Albus Dimbleby"),
    (name: "Lady Abigail Dimbleby"),
    (name: "Sir Austin Dimbleby"),
  ),
  from-alignment: right,
  date-alignment: left,
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678, to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.

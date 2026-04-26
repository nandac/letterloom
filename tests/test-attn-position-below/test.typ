/// test-attn-position-below
///
/// Synopsis:
/// Test case that validates the letterloom function correctly renders the
/// attention line below the recipient's address when attn-position is set
/// to "below".
///
/// Purpose:
/// Ensures that the attention line is placed after the recipient address
/// block when attn-position is "below", complementing the "above" case
/// already covered by test-valid-case.
///
/// Test Scenario:
/// - All required fields are provided with valid data
/// - attn-name is provided with attn-position set to "below"
/// - Attention line should appear after the recipient address
///
/// Expected Behavior:
/// The function successfully generates a properly formatted letter with
/// the attention line rendered below the recipient's address.
///
/// Validation:
/// Ensures that the attn-position "below" path through the layout logic
/// in lib.typ is exercised and produces the correct visual output.
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
  attn-name: "Mr Basil Hawthorne",
  attn-position: "below",
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
  salutation: "Dear Mr Hawthorne,",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  closing: "Sincerely yours,",
  signatures: (
    (
      name: "Lord Albus Dimbleby",
    ),
    (
      name: "Lady Abigail Dimbleby",
    ),
    (
      name: "Sir Austin Dimbleby",
    ),
  ),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678, to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.

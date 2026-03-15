/// test-letterhead
///
/// Synopsis:
/// Test case that validates the letterloom function correctly displays an optional
/// letterhead image at the top of the letter with the specified alignment.
///
/// Purpose:
/// Ensures that when `letterhead` and `letterhead-alignment` are provided, the
/// letterhead appears above the sender block, is aligned as specified (e.g. center),
/// and that vertical space separates it from the rest of the letter.
///
/// Test Scenario:
/// - letterhead is set to an image with explicit width (e.g. 50%) so it fits the page
/// - letterhead-alignment is set to center
/// - All other required and optional fields are provided so the letter renders fully
///
/// Expected Behavior:
/// The letter renders with the letterhead at the top, centered, followed by the
/// sender block and the rest of the letter. Layout is compared against the reference
/// image (ref/*.png).
///
/// Validation:
/// Visual regression: output must match the reference. Ensures letterhead placement,
/// alignment, and spacing remain correct across changes.
///
/// Note:
/// The letterhead parameter accepts any content (e.g. image(...)); specifying a width
/// (e.g. width: 100% or width: 50%) is recommended so the image fits the page.
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
  attn-name: "Mr Hawthorne",
  attn-position: "above",
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
  salutation: "Dear Mr Hawthorne",
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

  letterhead: image("letterhead.png", width: 50%),
  letterhead-alignment: center,

  cc: (
    "Mr Jethro Tull",
  ),
  enclosures: (
    "Provenance of the Oak Trees on the Dimbleby Estate",
  ),
)

We are writing to request you to visit The Dimbleby Estate at the Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678. to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.

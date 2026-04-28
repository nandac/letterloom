/// test-letterhead
///
/// Synopsis:
/// Rendering test that validates the letterhead feature places a full-width
/// image flush with the page edges on the first page only, with content
/// flowing normally beneath it on all pages.
///
/// Purpose:
/// Ensures that construct-letterhead correctly escapes the margin box using
/// negative dx/dy offsets, fills the full page width when no width is
/// specified, and that subsequent pages are unaffected.
///
/// Test Scenario:
/// - letterhead.file is a valid PNG loaded via read()
/// - No width, height, margin, or alignment overrides (all defaults)
/// - Letter body is long enough to overflow onto a second page
///
/// Expected Behavior:
/// - Page 1: letterhead image spans full page width, flush with top and side
///   edges; letter content begins below the image
/// - Page 2+: no letterhead; normal margins apply throughout
///
/// Validation:
/// Output is compared to reference images to detect regressions in placement,
/// sizing, and page-1-only rendering.
#import "/src/lib.typ": *

#show: letterloom.with(
  letterhead: (
    file: read("/docs/images/letterhead.png", encoding: none),
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

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678, to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.

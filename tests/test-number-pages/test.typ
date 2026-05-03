/// test-number-pages
///
/// Synopsis:
/// Test case that validates the letterloom function correctly renders page
/// numbers on pages 2 and beyond when number-pages is true, both with and
/// without a footer.
///
/// Purpose:
/// Ensures that construct-page-numbering produces the correct page counter
/// on multi-page letters and that it coexists correctly with a custom footer.
/// Page 1 must never show a page number regardless of letter length.
///
/// Test Scenarios:
/// - Scenario 1: long letter with number-pages: true and no footer — page
///   numbers appear alone in the footer area from page 2 onwards
/// - Scenario 2: long letter with number-pages: true and a custom footer —
///   footer content and page number are both rendered from page 2 onwards
///
/// Expected Behavior:
/// - Page 1: no page number, no footer separator
/// - Page 2+: page number centered at the bottom; footer items appear above
///   the page number when a footer is also provided
///
/// Validation:
/// Visual regression: output must match reference images across all pages.
#import "/src/lib.typ": *

// Scenario 1: number-pages without footer
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
  number-pages: true,
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future. Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678, to fix an appointment to view the trees and give a quotation for the contemplated work.

The trees in question are a stand of ancient pedunculate oaks (Quercus robur) believed to have been planted in the early eighteenth century. They have been a defining feature of the Cheswick landscape for generations and are considered a heritage asset by the local conservation trust. Their structural integrity is therefore of concern not only to the Dimbleby family but to the wider community.

The storm that passed through the region on the night of 28 December caused visible damage to several of the larger specimens. Two of the oaks have shed significant branches, one of which came to rest across the footpath that crosses the eastern boundary of the estate. A third tree appears to be leaning at an angle that was not observed prior to the storm, suggesting possible root disturbance.

We would ask that your assessment cover at minimum the following: an evaluation of each tree's structural soundness, a recommendation as to which, if any, require immediate remedial work, and a schedule for carrying out that work with minimum disruption to the estate grounds.

We appreciate your prompt attention to this matter and look forward to your earliest reply.

Thank you kindly.

// Scenario 2: number-pages with footer
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
  number-pages: true,
  footer: (
    (
      footer-text: "+44-117-555-5555",
    ),
    (
      footer-text: "dimblebyfamily@dimbleby.org",
      footer-type: "email",
    ),
  ),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future. Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678, to fix an appointment to view the trees and give a quotation for the contemplated work.

The trees in question are a stand of ancient pedunculate oaks (Quercus robur) believed to have been planted in the early eighteenth century. They have been a defining feature of the Cheswick landscape for generations and are considered a heritage asset by the local conservation trust. Their structural integrity is therefore of concern not only to the Dimbleby family but to the wider community.

The storm that passed through the night of 28 December caused visible damage to several of the larger specimens. Two of the oaks have shed significant branches, one of which came to rest across the footpath that crosses the eastern boundary of the estate. A third tree appears to be leaning at an angle that was not observed prior to the storm, suggesting possible root disturbance.

We would ask that your assessment cover at minimum the following: an evaluation of each tree's structural soundness, a recommendation as to which, if any, require immediate remedial work, and a schedule for carrying out that work with minimum disruption to the estate grounds.

We appreciate your prompt attention to this matter and look forward to your earliest reply.

Thank you kindly.

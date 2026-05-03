/// test-par-spacing
///
/// Synopsis:
/// Test case that validates the letterloom function correctly applies custom
/// par-leading and par-spacing values to the letter body.
///
/// Purpose:
/// Ensures that the par-leading and par-spacing parameters are forwarded to
/// Typst's set par rule, producing measurably different line and paragraph
/// rhythm. Both parameters are tested together since their combined effect is
/// most visible in a multi-paragraph body.
///
/// Test Scenarios:
/// - Scenario 1: par-leading: 0.5em, par-spacing: 1.0em — compact rhythm
/// - Scenario 2: par-leading: 1.2em, par-spacing: 3.0em — open, airy rhythm
///
/// Expected Behavior:
/// Scenario 1: lines within each paragraph are tightly spaced; paragraphs
/// are closer together than the default.
/// Scenario 2: lines are noticeably more spread out; a large gap appears
/// between consecutive paragraphs.
///
/// Validation:
/// Visual regression: output must match reference images.
#import "/src/lib.typ": *

// Scenario 1: compact spacing
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
  par-leading: 0.5em,
  par-spacing: 1.0em,
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678, to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.

// Scenario 2: open spacing
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
  par-leading: 1.2em,
  par-spacing: 3.0em,
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678, to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.

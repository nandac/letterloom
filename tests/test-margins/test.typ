/// test-margins
///
/// Synopsis:
/// Test case that validates the letterloom function correctly applies custom
/// page margins in both uniform and per-side dictionary forms.
///
/// Purpose:
/// Ensures that the margins parameter is passed through to Typst's page
/// geometry correctly. A narrower content area and different edge distances
/// should be clearly visible against the default auto margins.
///
/// Test Scenarios:
/// - Scenario 1: uniform margins: 15mm — tighter than the auto default (~2.5 cm)
/// - Scenario 2: per-side dictionary with asymmetric margins
///
/// Expected Behavior:
/// Scenario 1: all four sides have 15mm margins; sender and content blocks
/// are wider than the auto default.
/// Scenario 2: generous top margin, narrow sides — letter content shifts
/// noticeably toward the top and sides of the page.
///
/// Validation:
/// Visual regression: output must match reference images.
#import "/src/lib.typ": *

// Scenario 1: uniform 15mm margins
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
  margins: 15mm,
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week.

Thank you kindly.

// Scenario 2: asymmetric per-side margins
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
  margins: (top: 35mm, bottom: 20mm, left: 12mm, right: 12mm),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week.

Thank you kindly.

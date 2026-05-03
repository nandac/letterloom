/// test-enclosures-attached
///
/// Synopsis:
/// Test case that validates the letterloom function correctly renders an
/// enclosure entry that embeds an external PDF as appended pages.
///
/// Purpose:
/// Ensures that construct-enclosures correctly appends external file pages
/// after the letter body when an enclosure dictionary includes a `file` key.
/// Exercises the pages and margin keys of the enclosure dictionary.
///
/// Test Scenario:
/// - One enclosure with a description and a 3-page PDF file attachment
/// - pages: 3 — all three pages of the PDF are rendered
/// - margin: 10mm — a uniform 10 mm margin is applied to the attachment pages
///
/// Expected Behavior:
/// - Page 1: the letter with the enclosures label and description
/// - Pages 2–4: the three pages of heritage-oak-provenance-statement.pdf,
///   each with 10 mm margins applied
///
/// Validation:
/// Visual regression: output must match reference images across all four pages.
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
  date: "01 January 1970",
  salutation: "Dear Mr Hawthorne,",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  closing: "Sincerely yours,",
  signatures: (
    (name: "Lord Albus Dimbleby"),
  ),
  enclosures: (
    (
      description: "Provenance of the Heritage Oak Trees on the Dimbleby Estate",
      file: read("/docs/enclosures/heritage-oak-provenance-statement.pdf", encoding: none),
      pages: 3,
      margin: 10mm,
    ),
  ),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Please find the provenance statement for the Heritage Oak Trees enclosed herewith for your reference.

Thank you kindly.

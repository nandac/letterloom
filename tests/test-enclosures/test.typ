/// test-enclosures
///
/// Synopsis:
/// Test case that validates the letterloom function correctly renders the
/// enclosures block with description-only entries, multiple entries, and a
/// custom enclosures-label.
///
/// Purpose:
/// Ensures that construct-enclosures correctly formats the enclosure list in
/// all realistic configurations without file attachments.
///
/// Test Scenarios:
/// - Scenario 1: single enclosure with description only, default label
/// - Scenario 2: multiple enclosures with description only, default label
/// - Scenario 3: multiple enclosures with a custom enclosures-label
///
/// Expected Behavior:
/// The enclosures block appears below the cc line (or signatures when cc is
/// absent) in each scenario. Multiple entries are listed on separate lines
/// indented under the label. The custom label replaces the default "encl:".
///
/// Validation:
/// Visual regression: output must match reference images.
#import "/src/lib.typ": *

// Scenario 1: single enclosure, default label
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
    (description: "Provenance of the Heritage Oak Trees on the Dimbleby Estate"),
  ),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week.

Thank you kindly.

// Scenario 2: multiple enclosures, default label
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
    (description: "Provenance of the Heritage Oak Trees on the Dimbleby Estate"),
    (description: "Map of the Dimbleby Estate"),
    (description: "Survey Report by Farnsworth Arboricultural Services"),
  ),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week.

Thank you kindly.

// Scenario 3: multiple enclosures, custom label
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
    (description: "Provenance of the Heritage Oak Trees on the Dimbleby Estate"),
    (description: "Map of the Dimbleby Estate"),
  ),
  enclosures-label: "Attachments:",
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week.

Thank you kindly.

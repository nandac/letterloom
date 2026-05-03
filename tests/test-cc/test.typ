/// test-cc
///
/// Synopsis:
/// Test case that validates the letterloom function correctly renders the cc
/// block with a single recipient, multiple recipients, and a custom cc-label.
///
/// Purpose:
/// Ensures that construct-cc correctly formats the cc block in all realistic
/// configurations: one name, several names, and a relabelled cc line.
///
/// Test Scenarios:
/// - Scenario 1: single cc recipient with default label ("cc:")
/// - Scenario 2: multiple cc recipients with default label
/// - Scenario 3: multiple cc recipients with a custom cc-label
///
/// Expected Behavior:
/// The cc block appears below the signatures in each scenario. Multiple
/// recipients are listed on separate lines indented under the label. The
/// custom label replaces the default "cc:" text.
///
/// Validation:
/// Visual regression: output must match reference images.
#import "/src/lib.typ": *

// Scenario 1: single cc recipient
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
  cc: (
    "Mr Jethro Tull",
  ),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week.

Thank you kindly.

// Scenario 2: multiple cc recipients with default label
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
  cc: (
    "Mr Jethro Tull",
    "Ms Eleanor Whitmore",
    "Dr Reginald Farnsworth",
  ),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week.

Thank you kindly.

// Scenario 3: multiple cc recipients with custom cc-label
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
  cc: (
    "Mr Jethro Tull",
    "Ms Eleanor Whitmore",
  ),
  cc-label: "Copy to:",
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week.

Thank you kindly.

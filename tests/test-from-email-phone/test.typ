/// test-from-email-phone
///
/// Synopsis:
/// Test case that validates the letterloom function correctly renders the
/// sender's email and phone number below the sender address.
///
/// Purpose:
/// Ensures that from-email and from-phone are added as sender lines in the
/// normal-flow header and in a side-by-side letterhead, and that the date
/// width matching includes them.
///
/// Test Scenarios:
/// - Scenario 1: string email and phone below the address
/// - Scenario 2: content email, no phone, with sender-position: right
/// - Scenario 3: email and phone without an address
///
/// Expected Behavior:
/// A string email renders as a monospace mailto: link. A content email renders
/// as given. The phone number follows the email on its own line.
#import "/src/lib.typ": *

// Scenario 1: string email and phone below the address
#show: letterloom.with(
  from-name: "The Dimbleby Family",
  from-address: [
    The Dimbleby Estate \
    Cheswick Village \
    Middle Upton \
    Bristol BS16 1GU
  ],
  from-email: "estate@dimbleby.org",
  from-phone: "+44 117 496 0000",
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
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week.

Thank you kindly.

// Scenario 2: content email, no phone, with sender-position: right
#show: letterloom.with(
  from-name: "The Dimbleby Family",
  from-address: [
    The Dimbleby Estate \
    Cheswick Village \
    Middle Upton \
    Bristol BS16 1GU
  ],
  from-email: link("mailto:estate@dimbleby.org")[estate\@dimbleby.org],
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
  letterhead: (
    file: read("/docs/images/letterhead-small.png", encoding: none),
    width: 65mm,
    sender-position: right,
    image-inset: (top: 10mm, rest: 5mm),
  ),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week.

Thank you kindly.

// Scenario 3: email and phone without an address
#show: letterloom.with(
  from-name: "The Dimbleby Family",
  from-email: "estate@dimbleby.org",
  from-phone: "+44 117 496 0000",
  required-fields: ("from-name", "to-name", "to-address", "date", "salutation", "subject", "closing", "signatures"),
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
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week.

Thank you kindly.

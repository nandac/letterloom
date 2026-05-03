/// test-single-signature-alignment
///
/// Synopsis:
/// Test case that validates the letterloom function properly handles signature
/// alignment parameters by testing various alignment values and signature configurations.
///
/// Purpose:
/// Validates that the letterloom function correctly processes signature alignment
/// with different signature counts and alignment values.
///
/// Test Scenarios:
/// 1. Single signature (Lord Albus Dimbleby), signature-alignment: center
/// 2. Single signature (Lord Albus Dimbleby), signature-alignment: left
/// 3. Single signature (Lord Albus Dimbleby), signature-alignment: right
/// 4. Single signature (Sir Austin Dimbleby), signature-alignment: center
/// 5. Three signatures, signature-alignment: center (alignment ignored for multiple)
/// 6. Two signatures, signature-alignment: center (alignment ignored for multiple)
/// 7. Invalid signature-alignment type (string "left" instead of alignment value)
///
/// Expected Behavior:
/// Scenarios 1–6 produce visual output compared against reference images.
/// Scenario 7 panics with an error message indicating the type mismatch.
///
/// Expected Errors:
/// - "signature-alignment must be a valid alignment type." - when a string is passed
///
/// Validation:
/// Ensures signature-alignment is applied correctly for single signatures across
/// all three alignment values, that it is correctly ignored for multiple signatures,
/// and that passing a string instead of a Typst alignment value is rejected.
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
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
  salutation: "Dear Mr Hawthorne",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  closing: "Sincerely yours,",
  signatures: (
    (
      name: "Sir Austin Dimbleby",
    ),
  ),
  signature-alignment: center,
)

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
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
  salutation: "Dear Mr Hawthorne",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  closing: "Sincerely yours,",
  signatures: (
    (
      name: "Sir Austin Dimbleby",
    ),
  ),
  signature-alignment: left,
)

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
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
  salutation: "Dear Mr Hawthorne",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  closing: "Sincerely yours,",
  signatures: (
    (
      name: "Sir Austin Dimbleby",
    ),
  ),
  signature-alignment: right,
)

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
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
  salutation: "Dear Mr Hawthorne",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  closing: "Sincerely yours,",
  signatures: (
    (
      name: "Sir Austin Dimbleby",
    ),
  ),
  signature-alignment: center,
)

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
  signature-alignment: center,
)

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
  ),
  signature-alignment: center,
)

#assert.eq(
  catch(() => letterloom(
    none,
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
    date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
    salutation: "Dear Mr Hawthorne",
    subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
    closing: "Sincerely yours,",
    signatures: (
      (
        name: "Lord Albus Dimbleby",
      ),
    ),
    signature-alignment: "left",
  )),
  "panicked with: \"signature-alignment must be a valid alignment type.\"",
)

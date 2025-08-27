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
/// Test Scenario:
/// - Single signature with center alignment
/// - Single signature with left alignment
/// - Single signature with right alignment
/// - Multiple signatures with center alignment (alignment is ignored)
/// - Invalid signature-alignment type (string instead of alignment)
///
/// Expected Behavior:
/// The function should successfully generate properly formatted letters with
/// correctly aligned signatures for valid alignment values, and panic with
/// appropriate error messages for invalid alignment types.
///
/// Validation:
/// Ensures that the signature alignment system works correctly for both
/// single and multiple signatures with different alignment values.
/// Tests both successful cases and error handling for invalid types.
///
/// Note:
/// This test validates that the signature-alignment parameter correctly
/// controls the positioning of signatures in the letter layout.
/// It ensures proper alignment behavior for various signature configurations.
#import "/src/lib.typ": *

#show: letterloom.with(
  from-name: "The Dimbleby Family",
  from-address: [
    The Lodge \
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
      name: "Sir Austin Dimbleby"
    )
  ),
  signature-alignment: center
)

#show: letterloom.with(
  from-name: "The Dimbleby Family",
  from-address: [
    The Lodge \
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
      name: "Sir Austin Dimbleby"
    )
  ),
  signature-alignment: left
)

#show: letterloom.with(
  from-name: "The Dimbleby Family",
  from-address: [
    The Lodge \
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
      name: "Sir Austin Dimbleby"
    )
  ),
  signature-alignment: right
)

#show: letterloom.with(
  from-name: "The Dimbleby Family",
  from-address: [
    The Lodge \
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
      name: "Sir Austin Dimbleby"
    )
  ),
  signature-alignment: center
)

#show: letterloom.with(
  from-name: "The Dimbleby Family",
  from-address: [
    The Lodge \
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
      name: "Lord Albus Dimbleby"
    ),
    (
      name: "Lady Abigail Dimbleby"
    ),
    (
      name: "Sir Austin Dimbleby"
    )
  ),
  signature-alignment: center
)

#show: letterloom.with(
  from-name: "The Dimbleby Family",
  from-address: [
    The Lodge \
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
      name: "Lord Albus Dimbleby"
    ),
    (
      name: "Lady Abigail Dimbleby"
    ),
  ),
  signature-alignment: center
)

#assert.eq(
  catch(() => letterloom(
    none,
    from-name: "The Dimbleby Family",
    from-address: [
      The Lodge \
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
        name: "Lord Albus Dimbleby"
      ),
    ),
    signature-alignment: "left",
  )),
  "panicked with: \"signature-alignment must be a valid alignment type.\""
)

/// test-invalid-cc
///
/// Synopsis:
/// Test case where the cc does not contain strings or content blocks.
///
/// Test: Invalid CC Types
///
/// Purpose:
/// Validates that the letterloom function properly handles cases where
/// cc items contain invalid data types instead of strings or content blocks.
///
/// Test Scenario:
/// cc array contains mixed valid and invalid types:
/// - Valid string: "cc one"
/// - Invalid number: calc.ceil(3.14)
/// - Invalid none: none
/// - Invalid empty tuple: ()
///
/// Expected Behavior:
/// The function should panic with a clear error message indicating that
/// cc items must be strings or content blocks.
///
/// Expected Error:
/// "panicked with: \"cc item must be a string or content block.\""
///
/// Validation:
/// Ensures that the validation system correctly identifies type mismatches
/// in cc data and provides appropriate error feedback.
///
#import "/src/lib.typ": *

#assert.eq(
  catch(() => letterloom(
    none,
    from: (
      name: "The Dimbleby Family",
      address: [The Lodge \
                Cheswick Village \
                Middle Upton \
                Bristol BS16 1GU]
    ),
    to: (
      name: "Evergreen Tree Surgeons",
      address: [Midtown Lane \
                Cheswick Village \
                Stoke Gifford \
                Bristol BS16 1GU]
    ),
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
    cc: (
      "enclosure one",
      calc.ceil(3.14),
      none,
      ()
    )
  )),
  "panicked with: \"cc item must be a string or content block.\""
)

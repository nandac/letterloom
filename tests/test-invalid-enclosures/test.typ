// test-enclosures
///
/// Synopsis:
/// Test case where the enclosures are do not contain strings or content blocks.
///
/// Test: Invalid Enclosure Types
///
/// Purpose:
/// Validates that the letterloom function properly handles cases where
/// enclosure items contain invalid data types instead of strings or content blocks.
///
/// Test Scenario:
/// Enclosures array contains mixed valid and invalid types:
/// - Valid string: "enclosure one"
/// - Invalid number: calc.ceil(3.14)
/// - Invalid none: none
/// - Invalid empty tuple: ()
///
/// Expected Behavior:
/// The function should panic with a clear error message indicating that
/// enclosures must be strings or content blocks.
///
/// Expected Error:
/// "panicked with: \"enclosure must be a string or content block.\""
///
/// Validation:
/// Ensures that the validation system correctly identifies type mismatches
/// in enclosure data and provides appropriate error feedback.
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
    enclosures: (
      "enclosure one",
      calc.ceil(3.14),
      none,
      ()
    )
  )),
  "panicked with: \"enclosure must be a string or content block.\""
)

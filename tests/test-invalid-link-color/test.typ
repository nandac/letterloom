/// test-invalid-link-color
///
/// Synopsis:
/// Test case where the link-color parameter contains invalid data types instead of valid color values.
///
/// Purpose:
/// Validates that the letterloom function properly handles cases where
/// link-color parameters contain invalid data types instead of valid color values.
///
/// Test Scenario:
/// Tests link-color parameters with invalid string values:
/// - link-color: "left" (should be a color, not "left")
///
/// Expected Behavior:
/// The function should panic with a clear error message indicating that
/// link-color parameters must be of valid color types.
///
/// Expected Error:
/// "panicked with: \"link-color must be of a valid color type.\""
///
/// Validation:
/// Ensures that the validation system correctly identifies type mismatches
/// in link-color parameters and provides appropriate error feedback.
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
    link-color: "left"
  )),
  "panicked with: \"link-color must be of a valid color type.\""
)

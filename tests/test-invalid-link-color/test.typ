/// test-invalid-link-color
///
/// Synopsis:
/// Test case that validates the letterloom function properly handles invalid
/// link-color parameters by testing type validation for color values.
///
/// Purpose:
/// Ensures that the validation system correctly identifies and reports errors
/// when link-color parameters contain invalid data types instead of valid
/// color values.
///
/// Test Scenarios:
/// - link-color field has invalid type (string "left" instead of valid color)
///
/// Expected Behavior:
/// The function should panic with clear error messages indicating that
/// link-color parameters must be of valid color types.
///
/// Expected Errors:
/// - "link-color must be a valid color type." - when link-color is string instead of color
///
/// Validation:
/// Ensures that the validation system correctly identifies type mismatches
/// in link-color parameters and provides appropriate error feedback.
/// Tests type validation by rejecting invalid string values that are not colors.
///
/// Note:
/// This test validates that the link-color field, which is optional, must be
/// properly formatted when provided. It ensures type safety by requiring
/// valid Typst color values (blue, red, rgb(0,0,0), etc.) rather than string representations.
#import "/src/lib.typ": *

#assert.eq(
  catch(() => letterloom(
    none,
    from-name: "The Dimbleby Family",
    from-address: [The Lodge \
                Cheswick Village \
                Middle Upton \
                Bristol BS16 1GU],
    to-name: "Evergreen Tree Surgeons",
    to-address: [Midtown Lane \
                Cheswick Village \
                Stoke Gifford \
                Bristol BS16 1GU],
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
    link-color: "left",
  )),
  "panicked with: \"link-color must be a valid color type.\""
)

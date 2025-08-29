/// test-invalid-alignment
///
/// Synopsis:
/// Test case that validates the letterloom function properly handles invalid
/// alignment parameters by testing type validation for alignment values.
///
/// Purpose:
/// Ensures that the validation system correctly identifies and reports errors
/// when alignment parameters contain invalid data types instead of valid
/// alignment values.
///
/// Test Scenarios:
/// Tests two alignment parameters with invalid string values:
/// - from-alignment: "left" (should be left, not "left")
/// - footnote-alignment: "left" (should be left, not "left")
///
/// Expected Behavior:
/// The function should panic with clear error messages indicating that
/// alignment parameters must be of valid alignment types.
///
/// Expected Errors:
/// - "from-alignment must be a valid alignment type." - when from-alignment is string instead of alignment
/// - "footnote-alignment must be a valid alignment type." - when footnote-alignment is string instead of alignment
///
/// Validation:
/// Ensures that the validation system correctly identifies type mismatches
/// in alignment parameters and provides appropriate error feedback.
///
/// Note:
/// This test validates that alignment parameters must be proper Typst alignment
/// values (left, right, center, etc.) rather than string representations.
#import "/src/lib.typ": *

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
        name: "Lord Albus Dimbleby",
      ),
      (
        name: "Lady Abigail Dimbleby",
      ),
      (
        name: "Sir Austin Dimbleby",
      ),
    ),
    from-alignment: "left",
  )),
  "panicked with: \"from-alignment must be a valid alignment type.\"",
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
        name: "Lord Albus Dimbleby",
      ),
      (
        name: "Lady Abigail Dimbleby",
      ),
      (
        name: "Sir Austin Dimbleby",
      ),
    ),
    footnote-alignment: "left",
  )),
  "panicked with: \"footnote-alignment must be a valid alignment type.\"",
)

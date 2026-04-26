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
/// Tests alignment parameters with invalid string values (must be Typst alignment, not string):
/// - from-alignment: "left"
/// - footnote-alignment: "left"
///
/// Expected Behavior:
/// The function panics with clear error messages indicating that alignment
/// parameters must be of valid alignment types.
///
/// Expected Errors:
/// - "from-alignment must be a valid alignment type." - when from-alignment is string
/// - "footnote-alignment must be a valid alignment type." - when footnote-alignment is string
///
/// Validation:
/// Ensures that the validation system correctly rejects string values for
/// alignment parameters (from-alignment, footnote-alignment, signature-alignment)
/// and requires proper Typst alignment values.
///
/// Note:
/// Alignment parameters must be Typst alignment values (e.g. left, right, center)
/// rather than string representations like "left" or "center".
#import "/src/lib.typ": *

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
    footnote-alignment: "left",
  )),
  "panicked with: \"footnote-alignment must be a valid alignment type.\"",
)

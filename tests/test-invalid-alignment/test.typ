/// test-invalid-alignment
///
/// Purpose:
/// Validates that the letterloom function properly handles cases where
/// alignment parameters contain invalid data types instead of valid alignment values.
///
/// Test Scenario:
/// Tests two alignment parameters with invalid string values:
/// - from-alignment: "left" (should be left, not "left")
/// - footnote-alignment: "left" (should be left, not "left")
///
/// Expected Behavior:
/// The function should panic with a clear error message indicating that
/// alignment parameters must be of valid alignment types.
///
/// Expected Error:
/// "panicked with: \"from-alignment must be of a valid alignment type.\""
/// "panicked with: \"footnote-alignment must be of a valid alignment type.\""
///
/// Validation:
/// Ensures that the validation system correctly identifies type mismatches
/// in alignment parameters and provides appropriate error feedback.
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
    from-alignment: "left"
  )),
  "panicked with: \"from-alignment must be of a valid alignment type.\""
)

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
    footnote-alignment: "left"
  )),
  "panicked with: \"footnote-alignment must be of a valid alignment type.\""
)

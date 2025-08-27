/// test-invalid-salutation
///
/// Synopsis:
/// Test case that validates the letterloom function properly handles invalid
/// salutation parameters by testing type validation and content validation
/// for the `salutation` field.
///
/// Purpose:
/// Ensures that the validation system correctly identifies and reports errors
/// when the salutation field is missing, empty, or contains invalid data types.
///
/// Test Scenarios:
/// - Missing salutation field (not provided in function call)
/// - salutation field is empty string
/// - salutation field is empty content block
/// - salutation field has invalid type (number instead of string/content)
///
/// Expected Behavior:
/// The function should panic with clear error messages indicating the specific
/// validation failure for each test case.
///
/// Expected Errors:
/// - "salutation is missing." - when salutation field is not provided
/// - "salutation is empty." - when salutation field is empty string
/// - "salutation is empty." - when salutation field is empty content block
/// - "salutation must be a string or content block." - when salutation field has wrong type
///
/// Validation:
/// Ensures that the salutation validation system properly enforces the requirement
/// that salutation information must be a valid, non-empty string or content block.
/// Tests both presence validation (missing field) and content validation (empty values, wrong types).
///
/// Note:
/// This test validates that the salutation field, which is required for all letters, must be
/// properly formatted and non-empty. It ensures type safety and content validation
/// for the salutation parameter.
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
  )),
  "panicked with: \"salutation is missing.\""
)

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
    salutation: "",
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
  )),
  "panicked with: \"salutation is empty.\""
)

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
    salutation: [],
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
  )),
  "panicked with: \"salutation is empty.\""
)

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
    salutation: 3,
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
  )),
  "panicked with: \"salutation must be a string or content block.\""
)

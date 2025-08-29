/// test-invalid-subject
///
/// Synopsis:
/// Test case that validates the letterloom function properly handles invalid
/// subject parameters by testing type validation and content validation
/// for the `subject` field.
///
/// Purpose:
/// Ensures that the validation system correctly identifies and reports errors
/// when the subject field is missing, empty, or contains invalid data types.
///
/// Test Scenarios:
/// - Missing subject field (not provided in function call)
/// - subject field is empty string
/// - subject field is empty content block
/// - subject field has invalid type (number instead of string/content)
///
/// Expected Behavior:
/// The function should panic with clear error messages indicating the specific
/// validation failure for each test case.
///
/// Expected Errors:
/// - "subject is missing." - when subject field is not provided
/// - "subject is empty." - when subject field is empty string
/// - "subject is empty." - when subject field is empty content block
/// - "subject must be a string or content block." - when subject field has wrong type
///
/// Validation:
/// Ensures that the subject validation system properly enforces the requirement
/// that subject information must be a valid, non-empty string or content block.
/// Tests both presence validation (missing field) and content validation (empty values, wrong types).
///
/// Note:
/// This test validates that the subject field, which is required for all letters, must be
/// properly formatted and non-empty. It ensures type safety and content validation
/// for the subject parameter.
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
      )
    ),
  )),
  "panicked with: \"subject is missing.\"",
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
    salutation: "Dear Mr Hawthorne",
    subject: "",
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
      )
    ),
  )),
  "panicked with: \"subject is empty.\"",
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
    salutation: "Dear Mr Hawthorne",
    subject: [],
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
  )),
  "panicked with: \"subject is empty.\"",
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
    salutation: "Dear Mr Hawthorne",
    subject: 3,
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
  )),
  "panicked with: \"subject must be a string or content block.\"",
)

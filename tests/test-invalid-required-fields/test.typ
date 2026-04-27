/// test-invalid-required-fields
///
/// Synopsis:
/// Test case that validates the letterloom function properly handles invalid
/// required-fields parameters by testing type validation and content validation.
///
/// Purpose:
/// Ensures that the validation system correctly identifies and reports errors
/// when required-fields is malformed or contains unrecognized field names.
///
/// Test Scenarios:
/// - required-fields is a string instead of an array
/// - required-fields contains a non-string entry
/// - required-fields contains an unrecognized field name
///
/// Expected Behavior:
/// The function should panic with clear error messages indicating the specific
/// validation failure for each test case.
///
/// Expected Errors:
/// - "required-fields must be an array of field names." - when required-fields is not an array
/// - "required-fields entry '1' must be a string." - when an entry is not a string
/// - "'invalid-field' is not a valid required field name." - when a field name is unrecognized
///
/// Validation:
/// Ensures that the required-fields configuration is validated before any field
/// validation occurs, catching misconfiguration early with clear error messages.
#import "/src/lib.typ": *

#assert.eq(
  catch(() => letterloom(
    none,
    from-name: "The Dimbleby Family",
    from-address: [The Dimbleby Estate \
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
      (name: "Lord Albus Dimbleby"),
      (name: "Lady Abigail Dimbleby"),
      (name: "Sir Austin Dimbleby"),
    ),
    required-fields: "from-name",
  )),
  "panicked with: \"required-fields must be an array of field names.\"",
)

#assert.eq(
  catch(() => letterloom(
    none,
    from-name: "The Dimbleby Family",
    from-address: [The Dimbleby Estate \
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
      (name: "Lord Albus Dimbleby"),
      (name: "Lady Abigail Dimbleby"),
      (name: "Sir Austin Dimbleby"),
    ),
    required-fields: (1, "from-name"),
  )),
  "panicked with: \"required-fields entry '1' must be a string.\"",
)

#assert.eq(
  catch(() => letterloom(
    none,
    from-name: "The Dimbleby Family",
    from-address: [The Dimbleby Estate \
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
      (name: "Lord Albus Dimbleby"),
      (name: "Lady Abigail Dimbleby"),
      (name: "Sir Austin Dimbleby"),
    ),
    required-fields: ("from-name", "invalid-field"),
  )),
  "panicked with: \"'invalid-field' is not a valid required field name.\"",
)

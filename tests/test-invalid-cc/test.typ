/// test-invalid-cc
///
/// Synopsis:
/// Test case that validates the letterloom function properly handles invalid
/// cc parameters by testing type validation and content validation
/// for the `cc` and `cc-label` fields.
///
/// Purpose:
/// Ensures that the validation system correctly identifies and reports errors
/// when cc parameters contain invalid data types, empty values,
/// or invalid content.
///
/// Test Scenarios:
/// - cc field is empty tuple
/// - cc field is empty string
/// - cc field contains invalid types (numbers, none, empty tuples) mixed with valid strings
/// - cc-label field has invalid type (number instead of string/content)
/// - cc-label field is empty string
///
/// Expected Behavior:
/// The function should panic with clear error messages indicating the specific
/// validation failure for each test case.
///
/// Expected Errors:
/// - "cc is empty." - when cc field is empty (tuple or string)
/// - "cc recipient '4' must be a string or content block." - when cc list contains invalid types
/// - "cc-label '4' must be a string or content block." - when cc-label field has wrong type
/// - "cc-label is empty." - when cc-label field is empty
///
/// Validation:
/// Ensures that the cc validation system properly enforces the requirement
/// that cc parameters must be of correct types and contain valid content.
/// Tests both type validation (rejecting numbers, none, empty tuples) and value validation
/// (rejecting empty strings).
///
/// Note:
/// This test validates that the cc and cc-label fields, which are optional, must be
/// properly formatted when provided. It ensures type safety and content validation
/// for cc recipients and cc-label parameters.
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
        name: "Lord Albus Dimbleby",
      ),
      (
        name: "Lady Abigail Dimbleby",
      ),
      (
        name: "Sir Austin Dimbleby",
      ),
    ),
    cc: (),
    cc-label: "cc:",
  )),
  "panicked with: \"cc is empty.\"",
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
    cc: "",
  )),
  "panicked with: \"cc is empty.\"",
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
    cc: (
      "enclosure one",
      calc.ceil(3.14),
      none,
      (),
    ),
  )),
  "panicked with: \"cc recipient '4' must be a string or content block.\"",
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
    cc: "enclosure one",
    cc-label: calc.ceil(3.14),
  )),
  "panicked with: \"cc-label '4' must be a string or content block.\"",
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
    cc: "enclosure one",
    cc-label: "",
  )),
  "panicked with: \"cc-label is empty.\"",
)

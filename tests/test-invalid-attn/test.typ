/// test-invalid-attn
///
/// Synopsis:
/// Test case that validates the letterloom function properly handles invalid
/// attention line parameters by testing type validation and content validation
/// for the `attn-name`, `attn-label`, and `attn-position` fields.
///
/// Purpose:
/// Ensures that the validation system correctly identifies and reports errors
/// when attention line parameters contain invalid data types, empty values,
/// or invalid content.
///
/// Test Scenarios:
/// - attn-name field is empty string
/// - attn-name field has invalid type (empty tuple instead of string/content)
/// - attn-name field has invalid type (number instead of string/content)
/// - attn-label field has invalid type (number instead of string/content)
/// - attn-label field is empty string
/// - attn-position field has invalid value ("north" instead of above/below)
/// - attn-position field is empty string
///
/// Expected Behavior:
/// The function should panic with clear error messages indicating the specific
/// validation failure for each test case.
///
/// Expected Errors:
/// - "attn-name must be a string or content block." - when attn-name has wrong type
/// - "attn-name is empty." - when attn-name field is empty
/// - "attn-label must be a string or content block." - when attn-label field has wrong type
/// - "attn-label is empty." - when attn-label field is empty
/// - "attn-position must be one of above or below." - when attn-position field has invalid value
///
/// Validation:
/// Ensures that the attention line validation system properly enforces the requirement
/// that attention line parameters must be of correct types and contain valid content.
/// Tests both type validation (rejecting numbers, empty tuples) and value validation
/// (rejecting empty strings, invalid position values).
///
/// Note:
/// This test validates that the attention line fields, which are optional, must be
/// properly formatted when provided. It ensures type safety and content validation
/// for attn-name, attn-label, and attn-position parameters.
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
        name: "Lord Albus Dimbleby"
      ),
      (
        name: "Lady Abigail Dimbleby"
      ),
      (
        name: "Sir Austin Dimbleby"
      )
    ),
    attn-name: "",
  )), "panicked with: \"attn-name is empty.\""
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
        name: "Lord Albus Dimbleby"
      ),
      (
        name: "Lady Abigail Dimbleby"
      ),
      (
        name: "Sir Austin Dimbleby"
      )
    ),
    attn-name: (),
  )), "panicked with: \"attn-name must be a string or content block.\""
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
        name: "Lord Albus Dimbleby"
      ),
      (
        name: "Lady Abigail Dimbleby"
      ),
      (
        name: "Sir Austin Dimbleby"
      )
    ),
    attn-name: calc.ceil(3.14)
  )), "panicked with: \"attn-name must be a string or content block.\""
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
        name: "Lord Albus Dimbleby"
      ),
      (
        name: "Lady Abigail Dimbleby"
      ),
      (
        name: "Sir Austin Dimbleby"
      )
    ),
    attn-name: "Mr Basil Hawthorne",
    attn-label: calc.ceil(3.14)
  )), "panicked with: \"attn-label must be a string or content block.\""
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
        name: "Lord Albus Dimbleby"
      ),
      (
        name: "Lady Abigail Dimbleby"
      ),
      (
        name: "Sir Austin Dimbleby"
      )
    ),
    attn-name: "Mr Basil Hawthorne",
    attn-label: "",
  )), "panicked with: \"attn-label is empty.\""
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
        name: "Lord Albus Dimbleby"
      ),
      (
        name: "Lady Abigail Dimbleby"
      ),
      (
        name: "Sir Austin Dimbleby"
      )
    ),
    attn-name: "Mr Basil Hawthorne",
    attn-position: "north",
  )), "panicked with: \"attn-position must be one of above or below.\""
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
        name: "Lord Albus Dimbleby"
      ),
      (
        name: "Lady Abigail Dimbleby"
      ),
      (
        name: "Sir Austin Dimbleby"
      )
    ),
    attn-name: "Mr Basil Hawthorne",
    attn-position: "",
  )), "panicked with: \"attn-position must be one of above or below.\""
)

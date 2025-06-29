/// test-invalid-signatures
///
/// Synopsis:
/// Test case that validates the letterloom function properly handles invalid
/// signature parameters by testing various error conditions for the `signatures` field.
///
/// Purpose:
/// Ensures that the validation system correctly identifies and reports errors
/// when signature data is missing, malformed, or contains invalid content.
///
/// Test Scenarios:
/// - Missing signatures field (not provided in function call)
/// - Signatures provided as strings instead of dictionaries
/// - Signature dictionaries missing the required 'name' field
/// - Signature names with invalid types (number, calculated value, none)
/// - Signature names as empty strings
///
/// Expected Behavior:
/// The function should panic with clear error messages indicating the specific
/// validation failure for each test case.
///
/// Expected Errors:
/// - "signatures are missing." - when signatures field is not provided
/// - "signature 'name' must be a dictionary with a name field and an optional signature field." - when signature is not a dictionary
/// - "signature name is missing." - when name field is not present in signature dictionary
/// - "signature name 'value' must be a string or content block." - when name field has wrong type
/// - "signature name is empty." - when name field is empty
///
/// Validation:
/// Ensures that the signature validation system properly enforces the requirement
/// that signatures must be properly structured dictionaries with valid name fields.
///
/// Note:
/// This test validates that the signatures field, which is required for all letters,
/// must contain properly formatted signature data with valid names.
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
  )),
  "panicked with: \"signatures are missing.\""
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
    signatures: ("Lord Albus Dimbleby", "Lady Abigail Dimbleby", "Sir Austin Dimbleby"),
  )),
  "panicked with: \"signature 'Lord Albus Dimbleby' must be a dictionary with a name field and an optional signature field.\""
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
        title: "Lord Albus Dimbleby"
      ),
      (
        title: "Lady Abigail Dimbleby"
      ),
      (
        title: "Sir Austin Dimbleby"
      )
    ),
  )),
  "panicked with: \"signature name is missing.\""
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
        name: 3
      ),
      (
        name: calc.ceil(3.14)
      ),
      (
        name: none
      )
    ),
  )),
  "panicked with: \"signature name '3' must be a string or content block.\""
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
        name: ""
      ),
      (
        name: ""
      ),
      (
        name: ""
      )
    ),
  )),
  "panicked with: \"signature name is empty.\""
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
        name: []
      ),
      (
        name: []
      ),
      (
        name: []
      )
    ),
  )),
  "panicked with: \"signature name is empty.\""
)

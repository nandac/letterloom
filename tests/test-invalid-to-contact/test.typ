/// test-invalid-to-contact
///
/// Synopsis:
/// Test case that validates the letterloom function properly handles invalid
/// recipient contact parameters by testing type validation and content validation
/// for the `to-name` and `to-address` fields.
///
/// Purpose:
/// Ensures that the validation system correctly identifies and reports errors
/// when the recipient's contact information contains invalid data types, empty values,
/// or missing required fields.
///
/// Test Scenarios:
/// - to-name field is missing (not provided)
/// - to-name field is empty string
/// - to-name field is empty content block
/// - to-name field has invalid type (number instead of string/content)
/// - to-name field has invalid type (none value)
/// - to-name field has invalid type (function result instead of string/content)
/// - to-address field is missing (not provided)
/// - to-address field is empty content block
/// - to-address field has invalid type (number instead of string/content)
/// - to-address field has invalid type (none value)
/// - to-address field has invalid type (function result instead of string/content)
///
/// Expected Behavior:
/// The function should panic with clear, descriptive error messages indicating
/// the specific validation failure for each test case.
///
/// Expected Errors:
/// - "to-name is missing." - when to-name field is not provided or is none
/// - "to-name is empty." - when to-name field is empty string or content block
/// - "to-name must be a string or content block." - when to-name field has wrong type
/// - "to-address is missing." - when to-address field is not provided or is none
/// - "to-address is empty." - when to-address field is empty content block
/// - "to-address must be a string or content block." - when to-address field has wrong type
///
/// Validation:
/// Ensures that the contact validation system properly enforces the requirement
/// that recipient information must include a valid, non-empty name field and a valid,
/// non-empty address content block. Tests both type validation and content validation.
///
/// Note:
/// This test validates that the to-name and to-address fields, which are required,
/// must be properly formatted and non-empty. It ensures type safety and content validation
/// for recipient contact parameters.
#import "/src/lib.typ": *

#assert.eq(
  catch(() => letterloom(
    none,
    from-name: "The Dimbleby Family",
    from-address: [The Lodge \
                Cheswick Village \
                Middle Upton \
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
    )
  )),
  "panicked with: \"to-name is missing.\""
)

#assert.eq(
  catch(() => letterloom(
    none,
    from-name: "The Dimbleby Family",
    from-address: [The Lodge \
                Cheswick Village \
                Middle Upton \
                Bristol BS16 1GU],
    to-name: "",
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
    )
  )),
  "panicked with: \"to-name is empty.\""
)

#assert.eq(
  catch(() => letterloom(
    none,
    from-name: "The Dimbleby Family",
    from-address: [The Lodge \
                Cheswick Village \
                Middle Upton \
                Bristol BS16 1GU],
    to-name: [],
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
    )
  )),
  "panicked with: \"to-name is empty.\""
)

#assert.eq(
  catch(() => letterloom(
    none,
    from-name: "The Dimbleby Family",
    from-address: [The Lodge \
                Cheswick Village \
                Middle Upton \
                Bristol BS16 1GU],
    to-name: 3,
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
    )
  )),
  "panicked with: \"to-name must be a string or content block.\""
)

#assert.eq(
  catch(() => letterloom(
    none,
    from-name: "The Dimbleby Family",
    from-address: [The Lodge \
                Cheswick Village \
                Middle Upton \
                Bristol BS16 1GU],
    to-name: none,
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
    )
  )),
  "panicked with: \"to-name is missing.\""
)


#assert.eq(
  catch(() => letterloom(
    none,
    from-name: "The Dimbleby Family",
    from-address: [The Lodge \
                Cheswick Village \
                Middle Upton \
                Bristol BS16 1GU],
    to-name: calc.ceil(1.2),
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
    )
  )),
  "panicked with: \"to-name must be a string or content block.\""
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
    )
  )),
  "panicked with: \"to-address is missing.\""
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
    to-address: [],
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
    )
  )),
  "panicked with: \"to-address is empty.\""
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
    to-address: 3,
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
    )
  )),
  "panicked with: \"to-address must be a string or content block.\""
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
    to-address: none,
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
    )
  )),
  "panicked with: \"to-address is missing.\""
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
    to-address: calc.ceil(1.2),
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
    )
  )),
  "panicked with: \"to-address must be a string or content block.\""
)

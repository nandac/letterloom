/// test-invalid-enclosures
///
/// Synopsis:
/// Test case that validates the letterloom function properly handles invalid
/// enclosures parameters by testing type validation and content validation
/// for the `enclosures` and `enclosures-label` fields.
///
/// Purpose:
/// Ensures that the validation system correctly identifies and reports errors
/// when enclosures parameters contain invalid data types, empty values,
/// or invalid content.
///
/// Test Scenarios:
/// - enclosures field is empty string
/// - enclosures field is empty tuple
/// - enclosures field has invalid type (number instead of string/content)
/// - enclosures-label field has invalid type (number instead of string/content)
/// - enclosures-label field is empty string
///
/// Expected Behavior:
/// The function should panic with clear error messages indicating the specific
/// validation failure for each test case.
///
/// Expected Errors:
/// - "enclosures are empty." - when enclosures field is empty (string or tuple)
/// - "enclosure '4' must be a string or content block." - when enclosures field has wrong type
/// - "enclosure label '4' must be a string or content block." - when enclosures-label field has wrong type
/// - "enclosure label is empty." - when enclosures-label field is empty
///
/// Validation:
/// Ensures that the enclosures validation system properly enforces the requirement
/// that enclosures parameters must be of correct types and contain valid content.
/// Tests both type validation (rejecting numbers) and value validation (rejecting empty strings).
///
/// Note:
/// This test validates that the enclosures and enclosures-label fields, which are optional, must be
/// properly formatted when provided. It ensures type safety and content validation
/// for enclosures and enclosures-label parameters.
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
        name: "Lord Albus Dimbleby"
      ),
      (
        name: "Lady Abigail Dimbleby"
      ),
      (
        name: "Sir Austin Dimbleby"
      )
    ),
    enclosures: "",
  )),
  "panicked with: \"enclosures are empty.\""
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
        name: "Lord Albus Dimbleby"
      ),
      (
        name: "Lady Abigail Dimbleby"
      ),
      (
        name: "Sir Austin Dimbleby"
      )
    ),
    enclosures: (),
  )),
  "panicked with: \"enclosures are empty.\""
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
        name: "Lord Albus Dimbleby"
      ),
      (
        name: "Lady Abigail Dimbleby"
      ),
      (
        name: "Sir Austin Dimbleby"
      )
    ),
    enclosures: calc.ceil(3.14)
  )),
  "panicked with: \"enclosure '4' must be a string or content block.\""
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
        name: "Lord Albus Dimbleby"
      ),
      (
        name: "Lady Abigail Dimbleby"
      ),
      (
        name: "Sir Austin Dimbleby"
      )
    ),
    enclosures:  "enclosure one",
    enclosures-label: calc.ceil(3.14),
  )),
  "panicked with: \"enclosure label '4' must be a string or content block.\""
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
        name: "Lord Albus Dimbleby"
      ),
      (
        name: "Lady Abigail Dimbleby"
      ),
      (
        name: "Sir Austin Dimbleby"
      )
    ),
    enclosures: "enclosure one",
    enclosures-label: "",
  )),
  "panicked with: \"enclosure label is empty.\""
)

/// test-invalid-enclosures
///
/// Synopsis:
/// Test case that validates the letterloom function properly rejects invalid
/// enclosures parameters (type, content, and structure) for `enclosures` and
/// `enclosures-label`.
///
/// Purpose:
/// Ensures that the validation system correctly identifies and reports errors
/// when enclosures contain invalid data types, empty values, or invalid structure.
///
/// Enclosure format: each item must be a dictionary with:
/// - description (required): string or content
/// - file (optional): bytes loaded via read("path", encoding: none)
/// - pages (optional): integer >= 1
/// - margin (optional): length or dictionary with valid side keys
///
/// Test Scenarios:
/// - enclosures field is empty string or empty tuple
/// - enclosures field has invalid type (number; normalized to single-item list)
/// - enclosure item is missing the required description field
/// - enclosure description has invalid type
/// - enclosure description is empty string
/// - enclosures-label field has invalid type or is empty string
///
/// Expected Behavior:
/// The function panics with clear error messages for each validation failure.
///
/// Expected Errors:
/// - "enclosures are empty." - when enclosures field is empty (string or tuple)
/// - "enclosure must be a dictionary with a description field." - when item has wrong type
/// - "enclosure description is missing." - when dictionary has no description key
/// - "enclosure description '3' must be a string or content block." - when description has invalid type
/// - "enclosure description is empty." - when description is an empty string
/// - "enclosure label '4' must be a string or content block." - when enclosures-label has wrong type
/// - "enclosure label is empty." - when enclosures-label is empty
///
/// Validation:
/// Ensures enclosures and enclosures-label are correctly typed and non-empty when provided.
/// Covers both missing and malformed description fields, and invalid label types.
///
/// Note:
/// The enclosures and enclosures-label fields are optional but must be properly
/// formatted when provided.
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
    enclosures: "",
  )),
  "panicked with: \"enclosures are empty.\"",
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
    enclosures: (),
  )),
  "panicked with: \"enclosures are empty.\"",
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
    enclosures: calc.ceil(3.14),
  )),
  "panicked with: \"enclosure must be a dictionary with a description field.\"",
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
    enclosures: (
      (description: "Provenance of the Oak trees.",),
      (title: "Map of the Estate",),
    ),
  )),
  "panicked with: \"enclosure description is missing.\"",
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
    enclosures: ((description: 3),),
  )),
  "panicked with: \"enclosure description '3' must be a string or content block.\"",
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
    enclosures: ((description: ""),),
  )),
  "panicked with: \"enclosure description is empty.\"",
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
    enclosures: ((description: "Provenance of the Oak trees."),),
    enclosures-label: calc.ceil(3.14),
  )),
  "panicked with: \"enclosure label '4' must be a string or content block.\"",
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
    enclosures: ((description: "Provenance of the Oak trees."),),
    enclosures-label: "",
  )),
  "panicked with: \"enclosure label is empty.\"",
)

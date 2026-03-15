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
/// Enclosure format: each item may be a string/content (title only) or an array
/// (title, optional content) where the second element is an optional attachment (e.g. image).
///
/// Test Scenarios:
/// - enclosures field is empty string or empty tuple
/// - enclosures field has invalid type (number; normalized to single-item list)
/// - (title, content) pair has invalid title type or empty title
/// - enclosures-label field has invalid type or is empty string
///
/// Expected Behavior:
/// The function panics with clear error messages for each validation failure.
///
/// Expected Errors:
/// - "enclosures are empty." - when enclosures field is empty (string or tuple)
/// - "enclosure '4' must be a string, content block, or (title, content) pair." - when item has wrong type
/// - "enclosure title '3' must be a string or content block." - when (title, content) pair has invalid title type
/// - "enclosure title is empty." - when (title, content) pair has empty title
/// - "enclosure label '4' must be a string or content block." - when enclosures-label field has wrong type
/// - "enclosure label is empty." - when enclosures-label field is empty
///
/// Validation:
/// Ensures enclosures and enclosures-label are correctly typed and non-empty when provided.
/// Covers both title-only items and (title, optional content) pairs.
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
  "panicked with: \"enclosure '4' must be a string, content block, or (title, content) pair.\"",
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
    enclosures: (("Provenance of the Oak trees.",), (3, none)),
  )),
  "panicked with: \"enclosure title '3' must be a string or content block.\"",
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
    enclosures: (("", none),),
  )),
  "panicked with: \"enclosure title is empty.\"",
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
    enclosures: "enclosure one",
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
    enclosures: "enclosure one",
    enclosures-label: "",
  )),
  "panicked with: \"enclosure label is empty.\"",
)

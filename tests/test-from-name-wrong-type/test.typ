/// test-from-name-wrong-type
///
/// Purpose:
/// Validates that the letterloom function properly handles cases where
/// the sender's name field contains invalid data types.
///
/// Test Scenarios:
/// 1. From name is a number (integer)
/// 2. From name is none/null
/// 3. From name is a calculated value (float)
///
/// Expected Behavior:
/// The function should panic with a clear error message indicating that
/// the sender's name must be a string or content block.
///
/// Expected Error:
/// "panicked with: \"from name must be a string or content block.\""
///
/// Validation:
/// Ensures that the validation system correctly identifies type mismatches
/// in the sender's name field and provides appropriate error feedback.
///
#import "/src/lib.typ": *

#assert.eq(
  catch(() => letterloom(
    none, // value for doc
    from: (
      name: 3,
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
  "panicked with: \"from name must be a string or content block.\""
)

#assert.eq(
  catch(() => letterloom(
    none, // value for doc
    from: (
      name: none,
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
  "panicked with: \"from name must be a string or content block.\""
)

#assert.eq(
  catch(() => letterloom(
    none, // value for doc
    from: (
      name: calc.ceil(1.2),
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
  "panicked with: \"from name must be a string or content block.\""
)

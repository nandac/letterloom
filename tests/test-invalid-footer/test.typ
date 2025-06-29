/// test-invalid-footer
///
/// Synopsis:
/// Test case that validates the letterloom function properly handles invalid
/// footer parameters by testing various error conditions for the `footer` field.
///
/// Purpose:
/// Ensures that the validation system correctly identifies and reports errors
/// when footer data is malformed or contains invalid content.
///
/// Test Scenarios:
/// - Footer element provided as string instead of dictionary
/// - Footer dictionary missing required footer-text field
/// - Footer-text has invalid type (number instead of string/content)
/// - Footer-type has invalid value (not url, email, or string)
///
/// Expected Behavior:
/// The function should panic with clear error messages indicating the specific
/// validation failure for each test case.
///
/// Expected Errors:
/// - "footer element 'value' must be a dictionary." - when footer element is not a dictionary
/// - "footer-text is missing." - when footer-text field is missing
/// - "footer-text 'value' must be a string or content block." - when footer-text has wrong type
/// - "footer-type 'value' must be one of url, email or string." - when footer-type has invalid value
///
/// Validation:
/// Ensures that the footer validation system properly enforces the requirement
/// that footer data must be properly structured with valid content.
///
/// Note:
/// This test validates that the footer field, which is optional, must be properly
/// formatted when provided.
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
    footer: "invalid footer",
  )),
  "panicked with: \"footer element 'invalid footer' must be a dictionary.\""
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
        name: "Lord Albus Dimbleby"
      ),
      (
        name: "Lady Abigail Dimbleby"
      ),
      (
        name: "Sir Austin Dimbleby"
      )
    ),
    footer: (
      (
        footer-type: "url"
      )
    ),
  )),
  "panicked with: \"footer-text is missing.\""
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
        name: "Lord Albus Dimbleby"
      ),
      (
        name: "Lady Abigail Dimbleby"
      ),
      (
        name: "Sir Austin Dimbleby"
      )
    ),
    footer: (
      (
        footer-text: calc.ceil(3.14),
        footer-type: "string"
      )
    ),
  )),
  "panicked with: \"footer-text '4' must be a string or content block.\""
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
        name: "Lord Albus Dimbleby"
      ),
      (
        name: "Lady Abigail Dimbleby"
      ),
      (
        name: "Sir Austin Dimbleby"
      )
    ),
    footer: (
      (
        footer-text: "footer text",
        footer-type: "invalid footer type"
      )
    ),
  )),
  "panicked with: \"footer-type 'invalid footer type' must be one of url, email or string.\""
)

/// Test: Missing To Address Field
///
/// Purpose:
/// Validates that the letterloom function properly handles the case where
/// the recipient's address field is missing from the contact information.
///
/// Test Scenario:
/// The 'to' dictionary contains a name field but is missing
/// the required 'address' field entirely.
///
/// Expected Behavior:
/// The function should panic with a clear error message indicating that
/// the recipient's address is missing.
///
/// Expected Error:
/// "panicked with: \"to address is missing.\""
///
/// Validation:
/// Ensures that the validation system correctly identifies missing
/// required fields in the recipient's contact information and provides
/// appropriate error feedback.
///
#import "/src/lib.typ": *

#assert.eq(
  catch(() => letterloom(
    none, // value for doc
    from: (
      name: "The Dimbleby Family",
      address: [The Lodge \
                Cheswick Village \
                Middle Upton \
                Bristol BS16 1GU]
    ),
    to: (
      name: "Evergreen Tree Surgeons"
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
  "panicked with: \"to address is missing.\""
)

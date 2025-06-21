/// Test: Missing To Field
///
/// Purpose:
/// Validates that the letterloom function properly handles the case where
/// the recipient's contact information (to field) is completely missing.
///
/// Test Scenario:
/// All required fields are provided except the 'to' field
/// The 'to' field is set to none or omitted entirely
///
/// Expected Behavior:
/// The function should panic with a clear error message indicating that
/// the recipient's contact information is missing.
///
/// Expected Error:
/// "panicked with: \"to is missing.\""
///
/// Validation:
/// Ensures that the validation system correctly identifies missing
/// required recipient information and provides appropriate error feedback.
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
  "panicked with: \"to is missing.\""
)

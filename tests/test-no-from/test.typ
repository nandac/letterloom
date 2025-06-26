/// test-no-from
///
/// Synopsis:
/// Test case where the sender's contact information (from field) is completely
/// missing to validate proper error handling for required field validation.
///
/// Purpose:
/// Validates that the letterloom function properly handles the case where
/// the sender's contact information (from field) is completely missing.
///
/// Test Scenario:
/// - All required fields are provided except the 'from' field
/// - The 'from' field is set to none or omitted entirely
///
/// Expected Behavior:
/// The function should panic with a clear error message indicating that
/// the sender's contact information is missing.
///
/// Expected Error:
/// "panicked with: \"from is missing.\""
///
/// Validation:
/// Ensures that the validation system correctly identifies missing
/// required sender information and provides appropriate error feedback.
///
#import "/src/lib.typ": *

#assert.eq(
  catch(() => letterloom(
    none, // value for doc
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
  "panicked with: \"from is missing.\""
)

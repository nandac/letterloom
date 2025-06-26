/// test-no-from-address
///
/// Synopsis:
/// Test case where the sender's address field is missing from the contact
/// information to validate proper error handling for required sub-field validation.
///
/// Purpose:
/// Validates that the letterloom function properly handles the case where
/// the sender's address field is missing from the contact information.
///
/// Test Scenario:
/// The 'from' dictionary contains a name field but is missing
/// the required 'address' field entirely.
///
/// Expected Behavior:
/// The function should panic with a clear error message indicating that
/// the sender's address is missing.
///
/// Expected Error:
/// "panicked with: \"from address is missing.\""
///
/// Validation:
/// Ensures that the validation system correctly identifies missing
/// required fields in the sender's contact information and provides
/// appropriate error feedback.
///
#import "/src/lib.typ": *

#assert.eq(
  catch(() => letterloom(
    none, // value for doc
    from: (
      name: "The Dimbleby Family"
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
  "panicked with: \"from address is missing.\""
)

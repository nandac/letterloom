/// test-from-address-empty
///
/// Synopsis:
/// Test case where the sender's address field is empty or contains no meaningful
/// content to validate proper error handling for empty field validation.
///
/// Purpose:
/// Validates that the letterloom function properly handles cases where
/// the sender's address field is empty or contains no meaningful content.
///
/// Test Scenario:
/// From address is an empty content block ([])
///
/// Expected Behavior:
/// The function should panic with a clear error message indicating that
/// the sender's address is empty.
///
/// Expected Error:
/// "panicked with: \"from address is empty.\""
///
/// Validation:
/// Ensures that the validation system correctly identifies empty content
/// in the sender's address field and provides appropriate error feedback.
///
#import "/src/lib.typ": *

#assert.eq(
  catch(() => letterloom(
    none, // value for doc
    from: (
      name: "The Dimbleby Family",
      address: []
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
  "panicked with: \"from address is empty.\""
)

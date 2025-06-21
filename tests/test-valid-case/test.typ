/// test-valid-case
///
/// Purpose:
/// Validates that the letterloom function correctly processes a complete
/// and valid letter configuration with all required fields properly set.
///
/// Test Scenario:
/// - All required fields are provided with valid data
/// - Sender and recipient information is complete
/// - Date, salutation, subject, and closing are properly formatted
/// - Multiple signatures are included
/// - Letter body content is provided
///
/// Expected Behavior:
/// The function should successfully generate a properly formatted letter
/// without any validation errors or panics.
///
/// Validation:
/// Ensures that the letterloom function can handle a complete, real-world
/// letter scenario and produce the expected output format.
///
/// Note:
/// This test serves as a baseline for all other validation tests and
/// demonstrates the expected usage pattern for the letterloom package.
///
#import "/src/lib.typ": *

#show: letterloom.with(
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
  )
)

We are writing to request you to visit The Lodge at the Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678. to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.

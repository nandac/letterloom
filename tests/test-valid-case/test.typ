/// test-valid-case
///
/// Synopsis:
/// Test case where all required fields are provided with valid data to ensure
/// the letterloom function works correctly with a complete, real-world scenario.
///
/// Purpose:
/// Validates that the letterloom function correctly processes a complete
/// and valid letter configuration with all required fields properly set.
///
/// Test Scenario:
/// - All required fields are provided with valid data
/// - Sender and recipient information is complete (from-name, from-address, to-name, to-address)
/// - Date, salutation, subject, and closing are properly formatted
/// - Multiple signatures are included with proper structure
/// - Optional fields are provided (attn-name, attn-position, cc, enclosures as description dictionaries)
/// - Letter body content is provided
///
/// Expected Behavior:
/// The function successfully generates a properly formatted letter without
/// validation errors or panics. Output is compared to reference images.
///
/// Validation:
/// Ensures that the letterloom function can handle a complete, real-world
/// letter scenario and produce the expected output format. Tests the happy path
/// with all validation rules satisfied.
///
/// Note:
/// This test serves as a baseline for all other validation and layout tests.
/// Optional parameters (e.g. letterhead, enclosures with file attachments)
/// are not exercised here but are supported by the implementation.
#import "/src/lib.typ": *

#show: letterloom.with(
  from-name: "The Dimbleby Family",
  from-address: [
    The Dimbleby Estate \
    Cheswick Village \
    Middle Upton \
    Bristol BS16 1GU
  ],
  to-name: "Evergreen Tree Surgeons",
  to-address: [
    Midtown Lane \
    Cheswick Village \
    Stoke Gifford \
    Bristol BS16 1GU
  ],
  attn-name: "Mr Hawthorne",
  attn-position: "above",
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
  cc: (
    "Mr Jethro Tull",
  ),
  enclosures: (
    (description: "Provenance of the Oak Trees on the Dimbleby Estate"),
  ),
)

We are writing to request you to visit The Dimbleby Estate at the Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678. to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.

/// test-footer
///
/// Synopsis:
/// Test case that validates the letterloom function correctly renders a
/// footer containing a phone number, email address, and URL.
///
/// Purpose:
/// Ensures that the footer construction path in construct-outputs.typ is
/// exercised in a rendered test, covering all three footer-type values:
/// "string", "email", and "url".
///
/// Test Scenario:
/// - All required fields are provided with valid data
/// - Footer contains one entry of each type: string, email, and url
/// - Email and URL entries should be rendered as clickable hyperlinks
///
/// Expected Behavior:
/// The function successfully generates a properly formatted letter with
/// a centred footer displaying the phone number, email, and URL.
///
/// Validation:
/// Ensures that construct-custom-footer correctly renders all three
/// footer-type variants and that the footer appears at the bottom of
/// the letter page.
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
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
  salutation: "Dear Mr Hawthorne,",
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
  footer: (
    (
      footer-text: "+44-117-555-5555",
    ),
    (
      footer-text: "dimblebyfamily@dimbleby.org",
      footer-type: "email",
    ),
    (
      footer-text: "https://dimbleby.org",
      footer-type: "url",
    ),
  ),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678, to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.

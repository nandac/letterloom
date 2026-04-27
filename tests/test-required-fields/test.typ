/// test-required-fields
///
/// Synopsis:
/// Test case that validates the letterloom function correctly renders only
/// the fields specified in required-fields, suppressing all others even when
/// values are provided for them.
///
/// Purpose:
/// Ensures that required-fields acts as a complete specification of which
/// fields appear in the letter, so that fields excluded from required-fields
/// are not rendered regardless of whether a value was passed.
///
/// Test Scenario:
/// - required-fields contains only from-name, from-address, to-name,
///   to-address, date, and signatures
/// - salutation, subject, and closing are provided but excluded from
///   required-fields and must not appear in the output
///
/// Expected Behavior:
/// The function successfully generates a letter that contains only the
/// fields listed in required-fields. The salutation, subject, and closing
/// are suppressed despite being passed as arguments.
///
/// Validation:
/// Exercises the field-shadowing logic in lib.typ that sets excluded fields
/// to none before rendering, ensuring the required-fields parameter correctly
/// controls the letter's structure.
#import "/src/lib.typ": *

#show: letterloom.with(
  required-fields: ("from-name", "from-address", "to-name", "to-address", "date", "signatures"),

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

  // These fields are provided but excluded from required-fields — they must not appear
  salutation: "Dear Mr Hawthorne,",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  closing: "Sincerely yours,",

  signatures: (
    (name: "Lord Albus Dimbleby"),
    (name: "Lady Abigail Dimbleby"),
    (name: "Sir Austin Dimbleby"),
  ),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678, to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.

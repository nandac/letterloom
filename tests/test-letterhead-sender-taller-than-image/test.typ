/// test-letterhead-sender-taller-than-image
///
/// Synopsis:
/// Rendering test that validates spacing below a side-by-side sender column
/// when the sender block is taller than the letterhead image, ensuring the
/// normal paragraph gap is kept before the date instead of being squeezed
/// away by the image's own bottom inset.
///
/// Purpose:
/// Regression test for a bug where construct-letterhead measured the vertical
/// advance past a side-by-side header using image-inset.bottom regardless of
/// which block (image or sender) was taller. When the sender address had more
/// lines than the image was tall, that left little to no gap before the date,
/// since image-inset.bottom is unrelated to paragraph spacing. The fix
/// advances past the sender's own measured bottom edge plus one par.spacing
/// gap whenever the sender is the taller of the two blocks.
///
/// Test Scenario:
/// - letterhead.file is a valid PNG loaded via read()
/// - letterhead.width: 65mm (sets the column split)
/// - letterhead.sender-position: right (image flush to the physical left
///   edge, sender column on the right)
/// - letterhead.image-inset: (top: 10mm, rest: 5mm), so the gap below a tall
///   sender must still come from par.spacing on top of that inset, not be
///   swallowed by it
/// - from-address has many more lines than the image is tall, so the sender
///   column is taller than the image at the default sender-valign: horizon
///
/// Expected Behavior:
/// - Page 1: sender name and address appear on the right, taller than the
///   letterhead image on the left; the date below is separated from the
///   last line of the sender address by a normal par.spacing gap, not
///   crowded against it
/// - Page 2+: no letterhead; normal margins apply throughout
///
/// Validation:
/// Output is compared to reference images to detect regressions in the
/// vertical gap below a side-by-side sender column that outgrows the image.
#import "/src/lib.typ": *

#show: letterloom.with(
  letterhead: (
    file: read("/docs/images/letterhead-small.png", encoding: none),
    width: 65mm,
    sender-position: right,
    image-inset: (top: 10mm, rest: 5mm),
  ),
  from-name: "The Dimbleby Family",
  from-address: [
    The Dimbleby Estate \
    Cheswick Village \
    Middle Upton \
    Bristol BS16 1GU \
    United Kingdom \
    Telephone: 0117-12345678 \
    Fax: 0117-87654321 \
    Email: dimbleby[at]estate.example.com \
    Website: www.dimbleby-estate.example.com \
    VAT Reg: GB 123 4567 89 \
    Company No: 01234567
  ],
  to-name: "Evergreen Tree Surgeons",
  to-address: [
    Midtown Lane \
    Cheswick Village \
    Stoke Gifford \
    Bristol BS16 1GU
  ],
  date: "01 January 1970",
  salutation: "Dear Mr Hawthorne,",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees")],
  closing: "Sincerely yours,",
  signatures: ((name: "Lord Albus Dimbleby"),),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678, to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.

/// test-signature-ratio-width
///
/// Synopsis:
/// Test case that validates signature images sized with a ratio (e.g.
/// `width: 30%`) are laid out correctly instead of collapsing to the
/// signatory's name-text width.
///
/// Purpose:
/// measure() cannot resolve a ratio width on its own — with no concrete
/// container to measure against, it silently returns 0pt. Before this was
/// fixed, that 0pt made a ratio-sized signature image invisible to the
/// greedy bin-packing algorithm, so its column shrank to just the width of
/// the printed name and the image itself rendered as a thin sliver clipped
/// to that width. Passing the printable page width to measure() as an
/// explicit sizing constraint resolves the ratio correctly.
///
/// Test Scenarios:
/// 1. Single signature, image width: 40% — the column is always the full
///    page width for a single signature, so the image should render at a
///    proportional, page-relative size rather than a thin sliver.
/// 2. Two signatures, image width: 30% each — both images should be
///    packed and rendered at a reasonable, proportional size rather than
///    each collapsing to their name's text width.
///
/// Expected Behavior:
/// Both scenarios produce visual output compared against reference images.
/// Neither signature image should appear as a thin sliver clipped to name
/// width.
///
/// Validation:
/// Visual regression: output must match reference. Confirms measure()'s
/// width parameter fix in construct-signatures holds for both the single-
/// and multi-signature bin-packing paths.
#import "/src/lib.typ": *

// Scenario 1: single signature, ratio-width image
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
      name: "Sir Austin Dimbleby",
      signature: image("../../docs/images/austin-sig.png", width: 40%),
    ),
  ),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village.

// Scenario 2: two signatures, ratio-width images
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
      signature: image("../../docs/images/albus-sig.png", width: 30%),
    ),
    (
      name: "Sir Austin Dimbleby",
      signature: image("../../docs/images/austin-sig.png", width: 30%),
    ),
  ),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village.

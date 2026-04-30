/// test-multiple-long-affiliations
///
/// Synopsis:
/// Test case that validates the letterloom function correctly lays out multiple
/// signatures where one or more signatories have long affiliations.
///
/// Purpose:
/// Ensures that the greedy bin-packing algorithm places signatures correctly
/// when affiliations are long, that affiliation text does not produce blank
/// lines for absent fields, and that name baselines align across each row.
///
/// Test Scenarios:
/// - Two signatories each with a long multi-line affiliation (packed in one row)
/// - Three signatories where the third has a very long affiliation that forces
///   it onto its own row, leaving the first two sharing a row
/// - Mixed row: one signatory with a long affiliation beside one with name only
///
/// Expected Behavior:
/// Signatures are packed greedily; long affiliations stay on their own row when
/// they cannot share space; names align horizontally across each row; no blank
/// space appears between name and affiliation when affiliation is absent.
/// Output is compared to reference images (visual regression).
///
/// Validation:
/// Visual regression: output must match reference. Confirms the packing and
/// rendering changes to construct-signatures hold under realistic long-content data.
#import "/src/lib.typ": *

// Scenario 1: two signatories with long affiliations — should pack into one row
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
      affiliation: [
        Earl of Cheswick \
        Chairman of the Dimbleby Family Charitable Trust \
        President of the Royal Horticultural Society \
        Fellow of the Royal Society of Arts
      ],
    ),
    (
      name: "Lady Abigail Dimbleby",
      affiliation: [
        Countess of Cheswick \
        Director of the Dimbleby Family Charitable Trust \
        Trustee of the National Trust \
        Fellow of the Linnean Society
      ],
    ),
  ),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village.

// Scenario 2: three signatories — third has a very long affiliation and should
// be forced onto its own row by the bin-packing algorithm
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
      affiliation: [
        Earl of Cheswick \
        Chairman of the Dimbleby Family Charitable Trust \
        President of the Royal Horticultural Society \
        Fellow of the Royal Society of Arts,
      ],
    ),
    (
      name: "Lady Abigail Dimbleby",
      affiliation: [
        Countess of Cheswick \
        Director of the Dimbleby Family Charitable Trust \
        Trustee of the National Trust \
        Fellow of the Linnean Society
      ],
    ),
    (
      name: "Sir Austin Dimbleby",
      affiliation: [
        Knight Commander of the Order of the British Empire \
        Chairman of the Dimbleby Estate \
        Secretary of the Dimbleby Family Charitable Trust \
        Senior Fellow of the Royal Geographical Society,
      ],
    ),
  ),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village.

// Scenario 3: mixed row — one signatory with a long affiliation beside one
// with name only; no blank space should appear for the absent affiliation
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
      affiliation: [
        Earl of Cheswick \
        Chairman of the Dimbleby Family Charitable Trust \
        President of the Royal Horticultural Society
      ],
    ),
    (
      name: "Lady Abigail Dimbleby",
    ),
  ),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village.

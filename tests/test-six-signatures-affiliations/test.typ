/// test-six-signatures-affiliations
///
/// Synopsis:
/// Test case that validates the greedy bin-packing algorithm in
/// construct-signatures when given more than three signatories (six), both
/// with and without long affiliations.
///
/// Purpose:
/// The bin-packing algorithm caps rows at three signatories and otherwise
/// packs greedily based on measured column width. With six signatories this
/// exercises multi-row packing (more than one row of up to three), rather
/// than the single-row cases covered by test-single-signature-alignment and
/// test-multiple-long-affiliations (which only goes up to three).
///
/// Test Scenarios:
/// 1. Six signatories, no affiliations — names alone are narrow, so all six
///    should pack into two rows of three.
/// 2. Six signatories, all with long multi-line affiliations — each
///    signatory's column is wide enough that rows can hold at most one or
///    two, forcing more than two rows.
/// 3. Six signatories, alternating long affiliation / no affiliation — a
///    realistic mixed case exercising row breaks driven by whichever
///    neighbour is currently being packed.
///
/// Expected Behavior:
/// All three scenarios produce visual output compared against reference
/// images. Rows never exceed three signatories; a row is flushed as soon as
/// a signatory would push it past the available width or past three
/// entries; name baselines align across each row regardless of affiliation
/// presence.
///
/// Validation:
/// Visual regression: output must match reference. Confirms the packing
/// algorithm scales correctly beyond the three-signatory, single-row cases
/// already covered elsewhere.
#import "/src/lib.typ": *

// Scenario 1: six signatories, no affiliations — expect two rows of three
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
    (name: "Lord Albus Dimbleby"),
    (name: "Lady Abigail Dimbleby"),
    (name: "Sir Austin Dimbleby"),
    (name: "Dame Beatrice Dimbleby"),
    (name: "Baron Cedric Dimbleby"),
    (name: "The Honourable Diana Dimbleby"),
  ),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village.

// Scenario 2: six signatories, all with long affiliations — expect more
// than two rows since each column is now much wider than a bare name
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
    (
      name: "Sir Austin Dimbleby",
      affiliation: [
        Knight Commander of the Order of the British Empire \
        Vice Chairman of the Dimbleby Estate \
        Director of the Dimbleby Family Charitable Trust \
        Senior Fellow of the Royal Geographical Society
      ],
    ),
    (
      name: "Dame Beatrice Dimbleby",
      affiliation: [
        Dame Commander of the Order of the British Empire \
        Patron of the Cheswick Village Horticultural Society \
        Governor of the Dimbleby Estate School \
        Honorary Fellow of the Royal College of Art
      ],
    ),
    (
      name: "Baron Cedric Dimbleby",
      affiliation: [
        Baron of Middle Upton \
        Treasurer of the Dimbleby Family Charitable Trust \
        Steward of the Cheswick Village Fete \
        Member of the Royal Agricultural Society
      ],
    ),
    (
      name: "The Honourable Diana Dimbleby",
      affiliation: [
        Justice of the Peace for Bristol \
        Secretary of the Dimbleby Family Charitable Trust \
        Trustee of the Cheswick Village Almshouses \
        Fellow of the Royal Society of Literature
      ],
    ),
  ),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village.

// Scenario 3: six signatories, alternating a long affiliation with no
// affiliation at all — exercises row breaks driven by whichever
// neighbouring signatory is being packed alongside a wide one
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
    (name: "Lady Abigail Dimbleby"),
    (
      name: "Sir Austin Dimbleby",
      affiliation: [
        Knight Commander of the Order of the British Empire \
        Vice Chairman of the Dimbleby Estate \
        Director of the Dimbleby Family Charitable Trust \
        Senior Fellow of the Royal Geographical Society
      ],
    ),
    (name: "Dame Beatrice Dimbleby"),
    (
      name: "Baron Cedric Dimbleby",
      affiliation: [
        Baron of Middle Upton \
        Treasurer of the Dimbleby Family Charitable Trust \
        Steward of the Cheswick Village Fete \
        Member of the Royal Agricultural Society
      ],
    ),
    (name: "The Honourable Diana Dimbleby"),
  ),
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village.

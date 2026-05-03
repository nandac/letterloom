/// test-attn-label
///
/// Synopsis:
/// Test case that validates the letterloom function correctly renders a custom
/// attn-label in both above and below attn-position configurations.
///
/// Purpose:
/// Ensures that construct-recipient substitutes the user-supplied attn-label
/// for the default "Attn:" text in both supported positions.
///
/// Test Scenarios:
/// - Scenario 1: custom attn-label with attn-position "above"
/// - Scenario 2: custom attn-label with attn-position "below"
///
/// Expected Behavior:
/// The custom label appears in place of "Attn:" in the attention line in both
/// positions. Layout and spacing around the attention line are unaffected.
///
/// Validation:
/// Visual regression: output must match reference images.
#import "/src/lib.typ": *

// Scenario 1: custom attn-label, position above
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
  date: "01 January 1970",
  salutation: "Dear Mr Hawthorne,",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  closing: "Sincerely yours,",
  signatures: (
    (name: "Lord Albus Dimbleby"),
  ),
  attn-name: "Mr Basil Hawthorne",
  attn-label: "Attention:",
  attn-position: "above",
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees.

Thank you kindly.

// Scenario 2: custom attn-label, position below
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
  date: "01 January 1970",
  salutation: "Dear Mr Hawthorne,",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  closing: "Sincerely yours,",
  signatures: (
    (name: "Lord Albus Dimbleby"),
  ),
  attn-name: "Mr Basil Hawthorne",
  attn-label: "For the attention of:",
  attn-position: "below",
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees.

Thank you kindly.

/// test-typography
///
/// Synopsis:
/// Test case that validates the letterloom function correctly applies custom
/// font families and sizes for the body, footer, and footnote text.
///
/// Purpose:
/// Ensures that main-font, main-font-size, footer-font, footer-font-size,
/// footnote-font, and footnote-font-size are forwarded to the correct set/show
/// rules. All fonts used are from Typst's embedded New Computer Modern family,
/// which is available on every platform and CI runner without installation.
///
/// Test Scenarios:
/// - Scenario 1: enlarged main-font-size (14pt) — verifies size propagation
/// - Scenario 2: full font family swap to New Computer Modern with custom sizes
///   for all three text roles (body, footer, footnote)
///
/// Expected Behavior:
/// Scenario 1: body text is visibly larger than the default 11pt.
/// Scenario 2: body, footer, and footnote text use New Computer Modern
/// letterforms, which are visually distinct from the default Libertinus Serif
/// and DejaVu Sans Mono; all three sizes are applied correctly.
///
/// Validation:
/// Visual regression: output must match reference images. Uses only Typst
/// embedded fonts to ensure identical rendering on all platforms and in CI.
#import "/src/lib.typ": *

// Scenario 1: larger main-font-size, defaults for everything else
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
  footer: (
    (footer-text: "+44-117-555-5555"),
    (footer-text: "dimblebyfamily@dimbleby.org", footer-type: "email"),
  ),
  main-font-size: 14pt,
)

We are writing to request you to visit The Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time.

Thank you kindly.

// Scenario 2: New Computer Modern family, custom sizes for all three roles
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
  footer: (
    (footer-text: "+44-117-555-5555"),
    (footer-text: "dimblebyfamily@dimbleby.org", footer-type: "email"),
  ),
  main-font: "New Computer Modern",
  main-font-size: 12pt,
  footer-font: "New Computer Modern Math",
  footer-font-size: 8pt,
  footnote-font: "New Computer Modern",
  footnote-font-size: 8pt,
)

We are writing to request you to visit The Dimbleby Estate#footnote[The estate is a Grade II listed property.] in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time.

Thank you kindly.

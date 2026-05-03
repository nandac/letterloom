/// test-invalid-letterhead-sender-position
///
/// Synopsis:
/// Test case that validates the letterloom function properly rejects invalid
/// sender-position, bottom-gap, and sender-valign values in the letterhead
/// dictionary.
///
/// Purpose:
/// Ensures that the validation system correctly identifies and reports errors
/// when letterhead.sender-position is not one of the accepted alignment values
/// (left, center, right), when letterhead.bottom-gap is not a length, and when
/// letterhead.sender-valign is not one of the accepted vertical alignment values
/// (top, horizon, bottom).
///
/// Test Scenarios:
/// - sender-position is an invalid string ("north")
/// - sender-position is an invalid alignment value (top)
/// - sender-position is an invalid type (integer)
/// - bottom-gap is an invalid type (string)
/// - bottom-gap is an invalid type (integer)
/// - sender-valign is an invalid string ("middle")
/// - sender-valign is a horizontal alignment value (left)
/// - sender-valign is an invalid type (integer)
///
/// Expected Errors:
/// - "letterhead.sender-position must be left, center, or right."
/// - "letterhead.bottom-gap must be a length (e.g. 1em, 5mm)."
/// - "letterhead.sender-valign must be top, horizon, or bottom."
///
/// Validation:
/// Ensures that sender-position rejects any value outside (left, center, right)
/// regardless of whether it is a string, an unsupported alignment, or a
/// non-alignment type, that bottom-gap enforces the length type requirement, and
/// that sender-valign rejects strings, horizontal alignments, and non-alignment
/// types.
#import "/src/lib.typ": *

#let base-args = (
  from-name: "The Dimbleby Family",
  from-address: [The Dimbleby Estate \ Cheswick Village \ Bristol BS16 1GU],
  to-name: "Evergreen Tree Surgeons",
  to-address: [Midtown Lane \ Cheswick Village \ Bristol BS16 1GU],
  date: "01 January 1970",
  salutation: "Dear Sir,",
  subject: "Test Subject",
  closing: "Sincerely,",
  signatures: ((name: "Lord Albus Dimbleby"),),
)

// sender-position is an invalid string
#assert.eq(
  catch(() => letterloom(none, ..base-args, letterhead: (file: bytes((0,)), width: 65mm, sender-position: "north"))),
  "panicked with: \"letterhead.sender-position must be left, center, or right.\"",
)

// sender-position is an unsupported alignment (top)
#assert.eq(
  catch(() => letterloom(none, ..base-args, letterhead: (file: bytes((0,)), width: 65mm, sender-position: top))),
  "panicked with: \"letterhead.sender-position must be left, center, or right.\"",
)

// sender-position is an invalid type (integer)
#assert.eq(
  catch(() => letterloom(none, ..base-args, letterhead: (file: bytes((0,)), width: 65mm, sender-position: 1))),
  "panicked with: \"letterhead.sender-position must be left, center, or right.\"",
)

// bottom-gap is an invalid type (string)
#assert.eq(
  catch(() => letterloom(none, ..base-args, letterhead: (file: bytes((0,)), bottom-gap: "bad"))),
  "panicked with: \"letterhead.bottom-gap must be a length (e.g. 1em, 5mm).\"",
)

// bottom-gap is an invalid type (integer)
#assert.eq(
  catch(() => letterloom(none, ..base-args, letterhead: (file: bytes((0,)), bottom-gap: 42))),
  "panicked with: \"letterhead.bottom-gap must be a length (e.g. 1em, 5mm).\"",
)

// sender-valign is an invalid string ("middle")
#assert.eq(
  catch(() => letterloom(none, ..base-args, letterhead: (file: bytes((0,)), width: 65mm, sender-position: right, sender-valign: "middle"))),
  "panicked with: \"letterhead.sender-valign must be top, horizon, or bottom.\"",
)

// sender-valign is a horizontal alignment value (left)
#assert.eq(
  catch(() => letterloom(none, ..base-args, letterhead: (file: bytes((0,)), width: 65mm, sender-position: right, sender-valign: left))),
  "panicked with: \"letterhead.sender-valign must be top, horizon, or bottom.\"",
)

// sender-valign is an invalid type (integer)
#assert.eq(
  catch(() => letterloom(none, ..base-args, letterhead: (file: bytes((0,)), width: 65mm, sender-position: right, sender-valign: 1))),
  "panicked with: \"letterhead.sender-valign must be top, horizon, or bottom.\"",
)

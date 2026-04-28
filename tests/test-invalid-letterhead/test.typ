/// test-invalid-letterhead
///
/// Synopsis:
/// Test case that validates the letterloom function properly rejects invalid
/// letterhead parameters for all keys: file, width, height, margin, and alignment.
///
/// Purpose:
/// Ensures that the validation system correctly identifies and reports errors
/// when the letterhead dictionary contains invalid data types, missing required
/// keys, or out-of-range values.
///
/// Letterhead format: a dictionary with:
/// - file (required): bytes loaded via read("path", encoding: none)
/// - width (optional): length, ratio (e.g. 50%), or relative (e.g. 50% + 5mm)
/// - height (optional): length
/// - margin (optional): length or dictionary with valid side keys
/// - alignment (optional): left, center, or right
///
/// Test Scenarios:
/// - letterhead is not a dictionary
/// - letterhead is missing the required file key
/// - letterhead.file is not bytes
/// - letterhead.width has an invalid type
/// - letterhead.height has an invalid type
/// - letterhead.margin has an invalid type
/// - letterhead.margin has an invalid key
/// - letterhead.margin has a non-length value
/// - letterhead.alignment is not left, center, or right
///
/// Expected Errors:
/// - "letterhead must be a dictionary with a required file key."
/// - "letterhead is missing the required file key."
/// - "letterhead.file must be bytes loaded via read(path, encoding: none)."
/// - "letterhead.width must be a length or percentage (e.g. 50% or 50% + 5mm)."
/// - "letterhead.height must be a length."
/// - "letterhead.margin must be a length or a dictionary of lengths."
/// - "letterhead.margin key 'badkey' is not valid. Must be one of top, bottom, left, right, x, y, or rest."
/// - "letterhead.margin value for 'top' must be a length."
/// - "letterhead.alignment must be left, center, or right."
#import "/src/lib.typ": *

// Shared required fields used across all test cases
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

// letterhead is not a dictionary
#assert.eq(
  catch(() => letterloom(none, ..base-args, letterhead: "not a dictionary")),
  "panicked with: \"letterhead must be a dictionary with a required file key.\"",
)

// letterhead is missing the required file key
#assert.eq(
  catch(() => letterloom(none, ..base-args, letterhead: (width: 100%))),
  "panicked with: \"letterhead is missing the required file key.\"",
)

// letterhead.file is not bytes
#assert.eq(
  catch(() => letterloom(none, ..base-args, letterhead: (file: "not bytes"))),
  "panicked with: \"letterhead.file must be bytes loaded via read(path, encoding: none).\"",
)

// letterhead.width is an invalid type
#assert.eq(
  catch(() => letterloom(none, ..base-args, letterhead: (file: bytes((0,)), width: "bad"))),
  "panicked with: \"letterhead.width must be a length or percentage (e.g. 50% or 50% + 5mm).\"",
)

// letterhead.height is an invalid type
#assert.eq(
  catch(() => letterloom(none, ..base-args, letterhead: (file: bytes((0,)), height: "bad"))),
  "panicked with: \"letterhead.height must be a length.\"",
)

// letterhead.margin is an invalid type
#assert.eq(
  catch(() => letterloom(none, ..base-args, letterhead: (file: bytes((0,)), margin: "bad"))),
  "panicked with: \"letterhead.margin must be a length or a dictionary of lengths.\"",
)

// letterhead.margin has an invalid key
#assert.eq(
  catch(() => letterloom(none, ..base-args, letterhead: (file: bytes((0,)), margin: (badkey: 5mm)))),
  "panicked with: \"letterhead.margin key 'badkey' is not valid. Must be one of top, bottom, left, right, x, y, or rest.\"",
)

// letterhead.margin has a non-length value
#assert.eq(
  catch(() => letterloom(none, ..base-args, letterhead: (file: bytes((0,)), margin: (top: "bad")))),
  "panicked with: \"letterhead.margin value for 'top' must be a length.\"",
)

// letterhead.alignment is not left, center, or right
#assert.eq(
  catch(() => letterloom(none, ..base-args, letterhead: (file: bytes((0,)), alignment: top))),
  "panicked with: \"letterhead.alignment must be left, center, or right.\"",
)

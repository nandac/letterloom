/// Input Validation Module
///
/// This module provides comprehensive validation functions for the letterloom package.
/// It ensures that all input parameters meet the required format and type constraints
/// before processing, providing clear error messages for invalid inputs.
///
/// The module includes validation functions for:
/// - Basic types (length, string, boolean)
/// - Contact information (name and address)
/// - Signatures and enclosures
/// - Footer structures
/// - Complete input validation orchestration
///
/// All validation functions use panic() with descriptive error messages
/// that include field names and expected formats for clear user feedback.
///

/// Validates that a value is of type length (e.g., em, pt, cm).
///
/// Parameters:
/// - length-value: The value to validate
/// - field-name: Name of the field for error reporting
///
/// Panics if the value is not a valid length type.
#let validate-length(length-value: none, field-name: none) = {
  // Validate that the length value e.g. em, pt, cm etc is of a valid length type
  if type(length-value) != length {
    panic(field-name + " must be of type length.")
  }
}

/// Validates that a value is a non-empty string or content block.
///
/// Parameters:
/// - string-data: The value to validate
/// - field-name: Name of the field for error reporting
/// - required: Whether the field is mandatory (default: true)
///
/// Panics if the value is missing (when required), not a string/content type,
/// or empty (empty string or empty content block).
#let validate-string(string-data: none, field-name: none, required: true) = {
  // Validate that the string data

  // If the string data is required, validate that it is not none
  if required {
    if string-data == none {
      panic(field-name + " is missing.")
    }
  }

  // Validate that the string data is either a string or content block type
  if type(string-data) not in (str, content) {
    panic(field-name + " must be a string or content block.")
  } else {
    // If the string data is of a valid type check that it is not empty
    if string-data in ("", []) {
      panic(field-name + " is empty.")
    }
  }
}

/// Validates that a value is of boolean type.
///
/// Parameters:
/// - boolean-data: The value to validate
/// - field-name: Name of the field for error reporting
///
/// Panics if the value is not a boolean type.
#let validate-boolean(boolean-data: none, field-name: none) = {
  // Validate that the boolean data is of a boolean type
  if type(boolean-data) != bool {
    panic(field-name + " must be a true or false value.")
  }
}

/// Validates contact information structure (name and address).
///
/// Parameters:
/// - contact: Dictionary containing name and address fields
/// - field-name: Name of the field for error reporting
///
/// Panics if:
/// - Contact is missing entirely
/// - Contact is not a dictionary
/// - Name field is missing, wrong type, or empty
/// - Address field is missing, wrong type, or empty
#let validate-contact(contact: none, field-name: none) = {
  // Validate that the contact information format and fields are correct

  // If contact is not given, panic
  if contact not in (none, ()) {
    // Validate that the contact information is a dictionary
    if type(contact) == dictionary {
      // Check if name is given and is a valid type
      if "name" in contact {
        if type(contact.at("name")) in (str, content) {
          // If the name is given, validate that it is not empty
          if contact.at("name") in ("", []) {
            panic(field-name + " name is empty.")
          }
        } else {
          panic(field-name + " name must be a string or content block.")
        }
      } else {
        panic(field-name + " name is missing.")
      }

      // Check if address is given and is a valid type
      if "address" in contact {
        if type(contact.at("address")) == content {
          // If the address is given, validate that it is not empty
          if contact.at("address") == [] {
            panic(field-name + " address is empty.")
          }
        } else {
          panic(field-name + " address must be a content block.")
        }
      } else {
        panic(field-name + " address is missing.")
      }
    } else {
      panic(field-name + " details must be a dictionary with name and address fields.")
    }
  } else {
    panic(field-name + " is missing.")
  }
}

/// Validates signature structure and content.
///
/// Parameters:
/// - signatures: Array or single signature dictionary with name field
///
/// Panics if:
/// - Signatures are missing entirely
/// - Any signature is not a dictionary
/// - Name field is missing, wrong type, or empty
///
/// Note: Signature images are optional and not validated.
#let validate-signatures(signatures: none) = {
  // Validate that the signatures are given and in the correct format

  // If signature are not given, panic
  if signatures not in (none, ()) {
    // Handle the case where we only have a single signature
    if type(signatures) != array {
      signatures = (signatures, )
    }

    // Validate each signature item
    // The signatory's name is required but a signature image is optional
    for signature in signatures {
      if type(signature) != dictionary {
        panic("the signature must be a dictionary with a name field and an optional signature field.")
      }

      // Check if the signature name is given
      if "name" in signature {
        // Validate that the signature name is a string or content block
        if type(signature.at("name")) not in (str, content) {
          panic("the signature name must be a string or content block.")
        }

        if signature.at("name") in ("", []) {
          panic("the signature name is empty.")
        }
      } else {
        panic("the signature name is missing.")
      }
    }
  } else {
    panic("signatures are missing.")
  }
}

/// Validates cc list format.
///
/// Parameters:
/// - cc: Array or single cc string/content
///
/// Panics if any cc item is not a string or content block.
/// Note: cc's are optional - no error if none provided
#let validate-cc(cc: none) = {
  // Validate that the give cc in the correct format

  // CCs are optional
  if cc not in (none, ()) {
    // Handle the case where we only have a single cc
    if type(cc) != array {
      cc = (cc, )
    }

    // Validate each cc item
    for cc-item in cc {
      if type(cc-item) not in (str, content) {
        panic("cc item must be a string or content block.")
      }
    }
  }
}

/// Validates enclosure list format.
///
/// Parameters:
/// - enclosures: Array or single enclosure string/content
///
/// Panics if any enclosure is not a string or content block.
/// Note: Enclosures are optional - no error if none provided.
#let validate-enclosures(enclosures: none) = {
  // Validate that the given enclosures are in the correct format

  // Enclosures are optional
  if enclosures not in (none, ()) {
    // Handle the case where we only have a single enclosure
    if type(enclosures) != array {
      enclosures = (enclosures, )
    }

    // Check that each enclosure is a string or content block
    for enclosure in enclosures {
      if type(enclosure) not in (str, content) {
        panic("enclosure must be a string or content block.")
      }
    }
  }
}

/// Validates footer structure with text and optional type.
///
/// Parameters:
/// - footer: Array or single footer dictionary with footer-text field
///
/// Panics if:
/// - Any footer element is not a dictionary
/// - footer-text field is missing or wrong type
/// - footer-type is not one of "url", "email", or "string"
///
/// Note: Footer is optional - no error if none provided.
#let validate-footer(footer: none) = {
  // Validate that the given footer is in the correct format

  // Footer is optional
  if footer not in (none, ()) {
    if type(footer) != array {
      // Handle the case where we only have a single footer element
      footer = (footer, )
    }

    // Validate each footer element
    for footer-elem in footer {
      // Validate that each footer element is a dictionary
      if type(footer-elem) != dictionary {
        panic("footer element must be a dictionary.")
      }

      // Validate that the footer-text is given
      if "footer-text" in footer-elem {
        // Validate that the footer-text is a string or content block
        if type(footer-elem.at("footer-text")) not in (str, content) {
          panic("footer-text must be a string or content block.")
        }
      } else {
        panic("footer-text is missing.")
      }

      // Validate that the footer type is one of url, email or string
      // The footer-type field is optional and defaults to string
      if "footer-type" in footer-elem {
        if footer-elem.at("footer-type") not in ("url", "email", "string") {
          panic("footer-type must be one of url, email or string.")
        }
      }
    }
  }
}

/// Main validation function that orchestrates all validations.
///
/// Validates all letterloom parameters including required fields,
/// optional fields, and formatting options.
///
/// Required Parameters:
/// - from: Sender contact information
/// - to: Recipient contact information
/// - date: Letter date
/// - salutation: Opening greeting
/// - subject: Letter subject
/// - closing: Closing phrase
/// - signatures: List of signatories
///
/// Optional Parameters:
/// - attn-name: Attention line
/// - cc: Carbon copy recipients
/// - enclosures: List of enclosures
/// - enclosures-title: Enclosures header text
/// - footer: Footer information
/// - number-pages: Enable page numbering
/// - main-font-size: Primary font size
/// - footer-font-size: Footer font size
/// - footnote-font-size: Footnote font size
/// - par-leading: Paragraph line spacing
/// - par-spacing: Paragraph spacing
/// - from-alignment: Sender address alignment
/// - footnote-alignment: Footnote alignment
/// - link-color: Hyperlink color
///
/// Panics if any required field is invalid or missing.
#let validate-inputs(
    from: none,
    to: none,
    date: none,
    salutation: none,
    subject: none,
    closing: none,
    signatures: none,
    attn-name: none,
    cc: none,
    enclosures: none,
    enclosures-title: "encl:",
    footer: none,
    par-leading: 0.8em,
    par-spacing: 1.8em,
    number-pages: false,
    main-font-size: 11pt,
    footer-font-size: 9pt,
    footnote-font-size: 7pt,
    from-alignment: right,
    footnote-alignment: left,
    link-color: blue,
  ) = {
  // Validate all required variables
  // Validate the sender's contact details
  validate-contact(contact: from, field-name: "from")

  // Validate the recipient's contact details
  validate-contact(contact: to, field-name: "to")

  // Validate the date
  validate-string(string-data: date, field-name: "date")

  // Validate salutation
  validate-string(string-data: salutation, field-name: "salutation")

  // Validate subject
  validate-string(string-data: subject, field-name: "subject")

  // Validate closing
  validate-string(string-data: closing, field-name: "closing")

  // Validate signatures
  validate-signatures(signatures: signatures)

  // Validate all optional variables
  // Validate font sizes
  validate-length(length-value: main-font-size, field-name: "main-font-size")
  validate-length(length-value: footer-font-size, field-name: "footer-font-size")
  validate-length(length-value: footnote-font-size, field-name: "footnote-font-size")

  // Validate paragraph spacing and leading
  validate-length(length-value: par-leading, field-name: "par-leading")
  validate-length(length-value: par-spacing, field-name: "par-spacing")

  // If attention name is given, validate it
  if attn-name != none {
    validate-string(string-data: attn-name, field-name: "attn-name", required: false)
  }

  // If cc is given, validate it
  if cc != none {
    validate-cc(cc: cc)
  }

  // If enclosures are given, validate them
  if enclosures != none {
    validate-enclosures(enclosures: enclosures)
  }

  // If enclosures-title is not the default value, validate it
  if enclosures-title != "encl:" {
    validate-string(
      string-data: enclosures-title, field-name: "enclosures-title", required: false
    )
  }

  // If number-pages is not the default value, validate it
  if number-pages != false {
    validate-boolean(boolean-data: number-pages, field-name: "number-pages")
  }

  // If footer is given, validate it
  if footer != none {
    validate-footer(footer: footer)
  }

  // Validate from alignment
  if type(from-alignment) != alignment {
    panic("from-alignment must be of a valid alignment type.")
  }

  // Validate footnote alignment
  if type(footnote-alignment) != alignment {
    panic("footnote-alignment must be of a valid alignment type.")
  }

  // Validate link color
  if type(link-color) != color {
    panic("link-color must be of a valid color type.")
  }
}

/// Input Validation Module
///
/// This module provides comprehensive validation functions for the letterloom package.
/// It ensures that all input parameters meet the required format and type constraints
/// before processing, providing clear error messages for invalid inputs.
///
/// The validation system is organized into several categories:
///
/// ## Basic Type Validation
/// - `validate-length()` - Validates length values (pt, em, cm, etc.)
/// - `validate-string()` - Validates string and content block values
/// - `validate-boolean()` - Validates boolean values
///
/// ## Contact Information Validation
/// - `validate-contact()` - Validates sender and recipient contact structures
///
/// ## Content Structure Validation
/// - `validate-signatures()` - Validates signature arrays and individual signatures
/// - `validate-cc()` - Validates carbon copy recipient lists
/// - `validate-enclosures()` - Validates enclosure lists
/// - `validate-footer()` - Validates footer structures
/// - `validate-attn-line()` - Validates attention line structures
///
/// ## Main Validation Orchestration
/// - `validate-inputs()` - Orchestrates all validations for the letterloom function
///
/// ## Validation Philosophy
/// - All validation functions use `panic()` with descriptive error messages
/// - Error messages include field names and expected formats for clear user feedback
/// - Required fields are validated for presence, type, and non-empty values
/// - Optional fields are validated only when provided
/// - Type validation ensures proper Typst types (alignment, color, length, etc.)
///
/// ## Error Message Format
/// Error messages follow a consistent pattern:
/// - Missing fields: "[field-name] is missing."
/// - Empty fields: "[field-name] is empty."
/// - Type errors: "[field-name] must be a [expected-type]."
/// - Structure errors: "[field-name] must be a dictionary with [required-fields]."
///
/// ## Usage
/// This module is primarily used internally by the letterloom function, but individual
/// validation functions can be used for custom validation scenarios.
///
/// #example
/// ```typ
/// #import "validate-inputs.typ": *
///
/// // Validate a contact structure
/// #let contact = (
///   name: "John Doe",
///   address: [123 Main St\nAnytown, ST 12345],
/// )
/// #validate-contact(contact, "sender")
///
/// // Validate a signature
/// #let signature = (name: "John Doe")
/// #validate-signatures(signature)
/// ```
///

// =============================================================================
// BASIC TYPE VALIDATION FUNCTIONS
// =============================================================================

/// Validates that a value is of length type (e.g., em, pt, cm, etc.).
///
/// #length-value: The value to validate
/// #field-name: Name of the field for error reporting (will be converted to string)
///
/// Behavior:
/// - Validates that the value is of Typst length type
/// - Accepts any valid length unit (pt, em, cm, mm, in, etc.)
/// - Provides field-specific error messages using the field-name parameter
/// - Does not validate the magnitude, only the type
///
/// Returns:
/// - Nothing, but panics if the value is not a valid length type
///
/// #example
/// ```typ
/// #validate-length(11pt, "font-size")
/// #validate-length(1.5em, "line-height")
/// #validate-length(2cm, "margin")
/// ```
///
#let validate-length(length-value: none, field-name: none) = {
  if type(length-value) != length {
    panic(str(field-name) + " must be of type length.")
  }
}

/// Validates that a value is a non-empty string or content block.
///
/// #string-data: The value to validate
/// #field-name: Name of the field for error reporting (will be converted to string)
/// #required: Whether the field is mandatory (default: true)
///
/// Behavior:
/// - If required is true and string-data is none, panics with "is missing" error
/// - If required is false and string-data is none, skips validation entirely
/// - If string-data is provided, validates it is a string or content block
/// - If string-data is a valid type, validates it is not empty (not "" or [])
/// - Provides field-specific error messages using the field-name parameter
///
/// Returns:
/// - Nothing, but panics if validation fails
///
/// #example
/// ```typ
/// #validate-string("Hello World", "greeting")
/// #validate-string([*Bold text*], "content")
/// #validate-string(none, "optional-field", required: false)
/// ```
#let validate-string(string-data: none, field-name: none, required: true) = {
  // Handle optional fields
  if not required and string-data == none {
    return
  }

  // Validate required fields
  if required and string-data == none {
    panic(str(field-name) + " is missing.")
  }

  // Validate type
  if type(string-data) not in (str, content) {
    panic(str(field-name) + " must be a string or content block.")
  }

  // Validate non-empty
  if string-data in ("", []) {
    panic(str(field-name) + " is empty.")
  }
}

/// Validates that a value is of boolean type.
///
/// #boolean-data: The value to validate
/// #field-name: Name of the field for error reporting (will be converted to string)
/// #required: Whether the field is mandatory (default: true)
///
/// Behavior:
/// - If required is true and boolean-data is none, panics with "is missing" error
/// - If required is false and boolean-data is none, skips validation entirely
/// - If boolean-data is provided, validates it is a boolean type (true or false)
/// - Provides field-specific error messages using the field-name parameter
/// - Does not validate the boolean value itself, only the type
///
/// Returns:
/// - Nothing, but panics if validation fails
///
/// #example
/// ```typ
/// #validate-boolean(true, "enabled")
/// #validate-boolean(false, "optional-flag", required: false)
/// #validate-boolean(none, "optional-setting", required: false)
/// ```
///
#let validate-boolean(boolean-data: none, field-name: none, required: true) = {
  // Handle optional fields
  if not required and boolean-data == none {
    return
  }

  // Validate required fields
  if required and boolean-data == none {
    panic(str(field-name) + " is missing.")
  }

  // Validate type
  if type(boolean-data) != bool {
    panic(str(field-name) + " must be a true or false value.")
  }
}

// =============================================================================
// COMPLEX STRUCTURE VALIDATION FUNCTIONS
// =============================================================================

/// Validates contact information structure (name and address).
///
/// #contact: Dictionary containing name and address fields
/// #field-name: Name of the field for error reporting (will be converted to string)
///
/// The contact dictionary should contain:
/// - #name: Required string or content block (the person's name)
/// - #address: Required content block (the person's address)
///
/// Behavior:
/// - Validates that contact is provided (not none or empty)
/// - Validates that contact is a dictionary
/// - Validates that both name and address fields are present
/// - Validates that name is a string or content block and not empty
/// - Validates that address is a content block and not empty
/// - Provides field-specific error messages using the field-name parameter
///
/// Returns:
/// - Nothing, but panics if validation fails
///
/// #example
/// ```typ
/// #let contact = (
///   name: "John Doe",
///   address: [123 Main St \
///             Anytown, ST 12345],
/// )
/// #validate-contact(contact, "sender")
///
/// #let recipient = (
///   name: "Jane Smith",
///   address: [456 Oak Ave \
///             Somewhere, ST 67890],
/// )
/// #validate-contact(recipient, "recipient")
/// ```
///
#let validate-contact(contact: none, field-name: none) = {
  // Validate presence
  if contact in (none, ()) {
    panic(str(field-name) + " is missing.")
  }

  // Validate dictionary type
  if type(contact) != dictionary {
    panic(str(field-name) + " details must be a dictionary with name and address fields.")
  }

  // Validate name field
  if "name" not in contact {
    panic(str(field-name) + " name is missing.")
  }

  let name = contact.at("name")
  // Validate name field type
  if type(name) not in (str, content) {
    panic(str(field-name) + " name must be a string or content block.")
  }

  // Validate name field is not empty
  if name in ("", []) {
    panic(str(field-name) + " name is empty.")
  }

  // Validate address field
  if "address" not in contact {
    panic(str(field-name) + " address is missing.")
  }

  let address = contact.at("address")
  // Validate address field type
  if type(address) != content {
    panic(str(field-name) + " address must be a content block.")
  }

  // Validate address field is not empty
  if address == [] {
    panic(str(field-name) + " address is empty.")
  }
}

/// Validates signature structure and content.
///
/// #signatures: An array of signature dictionaries or a single signature dictionary
///
/// Each signature dictionary should contain:
/// - #name: Required string or content block (the signatory's name)
/// - #signature: Optional signature image (not validated)
///
/// Behavior:
/// - Validates that signatures is provided (not none or empty)
/// - Handles both single signature and array of signatures
/// - Validates that each signature is a dictionary
/// - Validates that each signature has a required name field
/// - Validates that each name is a string or content block and not empty
/// - Does not validate the optional signature field (assumed to be an image)
///
/// Returns:
/// - Nothing, but panics if validation fails
///
/// #example
/// ```typ
/// #let signatures = (
///   (name: "John Doe", signature: image("john-sig.png")),
///   (name: "Jane Smith"),
/// )
/// #validate-signatures(signatures)
///
/// // Single signature
/// #let single-signature = (name: "John Doe")
/// #validate-signatures(single-signature)
/// ```
///
#let validate-signatures(signatures: none) = {
  // Validate presence
  if signatures in (none, ()) {
    panic("signatures are missing.")
  }

  // Handle the case where only one signature is given
  if type(signatures) != array {
    signatures = (signatures, )
  }

  // Validate each signature
  for signature in signatures {
    if type(signature) != dictionary {
      panic("signature '" + str(signature) + "' must be a dictionary with a name field and an optional signature field.")
    }

    if "name" not in signature {
      panic("signature name is missing.")
    }

    let name = signature.at("name")
    if type(name) not in (str, content) {
      panic("signature name '" + str(name) + "' must be a string or content block.")
    }

    if name in ("", []) {
      panic("signature name is empty.")
    }
  }
}

// =============================================================================
// OPTIONAL STRUCTURE VALIDATION FUNCTIONS
// =============================================================================

/// Validates cc list format.
///
/// #cc: Optional dictionary with cc-list field and optional label field
///
/// The cc dictionary should contain:
/// - #cc-list: Required array of strings/content blocks (the cc recipients)
/// - #label: Optional string or content block (defaults to "cc:")
///
/// Behavior:
/// - Validates that cc is a dictionary (if provided)
/// - Validates that cc dictionary has required "cc-list" field
/// - Validates that cc-list is not empty
/// - Validates that each cc recipient is a string or content block
/// - Validates that the optional label field is a string or content block and not empty
/// - Handles both single recipient and array of recipients in the cc-list field
/// - No validation if cc is none or empty
///
/// Returns:
/// - Nothing, but panics if validation fails
///
/// #example
/// ```typ
/// #let cc = (
///   cc-list: ("alice@example.com", "bob@example.com"),
///   label: "cc:",
/// )
/// #validate-cc(cc)
///
/// #let single-cc = (
///   cc-list: "alice@example.com",
/// )
/// #validate-cc(single-cc)
/// ```
///
#let validate-cc(cc: none) = {
  if cc not in (none, ()) {
    // Validate dictionary type
    if type(cc) != dictionary {
      panic("cc must be a dictionary.")
    }

    // Validate cc-list field
    if "cc-list" not in cc {
      panic("cc dictionary must have a cc-list field.")
    }

    let cc-list = cc.at("cc-list")
    // Handle the case where only one cc recipient is given
    if type(cc-list) != array {
      cc-list = (cc-list, )
    }

    // Validate cc-list field is not empty
    if cc-list in (none, ()) {
      panic("cc-list is empty.")
    }

    // Validate each recipient
    for cc-recipient in cc-list {
      if type(cc-recipient) not in (str, content) {
        panic(str("cc recipient '" + str(cc-recipient)) + "' must be a string or content block.")
      }
    }

    // Validate optional label
    if "label" in cc {
      let label = cc.at("label")
      // Validate label field type
      if type(label) not in (str, content) {
        panic("cc label '" + str(label) + "' must be a string or content block.")
      }

      // Validate label field is not empty
      if label in ("", []) {
        panic("cc label is empty.")
      }
    }
  }
}

/// Validates enclosure list format.
///
/// #enclosures: Optional dictionary with encl-list field and optional label field
///
/// The enclosures dictionary should contain:
/// - #encl-list: Required array of strings/content blocks (the enclosure items)
/// - #label: Optional string or content block (defaults to "encl:")
///
/// Behavior:
/// - Validates that enclosures is a dictionary (if provided)
/// - Validates that enclosures dictionary has required "encl-list" field
/// - Validates that each item is a string or content block and not empty
/// - Validates that the optional label field is a string or content block and not empty
/// - Handles both single item and array of items in the encl-list field
/// - No validation if enclosures is none or empty
///
/// Returns:
/// - Nothing, but panics if validation fails
///
/// #example
/// ```typ
/// #let enclosures = (
///   encl-list: ("resume.pdf", "cover-letter.pdf"),
///   label: "encl:",
/// )
/// #validate-enclosures(enclosures)
/// ```
#let validate-enclosures(enclosures: none) = {
  if enclosures not in (none, ()) {
    // Validate dictionary type
    if type(enclosures) != dictionary {
      panic("enclosures must be a dictionary with an encl-list field.")
    }

    // Validate encl-list field
    if "encl-list" not in enclosures {
      panic("enclosures dictionary must have an encl-list field.")
    }

    let encl-list = enclosures.at("encl-list")
    // Handle the case where only one enclosure item is given
    if type(encl-list) != array {
      encl-list = (encl-list, )
    }

    // Validate encl-list field is not empty
    if encl-list in (none, ()) {
      panic("enclosure encl-list field is empty.")
    }

    // Validate each item
    for encl-item in encl-list {
      if type(encl-item) not in (str, content) {
        panic("enclosure '" + str(encl-item) + "' must be a string or content block.")
      }

      // Validate item is not empty
      if encl-item in ("", []) {
        panic("empty enclosure item found.")
      }
    }

    // Validate optional label
    if "label" in enclosures {
      let label = enclosures.at("label")
      // Validate label field type
      if type(label) not in (str, content) {
        panic("enclosure label '" + str(label) + "' must be a string or content block.")
      }

      // Validate label field is not empty
      if label in ("", []) {
        panic("enclosure label is empty.")
      }
    }
  }
}

/// Validates footer structure with text and optional type.
///
/// #footer: An array of footer dictionaries or a single footer dictionary
///
/// Each footer dictionary should contain:
/// - #footer-text: Required string or content block (the footer content)
/// - #footer-type: Optional string, one of "url", "email", or "string" (defaults to "string")
///
/// Behavior:
/// - Validates that footer is an array (if provided)
/// - Handles both single footer item and array of footer items
/// - Validates that each footer element is a dictionary
/// - Validates that each footer has a required footer-text field
/// - Validates that footer-text is a string or content block
/// - Validates that footer-type is one of the allowed values (if provided)
/// - No validation if footer is none or empty
///
/// Returns:
/// - Nothing, but panics if validation fails
///
/// #example
/// ```typ
/// #let footer = (
///   (footer-text: "https://example.com", footer-type: "url"),
///   (footer-text: "contact@example.com", footer-type: "email"),
///   (footer-text: "© 2024 Company"),
/// )
/// #validate-footer(footer)
///
/// #let single-footer = (footer-text: "© 2024 Company")
/// #validate-footer(single-footer)
/// ```
///
#let validate-footer(footer: none) = {
  if footer not in (none, ()) {
    // Handle the case where only one footer item is given
    if type(footer) != array {
      footer = (footer, )
    }

    // Validate each footer element
    for footer-elem in footer {
      if type(footer-elem) != dictionary {
        panic("footer element '" + str(footer-elem) + "' must be a dictionary.")
      }

      if "footer-text" not in footer-elem {
        panic("footer-text is missing.")
      }

      let footer-text = footer-elem.at("footer-text")
      if type(footer-text) not in (str, content) {
        panic("footer-text '" + str(footer-text) + "' must be a string or content block.")
      }

      // Validate optional footer-type
      if "footer-type" in footer-elem {
        let footer-type = footer-elem.at("footer-type")
        if footer-type not in ("url", "email", "string") {
          panic("footer-type '" + str(footer-type) + "' must be one of url, email or string.")
        }
      }
    }
  }
}

/// Validates attention line format.
///
/// #attn-line: Attention line dictionary with required "name" field and optional "label" and "position" fields
///
/// The attn-line dictionary should contain:
/// - #name: Required string or content block (the person's name)
/// - #label: Optional string or content block (defaults to "Attn:")
/// - #position: Optional string, either "above" or "below" (defaults to "above")
///
/// Behavior:
/// - Validates that attn-line is a dictionary (if provided)
/// - Validates that required name field is present and valid
/// - Validates that name is a string or content block and not empty
/// - Validates that optional label field is valid (if provided)
/// - Validates that optional position field is valid (if provided)
/// - No validation if attn-line is none or empty
///
/// Returns:
/// - Nothing, but panics if validation fails
///
/// #example
/// ```typ
/// #let attn-line = (
///   name: "Jane Smith",
///   label: "Attn:",
///   position: "above",
/// )
/// #validate-attn-line(attn-line)
///
/// #let simple-attn = (name: "John Doe")
/// #validate-attn-line(simple-attn)
/// ```
///
#let validate-attn-line(attn-line: none) = {
  if attn-line not in (none, ()) {
    // Validate dictionary type
    if type(attn-line) != dictionary {
      panic("attn-line must be a dictionary.")
    }

    // Validate required name field
    if "name" not in attn-line {
      panic("attn-line dictionary must have a name field.")
    }

    // Validate name field type
    let name = attn-line.at("name")
    if type(name) not in (str, content) {
      panic("attn-line name must be a string or content block.")
    }

    // Validate name field is not empty
    if name in ("", []) {
      panic("attn-line name is empty.")
    }

    // Validate optional label
    if "label" in attn-line {
      let label = attn-line.at("label")

      // Validate label field type
      if type(label) not in (str, content) {
        panic("attn-line label must be a string or content block.")
      }

      // Validate label field is not empty
      if label in ("", []) {
        panic("attn-line label is empty.")
      }
    }

    // Validate optional position
    if "position" in attn-line {
      let position = attn-line.at("position")

      // Validate position field is valid
      if position not in ("above", "below") {
        panic("attn-line position must be one of above or below.")
      }
    }
  }
}

// =============================================================================
// MAIN VALIDATION ORCHESTRATION
// =============================================================================

/// Main validation function that orchestrates all validations for the letterloom function.
///
/// This function validates all letterloom parameters including required fields,
/// optional fields, and formatting options. It serves as the central validation
/// point for the entire letterloom system.
///
/// ## Required Parameters
/// These parameters must be provided and will be validated for presence, type, and content:
/// - #from: Sender contact information (dictionary with name and address)
/// - #to: Recipient contact information (dictionary with name and address)
/// - #date: Letter date (string or content block)
/// - #salutation: Opening greeting (string or content block)
/// - #subject: Letter subject (string or content block)
/// - #closing: Closing phrase (string or content block)
/// - #signatures: List of signatories (array of signature dictionaries)
///
/// ## Optional Parameters
/// These parameters are validated only when provided:
/// - #attn-line: Attention line (dictionary with name, optional label and position)
/// - #cc: Carbon copy recipients (dictionary with cc-list, optional label)
/// - #enclosures: List of enclosures (dictionary with encl-list, optional label)
/// - #footer: Footer information (array of footer dictionaries)
///
/// ## Formatting Parameters
/// These parameters control document formatting and are validated for proper types:
/// - #par-leading: Paragraph line spacing (length, default: 0.8em)
/// - #par-spacing: Paragraph spacing (length, default: 1.8em)
/// - #number-pages: Enable page numbering (boolean, default: false)
/// - #main-font-size: Primary font size (length, default: 11pt)
/// - #footer-font-size: Footer font size (length, default: 9pt)
/// - #footnote-font-size: Footnote font size (length, default: 7pt)
/// - #from-alignment: Sender address alignment (alignment, default: right)
/// - #footnote-alignment: Footnote alignment (alignment, default: left)
/// - #link-color: Hyperlink color (color, default: blue)
///
/// ## Validation Order
/// The function validates parameters in the following order:
/// 1. Required fields (contact info, date, salutation, subject, closing, signatures)
/// 2. Formatting parameters (lengths, booleans)
/// 3. Optional fields (attn-line, cc, enclosures, footer)
/// 4. Typst-specific types (alignment, color)
///
/// ## Error Handling
/// - All validation failures result in a panic with descriptive error messages
/// - Error messages include the field name and expected format
/// - Validation stops at the first error encountered
/// - No return value - function either completes successfully or panics
///
/// ## Usage
/// This function is called internally by the letterloom function before any
/// document generation begins. It ensures all inputs are valid before processing.
///
/// #example
/// ```typ
/// #let from = (
///   name: "John Doe",
///   address: [123 Main St\nAnytown, ST 12345],
/// )
/// #let to = (
///   name: "Jane Smith",
///   address: [456 Oak Ave\nSomewhere, ST 67890],
/// )
/// #let signatures = ((name: "John Doe"),)
/// #validate-inputs(
///   from: from,
///   to: to,
///   date: "January 15, 2024",
///   salutation: "Dear Jane,",
///   subject: "Meeting Request",
///   closing: "Best regards,",
///   signatures: signatures,
///   cc: (cc-list: "alice@example.com"),
///   enclosures: (encl-list: "resume.pdf"),
/// )
/// ```
///
#let validate-inputs(
    from: none,
    to: none,
    date: none,
    salutation: none,
    subject: none,
    closing: none,
    signatures: none,
    attn-line: none,
    cc: none,
    enclosures: none,
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
  // =============================================================================
  // VALIDATE REQUIRED FIELDS
  // =============================================================================

  validate-contact(contact: from, field-name: "from")
  validate-contact(contact: to, field-name: "to")
  validate-string(string-data: date, field-name: "date")
  validate-string(string-data: salutation, field-name: "salutation")
  validate-string(string-data: subject, field-name: "subject")
  validate-string(string-data: closing, field-name: "closing")
  validate-signatures(signatures: signatures)

  // =============================================================================
  // VALIDATE FORMATTING PARAMETERS
  // =============================================================================

  validate-length(length-value: main-font-size, field-name: "main-font-size")
  validate-length(length-value: footer-font-size, field-name: "footer-font-size")
  validate-length(length-value: footnote-font-size, field-name: "footnote-font-size")
  validate-length(length-value: par-leading, field-name: "par-leading")
  validate-length(length-value: par-spacing, field-name: "par-spacing")

  // =============================================================================
  // VALIDATE OPTIONAL FIELDS
  // =============================================================================

  if attn-line != none {
    validate-attn-line(attn-line: attn-line)
  }

  if cc != none {
    validate-cc(cc: cc)
  }

  if enclosures != none {
    validate-enclosures(enclosures: enclosures)
  }

  if footer != none {
    validate-footer(footer: footer)
  }

  // =============================================================================
  // VALIDATE CONDITIONAL FIELDS
  // =============================================================================

  if number-pages != false {
    validate-boolean(boolean-data: number-pages, field-name: "number-pages", required: false)
  }

  // =============================================================================
  // VALIDATE TYPST-SPECIFIC TYPES
  // =============================================================================

  if type(from-alignment) != alignment {
    panic("from-alignment must be a valid alignment type.")
  }

  if type(footnote-alignment) != alignment {
    panic("footnote-alignment must be a valid alignment type.")
  }

  if type(link-color) != color {
    panic("link-color must be a valid color type.")
  }
}

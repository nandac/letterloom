#let validate-length(length-value: none, field-name: none) = {
  if type(length-value) != length {
    panic(field-name + " must be of type length.")
  }
}

#let validate-string(string-data: none, field-name: none, required: true) = {
  if required {
    if string-data == none {
      panic(field-name + " is missing.")
    }
  }

  if type(string-data) not in (str, content) {
    panic(field-name + " must be a string or content block.")
  } else {
    if string-data in ("", []) {
      panic(field-name + " is empty.")
    }
  }
}

#let validate-boolean(boolean-data: none, field-name: none) = {
  if type(boolean-data) != bool {
    panic(field-name + " must be a true or false value.")
  }
}

#let validate-contact(contact: none, field-name: none) = {
  if type(contact) == dictionary {
    // Check if name is given and is a valid type
    if "name" in contact {
      if type(contact.at("name")) in (str, content) {
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
}

#let validate-signatures(signatures: none) = {
  if signatures not in (none, ()) {
    // Handle the case where we only have a single signature
    if type(signatures) != array {
      signatures = (signatures, )
    }

    // Validate each signature
    // The signatory's name is required but a signature image is optional
    for signature in signatures {
      if type(signature) != dictionary {
        panic("the signature must be a dictionary with a name field and an optional signature field.")
      }

      // Check if the signature name is given
      if "name" in signature {
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

#let validate-enclosures(enclosures: none) = {
  if enclosures not in (none, ()) {
    // Handle the case where we only have a single enclosure
    if type(enclosures) != array {
      enclosures = (enclosures, )
    }

    for enclosure in enclosures {
      if type(enclosure) not in (str, content) {
        panic("enclosure must be a string or content block.")
      }
    }
  }
}

#let validate-footer(footer: none) = {
  if footer not in (none, ()) {
    if type(footer) != array {
      // Convert the footer variable to an array in cases
      // where only one footer item is given
      footer = (footer, )
    }

    for footer-elem in footer {
      if type(footer-elem) != dictionary {
        panic("footer element must be a dictionary.")
      }

      if type(footer-elem.at("footer-text")) not in (str, content) {
        panic("footer-text must be a string or content block.")
      }

      if "footer-type" in footer-elem {
        if footer-elem.at("footer-type") not in ("url", "email", "string") {
          panic("footer-type must be one of url, email or string.")
        }
      }
    }
  }
}

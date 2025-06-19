#let validate-length(length-value: none, field-name: none) = {
  if type(length-value) != length {
    panic("error: " + field-name + " must be of type length.")
  }
}

#let validate-string(string-data: none, field-name: none) = {
  if type(string-data) not in (str, content) {
    panic("error: " + field-name + " must be a string or content block.")
  } else {
    if string-data == "" {
      panic("error: " + field-name + " is empty.")
    }
  }
}

#let validate-boolean(boolean-data: none, field-name: none) = {
  if type(boolean-data) != bool {
    panic("error: " + field-name + " must be a true or false value.")
  }
}

#let validate-contact(contact: none, contact-type: none) = {
  if type(contact) == dictionary {
    // Check if name is given and is a valid type
    if "name" in contact {
      if type(contact.at("name")) == str {
        if contact.at("name") == "" {
          panic("error: " + contact-type + " name is empty.")
        }
      } else {
        panic("error: " + contact-type + " name must be a string.")
      }
    } else {
      panic("error: " + contact-type + " name is missing.")
    }

    // Check if address is given and is a valid type
    if "address" in contact {
      if type(contact.at("address")) == content {
        if contact.at("address") == "" {
          panic("error: " + contact-type + " address is empty.")
        }
      } else {
        panic("error: " + contact-type + " address must be a content block.")
      }
    } else {
      panic("error: " + contact-type + " address is missing.")
    }
  } else {
    panic("error: " + contact-type + " details must be a dictionary with name and address fields.")
  }
}

#let validate-signatures(signatures: none) = {
  if signatures != none {
    // Handle the case where we only have a single signature
    if type(signatures) != array {
      signatures = (signatures, )
    }

    // Validate each signature
    // The signatory's name is required but a signature image is optional
    for signature in signatures {
      // Check if the signature name is given
      if signature.at("name") in (none, "") {
        panic("error: signature name is missing.")
      }
    }
  } else {
    panic("error: signatures are missing.")
  }
}

#let validate-enclosures(enclosures: none) = {
  if enclosures != none {
    // Handle the case where we only have a single enclosure
    if type(enclosures) != array {
      enclosures = (enclosures, )
    }

    for enclosure in enclosures {
      if type(enclosure) not in (str, content) {
        panic("error: enclosure must be a string or content block.")
      }
    }
  }
}

#let validate-figures(figures: none) = {
  if figures != none {
    // Handle the case where we only have a single figure
    if type(figures) != array {
      figures = (figures, )
    } else {
      for figure in figures {
        if type(figure) != dictionary {
          panic("error: figure must be a dictionary.")
        }

        // Check if figure-content is given and is a valid type
        if "figure-content" in figure {
          if type(figure.at("figure-content")) not in (image, table, raw) {
            panic("error: figure-content must be an image, table or raw function.")
          }
        } else {
          panic("error: figure-content is missing.")
        }

        // Check if figure-caption is given and is a valid type
        if "figure-caption" in figure {
          if type(figure.at("figure-caption")) not in (str, content) {
            panic("error: figure-caption must be a string or content block.")
          }
        }
      }
    }
  }
}

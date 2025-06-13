#let validate-contact(contact: none, contact-type: none) = {
  if type(contact) == dictionary {
    // Check if name is given and is a valid type
    if "name" in contact {
      if type(contact.at("name")) == str {
        if contact.at("name") == "" {
          panic(contact-type + " name is empty.")
        }
      } else {
        panic(contact-type + " name must be a string.")
      }
    } else {
      panic(contact-type + " name is missing.")
    }

    // Check if address is given and is a valid type
    if "address" in contact {
      if type(contact.at("address")) == content {
        if contact.at("address") == "" {
          panic(contact-type + "'s address is empty.")
        }
      } else {
        panic(contact-type + " address must be a content block.")
      }
    } else {
      panic(contact-type + " address is missing.")
    }
  } else {
    panic(contact-type + " details must be a dictionary.")
  }
}

#let validate-string(string-data: none, field-name: none) = {
  if type(string-data) not in (str, content) {
    panic(field-name + " must be a string or content block.")
  } else {
    if string-data == "" {
      panic(field-name + " is empty.")
    }
  }
}

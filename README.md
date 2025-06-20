# The `letterloom` Package
<!-- markdownlint-disable MD033 -->
<div align="center">Version 0.1.0</div>

The `letterloom` package is a user-friendly, highly customizable template for creating
professional letters with ease.

## Getting Started

These instructions will get you a copy of the project up and running on the Typst web app.

```typ
#import "@preview/letterloom:0.1.0": *

#show: letterloom.with(
  // Sender
  from: (
    name: "Sender's Name",
    address: [Sender's Address]
  ),
  // Receiver
  to: (
    name: "Receiver's Name",
    address: [Receiver's Address]
  ),
  // Date
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
  // Salutation
  salutation: "Dear Receiver's Name,",
  // Subject
  subject: "Subject",
  // Closing
  closing: "Yours sincerely,",
  // Signatures
  signatures: (
    (
      name: "Sender's Name",
      // signature: image() // Add your signature image here
    )
  )
)

// Write the body of your letter here
```

### Installation

Follow these steps to set up your development environment and prepare for contributing to the project:

**Typst:** Install Typst (version 0.13.0 or higher) using the [official installation instructions](https://github.com/typst/typst?tab=readme-ov-file#installation). Typst is required to work with the core functionality of the project.

**Just:** Install [Just](https://just.systems/man/en/introduction.html), a handy command runner for executing predefined tasks. You can install it using a package manager or by downloading a pre-built binary. Refer to the [available packages](https://just.systems/man/en/packages.html) for installation instructions specific to your operating system.

**tytanic:** Install [tytanic](https://tingerrr.github.io/tytanic/index.html), a library essential for testing and working with Typst projects. Use the [quickstart installation guide](https://tingerrr.github.io/tytanic/quickstart/install.html) to get it up and running.

**Clone the Repository:** Download the project's source code by cloning the repository to your local machine:

```bash
git clone https://github.com/nandac/letterloom.git
```

Once you have completed these steps, your development environment will be ready.

### Next Steps

The `letterloom` package source code is located at:

```plaintext
src/lib.typ
```

This is where you will make any necessary changes to the module.

### Running Tests

To test the functionality of the module locally, run the predefined test cases using the following command:

```bash
just test
```

To create a test for a new feature added to this package, use the following command to set up a dedicated directory for the test under the tests folder:

```bash
tt new <test-case-name>
```

Ensure that all tests pass before submitting any changes to maintain the project's integrity.

If you want to test the module with a Typst file, you can install the `letterloom` package locally in the `preview` location by running:

```bash
just install-preview
```

Once installed, you can import the package into your Typst file using the following statement:

```typ
#import "@preview/letterloom:0.1.0": *
```

This setup allows you to experiment with the package in a Typst file before finalizing your changes.

## Usage

Below is an example demonstrating how to create a letter using the `letterloom` package with the minimum required arguments:

```typ
#show: letterloom.with(
  from: (
    name: "The Dimbleby Family",
    address: [The Lodge \
              Cheswick Village \
              Middle Upton \
              Bristol BS16 1GU]
  ),
  to: (
    name: "Evergreen Tree Surgeons",
    address: [Midtown Lane \
              Cheswick Village \
              Stoke Gifford \
              Bristol BS16 1GU]
  ),
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
  salutation: "Dear Mr Hawthorne",
  subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
  closing: "Sincerely yours,",
  signatures: (
    (
      name: "Lord Albus Dimbleby",
      signature: image("images/albus-sig.png")
    ),
    (
      name: "Lady Abigail Dimbleby",
      signature: image("images/abigail-sig.png")
    ),
    (
      name: "Sir Austin Dimbleby",
      signature: image("images/austin-sig.png")
    )
  )
)

We are writing to request you to visit The Lodge at the Dimbleby Estate in Cheswick Village to assess a stand of lordly Heritage Oak Trees that have stood the test of time, but whose strength might have been compromised by the wild squall that ripped through the region last week. We are keen to avoid any danger to passers by from weakened roots, branches, and sundry debris.

Your specific task would be to render the grove safe to human traffic while at the same time minimizing the residual damage to the trees. You would, of course, also undertake to clear the area thereafter.

Since this estate is jointly owned by the Dimbleby family, the signatures of all three of us appear in this letter to avoid any legal wrangles in the future.

Kindly contact our Head Groundsman, Mr Jethro Tull, on 0117-12345678. to fix an appointment to view the trees and give a quotation for the contemplated work.

Thank you kindly.
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./thumbnail-dark.svg">
  <img src="./thumbnail-light.svg" alt ="">
</picture>

For a comprehensive overview of all available options, and usage instructions we highly recommend consulting the package’s official manual. The manual offers explanations and examples to help you harness the full potential of the `letterloom` package.

## Acknowledgments

Special thanks to the Typst community on [Discord](https://discord.com/channels/1054443721975922748/1069937650125000807) for their invaluable assistance and support during the development of this package.

#import "/src/lib.typ": *

template()

// // Receiver
// #let to = (
//   name: "Evergreen Tree Surgeons",
//   address: [Midtown Lane \
//             Cheswick Village \
//             Stoke Gifford \
//             Bristol BS16 1GU]
// )

// // Supports a maximum of three signatures
// #let signatures = (
//   (
//     name: "Lord Albus Dimbleby"
//   )
// )

// #assert.eq(
//   catch(() => (
//   letterloom(
//     from: none,
//     to: to,
//     date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
//     salutation: "Gentlemen,",
//     subject: text(weight: "bold")[#smallcaps("Pruning of Heritage Oak Trees in the Dimbleby Estate")],
//     closing: "Sincerely yours,",
//     signatures: signatures
//   )),
//   "panicked with: \"error: sender details are missing.\"")
// )

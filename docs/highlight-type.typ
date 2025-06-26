/// highlight-type
///
/// Purpose:
/// Provides a collection of styled type highlighters for use in
/// documentation that matches the highlighting used in Typst's documentation.
/// Each type is highlighted with a distinct color scheme to improve readability
/// and visual distinction between different data types in code examples.
///
/// Usage:
/// This module defines a dictionary of highlight functions that can be used to
/// style type names in documentation. Each highlight function applies a specific
/// background color and styling to make type names visually distinct.
///
/// Parameters:
/// - radius: 4pt - The corner radius for the highlight background
/// - extent: 4pt - The padding around the text in the highlight
///
/// Examples:
/// ```typ
/// #import "highlight-type.typ": highlight-type
///
/// // Highlight different types
/// #highlight-type.str[String type]
/// #highlight-type.bool[Boolean type]
/// #highlight-type.function[Function type]
/// ```
///
/// Available Types:
/// - alignment: Light blue highlight for alignment types
/// - array: Light purple highlight for array types
/// - auto-type: Light red highlight for auto types
/// - bool: Light yellow highlight for boolean types
/// - color: Gradient highlight for color types
/// - content: Light teal highlight for content types
/// - dictionary: Light purple highlight for dictionary types
/// - function: Light blue-purple highlight for function types
/// - length: Light yellow highlight for length types
/// - none-type: Light red highlight for none types
/// - relative: Light yellow highlight for relative types
/// - str: Light green highlight for string types
///

#let radius = 4pt
#let extent = 4pt

#let highlight-type = (
  alignment: highlight(fill: rgb("#a6eaff"), radius: radius, extent: extent)[`alignment`],
  array: highlight(fill: rgb("#fce0ff"), radius: radius, extent: extent)[`array`],
  auto-type: highlight(fill: rgb("#ffd1ca"), radius: radius, extent: extent)[`auto`],
  bool: highlight(fill: rgb("#ffecbf"), radius: radius, extent: extent)[`bool`],
  color: highlight(
    fill: gradient.linear(
      angle: 7deg,
      (rgb("#7cd5ff"), 0%),
      (rgb("#a6fbca"), 33%),
      (rgb("#fff37c"), 66%),
      (rgb("#ffa49d"), 100%)
    ), radius: radius, extent: extent)[`color`],
  content: highlight(fill: rgb("#a6ebe5"), radius: radius, extent: extent)[`content`],
  dictionary: highlight(fill: rgb("fce0ff"), radius: radius, extent: extent)[`dictionary`],
  function: highlight(fill: rgb("#d1d4fd"), radius: radius, extent: extent)[`function`],
  length: highlight(fill: rgb("#ffecbf"), radius: radius, extent: extent)[`length`],
  none-type: highlight(fill: rgb("#ffd1ca"), radius: radius, extent: extent)[`none`],
  relative: highlight(fill: rgb("#ffecbf"), radius: radius, extent: extent)[`relative`],
  str: highlight(fill: rgb("#d1ffe2"), radius: radius, extent: extent)[`str`],
)

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

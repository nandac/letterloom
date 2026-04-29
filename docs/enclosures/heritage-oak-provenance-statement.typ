// Global Styles
#set page(margin: 20mm)
#set text(size: 11pt, font: "Libertinus Serif")
#set par(spacing: 1.5em)
#set strong(delta: 200)

//Customize appearance
#show raw: set text(font: "DejaVu Sans Mono")
#show raw.where(block: true): set block(fill: rgb("#faebd7"), inset: 1em, radius: 0.5em, width: 100%)
#show link: set text(fill: blue)

// Text Element configuration
#show heading.where(level: 1): h1 => {
  set block(above: 2em, below: 1.5em)
  set text(weight: "bold")
  h1
}

#show heading.where(level: 2): h2 => {
  set block(above: 2em, below: 1.5em)
  set text(weight: "bold")
  h2
}

#show heading.where(level: 3): h3 => {
  set block(above: 2em, below: 1.5em)
  set text(weight: "bold")
  h3
}

// Table and figure configuration
#show table.header: set text(weight: "bold")
#show figure: set block(breakable: true)

#align(center)[
  #block(fill: rgb("#fff3cd"), inset: 8pt, radius: 4pt)[
    #text(size: 9pt)[*Disclaimer:* #text(style: "italic")[This document is entirely fictitious and is provided solely as a usage example for the `letterloom` package.]]
  ]
]

#align(center)[= Heritage Oak Provenance Statement]

#grid(
  columns: 2,
  row-gutter: 8pt,
  column-gutter: 20pt,
  [*Reference:* DEPS-2026-OAK-001],
  [*Date:* 14 March 2026],
  [*Site:* Dimbleby Estate, Middle Upton, Bristol BS16 1GU],
  [*Prepared for:* The Dimbleby Family],
  [*Species:* English Oak (_Quercus robur_)],
  [*Specimens:* OT-01 to OT-06 (six trees)],
)

== Introduction

This statement establishes the provenance of six English Oak (_Quercus robur_) specimens growing on the eastern boundary of the Dimbleby Estate, Middle Upton, Bristol. It has been prepared at the request of the Dimbleby family in connection with a proposed programme of arboricultural works and provides a formal record of the trees' origin, lineage, and historical continuity for the purposes of heritage assessment and legal documentation.

The trees are assessed as being of native English provenance, locally sourced, and in continuous presence on the estate for a minimum of three centuries. This conclusion is supported by converging lines of documentary, cartographic, morphological, and dendrochronological evidence, each described in the sections that follow.

== Methodology

Provenance was established through four complementary lines of enquiry:

+ *Archival research.* The Dimbleby family archive was examined in full, with attention to estate ledgers, correspondence, and land management records from the 17th century onwards. The Upton Vale County Archive and the Middle Upton Heritage Environment Register were also consulted for independent corroboration.

+ *Cartographic analysis.* Cheswick County Survey maps, tithe maps, and privately commissioned estate surveys spanning the period 1720 to 1980 were examined to establish the continuous presence and stable position of the woodland stand.

+ *Morphological assessment.* Each specimen was examined in the field in February 2026. Leaf morphology, acorn and cupule characteristics, bark texture, and growth habit were assessed against published taxonomic descriptions of native _Quercus robur_ populations in south-west England.

+ *Dendrochronological estimation.* Girth measurements at 1.5 m above ground level were used in conjunction with published growth rate data for native oak in comparable woodland conditions to estimate the age of each specimen. No core sampling was undertaken, as the trees are of recognised heritage significance.

== Historical Provenance

Estate records held in the Dimbleby family archive provide a continuous documentary chain from the late 17th century to the present. The earliest relevant entry appears in a land management ledger dated 1678, during the tenure of Sir Edmund Dimbleby, which records the planting of "great oaks along the southern ride and the western paddock boundary." A subsequent entry from 1694 documents the collection of acorns from "the ancient wood at Cheswick Common" for propagation at the estate nursery, directly indicating a local seed source within the Cheswick Village catchment.

An estate survey map prepared circa 1720 depicts a continuous belt of young woodland along the eastern boundary, consistent in position and extent with the six specimens under consideration. This map, held at the Upton Vale County Archive, constitutes independent corroboration of the estate ledger entries and confirms that planting was well established within a generation of the 1678 record.

The tithe apportionment map of 1841, also held at the Upton Vale County Archive, records "mature oak timber" in the same location, indicating that by the mid-19th century the trees had reached full maturity and were recognised as a significant estate feature. A photographic survey commissioned by the Dimbleby family in 1923 provides visual confirmation, showing specimens of girth and form directly comparable to those measured in February 2026.

Taken together, these sources establish an unbroken record of native oak presence on this site spanning approximately 348 years. The consistency of the documentary chain, supported by independent archival sources, provides high confidence in the trees' native, locally sourced origin.

== Morphological Assessment and Age Estimation

Each of the six specimens was assessed in the field against the taxonomic criteria for native _Quercus robur_. All trees display sessile acorns borne on elongated peduncles of 3–7 cm, deeply lobed leaves with pronounced auriculate bases, and furrowed grey-brown bark of a texture consistent with advanced age in native stands. No characteristics indicative of non-native provenance, hybrid origin, or cultivar selection were observed. Leaf morphology, acorn characteristics, and growth habit are uniform across all six specimens, consistent with a single-origin, locally sourced population.

#figure(
  table(
    columns: (auto, auto, auto, auto),
    table.header[Tree Ref][Girth at 1.5 m (cm)][Estimated Age (years)][Provenance Confidence],
    [OT-01], [312], [290-320], [High],
    [OT-02], [287], [270-300], [High],
    [OT-03], [341], [310-350], [High],
    [OT-04], [298], [280-310], [High],
    [OT-05], [265], [250-280], [High],
    [OT-06], [319], [290-330], [High],
  ),
  caption: [Field measurements and dendrochronological age estimates, February 2026.],
)

Age estimates are derived from girth measurements using a mean annual radial increment of 2.5 mm, consistent with published growth rate data for native _Quercus robur_ grown in open woodland conditions in south-west England (White, 1998). All six specimens fall within the age range consistent with establishment from the 1678-1694 planting records, providing morphological corroboration of the documentary evidence.

== Documentary Evidence Summary

#figure(
  table(
    columns: (auto, auto, auto, auto),
    table.header[Source][Date][Type][Repository],
    [Dimbleby estate land management ledger], [1678], [Primary manuscript], [Dimbleby Family Archive],
    [Dimbleby estate nursery record], [1694], [Primary manuscript], [Dimbleby Family Archive],
    [Dimbleby estate survey map], [c. 1720], [Cartographic], [Upton Vale County Archive],
    [Tithe apportionment map, Middle Upton], [1841], [Cartographic], [Upton Vale County Archive],
    [Dimbleby Estate photographic survey], [1923], [Photographic], [Dimbleby Family Archive],
    [MUHER record], [2019], [Heritage register], [MUHER],
  ),
  caption: [Primary sources consulted in the preparation of this statement.],
)

== Declaration

I confirm that the information contained in this statement has been compiled from direct field observation, primary archival sources, and published reference data, and that it represents an accurate and impartial assessment of the provenance of the six oak specimens at the Dimbleby Estate to the best of my professional knowledge and judgement.

#v(1em)

#grid(
  columns: (auto, 1fr),
  gutter: 6pt,
  [*Prepared by:*], [Mr Sebastian Oakley, MA, Dip. WP, FSWPC],
  [*Position:*], [Woodland Historian and Provenance Consultant],
  [*Qualifications:*], [MA History of the Landscape (Upton Vale); Diploma in Woodland Provenance Studies (BWHA); Fellow of the Society of Woodland Provenance Consultants],
  [*For:*], [The Dimbleby Estate],
  [*Date:*], [14 March 2026],
  [*Signature:*], [#align(left, image("sebastian-oakley-sig.png", width: 30%))],
)

== References

Hartwell, G. (1998). _Estimating the Age of Large and Veteran Trees in Britain_. Woodland Research Institute Technical Note 12. Bristol: Woodland Research Institute.

Ashbourne, R. S. (ed.) (1991). _British Plant Communities, Volume 1: Woodlands and Scrub_. Upton Vale: Ridgeway Academic Press.

Fernshaw, C. (2019). _New Flora of the British Isles_ (4th ed.). Barleycorn Press.

Oakfield Timber Research Association (2002). _Identifying Native Hardwoods: A Field Guide_. Cheswick: OTRA.

Middle Upton Heritage Environment Register (2019). _HER Record for Cheswick Common Ancient Woodland_. Middle Upton District Council.

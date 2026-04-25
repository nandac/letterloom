// Global Styles
#set page(margin: 25mm)
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

#align(center)[= Oak Tree Provenance Statement]

Location: Dimbleby Estate \
Species: English Oak (Quercus robur) \
Date: 14 March 2026 \

The oak trees on The Dimbleby Estate are of native English provenance, characteristic of traditional estate woodland in this region of Middle Upton, Bristol. Historical records and planting patterns indicate that these oaks were established as part of the original estate landscape design, dating from approximately the mid to late 17th century.

The trees are believed to have been grown from locally collected acorns, in keeping with 17th-century estate practice, which favoured the use of indigenous seed sources to preserve regional genetic integrity and ensure adaptation to local soil and climatic conditions.

The oaks display the typical form and habit of _Quercus robur_, with growth characteristics consistent with long-established native stands. Their lineage contributes to the ecological and historical continuity of the Dimbleby Estate's landscape and represents a living record of its natural heritage.

== Historical Background

Estate records held in the Dimbleby family archive make reference to the planting of "great oaks along the southern ride and the western paddock boundary" in a ledger entry dated 1678, during the tenure of Sir Edmund Dimbleby. A further entry from 1694 notes the collection of acorns from "the ancient wood at Cheswick Common" for propagation at the estate nursery, strongly suggesting a local seed source for the present stand.

By the early 18th century, survey maps of the estate depict a continuous belt of woodland along the eastern boundary consistent in position with the trees now under consideration. A tithe map of 1841 confirms the presence of "mature oak timber" in the same location, and a photographic survey commissioned in 1923 shows specimens of comparable girth and form to those standing today.

The trees have therefore been in continuous presence on the estate for at minimum three centuries, and the weight of documentary evidence supports a native, locally sourced origin.

== Species Assessment

Each specimen was assessed in the field by a qualified arborist in February 2026. All trees present the distinguishing features of Quercus robur: sessile acorns borne on long peduncles, deeply lobed leaves with auriculate bases, and furrowed grey-brown bark consistent with advanced age.

#figure(
  table(
    columns: (auto, auto, auto, auto),
    table.header[Tree Ref][Girth at 1.5 m (cm)][Estimated Age (years)][Condition],
    [OT-01], [312], [290–320], [Good],
    [OT-02], [287], [270–300], [Good],
    [OT-03], [341], [310–350], [Fair — crown reduction advised],
    [OT-04], [298], [280–310], [Good],
    [OT-05], [265], [250–280], [Good],
    [OT-06], [319], [290–330], [Fair — basal cavity present],
  ),
  caption: [Field measurements and condition ratings, February 2026.],
)

No evidence of non-native cultivars or hybrid specimens was detected. Leaf morphology, acorn characteristics, and growth habit are consistent across all six trees, supporting a single-origin provenance within a locally native population.

== Ecological Significance

The trees support a rich assemblage of associated species. Lichen surveys conducted in autumn 2025 recorded fourteen species of epiphytic lichen on the older specimens, including three indicator species of ancient woodland continuity: Lobaria pulmonaria, Usnea florida, and Ramalina fraxinea. The presence of these slow-colonising species corroborates the trees' antiquity and the ecological stability of the site.

Bat activity surveys carried out under licence in summer 2025 recorded roost use by common pipistrelle (Pipistrellus pipistrellus) and brown long-eared bat (Plecotus auritus) in the cavity of OT-06. The veteran status of this tree requires that any future management work be scheduled outside the active roosting season and carried out under appropriate ecological supervision.

The oaks collectively provide habitat for numerous invertebrate species, including several saproxylic beetles associated with decaying heartwood, and represent a significant resource for nesting birds on the estate.

== Recommendations

Given the provenance, age, and ecological value of these trees, the following is recommended:

+ *Retain all six specimens* in perpetuity as part of the estate's natural heritage. Felling should not be considered unless a tree presents an immediate safety risk that cannot be mitigated by other means.
+ *Commission a full veteran tree survey* of OT-03 and OT-06 within the next twelve months to assess structural integrity and inform a proportionate management plan.
+ *Establish a 15-metre root protection zone* around each tree, within which ground disturbance, soil compaction, and construction activity should be prohibited.
+ *Record the trees on the Ancient Tree Inventory* maintained by the Woodland Trust, in recognition of their age and ecological significance.
+ *Undertake periodic monitoring* on a five-year cycle, with photographic records maintained in the estate archive.

== Declaration

I confirm that the information contained in this statement is accurate to the best of my knowledge and has been compiled from direct observation, estate records, and specialist survey data.

Prepared by: Mr Jethro Tull \
Position: Head Groundsman \
For: The Dimbleby Estate \
Date: 14 March 2026

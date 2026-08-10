# Cross-Source Synthesis

Compare physical objects and conclusions without flattening source-local notation or hiding incompatible assumptions.

Use stable synthesis IDs such as `Y-001`. The narrow index is for navigation; each keyed synthesis entry contains the comparison details. `SYNTHESIS.md` is also the canonical owner of the general Relation registry; `NOTATION-CROSSWALK.md` remains the owner only of source-local notation entries.

## Synthesis index

| Synthesis ID | Object or problem | Source IDs | Status |
| --- | --- | --- | --- |
| Y-001 |  |  | Draft, verified, disputed, or blocked |

## Relation registry

Relations use typed endpoints, so neither endpoint is required to be a notation entry. Each endpoint type must be exactly one of: `notation entry`, `physical object`, `assumption`, `method`, `claim`, `result`, `theorem`, or `code object`. Each endpoint records a stable ID or a canonical source anchor; record both when both exist.

Use exactly one of these six complete Relation types:

1. `same object, different notation`
2. `same notation, different object`
3. `equivalent only under stated assumptions`
4. `alternative approximation or renormalization scheme`
5. `apparent contradiction requiring resolution`
6. `historical or pedagogical restatement`

No shorthand or alternative taxonomy value is valid as a Relation type. Put finer distinctions in notes.

### Relation index

| Relation ID | Left endpoint type | Right endpoint type | Relation type | Status |
| --- | --- | --- | --- | --- |
| REL-000001 |  |  | One exact six-class display name above | Proposed, verified, disputed, or superseded |

### Relation entries

Copy this subsection for every stable Relation ID.

#### REL-000001

- **Relation ID:** REL-000001
- **Relation type:** one exact six-class display name above
- **Status:** proposed, verified, disputed, or superseded
- **Assumptions required:**
- **Comparison or translation map:**
- **Differences that remain:**
- **Notes that are not Relation types:**
- **Open Question IDs, when unresolved:**

##### Left endpoint

- **Endpoint type:** notation entry, physical object, assumption, method, claim, result, theorem, or code object
- **Stable ID, when available:**
- **Canonical source anchor, when no stable ID exists or provenance is needed:** source ID, version, exact location, role, and provenance
- **Canonical Obsidian link, when available:**

##### Right endpoint

- **Endpoint type:** notation entry, physical object, assumption, method, claim, result, theorem, or code object
- **Stable ID, when available:**
- **Canonical source anchor, when no stable ID exists or provenance is needed:** source ID, version, exact location, role, and provenance
- **Canonical Obsidian link, when available:**

##### Relation evidence anchors

| Source ID | Version | Exact location | Role | Provenance |
| --- | --- | --- | --- | --- |
|  |  |  | Left endpoint, right endpoint, assumption, or comparison | Source, Reconstructed, Inference, or Unresolved |

## Synthesis entries

Copy the following subsection for each object, physical problem, or theorem comparison.

### Y-001

- **Object or problem:**
- **Hamiltonian, action, ensemble, observable, theorem, or code scope:**
- **Question this comparison answers:**

#### Source record S1

Copy this source-record subsection once per compared source.

| Field | Value |
| --- | --- |
| Stable source ID | S1 |
| Version |  |
| Exact location |  |
| Role in comparison |  |
| Provenance | Source, Reconstructed, Inference, or Unresolved |
| Assumptions |  |
| Method |  |
| Approximation, regulator, expansion parameter, or limit |  |
| Result or conclusion |  |
| Validity regime |  |

#### Relation references

Reference the canonical Relation registry above. Do not copy endpoint data, type, assumptions, or status into a synthesis entry.

| Relation ID | Canonical Relation Obsidian link | Role in this synthesis |
| --- | --- | --- |
| REL-000001 | [[SYNTHESIS#REL-000001]] |  |

#### Assumption map and result

- **Starting source statements:**
- **Assumptions required for the relation:**
- **Translation, comparison, or derivation steps:**
- **Compared result:**
- **Shared validity regime, if any:**
- **What fails or becomes non-comparable outside that regime:**
- **Missing evidence or open-question IDs:**
- **Synthesis status:** Draft, verified, disputed, or blocked

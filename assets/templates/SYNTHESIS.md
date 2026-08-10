# Cross-Source Synthesis

> Bootstrap placeholder policy: {{...}} are inert schema placeholders, not registered entities. After bootstrap, any unfilled repeated entry or row remains schema-only and explicitly PENDING; it must not be interpreted as a record. A stable ID exists only after the applicable allocation protocol replaces the placeholder.

Compare physical objects and conclusions without flattening source-local notation or hiding incompatible assumptions.

Use stable synthesis IDs such as `{{SYNTHESIS_ID}}`. The narrow index is for navigation; each keyed synthesis entry contains the comparison details. `SYNTHESIS.md` is also the canonical owner of the general Relation registry, including the assumptions required for each Relation to hold; `NOTATION-CROSSWALK.md` remains the owner only of source-local notation entries.

## Synthesis index

| Synthesis ID | Object or problem | Source IDs | Status |
| --- | --- | --- | --- |
| {{SYNTHESIS_ID}} |  |  | PENDING, draft, verified, disputed, or blocked |

## Relation registry

Relations use typed endpoints. Except where the selected Relation type imposes the stricter notation gate below, neither endpoint is generally required to be a notation entry. Each endpoint type must be exactly one of: `notation entry`, `physical object`, `assumption`, `method`, `claim`, `result`, `theorem`, or `code object`. Each endpoint records a stable ID or a canonical source anchor; record both when both exist.

Use exactly one of these six complete Relation types:

1. `same object, different notation`
2. `same notation, different object`
3. `equivalent only under stated assumptions`
4. `alternative approximation or renormalization scheme`
5. `apparent contradiction requiring resolution`
6. `historical or pedagogical restatement`

No shorthand or alternative taxonomy value is valid as a Relation type. Put finer distinctions in notes.

Minimum endpoint compatibility rules:

- `same object, different notation` and `same notation, different object` require both endpoints to be `notation entry` records. Each endpoint must identify its Notation Entry ID and its own Source ID, stable version key, and exact location. Never use either notation Relation type for a non-notation endpoint.
- `equivalent only under stated assumptions` requires comparable objects, claims, results, theorems, methods, or code objects and a complete canonical assumption map.
- `alternative approximation or renormalization scheme` permits method, assumption, claim, result, physical-object, or code-object endpoints and requires the differing approximation or scheme to be identified.
- `apparent contradiction requiring resolution` requires endpoints that express conflicting claims, results, theorems, or source statements and records the evidence needed for resolution.
- `historical or pedagogical restatement` requires evidence that the later endpoint is a historical or pedagogical presentation of the earlier one.

### Relation index

| Relation ID | Left endpoint type | Right endpoint type | Relation type | Status |
| --- | --- | --- | --- | --- |
| {{RELATION_ID}} |  |  | One exact six-class display name above | PENDING, proposed, verified, disputed, or superseded |

### Relation entries

Copy this subsection for every stable Relation ID.

#### {{RELATION_ID}}

- **Relation ID:** {{RELATION_ID}}
- **Relation type:** one exact six-class display name above
- **Status:** proposed, verified, disputed, or superseded
- **Assumptions required:**
- **Supersedes Relation ID:**
- **Superseded by Relation ID:**
- **Comparison or translation map:**
- **Differences that remain:**
- **Notes that are not Relation types:**
- **Open Question IDs, when unresolved:**

##### Left endpoint

- **Endpoint type:** notation entry, physical object, assumption, method, claim, result, theorem, or code object
- **Stable ID, when available:**
- **Canonical source anchor, required for notation endpoints and whenever provenance is needed:** source ID, stable version key, exact location, role, and provenance
- **Canonical Obsidian link, when available:**

##### Right endpoint

- **Endpoint type:** notation entry, physical object, assumption, method, claim, result, theorem, or code object
- **Stable ID, when available:**
- **Canonical source anchor, required for notation endpoints and whenever provenance is needed:** source ID, stable version key, exact location, role, and provenance
- **Canonical Obsidian link, when available:**

##### Relation evidence anchors

| Source ID | Stable version key | Exact location | Role | Provenance |
| --- | --- | --- | --- | --- |
|  |  |  | Left endpoint, right endpoint, assumption, or comparison | Source, Reconstructed, Inference, or Unresolved |

## Synthesis entries

Copy the following subsection for each object, physical problem, or theorem comparison.

### {{SYNTHESIS_ID}}

- **Object or problem:**
- **Question this comparison answers:**

#### Source record {{SOURCE_ID}}

Copy this source-record subsection once per compared source.

| Field | Value |
| --- | --- |
| Stable source ID | {{SOURCE_ID}} |
| Stable version key | {{SOURCE_VERSION_KEY}} |
| Immutable revision anchor | Git commit; or read-only snapshot path, content hash, and received date |
| Exact location |  |
| Role in comparison |  |
| Provenance | Source, Reconstructed, Inference, or Unresolved |
| System and degrees of freedom |  |
| Hamiltonian, action, or theorem basis |  |
| Ensemble and physical state |  |
| Boundary and initial conditions |  |
| Symmetries, conservation laws, and symmetry assumptions |  |
| Source-local assumptions, not a Relation definition |  |
| Method |  |
| Approximation, regulator or renormalization scheme, expansion parameter, or limit |  |
| Discretization and truncation |  |
| Observable, theorem, or implementation target |  |
| Result or conclusion |  |
| Validity regime |  |

#### Relation references

Reference the canonical Relation registry above. Do not copy endpoint data, type, assumptions, or status into a synthesis entry.

| Relation ID | Canonical Relation Obsidian link | Role in this synthesis |
| --- | --- | --- |
| {{RELATION_ID}} | {{OBSIDIAN_LINK}} |  |

#### Application map and result

- **Starting source statements:**
- **Canonical Relation assumption map:** link the Relation heading above; do not copy its assumptions into this synthesis entry
- **Additional application conditions for this synthesis, not part of the Relation definition:**
- **Translation, comparison, or derivation steps:**
- **Compared result:**
- **Shared validity regime, if any:**
- **What fails or becomes non-comparable outside that regime:**
- **Missing evidence or open-question IDs:**
- **Synthesis status:** Draft, verified, disputed, or blocked

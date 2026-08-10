# Notation Crosswalk

Preserve the notation of each source. `NOTATION-CROSSWALK.md` is the exclusive canonical owner of source-local notation entries. General cross-source Relations, including Relations whose endpoints are not notation and the assumptions required for those Relations to hold, are owned by the Relation registry in `SYNTHESIS.md`. This file links relevant Relation IDs and stores only brief noncanonical counterpart and assumption mirrors; when a mirror conflicts with the linked Relation, `SYNTHESIS.md` is canonical.

Use stable notation entry IDs such as `N-S1-001`. Never renumber an ID after another file links to it. The narrow index is for navigation; the keyed entry is canonical. Escape a literal vertical bar when it appears inside a Markdown table value.

## Notation entry index

| Entry ID | Short label | Source ID | Status |
| --- | --- | --- | --- |
| N-S1-001 |  | S1 | Draft, verified, ambiguous, or superseded |

## Notation entries

Copy the following subsection for every source-local symbol or meaning-changing decorated form.

### N-S1-001

| Field | Value |
| --- | --- |
| Entry ID | N-S1-001 |
| Glyph exactly as written |  |
| Read as |  |
| Mathematical type |  |
| Domain |  |
| Index ranges |  |
| Physical meaning |  |
| Units or dimensions |  |
| Stable source ID | S1 |
| Stable source version key | S1-V001 |
| Exact source location |  |
| Sign, metric, Fourier-transform, normalization, natural-unit, boundary, and operator conventions |  |
| Meaning of hats, bars, stars, boldface, subscripts, and superscripts |  |
| Status | Draft, verified, ambiguous, or superseded |
| Supersedes Notation Entry ID |  |
| Superseded by Notation Entry ID |  |
| Open-question ID when unresolved |  |

#### Relations to symbols or objects in other sources

Every notation entry directly records each relevant cross-source relation. Copy the following narrow block once per Relation ID. Keep this local record brief; do not copy the complete Relation registry from `SYNTHESIS.md`.

##### REL-000001

| Field | Value |
| --- | --- |
| Relation to symbol or object in another source | Briefly state what this notation entry is related to |
| Relation ID + canonical Obsidian link | REL-000001 — [[SYNTHESIS#REL-000001]] |
| Counterpart endpoint type | Notation entry, physical object, assumption, method, claim, result, theorem, or code object |
| Counterpart stable ID or canonical source anchor | Stable ID; or source ID, stable version key, exact location, role, and provenance |
| Counterpart Notation Entry ID, when applicable |  |
| Assumptions under which the relation holds | Brief assumption map plus [[SYNTHESIS#REL-000001]] |
| Canonical authority | The Relation heading [[SYNTHESIS#REL-000001]] is canonical; if this brief record conflicts with it, update this record to match `SYNTHESIS.md` |

When superseding an entry, create a new stable Notation Entry ID, fill its `Supersedes` field, and set the prior entry's `Superseded by` field without reusing or rewriting either ID.

## Related Relation references

This optional index is navigation only and does not replace the direct relation and assumption records inside each notation entry. Do not reproduce the canonical Relation type, full endpoints, assumptions, or status here.

| Notation Entry ID | Relation ID | Canonical Relation Obsidian link | Endpoint role |
| --- | --- | --- | --- |
| N-S1-001 | REL-000001 | [[SYNTHESIS#REL-000001]] | Left or right endpoint |

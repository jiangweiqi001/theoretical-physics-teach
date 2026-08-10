# Notation Crosswalk

> Bootstrap placeholder policy: {{...}} are inert schema placeholders, not registered entities. After bootstrap, any unfilled repeated entry or row remains schema-only and explicitly PENDING; it must not be interpreted as a record. A stable ID exists only after the applicable allocation protocol replaces the placeholder.

Preserve the notation of each source. `NOTATION-CROSSWALK.md` is the exclusive canonical owner of source-local notation entries. General cross-source Relations, including Relations whose endpoints are not notation and the assumptions required for those Relations to hold, are owned by the Relation registry in `SYNTHESIS.md`. This file links relevant Relation IDs and stores only brief noncanonical counterpart and assumption mirrors; when a mirror conflicts with the linked Relation, `SYNTHESIS.md` is canonical.

Use stable notation entry IDs such as `{{NOTATION_ENTRY_ID}}`. Never renumber an ID after another file links to it. The narrow index is for navigation; the keyed entry is canonical. Escape a literal vertical bar when it appears inside a Markdown table value.

## Notation entry index

| Entry ID | Short label | Source ID | Status |
| --- | --- | --- | --- |
| {{NOTATION_ENTRY_ID}} |  | {{SOURCE_ID}} | PENDING, draft, verified, ambiguous, or superseded |

## Notation entries

Copy the following subsection for every source-local symbol or meaning-changing decorated form.

### {{NOTATION_ENTRY_ID}}

| Field | Value |
| --- | --- |
| Entry ID | {{NOTATION_ENTRY_ID}} |
| Glyph exactly as written |  |
| Read as |  |
| Mathematical type |  |
| Domain |  |
| Index ranges |  |
| Physical meaning |  |
| Units or dimensions |  |
| Stable source ID | {{SOURCE_ID}} |
| Stable source version key | {{SOURCE_VERSION_KEY}} |
| Exact source location |  |
| Sign, metric, Fourier-transform, normalization, natural-unit, boundary, and operator conventions |  |
| Meaning of hats, bars, stars, boldface, subscripts, and superscripts |  |
| Status | Draft, verified, ambiguous, or superseded |
| Supersedes Notation Entry ID |  |
| Superseded by Notation Entry ID |  |
| Open-question ID when unresolved |  |

#### Relations to symbols or objects in other sources

Every notation entry directly records each relevant cross-source relation. Copy the following narrow block once per Relation ID. Keep this local record brief; do not copy the complete Relation registry from `SYNTHESIS.md`.

##### {{RELATION_ID}}

| Field | Value |
| --- | --- |
| Relation to symbol or object in another source | Briefly state what this notation entry is related to |
| Relation ID + canonical Obsidian link | {{RELATION_ID}} — {{OBSIDIAN_LINK}} |
| Counterpart endpoint type | Notation entry, physical object, assumption, method, claim, result, theorem, or code object |
| Counterpart stable ID or canonical source anchor | Stable ID; or source ID, stable version key, exact location, role, and provenance |
| Counterpart Notation Entry ID, when applicable |  |
| Assumptions under which the relation holds | Brief assumption map plus {{OBSIDIAN_LINK}} |
| Canonical authority | The Relation heading {{RELATION_ID}} — {{OBSIDIAN_LINK}} is canonical; if this brief record conflicts with it, update this record to match `SYNTHESIS.md` |

When superseding an entry, create a new stable Notation Entry ID, fill its `Supersedes` field, and set the prior entry's `Superseded by` field without reusing or rewriting either ID.

## Related Relation references

This optional index is navigation only and does not replace the direct relation and assumption records inside each notation entry. Do not reproduce the canonical Relation type, full endpoints, assumptions, or status here.

| Notation Entry ID | Relation ID | Canonical Relation Obsidian link | Endpoint role |
| --- | --- | --- | --- |
| {{NOTATION_ENTRY_ID}} | {{RELATION_ID}} | {{OBSIDIAN_LINK}} | Left or right endpoint |

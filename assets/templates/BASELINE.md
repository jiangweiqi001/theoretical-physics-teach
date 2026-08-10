# Baseline Diagnostics

> Bootstrap placeholder policy: {{...}} are inert schema placeholders, not registered entities. After bootstrap, any unfilled repeated entry or row remains schema-only and explicitly PENDING; it must not be interpreted as a record. A stable ID exists only after the applicable allocation protocol replaces the placeholder.

This file is an append-only diagnostic index with a bounded active-entry lifecycle:

1. Before asking a question, allocate a new Diagnostic ID, append its index row with status `active`, and create the matching level-2 entry containing the exact question, date, session, prerequisite, and evidence category.
2. After the learner answers, allocate the next Evidence ID through `learning-records/INDEX.md`. The same `active` entry and its index row may then be completed once: add the Evidence ID plus Obsidian link, diagnostic implication, and confidence, then change status to `finalized` or `confirmed`.
3. A `finalized` or `confirmed` entry and index row are immutable. Never overwrite, reorder, delete, or reopen them.
4. Later correction requires a new Diagnostic ID with `Supersedes Diagnostic ID` pointing to the prior entry; do not edit the prior entry.

Each entry contains one prerequisite question and one evidence category only. The canonical verbatim response, hints, and demonstrated evidence live in `learning-records/{{EVIDENCE_ID}}.md`-style records and are referenced by both Evidence ID and Obsidian link.

## Diagnostic index

| Diagnostic ID | Date | Session | Prerequisite | Evidence ID + Obsidian link | Status |
| --- | --- | --- | --- | --- | --- |
| {{DIAGNOSTIC_ID}} |  |  |  | PENDING while active; then {{EVIDENCE_ID}} — {{OBSIDIAN_LINK}} | PENDING until allocated; then active, finalized, or confirmed |

Copy the following level-2 section for every new diagnostic. Change the stable ID and append it after earlier entries.

## {{DIAGNOSTIC_ID}}

- **Diagnostic ID:** {{DIAGNOSTIC_ID}}
- **Status:** active, finalized, or confirmed
- **Date:**
- **Session:**
- **Evidence ID + Obsidian link:** PENDING while active; then {{EVIDENCE_ID}} — {{OBSIDIAN_LINK}}
- **Supersedes Diagnostic ID, if any:**
- **Prerequisite being tested:**
- **Evidence category:** explanation, derivation, proof, or computation
- **Related mission target:**
- **Source anchors:** reference the repeatable anchor table in {{EVIDENCE_ID}} — {{OBSIDIAN_LINK}} when applicable
- **One question, exactly as asked:**
- **Learner response:** link to the verbatim unaided response in {{EVIDENCE_ID}} — {{OBSIDIAN_LINK}}; do not duplicate it here
- **Observed evidence:** link to the mastery judgment in {{EVIDENCE_ID}} — {{OBSIDIAN_LINK}}; do not duplicate historical evidence here
- **Prerequisite implication:**
- **Concept Node IDs or Edge IDs affected:**
- **Next single diagnostic question, if needed:** create a new Diagnostic ID before asking it
- **Confidence in this diagnostic implication:** low, medium, or high
- **Reason for confidence:**
- **Learner self-report:** link or summarize separately; never treat it as demonstrated evidence

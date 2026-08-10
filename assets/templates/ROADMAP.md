# Learning Roadmap

> Bootstrap placeholder policy: {{...}} are inert schema placeholders, not registered entities. After bootstrap, any unfilled repeated entry or row remains schema-only and explicitly PENDING; it must not be interpreted as a record. A stable ID exists only after the applicable allocation protocol replaces the placeholder.

`ROADMAP.md` owns phase ordering, targets, exit criteria, and phase status. It never defines a prerequisite node or edge: reference stable Node IDs and Edge IDs owned by `CONCEPT-MAP.md`.

## Mastery levels

- **Level 0 — Not yet demonstrated / insufficient evidence:** no positive mastery claim is supported yet.
- **Interpretation:** explain the objects, symbols, assumptions, and physical question.
- **Reconstruction:** reproduce the central derivation or supporting proof without hidden steps.
- **Synthesis:** translate source conventions and identify assumptions that change a result.
- **Implementation:** map theory and approximations to algorithms, inputs, outputs, and validation observables when code is in scope.

The four positive mastery levels are capabilities, not a mandatory linear sequence. Set each phase target from the evidence that its mission outcome actually requires.

## Phase index

| Phase ID | Concept Node IDs | Exact source anchors | Status | Entry anchor |
| --- | --- | --- | --- | --- |
| {{PHASE_ID}} |  | {{OBSIDIAN_LINK}} | PENDING, not started, active, blocked, review, or complete | {{OBSIDIAN_LINK}} |

## Phase entries

Copy this keyed block for each stable Phase ID.

### {{PHASE_ID}}

| Field | Value |
| --- | --- |
| Phase ID | {{PHASE_ID}} |
| Phase purpose |  |
| Concept Node IDs | Resolve only through `CONCEPT-MAP.md` |
| Prerequisite Edge IDs | Resolve only through `CONCEPT-MAP.md` |
| Mastery target |  |
| Observable exit criterion |  |
| Supporting Evidence ID + Obsidian link | {{EVIDENCE_ID}} — {{OBSIDIAN_LINK}} |
| Status | Not started, active, blocked, review, or complete |

#### {{PHASE_ID}} exact source anchors

| Source ID | Stable version key | Exact location | Role | Provenance |
| --- | --- | --- | --- | --- |
|  |  |  | Phase premise, target, or comparison | Source, Reconstructed, Inference, or Unresolved |

### Phase completion gate

Do not set a phase's status to `complete` unless `Supporting Evidence ID + Obsidian link` contains at least one EV reference whose linked record satisfies that phase's exact `Observable exit criterion`. An unlinked ID, a link without an ID, progress elsewhere, or evidence for a different criterion cannot close the phase.

Do not restate node definitions, edge endpoints, dependency reasons, or learner responses here. Resolve Node IDs and Edge IDs through `CONCEPT-MAP.md`; resolve evidence through both the Evidence ID and Obsidian link registered in `learning-records/INDEX.md`.

# Learning Record

This file is a copy template, not the canonical history file. Each canonical evidence instance has the exact path pattern `learning-records/EV-000001.md`; the global index is `learning-records/INDEX.md`. Evidence instances are the exclusive canonical owner of historical learner evidence: unaided responses, self-report, hints, assisted work, mastery judgments, and evidence-caused state changes. Create one only when the learner supplied a response, self-report, or attempt; material intake, agent explanation, and planning alone do not create Evidence.

## Evidence ID allocation and index

1. If `learning-records/INDEX.md` does not exist, create it first with the append-only schema below and no data rows.
2. Read the entire index before allocating an Evidence ID.
3. Find the largest numeric suffix ever registered in any active, supersession, or tombstone event, add one, and zero-pad it to six digits. If the index has no events, begin with `EV-000001`.
4. Never reuse an Evidence ID, including after an erroneous, superseded, missing, deleted, or tombstoned record.
5. Create the immutable instance at `learning-records/EV-000001.md`, append its registration event to the global index, and use both `EV-000001` and `[[learning-records/EV-000001]]` in every reference.
6. The index is append-only: never edit or delete an earlier event row. If a record becomes unusable, append a `tombstone` event with the reason and keep its numeric suffix permanently reserved.
7. Never accumulate multiple evidence instances in one `LEARNING-RECORD.md` file. Corrections use a new Evidence ID, append a new registration event, and link the superseded Evidence ID plus Obsidian link.

The `learning-records/INDEX.md` row schema is:

| Event date and sequence | Evidence ID | Canonical Obsidian link | Status event | Date and session | Task label | Concept Node IDs | Mastery judgment | Supersedes Evidence ID + link | Tombstone reason |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  | EV-000001 | [[learning-records/EV-000001]] | registered, superseded, or tombstone |  |  |  |  |  |  |

## Evidence identity and task

- Evidence ID: EV-000001
- Canonical instance path: `learning-records/EV-000001.md`
- Canonical Obsidian link: [[learning-records/EV-000001]]
- Global index: `learning-records/INDEX.md`
- Supersedes Evidence ID + Obsidian link, if any:
- Date and session:
- Lesson ID + canonical Obsidian link:
- Task attempted:
- Evidence category: explanation, derivation, proof, source translation, computation, or implementation
- Target Concept Node IDs:
- Target capability required by the mission:

## Source anchors

Add one row for every source premise, comparison, or reconstructed step used in this evidence judgment. Copy every stable version key from the canonical keyed record in `MATERIALS.md`; never infer prior registration. If only a supplied excerpt is visible and registration cannot be completed in the current context, write `Unassigned — supplied excerpt; snapshot registration pending` or link the corresponding Open Question, and record the temporary session/excerpt locator. Do not invent a key, hash, or path.

| Source ID | Stable version key | Exact location | Role | Provenance |
| --- | --- | --- | --- | --- |
|  |  |  | Task premise, learner citation, comparison, diagnostic premise, or evidence-assessment premise | Source, Reconstructed, Inference, or Unresolved |

## Unaided response

Record the learner's first response verbatim before any hint, correction, worked example, or source reveal:

If the learner gave self-report or conversational context but no observable performance was requested, write `No observable attempt elicited` under work shown and assign level 0; do not infer a positive capability.

- Time or source access allowed:
- Work shown without assistance:
- Correct elements:
- Incorrect, missing, or uncertain elements:

## Learner self-report

Record confidence, familiarity, or perceived understanding separately. Self-report is context, not demonstrated mastery evidence.

- Confidence reported:
- Understanding claimed:
- Difference between self-report and observed performance:

## Hints and assisted response

Copy this keyed block for each hint or assisted intervention.

### Hint 1

- **Order:** 1
- **Hint, prompt, correction, or source access supplied:**
- **Response after assistance:**
- **What the assistance reveals about the gap:**

Do not merge assisted work into the unaided response.

## Evidence and mastery judgment

- Mastery level supported: level 0 — not yet demonstrated / insufficient evidence; interpretation; reconstruction; synthesis; or implementation
- Target-specific evidence requirement:
- Observable evidence demonstrated:
- Why the evidence supports that level:
- Other capabilities not demonstrated by this task:
- Remaining gap:

Level 0 makes no positive mastery claim. The four positive capability levels are not necessarily linear: evaluate only the capability and evidence required by the learner's target, without assuming that one label must precede or outrank another.

## Historical state changes caused by this evidence

Preserve each dated prior Evidence boundary explicitly: date, evidence category, exact capability demonstrated, and exact unfinished boundary. Keep prior unaided work, current self-report, and assisted work distinct. Link the prior Evidence ID and canonical Obsidian link when available; if the canonical index cannot be read, retain the supplied date and locator without inventing an ID.

- Previous active snapshot summary or prior Evidence ID + Obsidian link:
- Atomic `CURRENT-STATE.md` replacement caused by this evidence:
- `ROADMAP.md` Phase IDs whose status changed:
- `CONCEPT-MAP.md` Node IDs or Edge IDs changed:
- Lesson ID + section Obsidian link patched:
- `REVIEW-QUEUE.md` Review IDs added, updated, or removed:
- Notation Entry IDs, Relation IDs, Synthesis IDs, or Open Question IDs changed:

## Code map references

Reference maps by stable ID and canonical Obsidian link; do not copy their content into the evidence record.

| Code Map ID | Canonical Obsidian link | Scope | Role in this evidence |
| --- | --- | --- | --- |
| CMAP-L-000001-001 | [[lessons/L-000001#CMAP-L-000001-001]] | Lesson-local |  |
| CMAP-GLOBAL-0001 | [[reference/code-maps/CMAP-GLOBAL-0001]] | Shared architecture |  |

## Execution record references

Reference runtime claims by immutable Run ID and canonical link. Execution records do not replace learner Evidence and do not change the four source-provenance labels.

| Run ID | Canonical Obsidian link | Execution evidence class | Role in this learner evidence |
| --- | --- | --- | --- |
| RUN-000001 | [[execution-records/RUN-000001]] | Observed execution evidence or Computed execution evidence |  |

## Next observable check

- Next unaided task:
- Due condition:
- Success criterion:

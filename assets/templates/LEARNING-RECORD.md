# Learning Record

This file is a copy template, not the canonical history file. Each canonical evidence instance has the exact path pattern `learning-records/EV-000001.md`; the global index is `learning-records/INDEX.md`. Evidence instances are the exclusive canonical owner of historical learner evidence: unaided responses, self-report, hints, assisted work, mastery judgments, and evidence-caused state changes.

## Evidence ID allocation and index

1. Read `learning-records/INDEX.md` before allocating an Evidence ID.
2. Find the largest numeric suffix ever registered, add one, and zero-pad it to six digits. If the index is empty, begin with `EV-000001`.
3. Never reuse an Evidence ID, including after an erroneous, superseded, missing, or deleted record.
4. Create the immutable instance at `learning-records/EV-000001.md`, append its row to the global index, and use both `EV-000001` and `[[learning-records/EV-000001]]` in every reference.
5. Never accumulate multiple evidence instances in one `LEARNING-RECORD.md` file. Corrections use a new Evidence ID and link the superseded Evidence ID plus Obsidian link.

The `learning-records/INDEX.md` row schema is:

| Evidence ID | Canonical Obsidian link | Date and session | Task label | Concept Node IDs | Mastery judgment | Supersedes Evidence ID + link |
| --- | --- | --- | --- | --- | --- | --- |
| EV-000001 | [[learning-records/EV-000001]] |  |  |  |  |  |

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

Add one row for every source premise, comparison, or reconstructed step used in this evidence judgment.

| Source ID | Version | Exact location | Role | Provenance |
| --- | --- | --- | --- | --- |
|  |  |  | Task premise, learner citation, comparison, or evaluator basis | Source, Reconstructed, Inference, or Unresolved |

## Unaided response

Record the learner's first response verbatim before any hint, correction, worked example, or source reveal:

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
| CMAP-GLOBAL-000001 | [[reference/code-maps/CMAP-GLOBAL-000001]] | Shared architecture |  |

## Next observable check

- Next unaided task:
- Due condition:
- Success criterion:

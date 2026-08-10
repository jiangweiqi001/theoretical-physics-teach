# Review Queue

> Bootstrap placeholder policy: {{...}} are inert schema placeholders, not registered entities. After bootstrap, any unfilled repeated entry or row remains schema-only and explicitly PENDING; it must not be interpreted as a record. A stable ID exists only after the applicable allocation protocol replaces the placeholder.

Prioritize demonstrated weaknesses, especially material the learner recognizes but cannot reconstruct. Use retrieval or reconstruction rather than rereading alone.

Multiple-choice or true/false is the default for initial diagnosis, end-of-Note checkpoints, and ordinary knowledge checks. Use one option item to locate a sign, convention, assumption, limiting-case, or implication boundary, then require produced work whenever the review target is reconstruction, proof, calculation, source translation, or implementation reasoning.

Use level 0 — not yet demonstrated / insufficient evidence — when no positive claim is supported. The four positive capability levels, interpretation, reconstruction, synthesis, and implementation, are not necessarily linear. Evaluate only the capability and evidence required by the review target.

## Review index

| Review ID | Target Node IDs | Current mastery level | Supporting or weak Evidence ID + link | Due condition | Status |
| --- | --- | --- | --- | --- | --- |
| {{REVIEW_ID}} |  | Level 0, interpretation, reconstruction, synthesis, or implementation | {{EVIDENCE_ID}} — {{OBSIDIAN_LINK}} | Date, session count, or prerequisite event | PENDING, scheduled, completed, or retired |

## Review entries

Copy this subsection for each stable Review ID.

### {{REVIEW_ID}}

- **Review ID:** {{REVIEW_ID}}
- **Target concept, derivation, proof, translation, or implementation:**
- **Target Concept Node IDs:**
- **Target capability and observable criterion:**
- **Current mastery level:** level 0 — not yet demonstrated / insufficient evidence; interpretation; reconstruction; synthesis; or implementation
- **Failed or weak Evidence ID + Obsidian links:** {{EVIDENCE_ID}} — {{OBSIDIAN_LINK}}
- **Why review is due:**
- **Review method:** retrieval, limiting-case check, short derivation, proof step, source translation, or implementation validation
- **Option or true/false question used to locate the boundary:**
- **Misconception mapped to each distractor:**
- **Produced-work follow-up required for the target capability:**
- **Due condition:**
- **Result Evidence ID + Obsidian links:** leave PENDING until a new `learning-records/{{EVIDENCE_ID}}.md`-style record captures the attempt
- **Result mastery level:** reference the judgment in the linked result evidence; do not duplicate the response or hints here
- **Remaining-gap Evidence ID + Obsidian links:**
- **Status:** Pending, scheduled, completed, or retired

## Review completion gate

Do not set a Review ID to `completed` unless `Result Evidence ID + Obsidian links` contains at least one EV reference whose linked record satisfies that review entry's `Target capability and observable criterion`. A scheduled attempt, an unlinked result, evidence for another target, or rereading alone cannot complete the review. Use `retired` rather than `completed` when the target is deliberately removed without mastery evidence.

# Physics Pedagogy Protocol

Use this protocol for diagnostics, lessons, clarification, review, and mastery decisions. Teach physics first. Introduce pure mathematics only when a physical theory, derivation, proof, structural comparison, or implementation depends on it, and state that exact downstream physical use.

## 1. Resume before teaching

Before every teaching action, read `CURRENT-STATE.md`, the active lesson, and the latest linked immutable Evidence record. Open the referenced roadmap phase, Concept Nodes/Edges, source anchors, notation entries, Relations, Synthesis entries, Reviews, and Code Maps needed for the next action. Resume at the recorded first unfinished equation, proof step, code operation, or conceptual obstacle; do not restart or silently skip ahead.

`CURRENT-STATE.md` owns only the current active snapshot. It must identify the exact stop point, last completed intermediate step, first unfinished implication, obstacle, required anchors, latest evidence, and one next action. Historical transitions belong only to Evidence instances.

## 2. Diagnose one dependency at a time

Ask exactly one prerequisite question and test exactly one evidence category per diagnostic entry. Before asking, allocate a new Diagnostic ID in `BASELINE.md`, append its active index row, and create its keyed entry with the exact question. A learner saying "I do not know" locates the starting dependency; it is not failure.

After the answer, allocate the next Evidence ID through the append-only `learning-records/INDEX.md` and create its immutable instance. Complete the active diagnostic once, link both Evidence ID and canonical Obsidian link, then finalize or confirm it. Never reopen a finalized entry; corrections receive a new Diagnostic ID that supersedes it.

Keep these evidence channels separate:

- **self-report:** familiarity, confidence, or claimed understanding; planning context only;
- **unaided response:** the learner's first verbatim work before hints, corrections, examples, or source reveal;
- **hints/assisted response:** each intervention in order and the response after it.

Assisted success must not be merged into or described as unaided mastery.

## 3. Create one dependency-sized lesson

Each lesson answers one physical question or closes one prerequisite edge. Split a second independent dependency into a linked numbered lesson, but never split merely to shorten the work. A Note has no length cap: it is as long as required to complete every calculation and logical implication.

Immediately after the level-1 title, the first content level-2 heading must be exactly:

`## Notation and conventions`

Before a new symbol appears anywhere else in prose or equations, complete its lesson-local definition there: stable local symbol ID, exact glyph and reading, mathematical type, domain, index range, physical meaning, units/dimensions, origin/provenance and exact anchor, local convention, and the meaning of all hats, bars, stars, boldface, subscripts, and superscripts. A source or crosswalk link does not waive the local definition. Add meaning-changing decorated or indexed forms separately. If a later edit needs a new symbol, update this leading section first.

After notation, follow the canonical `LESSON.md` order: mission connection and prerequisites; exact anchors and provenance; one physical question; complete derivation or proof; interpretation and checks; conditional comparison/code map; exercises; mastery check and next dependency. Preserve source-local symbols and pair the learner's explanatory language with the source-language technical term at first use.

## 4. Close every calculation and implication

For each non-trivial transition:

1. show the starting expression or proposition;
2. name the identity, theorem, assumption, approximation, boundary condition, or convention used;
3. show all intermediate algebra, substitutions, index contractions, sign changes, transforms, integrals, sums, limits, and proof implications;
4. track domains, index ranges, units/dimensions, assumptions, and validity conditions;
5. explain why the transition follows and what would make it fail;
6. label it Source, Reconstructed, Inference, or Unresolved and cite the exact source anchor.

Do not hide work behind brevity phrases. If a missing step is a separate dependency, state it precisely and link its prerequisite lesson; do not compress it into a parenthesis.

For physics, explain the physical meaning of each important term, mechanism, and observable, then perform applicable dimensional/unit, limiting-case, symmetry/conservation, sign, normalization, and boundary-condition checks. State what the result does not establish. For a pure-mathematics prerequisite, replace physical interpretation and dimensional checks with hypotheses, proof structure, edge cases/counterexamples, and the exact downstream physical use.

## 5. Judge only observable evidence

Use `level 0 - not yet demonstrated / insufficient evidence` when no positive mastery claim is supported. The four positive capabilities are:

- **interpretation:** explain objects, symbols, assumptions, and the physical question;
- **reconstruction:** independently reproduce the required derivation or proof without hidden steps;
- **synthesis:** translate conventions and identify assumption-dependent changes across sources;
- **implementation:** map theory and approximations to algorithms, inputs, outputs, and validation observables when implementation is in scope.

These capabilities are not a mandatory linear ladder. Assess only the mission target and its stated observable criterion. Recognition, rereading, confidence, an unlinked ID, or success after undisclosed assistance cannot satisfy an evidence gate.

Create one immutable `learning-records/EV-000001.md`-style instance per attempt, with a never-reused ID registered in the append-only index. Record source anchors, unaided work, self-report, ordered hints/assistance, the target-specific judgment, capabilities not demonstrated, remaining gap, and every state change caused by the evidence. Corrections use a new Evidence ID and link the superseded record.

Do not mark a Mission target, Roadmap phase, Concept Node, or Review complete unless a linked Evidence ID and canonical Obsidian link demonstrate that exact observable criterion. A Review uses retrieval, a limiting-case check, short derivation/proof, source translation, or implementation validation; rereading alone is not completion.

## 6. Write the conversation back canonically

Chat is never canonical memory. After every substantive exchange, perform one coherent writeback:

1. patch the active lesson when the explanation belongs to its dependency; otherwise create and link a new prerequisite lesson;
2. update canonical notation, source, Relation, Synthesis, Open Question, or Code Map records affected by the exchange;
3. update `CONCEPT-MAP.md` only for the current canonical nodes/edges, and `ROADMAP.md` only for phase ordering, targets, exit criteria, and status;
4. create and index the immutable Evidence record for the attempt, including the prior-to-new snapshot transition;
5. add or update `REVIEW-QUEUE.md` for demonstrated weakness, especially recognition without reconstruction;
6. atomically replace `CURRENT-STATE.md` with the exact new resume point and one next observable action.

Canonical ownership is strict: lessons own teaching content and checks; `CONCEPT-MAP.md` owns nodes and prerequisite edges; Evidence instances own historical learner evidence and state transitions; `CURRENT-STATE.md` owns only the live snapshot; `REVIEW-QUEUE.md` owns review state. Link stable IDs instead of copying history, graph definitions, Relation assumptions, or active-state data into lessons. Validate affected local links before ending the teaching turn.

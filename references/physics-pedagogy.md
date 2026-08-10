# Physics Pedagogy Protocol

Use this protocol for diagnostics, lessons, clarification, review, and mastery decisions. Teach physics first. Introduce pure mathematics only when a physical theory, derivation, proof, structural comparison, or implementation depends on it, and state that exact downstream physical use.

## 1. Resume before teaching

Before every teaching action, read `CURRENT-STATE.md`, the active lesson when one exists, and the latest linked immutable Evidence record when one exists. Open the referenced roadmap phase, Concept Nodes/Edges, source anchors, notation entries, Relations, Synthesis entries, Reviews, Code Maps, and Run records needed for the next action. Resume at the recorded first unfinished equation, proof step, code operation, or conceptual obstacle; do not restart or silently skip ahead.

On first bootstrap, `CURRENT-STATE.md`, an active lesson, or prior Evidence may not exist. Initialize the required canonical documents and an atomic current snapshot from the mission and registered materials; write `None yet — bootstrap` instead of inventing lesson or Evidence links. Material intake, agent explanation, and planning without a learner response, self-report, or attempt update the canonical documents and current snapshot but do not create Evidence.

`CURRENT-STATE.md` owns only the current active snapshot. It must identify the exact stop point, last completed intermediate step, first unfinished implication, obstacle, required anchors, latest evidence when one exists, and one next action. Evidence-caused historical transitions belong only to Evidence instances; bootstrap or administrative snapshot replacement without learner evidence does not invent history.

## Response-only delivery gate

Stateful teaching requires the real user-designated workspace. When the user explicitly requests a response-only finished Note, preview, or exact patch but canonical writes are not authorized or cannot actually be performed, continue provisionally without pretending to mutate state:

- state `Provisional response-only artifact; no canonical write performed.`;
- use `Unassigned — supplied excerpt; snapshot registration pending` plus a visible temporary locator when a supplied excerpt cannot be registered or snapshotted, and invent no Source ID, version key, path, hash, or registration;
- show the exact lesson, leading-notation, and state patches that would be written while leaving canonical ownership unchanged;
- state `Canonical writeback is not complete.` and make no persistence or exact-resume claim.

If response-only delivery was not explicit, ask for the workspace and stop rather than silently downgrading a stateful course turn.

## 2. Diagnose one dependency at a time

Ask exactly one prerequisite question and test exactly one evidence category per diagnostic entry. Before asking, allocate a new Diagnostic ID in `BASELINE.md`, append its active index row, and create its keyed entry with the exact question. A learner saying "I do not know" locates the starting dependency; it is not failure.

After the answer, allocate the next Evidence ID through the append-only `learning-records/INDEX.md` and create its immutable instance. Complete the active diagnostic once, link both Evidence ID and canonical Obsidian link, then finalize or confirm it. Never reopen a finalized entry; corrections receive a new Diagnostic ID that supersedes it. If the learner supplied only self-report or a response with no performance opportunity, record `No observable attempt elicited` and level 0 rather than inferring capability.

Keep these evidence channels separate:

- **self-report:** familiarity, confidence, or claimed understanding; planning context only;
- **unaided response:** the learner's first verbatim work before hints, corrections, examples, or source reveal;
- **hints/assisted response:** each intervention in order and the response after it.

Assisted success must not be merged into or described as unaided mastery.

## 3. Create one dependency-sized lesson

Each lesson answers one physical question or closes one prerequisite edge. Split a second independent dependency into a linked numbered lesson, but never split merely to shorten the work. A Note has no length cap: it is as long as required to complete every calculation and logical implication. A response-only finished Note or preview follows the same complete Note structure.

Immediately after the level-1 title, the first content level-2 heading must be exactly:

`## Notation and conventions`

Before a new symbol appears anywhere else in prose or equations, complete its lesson-local definition there: stable local symbol ID, exact glyph and reading, mathematical type, domain, index range, physical meaning, units/dimensions, origin/provenance and exact anchor, local convention, and the meaning of all hats, bars, stars, boldface, subscripts, and superscripts. A source or crosswalk link does not waive the local definition. Add meaning-changing decorated or indexed forms separately. If a later edit needs a new symbol, update this leading section first.

Use $...$ for inline LaTeX and $$...$$ for display LaTeX. Never use backslash-parenthesis or backslash-bracket math delimiters in a canonical Note or response-only Note preview.

When continuing an existing lesson, do not reteach completed content. Before first use of any new symbol in added prose or formulas, display or apply a patch to the leading notation section that completes every symbol-definition field. Apply the notation patch before the content patch when writing canonically; show it first in response-only output. Perform a symbol inventory audit before delivery. Check every prose and formula glyph against the leading section, including indices and meaning-changing decorations; fix missing or incomplete definitions before delivery.

After notation, follow the canonical `LESSON.md` order: mission connection and prerequisites; exact anchors and provenance; one physical question; complete derivation or proof; interpretation and checks; conditional comparison/code map; exercises; mastery check and next dependency. Preserve source-local symbols and pair the learner's explanatory language with the source-language technical term at first use. Add a new first-use bilingual term or a term whose meaning is source-dependent to `GLOSSARY.md`; that file owns terminology definitions and ambiguity records, while the lesson links the relevant term in context.

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

Create one immutable `learning-records/EV-000001.md`-style instance only when the learner supplied a response, self-report, or attempt, with a never-reused ID registered in the append-only index. Record source anchors, unaided work or `No observable attempt elicited`, self-report, ordered hints/assistance, the target-specific judgment, capabilities not demonstrated, remaining gap, and every state change caused by the evidence. Corrections use a new Evidence ID and link the superseded record. Never fabricate learner Evidence merely to document material intake, an agent explanation, or planning.

Do not mark a Mission target, Roadmap phase, Concept Node, or Review complete unless a linked Evidence ID and canonical Obsidian link demonstrate that exact observable criterion. A Review uses retrieval, a limiting-case check, short derivation/proof, source translation, or implementation validation; rereading alone is not completion.

## 6. Write the conversation back canonically

Chat is never canonical memory. A provisional response-only delivery shows exact would-be patches but performs none of the steps below and cannot report writeback complete. After every other substantive exchange, perform one coherent writeback:

1. when teaching content changed, patch the active lesson if it belongs to that dependency, otherwise create and link a new prerequisite lesson; for intake or planning with no teaching content, do not invent a lesson;
2. update canonical notation, terminology/ambiguity in `GLOSSARY.md`, source, Relation, Synthesis, Open Question, Code Map, or Run records affected by the exchange;
3. update `CONCEPT-MAP.md` only for current canonical nodes/edges, `ROADMAP.md` only for phase ordering/targets/exit criteria/status, and `MISSION.md` only for mission targets and completion rows; change a Mission completion row only when target scope changes or linked Evidence satisfies its exact criterion;
4. only if the learner supplied a response, self-report, or attempt, create and index the immutable Evidence record and record its prior-to-new snapshot transition;
5. only when demonstrated weakness exists, add or update `REVIEW-QUEUE.md`, especially for recognition without reconstruction;
6. atomically replace `CURRENT-STATE.md` with the exact new resume point and one next observable action, whether or not an Evidence record was created.

Canonical ownership is strict: lessons own teaching content and checks; `MISSION.md` owns mission targets and completion rows; `GLOSSARY.md` owns terminology definitions and ambiguity records; `CONCEPT-MAP.md` owns nodes and prerequisite edges; Evidence instances own historical learner evidence and evidence-caused state transitions; `CURRENT-STATE.md` owns only the live snapshot; `REVIEW-QUEUE.md` owns review state. Link stable IDs instead of copying history, graph definitions, Relation assumptions, or active-state data into lessons. Validate affected local links before ending the teaching turn.

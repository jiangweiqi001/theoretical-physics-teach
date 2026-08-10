---
name: theoretical-physics-math-teach
description: Use when a user explicitly invokes this skill to study supplied theoretical-physics papers, textbooks, lecture notes, or associated code across multiple sessions.
---

# Theoretical Physics Math Teach

Run only after the user explicitly invokes `$theoretical-physics-math-teach`; never activate it implicitly. Teach physics first. Introduce pure mathematics only as a prerequisite for a physical theory, derivation, proof, structural comparison, or implementation, and name that downstream physical use.

Use only materials the user supplies or explicitly places in scope. Do not browse for replacements, add external sources, widen the mission, or invent a co-equal pure-mathematics curriculum without the user's approval.

## Non-negotiable invariants

- Require a user-designated teaching workspace. Keep it outside the installed skill directory. Never write learning state, lessons, course files, snapshots, or learner evidence into the installed skill directory.
- Canonical teaching artifacts are Obsidian-compatible Markdown only.
- Do not create HTML, CSS, JavaScript, or browser-dependent lessons.
- Preserve each source's notation. Translate through `NOTATION-CROSSWALK.md` and compare through canonical Relations and entries in `SYNTHESIS.md`; never silently normalize sources into one convention.
- Ground material-dependent claims in supplied evidence and exact, reopenable anchors. Do not expand the available evidence from memory.
- Resume from the recorded first unfinished equation, proof step, code operation, or conceptual obstacle. Do not restart or silently skip ahead.
- There is no Note length cap.
- No skipped calculation or logic steps.

## Load only what the action requires

- For any source or multi-source action, including adding, replacing, registering, citing, comparing, or discovering unavailable material, read all of `references/source-workflow.md` before acting.
- For a diagnostic, lesson, clarification, prerequisite, review, or mastery decision, read all of `references/physics-pedagogy.md` before acting.
- Use `references/code-theory-bridge.md` only when implementation is a mission target and user-supplied or explicitly in-scope code, pseudocode, numerical-algorithm, or reproducibility material is available.
- Treat `assets/templates/` as copy sources and schemas. Do not paste their full contents into chat or duplicate their canonical records elsewhere.

Apply the code bridge gate exactly:

- `Active`: implementation is a mission target and the required supplied material is available. Read `references/code-theory-bridge.md`; only this state may create a Code Map.
- `Blocked`: implementation is a mission target but the material is missing. Create or link a canonical Open Question, create no Code Map, keep the Mission completion row open, and block the dependent Roadmap phase.
- `N/A`: implementation is not a mission target, even if incidental code exists. Create no Code Map.

Do not convert `Blocked` to `N/A` merely because evidence has not arrived.

## Teaching workflow

1. **Scope.** Confirm the workspace path, physical mission, supplied materials, explanatory language, constraints, and target observable capabilities. Ask before any material or mission expansion.
2. **Initialize or resume.** Before choosing either branch, copy every missing workspace document and required directory from `assets/templates/` without overwriting any existing or populated file. Then, for an existing initialized workspace, first read all of `MISSION.md` and `CURRENT-STATE.md`, followed by the active lesson and latest linked immutable Evidence record when they exist. Open the related canonical source, graph, notation, synthesis, question, review, code-map, and Run records needed for the next action.
3. **Take the bootstrap branch when needed.** If no current snapshot, active lesson, or prior Evidence exists, initialize the mission, registered materials, and an atomic current snapshot with `None yet - bootstrap`. Material intake, planning, or agent explanation without a learner response, self-report, or attempt creates no Evidence record and no fictional mastery history.
4. **Register sources before use.** Assign stable Source IDs and immutable version records, verify availability, and anchor the portion actually used. Stop only the claim or branch that lacks evidence; continue independent safe work.
5. **Diagnose one dependency.** Ask exactly one prerequisite question and test exactly one evidence category at a time. Treat "I do not know" as a starting-boundary signal, not failure. Keep self-report, unaided work, hints, and assisted work separate.
6. **Teach one dependency-sized lesson.** Answer one physical question or close one prerequisite edge. Split a second independent dependency into a linked lesson, never merely to shorten the derivation.
7. **Perform conversation writeback.** After every substantive exchange, patch the canonical files under the ownership rules below. A new explanation in chat must patch the active lesson when it belongs there or create and link a separate prerequisite lesson; chat is never canonical memory.
8. **Record the exact next action.** Atomically replace `CURRENT-STATE.md` with the precise resume point and one next observable teaching or retrieval action, whether or not learner Evidence was created.

## Lesson and Note contract

For every lesson or Note, the first content H2 must be exactly:

`## Notation and conventions`

Define every new symbol there before its first use in prose or equations. Complete the exact glyph and reading, mathematical type, domain, index ranges, physical meaning, units or dimensions, origin/provenance and exact anchor, local sign/metric/Fourier/normalization/natural-unit/boundary/operator conventions, and the meaning of hats, bars, stars, boldface, subscripts, and superscripts. Define meaning-changing decorated or indexed forms separately. A source or crosswalk link never waives the local definition.

Preserve source-local symbols. Register source notation in `NOTATION-CROSSWALK.md`; place general cross-source Relations and their assumption maps in `SYNTHESIS.md`. Use exactly the six complete Relation types defined in `references/source-workflow.md`; do not shorten them or invent another type. Never claim equivalence without the canonical assumption map and its validity conditions.

Show all intermediate algebra, substitutions, index contractions, sign changes, Fourier transforms, integrals, sums, limits, and proof or logical implications. At every non-trivial transition, name the identity, theorem, assumption, approximation, boundary condition, or convention; track domains, indices, units/dimensions, assumptions, and validity; explain why the transition follows and what would make it fail.

For physics, explain the physical meaning of important terms and observables and perform applicable dimensional/unit, limiting-case, symmetry/conservation, sign, normalization, and boundary checks. For a supporting pure-mathematics lesson, give hypotheses, complete proof structure, edge cases or counterexamples, and the exact downstream physical use.

## Evidence and provenance

Give each important claim, equation, convention, derivation step, comparison premise, or code behavior exactly one source-provenance label:

- **Source:** directly stated or visibly implemented at the cited anchor.
- **Reconstructed:** derived from cited Source premises, with the reconstruction shown.
- **Inference:** a defensible interpretation not explicitly stated by the source.
- **Unresolved:** unavailable, ambiguous, contradictory, or insufficient evidence.

Never invent an equation, citation, convention, theorem, appendix, code behavior, or anchor. Git material uses an exact commit as its immutable anchor. For an independent file, chat excerpt, or inline pseudocode, first save a workspace read-only snapshot and record its path, hash algorithm and digest, received date, and exact block or algorithm-step locator.

Put unavailable or ambiguous evidence and unresolved conflicts in `OPEN-QUESTIONS.md` with the evidence needed and next verification. Preserve conflicting anchored statements. Do not average them, select one silently, or call them equivalent without the required Relation and assumption map.

## Canonical ownership and evidence gates

- `MISSION.md` owns mission targets and completion rows.
- `CURRENT-STATE.md` owns only the live atomic snapshot and exact next action, never history.
- Lessons own teaching content and check criteria.
- Immutable `learning-records/EV-*.md` instances own learner responses, self-report, ordered assistance, mastery judgments, and evidence-caused historical state changes.
- `CONCEPT-MAP.md` owns concept nodes and prerequisite edges.
- `SYNTHESIS.md` owns the Relation registry, Relation assumption maps, and cross-source synthesis entries.
- `OPEN-QUESTIONS.md` owns evidence-gap and conflict lifecycle.
- Immutable `execution-records/RUN-*.md` instances own observed or computed execution evidence. Without a linked Run record, never claim execution, agreement, or convergence occurred.

Material intake, planning, an agent explanation, or a pure explanation with no learner response, self-report, or attempt must not produce a fabricated Evidence record. Use level 0 when observable mastery is insufficient. Do not mark a Mission target, Roadmap phase, Concept Node, or Review complete unless a linked Evidence ID and canonical Obsidian link demonstrate that exact observable criterion. Recognition, confidence, rereading, an unlinked ID, or assisted work presented as unaided does not pass an evidence gate.

## Writeback and completion gate

Before ending a teaching turn:

1. Patch the active lesson or create and link the required prerequisite lesson when teaching content changed.
2. Update every affected canonical source, notation, terminology, Relation, synthesis, Open Question, code-map, or Run record without duplicating its owner's data.
3. Create and index Evidence only when the learner supplied a response, self-report, or attempt; update Mission, Roadmap, Concept Map, and Review status only when that Evidence supports the exact gate.
4. Atomically update `CURRENT-STATE.md` with the exact stop point, last completed step, first unfinished implication, obstacle, required anchors, latest Evidence when one exists, and one next action.
5. Validate affected local paths, Obsidian links, stable IDs, source anchors, and supersession links. Repair failures before ending the turn.

Do not say the teaching task is complete unless every target-required `MISSION.md` completion row is satisfied by an Evidence ID plus resolvable canonical link that proves its observable criterion; `CURRENT-STATE.md` records a next action or explicit complete state consistent with those rows; required `OPEN-QUESTIONS.md` blockers are resolved or explicitly handled by scope; and all required local links resolve.

If the workspace is unspecified, ask for it and stop. If a required source is unavailable, mark only the dependent branch Unresolved and create an Open Question. If notation is ambiguous or sources conflict, preserve the alternatives and record the gap. If evidence is missing, do not advance the affected mastery or completion state. If validation fails, repair it before claiming completion.

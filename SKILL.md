---
name: theoretical-physics-teach
description: Use when a user explicitly invokes this skill to study supplied theoretical-physics papers, textbooks, lecture notes, or associated code across multiple sessions.
---

# Theoretical Physics Teach

Run only after the user explicitly invokes `$theoretical-physics-teach`; never activate it implicitly. Teach theoretical physics from the supplied sources. Introduce formal prerequisites only inside the physical theory, derivation, proof, structural comparison, or implementation that needs them, and name that downstream physical use.

Use only materials the user supplies or explicitly places in scope. Do not browse for replacements, add external sources, widen the mission, or construct a separate non-physics curriculum without the user's approval.

## Non-negotiable invariants

- Stateful course use requires a real user-designated workspace. Keep it outside the installed skill directory. Never write learning state, lessons, course files, snapshots, or learner evidence into the installed skill directory.
- Canonical teaching artifacts are Obsidian-compatible Markdown only.
- Do not create HTML, CSS, JavaScript, or browser-dependent lessons.
- In canonical Notes and response-only Note previews, use this exact rule: Use $...$ for inline LaTeX and $$...$$ for display LaTeX.
- Canonical Notes must not use backslash-parenthesis or backslash-bracket math delimiters.
- All learner-facing conversational teaching must not rely on inline LaTeX rendering. Apply the renderer-safe chat formatting and fallback rules in `references/physics-pedagogy.md`.
- Canonical Notes, exact canonical patches, and response-only finished Note previews are canonical artifact payloads even when transported through chat; keep their Obsidian LaTeX unchanged.
- Preserve each source's notation. Translate through `NOTATION-CROSSWALK.md` and compare through canonical Relations and entries in `SYNTHESIS.md`; never silently normalize sources into one convention.
- Ground material-dependent claims in supplied evidence and exact, reopenable anchors. Do not expand the available evidence from memory.
- Resume from the recorded first unfinished equation, proof step, code operation, or conceptual obstacle. Do not restart or silently skip ahead.
- A coherent writeback must make the Note read as if the clarification had been designed in place from the start.
- Do not append a detached chat transcript or clarification appendix.
- Multiple-choice or true/false is the default for initial diagnosis, end-of-Note checkpoints, and ordinary knowledge checks.
- Do not separately assess isolated elementary algebra or routine symbolic manipulation when it is below the learner's established assessment granularity.
- Passing an option item alone does not establish reconstruction mastery.
- There is no Note length cap.
- No skipped calculation or logic steps.

## Workspace and response-only gate

When the user explicitly requests a response-only finished Note, preview, or exact patch but has not authorized canonical writes or the workspace cannot actually be written, continue only with a provisional response:

- State `Provisional response-only artifact; no canonical write performed.`
- If a supplied excerpt cannot be registered or snapshotted, use the exact pending sentinel `Unassigned — supplied excerpt; snapshot registration pending`, give the visible session/excerpt locator, and do not invent a Source ID, version key, path, hash, or registration.
- Preserve the exact Unicode em dash U+2014 in canonical sentinels; if decoded tool output contains mojibake, repair it before delivery or writeback.
- Only after reading the complete canonical index may you allocate a stable ID. Absence from the prompt is not evidence that an index is empty. When the applicable complete index cannot actually be read, exact response-only patches must use inert type-specific placeholders such as `{{LESSON_ID_PENDING}}`, `{{EVIDENCE_ID_PENDING}}`, `{{SOURCE_ID_PENDING}}`, `{{RELATION_ID_PENDING}}`, `{{NOTATION_ID_PENDING}}`, `{{CODE_MAP_ID_PENDING}}`, and `{{RUN_ID_PENDING}}`, with no live Obsidian link.
- Follow every Note, notation, mathematics, provenance, and code non-claim rule below. Show the exact canonical patches that would be applied, but do not imply that any file changed.
- State `Canonical writeback is not complete.` Never claim the conversation writeback or resume state was persisted.
- Do not claim that a canonical record was created.

If response-only was not explicitly requested, ask for the workspace and stop.

## Load only what the action requires

- For any source or multi-source action, including adding, replacing, registering, citing, comparing, or discovering unavailable material, read all of `references/source-workflow.md` before acting.
- For a diagnostic, lesson, clarification, prerequisite, review, or mastery decision, read all of `references/physics-pedagogy.md` before acting.
- Use `references/code-theory-bridge.md` only when implementation is a mission target and trustworthy corresponding implementation material is available or required but missing.
- Treat `assets/templates/` as copy sources and schemas. Do not paste their full contents into chat or duplicate their canonical records elsewhere.

Apply the code bridge gate exactly:

- `Active`: implementation is a mission target and the available corresponding material is official or author-associated open-source code at a pinned commit, a user-supplied immutable snapshot, or anchored pseudocode sufficient for the mapping. Read `references/code-theory-bridge.md`; only this state may create a Code Map.
- `Blocked`: implementation is a mission target but the material is missing. Create or link a canonical Open Question, create no Code Map, keep the Mission completion row open, and block the dependent Roadmap phase.
- `N/A`: implementation is not a mission target, even if incidental code exists. Create no Code Map.

Do not convert `Blocked` to `N/A` merely because evidence has not arrived.

Use corresponding implementation material only when it is official or author-associated open-source code at a pinned commit, a user-supplied immutable snapshot, or anchored pseudocode sufficient for the mapping. If the user authorizes discovery, search only paper-linked, author-linked, project-official, or official-documentation repositories; never substitute unrelated code. When code understanding is optional and no trustworthy corresponding material exists, omit the learner-facing code section and use `N/A`. Never invent code or pseudocode to make a lesson appear complete.

## Teaching workflow

1. **Scope.** Confirm the workspace path, physical mission, supplied materials, explanatory language, constraints, and target observable capabilities. Ask before any material or mission expansion.
2. **Initialize or resume.** Apply the same deterministic repair to a new workspace or an incomplete existing workspace, and never overwrite an existing file:
   - Treat only these files as root singletons, each created from its same-named template in `assets/templates/` only when missing: `MISSION.md`, `BASELINE.md`, `MATERIALS.md`, `ROADMAP.md`, `CURRENT-STATE.md`, `CONCEPT-MAP.md`, `NOTATION-CROSSWALK.md`, `GLOSSARY.md`, `SYNTHESIS.md`, `OPEN-QUESTIONS.md`, `REVIEW-QUEUE.md`, and `NOTES.md`.
   - Never copy `LESSON.md` to the workspace root. When the first lesson is required, instantiate `assets/templates/LESSON.md` at `lessons/{stable-lesson-id}-{slug}.md`.
   - Never copy `LEARNING-RECORD.md` to the workspace root. Only when a real learner response, self-report, or attempt produces Evidence, instantiate it at `learning-records/EV-000001.md` and create or update `learning-records/INDEX.md` under that template's allocation rules.
   - Instantiate `assets/templates/CODE-MAP.md` at `reference/code-maps/{stable-code-map-id}.md` only when an Active code bridge first needs a new canonical map. Create its index under that template's allocation rules. Preserve existing Code Maps embedded in pre-v0.4 lessons; never migrate or overwrite them automatically.
   - Instantiate `assets/templates/RUN-RECORD.md` at `execution-records/{stable-run-id}.md` only after a real execution produces inspectable output. Create its index under that template's allocation rules. A linked filename, function, or pseudocode never creates a Run.
   - Create other reference or material subdirectories only when an action needs them. Do not create empty directories merely for bootstrap.
   Then, for an existing initialized workspace, first read all of `MISSION.md` and `CURRENT-STATE.md`, followed by the active lesson and latest linked immutable Evidence record when they exist. Open the related canonical source, graph, notation, synthesis, question, review, code-map, and Run records needed for the next action.
3. **Take the bootstrap branch when needed.** If no current snapshot, active lesson, or prior Evidence exists, initialize the mission, registered materials, and an atomic current snapshot with `None yet — bootstrap`. Material intake, planning, or agent explanation without a learner response, self-report, or attempt creates no Evidence record and no fictional mastery history.
4. **Register sources before use.** Assign stable Source IDs and immutable version records, verify availability, and anchor the portion actually used. Stop only the claim or branch that lacks evidence; continue independent safe work.
5. **Complete the pre-course architecture gate.** Before creating or teaching the first learner-facing lesson, inspect every available core material named in the Mission. Then write a provisional course main line and approximate sequence into `ROADMAP.md`. The first lesson remains blocked until both sections are populated; this is a provisional outline, not a requirement to add further curriculum machinery.
6. **Diagnose one dependency.** Ask exactly one prerequisite question and test exactly one evidence category at a time. Default to one multiple-choice or true/false item; require produced work when the target itself is derivation, proof, calculation, source translation, or implementation reasoning. Treat "I do not know" as a starting-boundary signal, not failure. Keep self-report, unaided work, hints, and assisted work separate.
7. **Teach one dependency-sized lesson.** Answer one physical question or close one prerequisite edge. Split a second independent dependency into a linked lesson, never merely to shorten the derivation.
8. **Perform conversation writeback.** After every substantive exchange, read the complete active Note, patch the leading notation first, and integrate a new explanation at the first sentence, equation, proof step, or code operation that depends on it. Rewrite the transition into and out of the clarification; remove obsolete stuck wording, duplicate explanations, and local contradictions; repair numbering, provenance, navigation links, and the final checkpoint. If it is a separate prerequisite, create the linked prerequisite Note and add a continuous bridge in the parent. Chat is never canonical memory.
9. **Record the exact next action.** Atomically replace `CURRENT-STATE.md` with the precise resume point and one next observable teaching or retrieval action, whether or not learner Evidence was created.

## Lesson and Note contract

For every newly created lesson or Note, including a response-only finished Note or preview, the first content H2 must be exactly:

`## Notation and conventions`

Define every new symbol there before its first use in prose or equations. Complete the exact glyph and reading, mathematical type, domain, index ranges, physical meaning, units or dimensions, origin/provenance and exact anchor, local sign/metric/Fourier/normalization/natural-unit/boundary/operator conventions, and the meaning of hats, bars, stars, boldface, subscripts, and superscripts. Define meaning-changing decorated or indexed forms separately. A source or crosswalk link never waives the local definition.

First use includes symbols inside another symbol's definition, domain, units, anchor, convention, or example cell. Order notation entries by dependency. Every symbol used inside an entry must resolve to an earlier complete entry, or be defined completely at that point in the same cell without introducing another undefined glyph. Define standard functions and constants at first use, individually or in a clearly grouped mathematical primitives entry. Meaning-changing decorated or indexed forms still require separate entries.

Code identifiers, unit glyphs, derived approximants, and error or variation symbols are not exempt; define each separately before first use.

A grouped primitives entry does not waive dependencies: dummy symbols introduced inside it must be defined earlier or eliminated.

Build the complete symbol-and-code-identifier dependency graph before drafting the notation section, then emit entries in topological order. A grouped entry is allowed only when it completely defines every member and uses no dependency that is defined later. List every source symbol, lesson-local symbol, code identifier, unit glyph, and mathematical primitive needed anywhere in the finished Note before its first dependent entry. Do not postpone code identifiers to a grouped row after source symbols have already referred to them.

When continuing an existing lesson, resume at the recorded point without reteaching completed content. Before first use of any new symbol in added prose or formulas, display or apply a patch to the leading notation section that completes every symbol-definition field. Apply that notation patch before the content patch when canonical writing is available; in response-only output, show the notation patch first. The first H2 of that continuation output must still be exactly `## Notation and conventions`. Perform a symbol inventory audit before delivery. Audit the notation section from top to bottom and each entry from left to right. At each cell, reject, reorder, or rewrite any entry that uses a dependency not completely defined earlier; the glyph being defined may appear in its own defining cell, but an auxiliary or example glyph may not appear there unless already defined. Recursively scan prose, inline and display mathematics, tables, and the notation definitions themselves in dependency order; repair newly exposed dependencies and scan again. Repeat the inventory scan until no undefined glyph remains.

Preserve source-local symbols. Register source notation in `NOTATION-CROSSWALK.md`; place general cross-source Relations and their assumption maps in `SYNTHESIS.md`. Use exactly the six complete Relation types defined in `references/source-workflow.md`; do not shorten them or invent another type. Never claim equivalence without the canonical assumption map and its validity conditions.

Show all intermediate algebra, substitutions, index contractions, sign changes, Fourier transforms, integrals, sums, limits, and proof or logical implications. At every non-trivial transition, name the identity, theorem, assumption, approximation, boundary condition, or convention; track domains, indices, units/dimensions, assumptions, and validity; explain why the transition follows and what would make it fail.

For physics, explain the physical meaning of important terms and observables and perform applicable dimensional/unit, limiting-case, symmetry/conservation, sign, normalization, and boundary checks. When a theorem or proof step is required by the physical argument, state its hypotheses, complete proof structure, edge cases or counterexamples, and exact role in that argument.

Every learner-facing Note ends with exactly one final section headed `## End-of-Note checkpoint`. Ask one item at a time and withhold its answer until the learner responds. Use three or four parallel, independently plausible options for multiple choice, vary the correct-option position, and avoid grammar, length, overlap, trick, or all/none cues. Use true/false only for one precise claim. If the target is reconstruction, proof, calculation, cross-source translation, or implementation reasoning, follow the option item with the smallest necessary produced-work task; do not promote option recognition to the stronger capability.

## Evidence and provenance

Give each important claim, equation, convention, derivation step, comparison premise, or code behavior exactly one source-provenance label:

- **Source:** directly stated or visibly implemented at the cited anchor.
- **Reconstructed:** derived from cited Source premises, with the reconstruction shown.
- **Inference:** a defensible interpretation not explicitly stated by the source.
- **Unresolved:** unavailable, ambiguous, contradictory, or insufficient evidence.

Never invent an equation, citation, convention, theorem, appendix, code behavior, or anchor. Git material uses an exact commit as its immutable anchor. For an independent file, chat excerpt, or inline pseudocode, first save a workspace read-only snapshot and record its path, hash algorithm and digest, received date, and exact block or algorithm-step locator.

Before mapping inline or non-Git pseudocode to theory, display its immutable-anchor status. If a response-only context prevents a real snapshot, use `Unassigned — supplied excerpt; snapshot registration pending` with a temporary visible locator; never fabricate a snapshot path, hash, or registration. Without a canonical Run record and inspected output, a filename or pseudocode is not evidence of successful numerical calculation: describe only the intended output or interface and state `No execution or validation claim is made.`

Put unavailable or ambiguous evidence and unresolved conflicts in `OPEN-QUESTIONS.md` with the evidence needed and next verification. Preserve conflicting anchored statements. Do not average them, select one silently, or call them equivalent without the required Relation and assumption map.

## Canonical ownership and evidence gates

- `MISSION.md` owns mission targets and completion rows.
- `CURRENT-STATE.md` owns only the live atomic snapshot and exact next action, never history.
- Lessons own teaching content and check criteria.
- Immutable `learning-records/EV-*.md` instances own learner responses, self-report, ordered assistance, mastery judgments, and evidence-caused historical state changes.
- `CONCEPT-MAP.md` owns concept nodes and prerequisite edges.
- `SYNTHESIS.md` owns the Relation registry, Relation assumption maps, and cross-source synthesis entries.
- `OPEN-QUESTIONS.md` owns evidence-gap and conflict lifecycle.
- `reference/code-maps/{Code-Map-ID}.md` instances own newly allocated canonical theory-to-code mappings. Existing lesson-local maps remain valid legacy owners and are never migrated automatically.
- Immutable `execution-records/RUN-*.md` instances own observed or computed execution evidence. Without a linked Run record, never claim execution, agreement, or convergence occurred.

Material intake, planning, an agent explanation, or a pure explanation with no learner response, self-report, or attempt must not produce a fabricated Evidence record. Use level 0 when observable mastery is insufficient. Do not mark a Mission target, Roadmap phase, Concept Node, or Review complete unless a linked Evidence ID and canonical Obsidian link demonstrate that exact observable criterion. Recognition, confidence, rereading, an unlinked ID, or assisted work presented as unaided does not pass an evidence gate.

Preserve each dated prior Evidence boundary explicitly: date, evidence category, exact capability demonstrated, and exact unfinished boundary. A new self-report or assisted explanation may move the current obstacle, but must not erase, generalize away, or relabel a prior unaided capability. Link the prior record when its canonical ID is available; otherwise retain its supplied date and locator without inventing an ID.

## Writeback and completion gate

For a provisional response-only artifact, show the would-be patches and the two required provisional status statements instead of performing this checklist. Do not claim canonical writeback. Otherwise, before ending a teaching turn:

1. Read the complete active Note and its directly linked local context. Locate the first statement or equation that depends on the clarification; patch there or create and link the required prerequisite lesson when it is a separate dependency.
2. Update every affected canonical source, notation, terminology, Relation, synthesis, Open Question, code-map, or Run record without duplicating its owner's data.
3. Create and index Evidence only when the learner supplied a response, self-report, or attempt. The learner Evidence gate applies only to positive mastery advancement, Mission completion, and marking a target, row, phase, node, or review `satisfied`, `complete`, or `completed`. Bootstrap, `Blocked`, `N/A`, scope or administrative updates, and `CURRENT-STATE.md` snapshot updates do not require learner Evidence; write them from mission scope or anchored source availability and link the relevant Q-ID, canonical Open Question, and source anchors when applicable.
4. Rewrite the incoming and outgoing transitions, remove obsolete stuck wording and duplicates, repair local step numbering and references, and update the final checkpoint so the Note remains continuous through the first downstream result.
5. Atomically update `CURRENT-STATE.md` with the exact stop point, last completed step, first unfinished implication, obstacle, required anchors, latest Evidence when one exists, and one next action.
6. Validate affected local paths, Obsidian links, stable IDs, source anchors, supersession links, and the full edited Note's notation and logical continuity. When Python is available, run the installed read-only `scripts/validate_workspace.py` against the user-designated workspace and repair every reported structural issue before ending the turn. The script does not compile or prove the mathematics, so complete the notation, LaTeX, derivation, and physics audits separately.

Do not say the teaching task is complete unless every target-required `MISSION.md` completion row is satisfied by an Evidence ID plus resolvable canonical link that proves its observable criterion; `CURRENT-STATE.md` records a next action or explicit complete state consistent with those rows; required `OPEN-QUESTIONS.md` blockers are resolved or explicitly handled by scope; and all required local links resolve.

If response-only was not explicitly requested, ask for the workspace and stop. If a required source is unavailable, mark only the dependent branch Unresolved and create an Open Question. If notation is ambiguous or sources conflict, preserve the alternatives and record the gap. If evidence is missing, do not advance the affected mastery or completion state. If validation fails, repair it before claiming completion.

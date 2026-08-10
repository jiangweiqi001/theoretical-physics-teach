# Theoretical Physics Math Teach Design

## Purpose

`theoretical-physics-math-teach` is a user-invoked Agent Skill for sustained, source-driven study of theoretical physics. Pure mathematics is supported when it is required for a physical theory, a proof, or a structural comparison, but it is not a co-equal curriculum.

The skill builds a durable Obsidian Markdown workspace from papers, textbooks, lecture notes, and associated code supplied by the learner. It preserves each source's notation, reconstructs derivations at the learner's level, and connects multiple sources without silently flattening their conventions.

## Ethical and Licensing Position

The project is an MIT-licensed derivative of Matt Pocock's `teach` skill.

- Retain the upstream MIT license and copyright notice.
- Add a `NOTICE.md` that identifies the upstream repository and describes the independent specialization.
- Add the new author's copyright notice for original additions without implying upstream endorsement.
- Use a distinct project and skill name.
- Do not describe the project as an official variant.

## Approaches Considered

### 1. Minimal Markdown fork

Keep the generic `teach` workflow and only replace HTML with Markdown. This is easy to maintain but does not solve multi-source notation, derivation gaps, source conflicts, or theory-to-code mapping.

### 2. Modular physics-first derivative

Keep the useful stateful-learning core, then add focused protocols and templates for source intake, notation crosswalks, concept dependencies, derivations, assessment, and optional code mapping. This is the selected approach because it is specialized without becoming a software platform.

### 3. Full learning application

Build a database, renderer, automatic PDF pipeline, spaced-repetition scheduler, and interactive interface. This adds deployment and maintenance costs before the teaching protocol itself has been validated, so it is out of scope.

## Invocation and Compatibility

- The skill is explicitly user-invoked.
- `disable-model-invocation: true` prevents unsolicited activation in compatible harnesses.
- `agents/openai.yaml` sets `policy.allow_implicit_invocation: false` for Codex.
- The skill follows the common Agent Skills folder structure.
- Codex is the primary tested harness; the Markdown instructions remain portable to other compatible agents.

## Canonical Output

All teaching artifacts are Obsidian-compatible Markdown.

- Use `$...$` for inline LaTeX and `$$...$$` for display LaTeX.
- Use wikilinks or relative Markdown links according to the learner's vault convention.
- Use Mermaid or static images only when they clarify a real relationship.
- Do not create HTML lessons, CSS-dependent pages, JavaScript quiz pages, or browser-only exercises.
- A requested website is a separate artifact; Markdown remains the teaching source of truth.

## Teaching Workspace

The generated workspace contains:

| Path | Responsibility |
| --- | --- |
| `MISSION.md` | Learner's physical questions, supplied sources, prior knowledge, constraints, and observable goals |
| `BASELINE.md` | Diagnostic evidence: what the learner can explain, derive, prove, and compute before the course |
| `MATERIALS.md` | Source registry with stable IDs, versions, local paths, bibliographic data, roles, and trust notes |
| `ROADMAP.md` | Prerequisite-ordered phases, source anchors, mastery targets, and exit conditions |
| `CURRENT-STATE.md` | Exact resume point: active lesson, equation or proof step, current obstacle, last evidence, and next action |
| `CONCEPT-MAP.md` | Cross-source dependency graph of physical concepts and required mathematics |
| `NOTATION-CROSSWALK.md` | Source-local symbols, meanings, domains, conventions, and explicit cross-source correspondences |
| `GLOSSARY.md` | Chinese explanations paired with source-language technical terms and first-use locations |
| `SYNTHESIS.md` | Cross-source comparison of assumptions, methods, approximations, conclusions, and regimes of validity |
| `OPEN-QUESTIONS.md` | Unresolved derivation gaps, contradictions, ambiguities, and questions for later verification |
| `REVIEW-QUEUE.md` | Retrieval and reconstruction items scheduled from demonstrated weaknesses |
| `lessons/*.md` | Numbered, tightly scoped lessons |
| `reference/*.md` | Formula sheets, derivation maps, theorem summaries, convention tables, and code-theory maps |
| `learning-records/*.md` | Evidence of demonstrated mastery and changes in the learner model |
| `assets/*` | Reusable static figures, datasets, and worked-example inputs |
| `NOTES.md` | Teaching preferences and temporary planning notes |

Files are created in the user-designated teaching workspace, never inside the installed skill directory.

## Source-Driven Workflow

### Source intake

1. Register every supplied paper, book, note set, and code repository in `MATERIALS.md` before teaching from it.
2. Assign a stable source ID such as `S1` or `S2`.
3. Record version, page or section addressability, and whether the full content is locally available.
4. Distinguish direct source claims from the agent's synthesis.
5. Stop and mark the gap when a required passage, equation, appendix, or code file is unavailable.

Every important equation or claim receives a provenance label:

- **Source:** stated directly at a cited source location;
- **Reconstructed:** an intermediate step derived from cited source premises;
- **Inference:** a defensible interpretation not explicitly stated by the source;
- **Unresolved:** insufficient evidence or an unresolved conflict.

### Multi-source synthesis

The unit of course organization is a physical concept or derivational dependency, not an arbitrary paper boundary. Every lesson records the exact source sections and equation numbers it uses.

For each cross-source connection, classify it as one of:

- same object, different notation;
- same notation, different object;
- equivalent only under stated assumptions;
- alternative approximation or renormalization scheme;
- apparent contradiction requiring resolution;
- historical or pedagogical restatement.

Do not label two statements equivalent without recording the map of assumptions that makes them equivalent.

`SYNTHESIS.md` compares more than symbols. It records which Hamiltonian, action, ensemble, regulator, approximation, expansion parameter, limit, and observable each source uses. A conclusion is linked to its regime of validity instead of being copied as a context-free fact.

### Notation policy

Each source retains its own symbols. `NOTATION-CROSSWALK.md` provides translation without rewriting the source.

Every notation entry records:

- source ID and exact location;
- symbol as written;
- mathematical type and domain;
- physical meaning;
- units or dimensions when applicable;
- sign, Fourier-transform, metric, and normalization conventions;
- relation to symbols in other sources;
- assumptions under which the relation holds.

## Physics-First Teaching Protocol

Each lesson teaches one dependency-sized unit and contains:

1. a leading notation and conventions section;
2. mission connection and prerequisites;
3. source anchors;
4. the physical question being answered;
5. a step-by-step derivation with no unexplained algebraic or conceptual jump;
6. the physical meaning of each important expression;
7. limiting cases, dimensional checks, and consistency checks where applicable;
8. comparison with other supplied sources;
9. retrieval or derivation exercises;
10. an observable mastery check and the next dependency.

The first content section of every Note is `## Notation and conventions`. Before any new symbol appears in prose or an equation, this section records:

- the exact glyph and how it is read;
- mathematical type and domain, including index ranges;
- physical meaning;
- units or dimensions when applicable;
- source ID and location;
- sign, metric, Fourier-transform, normalization, natural-unit, and operator conventions that affect it;
- the meaning of hats, bars, stars, boldface, subscripts, and superscripts.

A previously defined symbol may link to `NOTATION-CROSSWALK.md`, but the Note must still state the local meaning when ambiguity is possible. Do not use a new letter first and define it several paragraphs later.

When the learner says a field-theory or condensed-matter step is unfamiliar, the skill expands that prerequisite in a separate linked lesson instead of compressing it into a parenthetical aside.

Pure mathematics enters in support of the physics. For a theorem or proof, replace physical interpretation and dimensional checks with hypotheses, proof structure, edge cases, and the exact downstream physical use.

Lessons use the learner's preferred explanatory language while preserving source-language technical terms at first use. For a Chinese workspace, write forms such as “自能（self-energy）” and keep source symbols unchanged.

## Stateful Learning Loop

### Diagnostic entry

The diagnostic asks one prerequisite question at a time. A response such as “I do not know” is evidence for where teaching begins, not a failure. `BASELINE.md` records the demonstrated boundary without inflating it from recognition or confidence alone.

### Resume behavior

Before every teaching action, read `CURRENT-STATE.md`, the active lesson, and the latest learning record. Resume at the exact equation, proof step, or conceptual obstacle rather than restarting the topic. Update `CURRENT-STATE.md` after each substantive exchange.

### Conversation writeback

Chat is not the canonical memory. When an explanation resolves confusion or exposes a missing prerequisite:

1. patch the active lesson if the clarification belongs to its scope;
2. otherwise create a new prerequisite lesson and link it;
3. update `CONCEPT-MAP.md` and `CURRENT-STATE.md`;
4. add demonstrated evidence to a learning record;
5. place weak reconstruction targets in `REVIEW-QUEUE.md`.

Do not create a duplicate lesson merely because the clarification happened in a later session.

### Depth without skipped steps

A lesson is bounded by one dependency-sized question, not by word count. A Note may be long whenever that is required to close the calculation or logical argument.

- Show intermediate algebra, substitutions, index contractions, Fourier transforms, integrals, sums, limits, and sign changes.
- State the identity, theorem, approximation, boundary condition, or convention used at each non-trivial transition.
- Track units, dimensions, domains, and assumptions through the calculation.
- Explain why every logical implication follows; do not use “obvious”, “similarly”, or “it follows” to conceal a missing step.
- If a required step belongs to another concept, state the dependency and link a prerequisite Note. Do not compress it into an unexplained citation.
- A compact summary may follow the full derivation, but never replace it.

When a second conceptual dependency appears, split it into a linked numbered lesson. The split is for conceptual organization, not to shorten or truncate the derivation.

## Mastery Model

The roadmap uses four levels:

1. **Interpretation:** explain objects, symbols, assumptions, and the physical question.
2. **Reconstruction:** independently reproduce the central derivation or supporting proof.
3. **Synthesis:** compare sources, translate conventions, and identify which assumptions change the result.
4. **Implementation:** when code or numerical work exists, map equations and approximations to modules, inputs, outputs, algorithms, and validation observables.

Advancement requires evidence recorded in `learning-records/`. Reading fluency or recognition alone is not evidence of reconstruction.

`REVIEW-QUEUE.md` prioritizes items the learner could recognize but could not reconstruct. Reviews use retrieval, limiting-case checks, short derivations, or source translation; they do not merely ask the learner to reread a lesson.

## Code-Theory Bridge

The code track is conditional. It activates only when supplied materials include code, pseudocode, numerical methods, or reproducibility instructions.

For each relevant code path, record:

- the equation, functional, action, or algorithm being implemented;
- discretization, truncation, regulator, approximation, and units;
- input parameters and their physical meaning;
- output observables and how they are validated;
- numerical stability or convergence checks;
- code locations that implement each theoretical step;
- what the code does not establish.

The skill explains code at architecture and algorithm level before line-by-line detail.

## Error and Uncertainty Handling

- Never invent a missing equation, citation, convention, or code behavior.
- Put unresolved items in `OPEN-QUESTIONS.md` with the evidence needed to resolve them.
- Mark source disagreement explicitly; do not average incompatible claims.
- Distinguish exact results, controlled approximations, heuristic arguments, numerical evidence, and the agent's inference.
- If source notation is ambiguous, quote only the minimum local expression needed, cite its location, and state the ambiguity.
- Ask for a missing source only when progress cannot continue safely from the available material.
- Validate local lesson, reference, source, and asset links before declaring a teaching update complete.

## Skill Package Architecture

| File | Responsibility |
| --- | --- |
| `SKILL.md` | Trigger, invariants, decision flow, and references to the detailed protocols |
| `agents/openai.yaml` | Codex display metadata and explicit-only invocation policy |
| `references/source-workflow.md` | Source registry and multi-source comparison protocol |
| `references/physics-pedagogy.md` | Lesson, derivation, prerequisite, and mastery protocol |
| `references/code-theory-bridge.md` | Conditional theory-to-code mapping protocol |
| `assets/templates/*.md` | Copy-ready workspace templates |
| `tests/static-contract.ps1` | Structural and forbidden-output assertions |
| `tests/scenarios/*.md` | RED/GREEN behavioral evaluation prompts and expected observations |
| `README.md` | Purpose, installation, use, attribution, and limitations |
| `LICENSE` | MIT terms retaining upstream notice and adding new copyright |
| `NOTICE.md` | Derivative-work attribution and non-endorsement statement |

`SKILL.md` remains concise. Detailed tables and templates are loaded only when the current teaching action needs them.

## Testing Strategy

### RED baseline

Run realistic prompts without the new skill and record whether the agent:

- normalizes conflicting source notation without a crosswalk;
- skips unfamiliar derivation steps;
- compresses algebra or logic behind phrases such as “obvious” or “similarly”;
- uses new symbols before a leading notation section defines them;
- teaches from memory instead of source anchors;
- creates HTML or browser artifacts;
- describes code without mapping it to equations and approximations.
- leaves a resolved clarification only in chat instead of updating the workspace;
- restarts a course instead of using the recorded resume point;
- treats “I do not know” as an assessment failure instead of a prerequisite signal.

### GREEN behavior

Run the same prompts with the skill and require:

- Markdown-only workspace decisions;
- stable source IDs and exact source anchors;
- source-local notation plus explicit crosswalk;
- prerequisite-aware, stepwise derivations;
- complete intermediate calculations and explicit logical justifications without a length cap;
- a leading Note-level notation section defining every new symbol before use;
- separation of fact, approximation, disagreement, and inference;
- conditional code-theory mapping.
- exact resume behavior and canonical conversation writeback;
- bilingual terminology without replacing source notation;
- detailed single-dependency lessons and evidence-driven review targets.

### Static validation

The test script checks metadata, required reference files, required templates, Markdown paths, attribution, explicit invocation, and forbidden HTML lesson paths.

## Publication

Publish as a public repository named `theoretical-physics-math-teach` under `jiangweiqi001`. The default branch is `main`. The first release is a tested `v0.1.0` after RED/GREEN validation succeeds.

The existing `mattpocock/skills` fork and the Markdown proposal branch remain separate and unchanged.

## Success Criteria

- A learner can supply multiple theory sources and obtain a prerequisite-ordered Markdown course.
- Each source's notation is preserved and cross-source equivalences carry explicit assumptions.
- Cross-source comparisons include assumptions, methods, approximations, conclusions, and regimes of validity.
- Lessons make non-obvious derivation steps and physical interpretations inspectable.
- Learning records distinguish interpretation from independent reconstruction.
- A new session resumes at the recorded obstacle, and resolved explanations are written back into canonical notes.
- Code explanations map numerical operations to theory when code is present.
- The repository is installable as an explicit-only Agent Skill and clearly attributes its MIT origin.

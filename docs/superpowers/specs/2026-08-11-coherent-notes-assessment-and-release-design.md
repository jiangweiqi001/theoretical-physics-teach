# Coherent Notes, Assessment, and Publication Design

Date: 2026-08-11

Project: `theoretical-physics-math-teach`

Planned release: `v0.2.0`

## Goal

Turn the existing source-driven theoretical-physics teaching skill into a polished long-term paper-reading system whose canonical Notes remain coherent after clarification, render cleanly in Obsidian, resume at an exact mathematical boundary, assess learners without confusing recognition with reconstruction, and explain corresponding code only when trustworthy implementation material exists.

The public repository should explain these advantages clearly enough that a theoretical-physics learner can decide quickly whether the skill fits their work.

## Approved product principles

1. Chat is not canonical memory. Every substantive clarification must be integrated into the correct canonical Note location and the active resume state.
2. A patched Note must read as though the clarification was planned there from the beginning. Detached chat transcripts and clarification appendices are not acceptable substitutes.
3. Canonical teaching artifacts are UTF-8 `.md` files that use Obsidian-compatible structure and MathJax-friendly LaTeX.
4. Theory comes before implementation. Code explanation is conditional and belongs after the relevant physical derivation.
5. Initial diagnostics, end-of-Note checkpoints, and ordinary knowledge checks default to multiple-choice or true/false questions. Constructed responses remain necessary when the target capability is derivation, proof, calculation, translation, or implementation reasoning.
6. Recognition evidence from an option question cannot by itself establish reconstruction mastery.

## Approaches considered

### A. Wording-only patch

Add several sentences to `SKILL.md` and README.

Advantages: small and fast.

Disadvantages: easy for an agent to satisfy superficially; no deterministic regression protection; no validation of links or Note structure.

### B. Contract-driven refinement — selected

Strengthen the core instructions, detailed protocols, canonical templates, behavioral scenarios, deterministic tests, workspace validation, CI, README, and release metadata as one coherent change.

Advantages: each important promise is executable or reviewable; preserves the existing architecture; directly improves learner experience and public trust.

Disadvantages: touches several coordinated files and requires full regression verification.

### C. Complete course-engine rewrite

Replace the Markdown protocol with a generated course application or database-backed system.

Advantages: more automation.

Disadvantages: violates the Markdown/Obsidian-first goal, adds browser and infrastructure dependencies, and discards working source/evidence architecture.

## 1. Coherent clarification writeback

Every substantive exchange will use a single coherence transaction:

1. Read the complete active Note, not only the recorded stopping line, plus the exact `CURRENT-STATE.md` snapshot and directly linked prerequisite or successor Note sections.
2. Identify the conceptual insertion point: the first sentence, equation, derivation step, or code operation that depends on the missing explanation.
3. Patch `## Notation and conventions` first when the clarification introduces a new symbol, decorated form, unit glyph, code identifier, or convention.
4. Insert or replace the explanation at that conceptual location. Do not append a section named like “chat clarification” merely because the explanation originated in chat.
5. Rewrite the transition into the inserted material and the transition out of it. Remove obsolete claims such as “this remains unclear,” duplicate derivations, and local contradictions while preserving historical learner evidence in immutable Evidence records.
6. Repair step numbering, nearby terminology, equation or block references, prerequisite links, successor links, and the final checkpoint affected by the clarification.
7. Run a continuity audit from the preceding established result through the first downstream result. The mathematical dependencies, prose argument, notation, assumptions, and source labels must form one uninterrupted chain.
8. Update `CURRENT-STATE.md` atomically with the exact active Note section or block link, last completed step, first unfinished implication, current obstacle, and one next action.

If the missing explanation is a separate prerequisite dependency, create a linked prerequisite Note and insert a concise bridge in the parent Note instead of overloading the parent. The parent must still read continuously.

## 2. Obsidian- and LaTeX-native Note contract

Canonical lessons and reference Notes will obey these rendering rules:

- use UTF-8 Markdown files with the `.md` extension;
- use `$...$` for inline mathematics and `$$...$$` for display mathematics;
- use `\begin{aligned}...\end{aligned}` inside display math for multi-line derivations rather than putting multi-line algebra in Markdown tables;
- keep display-math fences on their own lines with blank lines around them;
- use stable H2/H3 headings for section-level links;
- use Obsidian links such as `[[lessons/L-000004-retarded-propagator#Complete derivation|retarded-propagator derivation]]` for Note navigation;
- add stable Obsidian block IDs only when another Note or `CURRENT-STATE.md` must deep-link to a specific equation or derivation step, and link them with `[[note#^block-id]]`;
- do not rename or remove a linked heading or block ID without updating every affected inbound link;
- provide prerequisite, related-Note, and next-Note navigation where those relationships exist;
- create no HTML, CSS, JavaScript, browser-only interaction, or code-fenced LaTeX equation;
- omit inactive scaffolding and empty conditional sections from learner-facing instantiated Notes.

The existing source-local notation, notation-first, provenance, no-length-cap, and no-skipped-step rules remain mandatory.

## 3. Exact resume state

`CURRENT-STATE.md` will gain explicit local deep-link fields:

- active Note section or block link;
- exact formula, proof step, code operation, or sentence label;
- last completed section/block link;
- first unfinished section/block link;
- current obstacle;
- one next observable action.

The snapshot remains atomic and history-free. Evidence records continue to own dated learner history. The live state may move after an explanation even when no learner Evidence was created, but mastery may not advance without the required Evidence.

## 4. Assessment policy

### Default interaction form

Use one question at a time. Prefer:

- a three- or four-option multiple-choice question when distractors can map to meaningful misconceptions; or
- a true/false question when one precise claim, sign, assumption, limiting case, or implication is being tested.

Vary the position of the correct option. Keep options parallel in grammar, comparable in length, and independently plausible. Avoid trick wording, accidental length cues, overlapping answers, and “all/none of the above.” Use “cannot be determined from the supplied evidence” only when epistemic sufficiency is itself the target.

### Initial diagnosis

The first baseline interaction proceeds adaptively, one prerequisite and one evidence category at a time. It begins with multiple-choice or true/false unless the mission target itself immediately requires produced work. Each distractor records the misconception or missing prerequisite it is designed to distinguish. “I do not know” remains a valid boundary signal.

### End-of-Note checkpoint

Every learner-facing Note ends with an `## End-of-Note checkpoint` section. The default is one multiple-choice or true/false item tied to that Note’s physical question and observable success criterion. Do not reveal the answer before the learner responds.

If the target is reconstruction, proof, calculation, cross-source translation, or implementation reasoning, the option item diagnoses the likely boundary and is followed by the smallest necessary constructed-response task. Passing the option item alone records interpretation or recognition evidence, not reconstruction mastery.

### Feedback writeback

After the learner answers, store the verbatim response and assistance sequence in the Evidence record. Integrate any substantive corrective explanation coherently into the canonical Note under the writeback transaction, then replace or add the next checkpoint needed to test the unresolved boundary.

## 5. Conditional code–theory bridge

The code section remains absent unless implementation is a mission target and trustworthy corresponding material is available.

Eligible material is:

- an official or author-associated open-source repository at a pinned commit;
- code supplied by the user and snapshotted immutably; or
- supplied or anchored pseudocode/reproducibility instructions sufficient for the stated mapping.

If the user authorizes discovery of corresponding open-source code, search only for repositories linked by the paper, authors, project, or official documentation. Do not substitute an unrelated implementation. If no trustworthy corresponding material is found, use `Blocked` when implementation is required or omit/mark the section `N/A` when it is optional. Never invent code or pseudocode to make the lesson look complete.

When active, explain the implementation after the relevant theory in this order:

1. physical problem and source equation;
2. assumptions and approximations;
3. discretization, basis, grids, measures, weights, cutoffs, regulators, boundary conditions, and symmetry reductions;
4. pseudocode that expresses the anchored algorithm without pretending to be the repository’s literal source;
5. for every physical quantity: theoretical definition, derivation or approximation source, code variable, units, domain, shape, indices, initialization, update rule, output destination, and validation observable;
6. loop-by-loop or solver-step physical meaning;
7. intended output and what it can and cannot establish;
8. Run-linked execution, convergence, and comparison claims only when real Run evidence exists.

Pseudocode reconstructed for pedagogy must be labeled **Reconstructed** and linked back to the pinned implementation steps. No execution or validation claim follows from pseudocode alone.

## 6. Templates and protocols

Planned coordinated changes:

- `SKILL.md`: make the coherence transaction, Note rendering contract, assessment default, and conditional code gate core invariants.
- `references/physics-pedagogy.md`: define the full clarification/edit flow and high-quality question design.
- `references/code-theory-bridge.md`: add corresponding-open-source discovery boundaries and the physical-quantity derivation chain.
- `assets/templates/LESSON.md`: add deep-link/navigation fields, continuity gates, conditional code ordering, and a final checkpoint schema.
- `assets/templates/BASELINE.md`: add question type, option quality, misconception map, and recognition-versus-production boundary fields.
- `assets/templates/CURRENT-STATE.md`: add exact local section/block resume links.
- `assets/templates/LEARNING-RECORD.md`: record question form, answer, recognition evidence, and any required production follow-up without conflating them.
- `assets/templates/REVIEW-QUEUE.md`: default review prompts to option/true-false questions while retaining produced-work checks for stronger capabilities.

No separate HTML lesson, web renderer, or general-purpose quiz application will be introduced.

## 7. Deterministic validation and behavioral coverage

### Static contracts

Add failing assertions before implementation for every new invariant, including the exact final checkpoint heading, coherence transaction, Obsidian deep-link fields, question-design rules, code-material eligibility, and pseudocode non-claim.

### Workspace validator

Add a small portable validation script for real learning workspaces. It will report, without modifying files:

- non-Markdown canonical lesson/reference artifacts;
- forbidden math delimiters and obvious code-fenced display equations;
- unresolved Obsidian Note targets;
- unresolved heading or block deep links;
- duplicate explicit block IDs; and
- active `CURRENT-STATE.md` links that cannot be reopened.

The validator will skip inert template placeholders and report limitations explicitly; it will not claim to compile or mathematically validate LaTeX.

### Behavioral scenarios

Add at least two isolated scenarios:

1. a learner says “this step is unclear” in the middle of a derivation; success requires a coherent in-place Note patch, repaired transitions, notation-first update, exact resume link, and a final option/true-false checkpoint;
2. a paper has either anchored corresponding code or no trustworthy code; success requires a physical pseudocode explanation in the first case and no fabricated code section in the second.

Evaluator-only text must remain isolated from dispatched prompts. Existing scenarios and accepted outputs must remain regression-green.

### CI

Add a GitHub Actions workflow that runs deterministic repository contracts and the workspace-validator tests. Display a truthful validation badge only after the workflow exists and passes on the public repository.

## 8. README and public release

Rewrite README as a strong but accurate project page with:

- a concise theoretical-physics-first tagline;
- a short “why this exists” explanation;
- a visual workflow showing source intake, notation mapping, coherent Notes, exact resume, evidence, and optional code;
- a feature comparison between a stateless paper summary and this skill;
- a small Obsidian Note example using real Markdown/LaTeX/link syntax;
- explicit strengths: cross-paper notation, complete derivations, coherent conversation writeback, exact resume, evidence-based assessment, and optional code–theory mapping;
- audience and non-audience boundaries;
- installation, update, invocation, and minimal quick-start instructions;
- honest limitations and retained MIT attribution;
- validation badge and release link only when verified.

Update the GitHub repository description and topics to match the released capabilities. Publish `v0.2.0` from the verified `main` commit and synchronize the installed skill without deleting the existing installation directory.

## 9. Failure handling

- If the active Note cannot be read completely, do not claim coherent writeback; produce a provisional patch or stop for the missing workspace access.
- If a linked heading or block no longer resolves, repair the link before advancing the resume state.
- If a question cannot distinguish misconceptions, use a simpler true/false claim or a constructed response instead of decorative multiple choice.
- If supplied evidence cannot establish code provenance, label the mapping Unresolved and do not create a canonical Code Map.
- If CI or any release contract fails, do not tag or publish the release.

## 10. Acceptance criteria

The release is ready only when:

1. a mid-derivation clarification produces a Note that is locally and globally coherent rather than appended as chat history;
2. every canonical teaching artifact remains Obsidian-compatible Markdown with resolvable required links;
3. `CURRENT-STATE.md` reopens the exact local formula or step and states one next action;
4. initial, end-of-Note, and ordinary checks default to well-formed multiple-choice or true/false questions;
5. stronger mastery claims still require the necessary produced work;
6. code explanation appears only from trustworthy corresponding material and traces every physical quantity into the algorithm;
7. all old and new static, bootstrap, behavioral, validator, and skill-package checks pass;
8. the installed copy matches the released package after line-ending normalization; and
9. README, GitHub metadata, `main`, and the `v0.2.0` release all describe the same verified feature set.

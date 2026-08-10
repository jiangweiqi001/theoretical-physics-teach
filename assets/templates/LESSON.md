# Lesson L-000001 — Dependency-Sized Title

## Notation and conventions

Every new symbol must be defined before first use in prose or equations, regardless of whether its origin/provenance is `Source / crosswalk / defined here`. Complete every required field below before writing any later section. Include each decorated or indexed form as its own entry whenever a hat, bar, star, boldface, subscript, or superscript changes the meaning, type, domain, or convention.

First use includes symbols inside another symbol's definition, domain, units, anchor, convention, or example cell. Order notation entries by dependency. A symbol inside an entry must resolve to an earlier complete entry or be defined completely in the same cell without introducing another undefined glyph. Define each standard function or constant at first use, or define related primitives in a clearly grouped mathematical primitives entry. Meaning-changing decorated or indexed forms still require separate entries.

Code identifiers, unit glyphs, derived approximants, and error or variation symbols are not exempt; define each separately before first use.

A grouped primitives entry does not waive dependencies: dummy symbols introduced inside it must be defined earlier or eliminated.

Build the complete symbol-and-code-identifier dependency graph before drafting the notation section, then emit entries in topological order. A grouped entry is allowed only when it completely defines every member and uses no dependency that is defined later. Put every source symbol, lesson-local symbol, code identifier, unit glyph, and mathematical primitive needed anywhere in the finished Note before its first dependent entry. Do not place a code identifier in a later grouped row if an earlier definition, provenance cell, table, or formula already uses it.

This exact leading section is also mandatory for every response-only finished Note or preview. Use $...$ for inline LaTeX and $$...$$ for display LaTeX. Never use backslash-parenthesis or backslash-bracket math delimiters in canonical or response-only Note content.

Keep display-math fences on their own lines with blank lines around them. For multi-line algebra, use `\begin{aligned}` and `\end{aligned}` inside `$$...$$`; do not put a multi-line derivation in a Markdown table or a code fence.

Use [[note#heading]] for section links and [[note#^block-id]] only when an exact equation or derivation step needs a stable deep link. Keep a linked heading or block ID stable; if it must change, repair every affected inbound link in the same writeback. Use a block ID only when `CURRENT-STATE.md` or another Note must reopen that exact local object.

Only after reading the complete canonical index may you allocate a stable ID. Absence from the prompt is not evidence that an index is empty. In provisional response-only output, replace every concrete sample ID below with inert type-specific placeholders such as `{{LESSON_ID_PENDING}}`, `{{EVIDENCE_ID_PENDING}}`, `{{SOURCE_ID_PENDING}}`, `{{RELATION_ID_PENDING}}`, `{{NOTATION_ID_PENDING}}`, `{{CODE_MAP_ID_PENDING}}`, and `{{RUN_ID_PENDING}}`; emit no live Obsidian link. Do not claim that a canonical record was created.

When continuing an existing lesson, do not repeat completed content. Before first use of any new symbol in added prose or formulas, display or apply a patch to the leading notation section that completes every symbol-definition field. Apply that notation patch before the content patch; in response-only output, show it first without claiming a canonical write. The first H2 of that continuation output must still be exactly `## Notation and conventions`.

- **Stable Lesson ID:** L-000001
- **Canonical lesson Obsidian link:** [[lessons/L-000001]]

This lesson is canonical only for teaching content, check criteria, and links to stable Evidence IDs plus Obsidian links. The dependency graph belongs to `CONCEPT-MAP.md`, the active snapshot belongs to `CURRENT-STATE.md`, and historical learner evidence belongs to immutable `learning-records/EV-000001.md`-style instances.

Before learner delivery, remove authoring instructions, unused schema rows, and inactive conditional sections from the instantiated Note. Keep only populated learner-facing content and active canonical links; never expose an empty code, comparison, execution, or assessment scaffold merely because it exists in this template.

Preserve each dated prior Evidence boundary explicitly: date, evidence category, exact capability demonstrated, and exact unfinished boundary. In continuation and writeback patches, keep current self-report, prior unaided performance, and assisted work distinct; link the prior record when possible instead of compressing its demonstrated capability into a generic stop point.

### Local symbol index

| Local symbol ID | Short label | Origin/provenance | Definition status |
| --- | --- | --- | --- |
| LSYM-001 |  | `Source / crosswalk / defined here` | Incomplete or complete |

### Symbol definitions

Copy the following two-column table for every new symbol. Escape a literal vertical bar inside a table value.

#### LSYM-001

| Field | Definition |
| --- | --- |
| Local symbol ID | LSYM-001 |
| Exact glyph as written |  |
| Read as |  |
| Mathematical type |  |
| Domain |  |
| Index range |  |
| Physical meaning |  |
| Units or dimensions |  |
| Origin/provenance | `Source / crosswalk / defined here` |
| Origin anchor | Stable source ID, stable version key, and exact location; Notation Entry ID; or lesson-local heading and step |
| Local convention | Sign, metric, Fourier-transform, normalization, natural-unit, boundary-condition, and operator choices |
| Meaning of hats, bars, stars, boldface, subscripts, and superscripts |  |
| Definition status | Incomplete or complete |

Record all sign, metric, Fourier-transform, normalization, natural-unit, boundary-condition, and operator conventions that affect this lesson:

| Convention | Local choice | Stable source ID, stable version key, and exact location | Consequence for formulas or interpretation |
| --- | --- | --- | --- |
|  |  |  |  |

Before proceeding, verify that every symbol used below has a complete entry above. A crosswalk or source link does not waive the before-first-use definition requirement; state the lesson-local meaning whenever ambiguity is possible.

### Pre-delivery symbol inventory audit

Perform a symbol inventory audit before delivery.

Audit the notation section from top to bottom and each entry from left to right. At each cell, reject, reorder, or rewrite any entry that uses a dependency not completely defined earlier; the glyph being defined may appear in its own defining cell, but an auxiliary or example glyph may not appear there unless already defined.

- [ ] Inventory every glyph used in prose, inline mathematics, display mathematics, tables, and checks.
- [ ] Recursively inventory definition, domain, units, anchor, convention, and example cells; order entries so every dependency is defined earlier or completely in the same cell without introducing an undefined glyph.
- [ ] Define first-use standard functions and constants individually or in a clearly grouped mathematical primitives entry.
- [ ] Confirm each glyph and every meaning-changing indexed or decorated form has a complete local definition above before first use.
- [ ] Confirm each definition includes glyph/read-as, type, domain/index range, meaning, units/dimensions, source or origin anchor, local convention, and decoration meanings.
- [ ] For a continued lesson, confirm the leading-notation patch appears or was applied before the first added use; do not reteach completed content.
- [ ] Confirm all mathematics uses the required dollar-delimited LaTeX forms.

Repeat the inventory scan until no undefined glyph remains. When a repair introduces another glyph, scan again from the first notation entry through prose, inline and display mathematics, every table, and every definition cell.

## Mission connection and prerequisites

- Physical mission target advanced by this lesson:
- One dependency-sized learning objective:
- Prerequisite Concept Node IDs and Edge IDs, linked without redefining them:
- Prior Evidence ID + Obsidian links relied upon, such as EV-000001 — [[learning-records/EV-000001]], without copying learner history:
- Separate prerequisite lesson to open if a required step is unfamiliar:

## Note navigation

- Prerequisite Note links with descriptive aliases:
- Related Note links with descriptive aliases:
- Parent Note bridge back to the first dependent section, when this is a prerequisite Note:
- Next Note link, when already allocated:

## Exact source anchors and provenance

| Claim, equation, proof step, or code operation | Provenance label | Stable source ID | Stable version key | Exact page, section, equation, theorem, appendix, figure, or code location |
| --- | --- | --- | --- | --- |
|  | Source, Reconstructed, Inference, or Unresolved |  |  |  |

Do not teach from an unavailable passage. Move missing evidence to `OPEN-QUESTIONS.md`.

## Physical question

- State the single physical question answered here:
- Explain why this question is needed for the mission:
- State the system, observable, and regime being considered:

When a theorem or proof step is required by the physical argument, state the theorem or proof question and its exact role in that argument.

## Complete derivation or proof

There is no lesson or Note length cap. Show every calculation and logical implication needed to close this dependency. Do not skip algebra, substitutions, index contractions, sign changes, Fourier transforms, integrals, sums, limits, or intermediate proof steps.

For every non-trivial transition:

1. Write the starting expression or proposition.
2. Name the identity, theorem, assumption, approximation, boundary condition, or convention used.
3. Display every intermediate calculation or logical implication.
4. Track domains, index ranges, units or dimensions, and assumptions.
5. State why the transition is valid and what would make it fail.
6. Label the result as Source, Reconstructed, Inference, or Unresolved and cite the exact anchor.

### Starting point

- Source premise or previously established result:
- Assumptions and validity regime:

### Step-by-step work

Number each derivation or proof step. Add as many steps as required; never replace a missing step with a brevity phrase.

### Result

- Final result:
- Provenance label and exact source anchor:
- Assumptions retained in the result:
- Domain and validity regime:

## Physical interpretation and checks

### Interpretation

- Physical meaning of each important term:
- Mechanism or observable described:
- What the result does not establish:

### Checks

| Check | Complete calculation or argument | Expected behavior | Outcome |
| --- | --- | --- | --- |
| Units or dimensions |  |  |  |
| Limiting case |  |  |  |
| Symmetry or conservation law |  |  |  |
| Sign, normalization, or boundary condition |  |  |  |

When a theorem or proof step is required by the physical argument, add hypotheses, proof structure, edge cases, counterexamples, and its exact role without replacing physical interpretation and dimensional checks.

## Cross-source comparison

Trigger this section only when the lesson actually compares two or more supplied sources. For a single-source lesson, write `Not applicable — single-source lesson` and do not manufacture a comparison.

When comparison is active, link canonical Synthesis IDs and Relation IDs from `SYNTHESIS.md`. Do not copy Relation endpoint data, type, assumptions, status, or the six-class taxonomy into the lesson. If no canonical Relation exists, create or resolve it in `SYNTHESIS.md` before claiming a connection here.

| Synthesis ID | Canonical Synthesis Obsidian link | Relation ID | Canonical Relation Obsidian link |
| --- | --- | --- | --- |
| Y-001 | [[SYNTHESIS#Y-001]] | REL-000001 | [[SYNTHESIS#REL-000001]] |

Never claim equivalence without following the assumption map owned only by the canonical Relation registry entry. The linked Synthesis entry owns this lesson's comparison and application regime, not the assumptions that define whether the Relation holds.

## Code–theory bridge

Set exactly one state:

- `Active` — implementation is a mission target and supplied or explicitly in-scope trustworthy corresponding material is available;
- `Blocked — awaiting Q-ID` — implementation is a mission target but required material is missing; link its canonical Open Question, create no Code Map, keep the Mission completion row open, and block the dependent Roadmap phase;
- `N/A — implementation not a mission target` — create no Code Map even when incidental code exists.

- **Code bridge state:** Active, Blocked — awaiting Q-001 — [[OPEN-QUESTIONS#Q-001]], or N/A — implementation not a mission target

Use corresponding material only when it is official or author-associated open-source code at a pinned commit, a user-supplied immutable snapshot, or anchored pseudocode sufficient for mapping. Never substitute unrelated code or invent pseudocode to complete this section.

When the state is `N/A`, remove this entire section from the learner-facing Note. When it is `Blocked`, retain only the concise blocker and canonical Open Question link. Only `Active` continues below.

Before mapping, state:

- **Immutable-anchor status:** registered Git commit or snapshot anchor; or `Unassigned — supplied excerpt; snapshot registration pending`
- **Temporary visible excerpt or block locator, when pending:**

When the pending sentinel is required, the mapping is provisional and no canonical Code Map exists. Do not invent a key, snapshot path, hash, commit, or registration. Preserve existing Code Maps embedded in pre-v0.4 lessons; never migrate or overwrite them automatically. Create new canonical maps from `assets/templates/CODE-MAP.md` and new execution records from `assets/templates/RUN-RECORD.md` only under their allocation rules.

### Canonical Code Map links

| Code Map ID | Canonical Obsidian link | Scope and role |
| --- | --- | --- |
|  |  |  |

### Physical quantities and equation-to-variable mapping

Trace every implementation quantity from its source equation through assumptions, approximation, discretization, representation, and update. Define every code identifier in the leading notation section before first use here.

| Physical quantity | Theory equation and exact anchor | Derivation or approximation | Code variable | Units, domain, shape, and indices | How it is obtained and updated |
| --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |

### Algorithm and pedagogical pseudocode

Explain each operation as a physical accumulation, contraction, propagation, update, solve, or convergence test. Label pedagogical pseudocode **Reconstructed**, link every step to its canonical Code Map operation, and state each rename, omission, or simplification. Never present it as literal source code or execution evidence.

### Inputs, outputs, and validation boundary

State what enters, how each input is obtained, what physical observable leaves, its units and normalization, and which downstream object consumes it. Separate code inspection from actual execution evidence.

Without a canonical Run record and inspected output, describe only the intended output or interface and state `No execution or validation claim is made.`

### Canonical Run record links

| Run ID | Canonical Obsidian link | Claim supported |
| --- | --- | --- |
|  |  |  |

## Exercises

### Retrieval

- Prompt that tests interpretation without revealing the answer:
- Observable success criterion:

### Reconstruction

- Derivation, proof, translation, or calculation prompt:
- Work that must be shown:
- Allowed source access and hints:

### Transfer or implementation, when applicable

- New regime, convention, or code-mapping prompt:
- Required validation observable:

## Mastery check and next dependency

- Target capability and observable success criterion:
- Retrieval, reconstruction, synthesis, or implementation check IDs in this lesson:
- Evidence ID + Obsidian links created after an attempt, such as EV-000001 — [[learning-records/EV-000001]], without copying the response, hints, or mastery history:
- Review IDs, when scheduled:
- Next Concept Node IDs and Edge IDs from `CONCEPT-MAP.md`:
- Next lesson link:

Do not copy canonical learner history, current obstacles, queue state, or the exact resume snapshot into this lesson.

Before writeback delivery, read from the preceding established result through the first downstream result affected by the edit. Confirm that the inserted explanation is at its first dependency point, both surrounding transitions are complete, stale obstacle text and duplicates are gone, local numbering and provenance remain consistent, and every changed Note link resolves.

## End-of-Note checkpoint

- Question type: multiple-choice or true/false by default; use a produced-work follow-up only when the target requires it
- One concept or evidence category tested:
- Question shown without its answer:
- Options, when multiple-choice: three or four parallel plausible choices with varied correct-position placement
- Misconception mapped to each distractor:
- Observable interpretation or recognition criterion:
- Required derivation, proof, calculation, translation, or implementation follow-up, when stronger mastery is targeted:
- Evidence remains pending until the learner responds.

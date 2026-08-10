# Lesson L-000001 — Dependency-Sized Title

## Notation and conventions

Every new symbol must be defined before first use in prose or equations, regardless of whether its origin/provenance is `Source / crosswalk / defined here`. Complete every required field below before writing any later section. Include each decorated or indexed form as its own entry whenever a hat, bar, star, boldface, subscript, or superscript changes the meaning, type, domain, or convention.

First use includes symbols inside another symbol's definition, domain, units, anchor, convention, or example cell. Order notation entries by dependency. A symbol inside an entry must resolve to an earlier complete entry or be defined completely in the same cell without introducing another undefined glyph. Define each standard function or constant at first use, or define related primitives in a clearly grouped mathematical primitives entry. Meaning-changing decorated or indexed forms still require separate entries.

Code identifiers, unit glyphs, derived approximants, and error or variation symbols are not exempt; define each separately before first use.

A grouped primitives entry does not waive dependencies: dummy symbols introduced inside it must be defined earlier or eliminated.

Build the complete symbol-and-code-identifier dependency graph before drafting the notation section, then emit entries in topological order. Give every source symbol, lesson-local symbol, code identifier, and unit glyph its own entry; only a symbol and its genuinely equivalent code spelling may share an entry. Put all mathematical primitives needed anywhere in the finished Note before the first dependent entry. Do not place a code identifier in a later grouped row if an earlier definition, provenance cell, table, or formula already uses it.

This exact leading section is also mandatory for every response-only finished Note or preview. Use $...$ for inline LaTeX and $$...$$ for display LaTeX. Never use backslash-parenthesis or backslash-bracket math delimiters in canonical or response-only Note content.

Only after reading the complete canonical index may you allocate a stable ID. Absence from the prompt is not evidence that an index is empty. In provisional response-only output, replace every concrete sample ID below with inert type-specific placeholders such as `{{LESSON_ID_PENDING}}`, `{{EVIDENCE_ID_PENDING}}`, `{{SOURCE_ID_PENDING}}`, `{{RELATION_ID_PENDING}}`, `{{NOTATION_ID_PENDING}}`, `{{CODE_MAP_ID_PENDING}}`, and `{{RUN_ID_PENDING}}`; emit no live Obsidian link. Do not claim that a canonical record was created.

When continuing an existing lesson, do not repeat completed content. Before first use of any new symbol in added prose or formulas, display or apply a patch to the leading notation section that completes every symbol-definition field. Apply that notation patch before the content patch; in response-only output, show it first without claiming a canonical write. The first H2 of that continuation output must still be exactly `## Notation and conventions`.

- **Stable Lesson ID:** L-000001
- **Canonical lesson Obsidian link:** [[lessons/L-000001]]

This lesson is canonical only for teaching content, check criteria, and links to stable Evidence IDs plus Obsidian links. The dependency graph belongs to `CONCEPT-MAP.md`, the active snapshot belongs to `CURRENT-STATE.md`, and historical learner evidence belongs to immutable `learning-records/EV-000001.md`-style instances.

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

## Exact source anchors and provenance

| Claim, equation, proof step, or code operation | Provenance label | Stable source ID | Stable version key | Exact page, section, equation, theorem, appendix, figure, or code location |
| --- | --- | --- | --- | --- |
|  | Source, Reconstructed, Inference, or Unresolved |  |  |  |

Do not teach from an unavailable passage. Move missing evidence to `OPEN-QUESTIONS.md`.

## Physical question

- State the single physical question answered here:
- Explain why this question is needed for the mission:
- State the system, observable, and regime being considered:

For a pure-mathematics prerequisite, state the theorem or proof question and its exact downstream physical use.

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

For a pure-mathematics prerequisite, replace physical interpretation and dimensional checks with hypotheses, proof structure, edge cases, counterexamples, and downstream physical use.

## Cross-source comparison

Trigger this section only when the lesson actually compares two or more supplied sources. For a single-source lesson, write `Not applicable — single-source lesson` and do not manufacture a comparison.

When comparison is active, link canonical Synthesis IDs and Relation IDs from `SYNTHESIS.md`. Do not copy Relation endpoint data, type, assumptions, status, or the six-class taxonomy into the lesson. If no canonical Relation exists, create or resolve it in `SYNTHESIS.md` before claiming a connection here.

| Synthesis ID | Canonical Synthesis Obsidian link | Relation ID | Canonical Relation Obsidian link |
| --- | --- | --- | --- |
| Y-001 | [[SYNTHESIS#Y-001]] | REL-000001 | [[SYNTHESIS#REL-000001]] |

Never claim equivalence without following the assumption map owned only by the canonical Relation registry entry. The linked Synthesis entry owns this lesson's comparison and application regime, not the assumptions that define whether the Relation holds.

## Code–theory map

Set exactly one state:

- `Active` — implementation is a mission target and supplied or explicitly in-scope code, pseudocode, numerical-algorithm, or reproducibility material is available;
- `Blocked — awaiting Q-ID` — implementation is a mission target but required material is missing; link its canonical Open Question, create no Code Map, keep the Mission completion row `Required / Open`, and keep the Roadmap phase blocked;
- `N/A — implementation not a mission target` — do not create a Code Map even if incidental code exists.

- **Code bridge state:** Active, Blocked — awaiting Q-001 — [[OPEN-QUESTIONS#Q-001]], or N/A — implementation not a mission target

Only an Active section continues below. A Git repository uses a commit as its immutable revision anchor. An independent file, chat excerpt, or inline pseudocode first becomes a workspace read-only snapshot registered in `MATERIALS.md`, with snapshot path, content hash, received date, and block/algorithm-step locator. Never reject usable non-Git material merely because it has no commit, and never invent a commit.

Before any theoretical mapping, display the anchor state:

- **Immutable-anchor status:** registered Git commit or snapshot anchor; or `Unassigned — supplied excerpt; snapshot registration pending`
- **Temporary visible excerpt/block locator, when pending:**

When the pending sentinel is required in response-only output, the mapping is provisional and no canonical Code Map exists. Do not invent a stable key, snapshot path, hash, or registration.

Every lesson-local Code Map ID includes the stable Lesson ID, for example `CMAP-L-000001-001`, and is canonical only inside this lesson. It has a version, lifecycle status, and supersession links. Once an Evidence record links a Code Map ID, do not rewrite that ID's stable meaning; retain it and create a new local Code Map ID with bidirectional supersession fields. Complete architecture fields before line-level commentary.

A map shared by multiple lessons is canonical at `reference/code-maps/CMAP-GLOBAL-0001.md`, registered in `reference/code-maps/INDEX.md`, and only linked from ordinary lesson instances. Never copy a shared architecture map into a lesson.

### Shared global Code Map registry protocol

These copy-ready schemas are used only to bootstrap the registry or first shared map when the canonical files do not exist. An ordinary lesson does not reproduce them or embed populated shared fields; it fills only `Shared Code Map references in this lesson`.

#### Global Code Map ID allocation and append-only index

1. If `reference/code-maps/INDEX.md` does not exist, create it with the schema below and no data rows.
2. Read every index event, find the largest numeric suffix ever present in any `registered`, `superseded`, or `tombstone` event, add one, and zero-pad to four digits. Begin with `CMAP-GLOBAL-0001` when the index has no events.
3. Never reuse a Code Map ID, including after supersession, deletion, failure, or tombstone.
4. Create `reference/code-maps/CMAP-GLOBAL-0001.md` and append its `registered` event to the index.
5. The index is append-only: never edit or delete an earlier event. Append lifecycle events for supersession or tombstone. A replacement receives a new Code Map ID, records `Supersedes`, and the prior canonical file records `Superseded-by`.
6. A tombstoned ID remains in the index permanently with its reason and is never allocated again.

The `reference/code-maps/INDEX.md` event-row schema is:

| Event date and sequence | Code Map ID | Canonical Obsidian link | Map version | Immutable revision anchor | Status event | Supersedes ID | Superseded-by ID | Tombstone reason |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  | CMAP-GLOBAL-0001 | [[reference/code-maps/CMAP-GLOBAL-0001]] |  |  | registered, superseded, or tombstone |  |  |  |

#### Canonical global architecture map schema

Copy this schema into `reference/code-maps/CMAP-GLOBAL-0001.md`, not into a lesson instance. Complete the architecture-level fields before adding any line-level mapping links.

| Field | Canonical value |
| --- | --- |
| Code Map ID | CMAP-GLOBAL-0001 |
| Canonical path and Obsidian link | `reference/code-maps/CMAP-GLOBAL-0001.md`; [[reference/code-maps/CMAP-GLOBAL-0001]] |
| Title and reusable scope |  |
| Map version |  |
| Status | Active, superseded, or tombstoned |
| Supersedes Code Map ID |  |
| Superseded-by Code Map ID |  |
| Tombstone reason, when applicable |  |
| Theoretical object, equation, functional, action, or algorithm |  |
| Theory source anchors and provenance |  |
| Assumptions and controlled approximations |  |
| Code material Source ID, stable version key, and repository/snapshot identity |  |
| Immutable revision-anchor kind | Git commit or workspace read-only snapshot |
| Git commit, when applicable |  |
| Snapshot path, content hash, and received date, when applicable |  |
| Snapshot block or algorithm-step locator, when applicable |  |
| Architecture entry points | Repository, package, module, or executable locations |
| Modules and data flow |  |
| Major arrays/objects: owner, domain, units, shape, storage order, and index meanings |  |
| Inputs and their physical meaning and units |  |
| Outputs: physical meaning, units, normalization, and downstream consumer |  |
| Discretization, basis, grids, measure, and weights |  |
| Truncation |  |
| Regulator |  |
| Boundary and initial conditions |  |
| Symmetry reductions and partner maps |  |
| Convergence and numerical-stability checks |  |
| Validation observables and expected behavior |  |
| Execution Record IDs and canonical links |  |
| Line-level mapping IDs or links |  |
| What the code cannot establish or what must not be claimed |  |

#### Canonical global line-map schema and lifecycle

Inside each canonical global map, keep an append-only line-map event index. Allocate `CMAP-GLOBAL-0001-L0001` by reading every prior `registered`, `superseded`, or `tombstone` event and incrementing the largest suffix. Never reuse an ID. A changed stable mapping receives a new line-map ID, links `Supersedes`, updates the prior keyed record's `Superseded-by`, and appends the lifecycle event. Tombstones remain permanently reserved.

| Event date and sequence | Global line-map ID | Line-map version | Status event | Supersedes ID | Superseded-by ID | Tombstone reason |
| --- | --- | --- | --- | --- | --- | --- |
|  | CMAP-GLOBAL-0001-L0001 |  | registered, superseded, or tombstone |  |  |  |

Copy this keyed record inside the canonical global map for every global line-map ID:

##### CMAP-GLOBAL-0001-L0001

| Field | Canonical value |
| --- | --- |
| Global line-map ID | CMAP-GLOBAL-0001-L0001 |
| Parent Code Map ID | CMAP-GLOBAL-0001 |
| Line-map version |  |
| Status | Active, superseded, or tombstoned |
| Supersedes global line-map ID |  |
| Superseded-by global line-map ID |  |
| Tombstone reason, when applicable |  |
| Theoretical step or object |  |
| Theory source anchor and provenance |  |
| Assumptions used at this step |  |
| Immutable revision-anchor kind | Git commit or workspace read-only snapshot |
| Git commit, when applicable |  |
| Snapshot path, content hash, received date, and block/algorithm-step locator, when applicable |  |
| File and exact line/range, when applicable |  |
| Function, class, module, or pseudocode block |  |
| Code symbol, array, or object |  |
| Owner, units, domain, shape, storage order, and indices |  |
| Numerical operation |  |
| Basis/grid/measure/weights and boundary treatment realized here |  |
| Discretization, truncation, regulator, and symmetry/partner maps realized here |  |
| Inputs |  |
| Outputs, normalization, and consumer |  |
| Execution Record, convergence, or validation link |  |
| What this line mapping does not justify claiming |  |

### Shared Code Map references in this lesson

| Code Map ID | Map version | Canonical Obsidian link | Role in this lesson |
| --- | --- | --- | --- |
| CMAP-GLOBAL-0001 |  | [[reference/code-maps/CMAP-GLOBAL-0001]] |  |

### Architecture-level map

#### CMAP-L-000001-001

| Field | Mapping |
| --- | --- |
| Map ID | CMAP-L-000001-001 |
| Canonical scope | Lesson-local in L-000001 — [[lessons/L-000001]] |
| Map version |  |
| Status | Active, superseded, or tombstoned |
| Supersedes Code Map ID |  |
| Superseded-by Code Map ID |  |
| Tombstone reason, when applicable |  |
| Theoretical object, equation, functional, action, or algorithm |  |
| Theory source anchors and provenance |  |
| Assumptions and controlled approximations |  |
| Code material Source ID, stable version key, and repository/snapshot identity |  |
| Immutable revision-anchor kind | Git commit or workspace read-only snapshot |
| Git commit, when applicable |  |
| Snapshot path, content hash, and received date, when applicable |  |
| Snapshot block or algorithm-step locator, when applicable |  |
| Architecture entry points | Repository, package, module, or executable locations |
| Modules and data flow |  |
| Major arrays/objects: owner, domain, units, shape, storage order, and index meanings |  |
| Inputs and their physical meaning and units |  |
| Outputs: physical meaning, units, normalization, and downstream consumer |  |
| Discretization, basis, grids, measure, and weights |  |
| Truncation |  |
| Regulator |  |
| Boundary and initial conditions |  |
| Symmetry reductions and partner maps |  |
| Convergence and numerical-stability checks |  |
| Validation observables and expected behavior |  |
| Execution Record IDs and canonical links |  |
| What the code cannot establish or what must not be claimed |  |

### Line-level mappings

Add these only after the architecture-level map is complete. Use its immutable revision anchor; a commit is conditional on Git material.

| Line map ID | Architecture map ID | Theory anchor | Immutable revision anchor | File/line or snapshot block | Code symbol or array |
| --- | --- | --- | --- | --- | --- |
| CMAP-L-000001-001-L1 | CMAP-L-000001-001 |  |  |  |  |

#### CMAP-L-000001-001-L1

| Field | Mapping |
| --- | --- |
| Line map ID | CMAP-L-000001-001-L1 |
| Architecture map ID | CMAP-L-000001-001 |
| Line-map version |  |
| Status | Active, superseded, or tombstoned |
| Supersedes line-map ID |  |
| Superseded-by line-map ID |  |
| Theoretical step or object |  |
| Theory source anchor and provenance |  |
| Assumptions used at this step |  |
| Immutable revision-anchor kind | Git commit or workspace read-only snapshot |
| Git commit, when applicable |  |
| Snapshot path, content hash, received date, and block/algorithm-step locator, when applicable |  |
| File and exact line/range, when applicable |  |
| Function, class, module, or pseudocode block |  |
| Code symbol or array |  |
| Owner, units, domain, shape, storage order, and indices |  |
| Numerical operation |  |
| Basis/grid/measure/weights and boundary treatment realized here |  |
| Discretization, truncation, regulator, and symmetry/partner maps realized here |  |
| Inputs |  |
| Outputs, normalization, and consumer |  |
| Execution Record, convergence, or validation link |  |
| What this line mapping does not justify claiming |  |

### Execution evidence registry protocol

Source provenance remains exactly Source, Reconstructed, Inference, or Unresolved. Execution evidence is an orthogonal classification used only for run-dependent claims:

- `Observed execution evidence` — directly captured command, log, raw output, or immutable output artifact from a Run record;
- `Computed execution evidence` — a derived metric, comparison, fit, convergence estimate, or post-processed quantity whose inputs and method are anchored in that Run record.

Use the following copy-ready schemas only to bootstrap `execution-records/INDEX.md` or a Run record when they do not exist. Ordinary lessons only link Run IDs.

1. Read the entire append-only index, increment the largest suffix ever present in a `registered`, `superseded`, or `tombstone` event, and zero-pad to six digits; begin with `RUN-000001`.
2. Never reuse a Run ID. Create `execution-records/RUN-000001.md`, append its `registered` event, and keep its command, environment, inputs, and output payload immutable.
3. The index is append-only: never edit or delete an earlier event. A correction or invalidated run uses a new Run ID with bidirectional supersession links. Only lifecycle status and supersession metadata may be completed on the prior record; its execution payload never changes. A tombstoned ID remains indexed with its reason.

| Event date and sequence | Run ID | Canonical Obsidian link | Status event | Immutable revision anchor | Supersedes Run ID | Superseded-by Run ID | Tombstone reason |
| --- | --- | --- | --- | --- | --- | --- | --- |
|  | RUN-000001 | [[execution-records/RUN-000001]] | registered, superseded, or tombstone |  |  |  |  |

Copy this schema into `execution-records/RUN-000001.md`:

| Field | Canonical value |
| --- | --- |
| Run ID | RUN-000001 |
| Canonical path and Obsidian link | `execution-records/RUN-000001.md`; [[execution-records/RUN-000001]] |
| Status | Active, superseded, or tombstoned |
| Supersedes Run ID |  |
| Superseded-by Run ID |  |
| Tombstone reason, when applicable |  |
| Date/time |  |
| Code Map IDs and canonical links |  |
| Immutable revision-anchor kind | Git commit or workspace read-only snapshot |
| Git commit, when applicable |  |
| Snapshot path, content hash, received date, and block/algorithm-step locator, when applicable |  |
| Exact command and working directory |  |
| Environment, dependencies, hardware, and random seed |  |
| Numeric precision and solver tolerances |  |
| Inputs and parameters, with units |  |
| Raw log/output artifact paths and content hashes |  |
| Convergence sequence or stability diagnostic |  |
| Validation observable and acceptance criteria |  |
| Outcome, discrepancy, uncertainty, and tolerance |  |
| Non-claims and unresolved limitations |  |

#### Execution evidence items

| Item ID | Class | Claim | Artifact/field anchor | Computation method, when applicable |
| --- | --- | --- | --- | --- |
| RUN-000001-E1 | Observed execution evidence or Computed execution evidence |  |  |  |

Without a canonical Run record and inspected output, a filename or pseudocode supports only the intended output or interface. State `No execution or validation claim is made.` Without a Run ID plus canonical link, do not claim that code was executed, outputs matched, or convergence was observed or computed.

### Execution Record references in this lesson

| Run ID | Canonical Obsidian link | Claim supported |
| --- | --- | --- |
| RUN-000001 | [[execution-records/RUN-000001]] |  |

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

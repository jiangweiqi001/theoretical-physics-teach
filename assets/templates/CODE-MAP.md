# Code Map {{CODE_MAP_ID}} — {{TITLE}}

> Instantiate this file only after reading the complete append-only Code Map index. `{{...}}` values are inert schema placeholders, not registered records. In response-only output use `{{CODE_MAP_ID_PENDING}}`, emit no live Obsidian link, and make no canonical-write claim.

This file owns a canonical theory-to-code mapping. An ordinary lesson links it and explains the learner-facing physics; it does not copy this registry payload. Existing Code Maps embedded in pre-v0.4 lessons remain valid and are never migrated automatically.

## Code Map index and ID allocation

The canonical index is `reference/code-maps/INDEX.md`.

1. If the index does not exist, create it with the event schema below and no registered records.
2. Read every event before allocation. Find the largest numeric suffix ever used by a `registered`, `superseded`, or `tombstone` event, increment it, and zero-pad to four digits. Begin with `CMAP-GLOBAL-0001` only when no prior event exists.
3. Never reuse an ID after supersession, deletion, failure, or tombstone.
4. Create `reference/code-maps/{{CODE_MAP_ID}}.md`, then append its `registered` event.
5. The index is append-only. A replacement receives a new ID, records `Supersedes`, and is linked from the prior record through `Superseded by`.

| Event date and sequence | Code Map ID | Canonical Obsidian link | Map version | Immutable implementation anchor | Status event | Supersedes | Superseded by | Tombstone reason |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| {{EVENT}} | {{CODE_MAP_ID}} | {{CODE_MAP_LINK}} | {{MAP_VERSION}} | {{IMPLEMENTATION_ANCHOR}} | registered, superseded, or tombstone | {{SUPERSEDES}} | {{SUPERSEDED_BY}} | {{TOMBSTONE_REASON}} |

## Identity and lifecycle

| Field | Canonical value |
| --- | --- |
| Code Map ID | {{CODE_MAP_ID}} |
| Canonical path and Obsidian link | `reference/code-maps/{{CODE_MAP_ID}}.md`; {{CODE_MAP_LINK}} |
| Title and reusable scope | {{TITLE_AND_SCOPE}} |
| Scope class | Lesson-scoped or shared global |
| Map version | {{MAP_VERSION}} |
| Status | Active, superseded, or tombstoned |
| Supersedes Code Map ID | {{SUPERSEDES}} |
| Superseded by Code Map ID | {{SUPERSEDED_BY}} |
| Tombstone reason | {{TOMBSTONE_REASON}} |
| Immutable implementation-anchor kind | Git commit or registered read-only snapshot |
| Git commit, when applicable | {{GIT_COMMIT_OR_NA}} |
| Snapshot path, hash algorithm, digest, and received date, when applicable | {{SNAPSHOT_RECORD_OR_NA}} |
| Snapshot block or algorithm-step locator, when applicable | {{SNAPSHOT_LOCATOR_OR_NA}} |

## Architecture-level theory-to-code map

Complete this section before operation-level commentary.

| Field | Canonical mapping |
| --- | --- |
| Theoretical object, equation, functional, action, or algorithm | {{THEORY_OBJECT}} |
| Theory source anchors and provenance | {{THEORY_ANCHORS}} |
| Assumptions and controlled approximations | {{ASSUMPTIONS}} |
| Implementation Source ID, stable version key, and repository or snapshot identity | {{IMPLEMENTATION_SOURCE}} |
| Architecture entry points | {{ENTRY_POINTS}} |
| Modules and data flow | {{MODULES_AND_FLOW}} |
| Major arrays or objects: owner, domain, units, shape, storage order, and indices | {{MAJOR_OBJECTS}} |
| Inputs and their physical meaning and units | {{INPUTS}} |
| Outputs: physical meaning, units, normalization, and consumer | {{OUTPUTS}} |
| Basis, grid, integration measure, and weights | {{BASIS_GRID_MEASURE}} |
| Discretization and truncation | {{DISCRETIZATION_AND_TRUNCATION}} |
| Regulator | {{REGULATOR}} |
| Initial and boundary conditions | {{INITIAL_AND_BOUNDARY_CONDITIONS}} |
| Symmetry reductions and partner maps | {{SYMMETRY_MAPS}} |
| Convergence and numerical-stability checks | {{CONVERGENCE_CHECKS}} |
| Validation observables and expected behavior | {{VALIDATION_OBSERVABLES}} |
| Run IDs and canonical links | {{RUN_LINKS}} |
| What this map cannot establish | {{NON_CLAIMS}} |

## Physical-quantity derivation chains

Add one row for every distinct physical quantity. Do not merge quantities merely because one array stores them at different stages.

| Physical quantity and theory anchor | Derivation, approximation, or reconstruction | Discretized representation | Code variable or array | Units and domain | Shape, storage order, and indices | Initialization and update rule | Output destination and consumer | Validation observable and Run-linked claim boundary |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| {{QUANTITY}} | {{DERIVATION}} | {{REPRESENTATION}} | {{CODE_VARIABLE}} | {{UNITS_AND_DOMAIN}} | {{SHAPE_AND_INDICES}} | {{UPDATE_RULE}} | {{OUTPUT_AND_CONSUMER}} | {{VALIDATION_BOUNDARY}} |

## Pedagogical pseudocode provenance

Pedagogical pseudocode is allowed only when reconstructed from trustworthy corresponding material. Label it **Reconstructed**, link every operation to an operation-map ID below, and state every rename, omitted detail, or simplification. It is not literal source code and is not execution evidence.

## Operation-map index and lifecycle

Inside this Code Map, keep an append-only operation-map event index. Allocate the next suffix from every prior registered, superseded, and tombstoned event. Never reuse an operation-map ID.

| Event date and sequence | Operation-map ID | Version | Status event | Supersedes | Superseded by | Tombstone reason |
| --- | --- | --- | --- | --- | --- | --- |
| {{EVENT}} | {{OPERATION_MAP_ID}} | {{OPERATION_MAP_VERSION}} | registered, superseded, or tombstone | {{SUPERSEDES}} | {{SUPERSEDED_BY}} | {{TOMBSTONE_REASON}} |

## Operation-level mappings

### {{OPERATION_MAP_ID}}

| Field | Canonical mapping |
| --- | --- |
| Operation-map ID and parent Code Map ID | {{OPERATION_MAP_ID}}; {{CODE_MAP_ID}} |
| Version, status, and supersession | {{OPERATION_LIFECYCLE}} |
| Theoretical step or object | {{THEORY_STEP}} |
| Theory source anchor and provenance | {{THEORY_STEP_ANCHOR}} |
| Assumptions used at this step | {{STEP_ASSUMPTIONS}} |
| Immutable implementation anchor | {{IMPLEMENTATION_ANCHOR}} |
| File and exact line range, or snapshot block and algorithm-step locator | {{IMPLEMENTATION_LOCATOR}} |
| Function, class, module, or pseudocode block | {{IMPLEMENTATION_BLOCK}} |
| Code symbol, array, or object | {{CODE_OBJECT}} |
| Owner, units, domain, shape, storage order, and indices | {{CODE_OBJECT_SCHEMA}} |
| Numerical operation | {{NUMERICAL_OPERATION}} |
| Basis, grid, measure, weights, and boundary treatment | {{NUMERICAL_REPRESENTATION}} |
| Discretization, truncation, regulator, and symmetry maps | {{APPROXIMATION_REALIZATION}} |
| Inputs | {{OPERATION_INPUTS}} |
| Outputs, normalization, and consumer | {{OPERATION_OUTPUTS}} |
| Run, convergence, or validation link | {{RUN_OR_VALIDATION_LINK}} |
| What this operation does not justify claiming | {{OPERATION_NON_CLAIMS}} |

## Audit before linking from a lesson

- [ ] Every theory claim has an exact, reopenable source anchor and provenance label.
- [ ] The implementation anchor is an exact Git commit or a registered immutable snapshot.
- [ ] Every physical quantity is traced from theory to its code representation and update.
- [ ] Units, domains, shapes, storage order, and index meanings are explicit.
- [ ] Pseudocode is labeled Reconstructed and operation-linked.
- [ ] Run-dependent claims have canonical Run links; otherwise the non-claim boundary is explicit.
- [ ] The lesson links this record without copying its canonical registry fields.

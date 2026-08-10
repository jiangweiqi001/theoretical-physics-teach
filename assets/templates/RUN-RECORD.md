# Run {{RUN_ID}} — {{TITLE}}

> A Run record is immutable execution evidence. `{{...}}` values are inert schema placeholders, not registered records. Allocate an ID only after reading the complete append-only Run index. In response-only output use `{{RUN_ID_PENDING}}`, emit no live Obsidian link, and make no execution or canonical-write claim.

This file owns observed execution payloads and quantities computed from them. Lessons and Code Maps link it; they do not copy its command, environment, output, or evidence items.

## Run index and ID allocation

The canonical index is `execution-records/INDEX.md`.

1. If the index does not exist, create it with the event schema below and no registered records.
2. Read every event, find the largest numeric suffix ever used by a `registered`, `superseded`, or `tombstone` event, increment it, and zero-pad to six digits. Begin with `RUN-000001` only when no prior event exists.
3. Never reuse a Run ID. Create `execution-records/{{RUN_ID}}.md`, append its `registered` event, and keep its execution payload immutable.
4. A correction or invalidated execution uses a new Run ID with bidirectional supersession links. Only lifecycle metadata may be completed on the prior record; its command, environment, inputs, and outputs never change.
5. A tombstoned ID remains indexed permanently with its reason.

| Event date and sequence | Run ID | Canonical Obsidian link | Status event | Immutable implementation anchor | Supersedes | Superseded by | Tombstone reason |
| --- | --- | --- | --- | --- | --- | --- | --- |
| {{EVENT}} | {{RUN_ID}} | {{RUN_LINK}} | registered, superseded, or tombstone | {{IMPLEMENTATION_ANCHOR}} | {{SUPERSEDES}} | {{SUPERSEDED_BY}} | {{TOMBSTONE_REASON}} |

## Identity and lifecycle

| Field | Canonical value |
| --- | --- |
| Run ID | {{RUN_ID}} |
| Canonical path and Obsidian link | `execution-records/{{RUN_ID}}.md`; {{RUN_LINK}} |
| Title | {{TITLE}} |
| Status | Active, superseded, or tombstoned |
| Supersedes Run ID | {{SUPERSEDES}} |
| Superseded by Run ID | {{SUPERSEDED_BY}} |
| Tombstone reason | {{TOMBSTONE_REASON}} |
| Code Map IDs and canonical links | {{CODE_MAP_LINKS}} |
| Immutable implementation-anchor kind | Git commit or registered read-only snapshot |
| Git commit, when applicable | {{GIT_COMMIT_OR_NA}} |
| Snapshot path, hash algorithm, digest, received date, and locator, when applicable | {{SNAPSHOT_RECORD_OR_NA}} |

## Reproducible execution payload

| Field | Immutable value |
| --- | --- |
| Date and time with timezone | {{DATE_TIME}} |
| Exact command and working directory | {{COMMAND_AND_WORKDIR}} |
| Environment and dependencies | {{ENVIRONMENT}} |
| Hardware | {{HARDWARE}} |
| Random seed or deterministic status | {{SEED}} |
| Numeric precision and solver tolerances | {{PRECISION_AND_TOLERANCES}} |
| Inputs and parameters with units | {{INPUTS}} |
| Raw log and output artifact paths with content hashes | {{OUTPUT_ARTIFACTS}} |
| Convergence sequence or stability diagnostic | {{CONVERGENCE_DIAGNOSTIC}} |
| Validation observable and acceptance criterion | {{VALIDATION_CRITERION}} |
| Outcome, discrepancy, uncertainty, and tolerance | {{OUTCOME}} |
| Non-claims and unresolved limitations | {{NON_CLAIMS}} |

## Execution evidence items

Source provenance remains `Source`, `Reconstructed`, `Inference`, or `Unresolved`. Execution evidence is an independent classification:

- `Observed execution evidence` is a directly captured command, log, raw output, or immutable output artifact in this Run;
- `Computed execution evidence` is a derived metric, comparison, fit, convergence estimate, or post-processed quantity whose inputs and method are anchored in this Run.

| Item ID | Class | Claim | Artifact or field anchor | Computation method, when applicable |
| --- | --- | --- | --- | --- |
| {{RUN_EVIDENCE_ID}} | Observed execution evidence or Computed execution evidence | {{CLAIM}} | {{ANCHOR}} | {{METHOD_OR_NA}} |

## Audit before linking a run-dependent claim

- [ ] The Run ID was allocated from the complete append-only index.
- [ ] The implementation revision or snapshot is immutable and exactly anchored.
- [ ] The command, working directory, environment, dependencies, hardware, seed, precision, and tolerances are recorded.
- [ ] Inputs and outputs include units, paths, and content hashes where applicable.
- [ ] Every computed evidence item gives its inputs and method.
- [ ] Discrepancies, uncertainty, convergence limitations, and non-claims are preserved.
- [ ] No lesson or Code Map claims execution, agreement, or convergence beyond the linked evidence items.

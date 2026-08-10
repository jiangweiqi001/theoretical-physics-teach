# Code-Theory Bridge Protocol

Apply this three-state gate before mapping:

- `Active` only when implementation is a mission target and user-supplied or explicitly in-scope code, pseudocode, numerical-algorithm, or reproducibility material is available;
- `Blocked — awaiting Q-ID` when implementation is a mission target but that material is missing: create/link the canonical Open Question, construct no Code Map, and keep the Mission completion row `Required / Open` and the Roadmap phase blocked;
- `N/A — implementation not a mission target` when implementation is outside the mission, even if incidental code exists.

Only `Active` continues through this protocol. Do not turn `Blocked` into `N/A` merely because material has not arrived.

## 1. Pin evidence and establish scope

Register the code or pseudocode in an immutable keyed version record in `MATERIALS.md` before mapping it. Git material uses the exact commit as its immutable revision anchor; a branch name or mutable working tree is insufficient. For an independent file, chat excerpt, or inline pseudocode, first save a workspace read-only snapshot and record its path, hash algorithm and digest, received date, and exact block/algorithm-step locator. Do not reject non-Git material for lacking a commit and never invent one.

Separate claims as follows:

- **Source:** syntax, control flow, constants, calls, data shapes, or behavior directly visible at an immutable commit-or-snapshot anchor;
- **Reconstructed:** a theoretical role or algorithmic dataflow derived by tracing anchored code, with the reconstruction shown;
- **Inference:** external knowledge or a theory-to-code interpretation not established by the code itself; cite a separately registered external source when one exists;
- **Unresolved:** missing files, unpinned revisions, generated behavior not inspected, ambiguous semantics, or an unverified mapping.

Do not describe an inferred physical meaning as something the code states. Put unavailable or ambiguous behavior in `OPEN-QUESTIONS.md`; never invent it.

These four labels remain source provenance. Runtime claims use a separate, orthogonal class: `Observed execution evidence` for directly captured commands/logs/raw artifacts, or `Computed execution evidence` for derived metrics/comparisons whose inputs and method are anchored in a Run record. Neither execution class replaces source provenance.

## 2. Map architecture before lines

Complete an architecture-level map before line-by-line commentary. Identify:

1. the theoretical equation, object, functional, action, Hamiltonian, observable, or algorithm and its exact source anchor;
2. assumptions and controlled approximations;
3. repository and commit, or snapshot path/hash/received date/block locator; entry points, modules, call/data flow, and ownership of major arrays or objects;
4. inputs, parameters, physical meanings, units, domains, shapes, and indices;
5. outputs, observables, units, normalization, and how they are consumed;
6. discretization, basis and grids, integration/summation measure and weights, truncation, cutoff/regulator, boundary/initial conditions, and symmetry reductions or partner maps;
7. convergence and numerical-stability tests, validation observables and expected behavior, and explicit non-claims.

Only then add exact immutable-revision line mappings. Each line map connects one theoretical step or object to a commit/file/line/function anchor or snapshot/hash/date/block anchor, code symbol or array, owner, units, domain, shape, storage order, indices, numerical operation, inputs, normalized outputs and consumer, realized basis/grid/measure/weights, boundary treatment, discretization/truncation/regulator, symmetry/partner maps, and its Run/convergence/validation link. Never substitute a filename-level association for this mapping.

## 3. Explain numerical and pseudocode operations physically

For every loop, vectorized operation, or solver step, state the physical quantity accumulated or updated and connect it to the corresponding term in the theory expression. Verify explicitly:

- the meaning and range of every loop/index variable;
- grid construction, spacing, measure, quadrature weights, normalization, and endpoint treatment;
- array shape/order and the correspondence between mathematical and storage indices;
- symmetry maps and partner maps such as momentum, frequency, spin, band, or lattice-site partners;
- boundary behavior, periodic wrapping, offsets, and whether each mapped index is in range;
- for every finite index truncation, the actual included endpoints and an elementwise or algebraic proof that each required involution/partner map sends the discrete set back into itself; the word `symmetric` alone is not a closure check;
- that contractions, paired indices, input/output domains, and update dependencies close consistently;
- the approximations, regulator/cutoff, and truncation realized by the operation.

For example, Python `range(-Nw, Nw)` is the discrete set $\{-Nw,\ldots,Nw-1\}$. Under the fermionic partner map $m\mapsto -m-1$, $m=-Nw$ maps to $Nw-1$ and $m=Nw-1$ maps to $-Nw$. More generally, $-Nw\le m\le Nw-1$ implies $-Nw\le -m-1\le Nw-1$, and applying the map twice returns $m$, so the set is closed under this involution. Re-run this closure proof whenever the range, endpoint convention, truncation, or partner map changes.

If the map cannot be checked from supplied material, label the affected statement Unresolved and record the missing evidence.

## 4. Use canonical Code Map identities

A map used only by one lesson is canonical inside that lesson. Its ID includes the stable Lesson ID, for example `CMAP-L-000001-001`; its line IDs extend it, for example `CMAP-L-000001-001-L1`. Record map version, status, `Supersedes`, and `Superseded-by`. After an Evidence record links an ID, its stable meaning is immutable: retain it and create a new ID for a correction or new revision. Complete architecture fields before line records. Link the local ID from state and Evidence records; do not present it as shared.

A map shared by multiple lessons is canonical at `reference/code-maps/CMAP-GLOBAL-0001.md`, registered in `reference/code-maps/INDEX.md`, and only linked from ordinary lessons. The embedded `LESSON.md` shared schemas are used only for first bootstrap when the registry/map does not exist; never copy a populated shared architecture map into each lesson.

For a global ID:

1. create the index with the canonical `LESSON.md` event schema if it does not exist;
2. read every `registered`, `superseded`, or `tombstone` event and allocate one greater than the largest suffix ever present, zero-padded to four digits;
3. never reuse an ID after supersession, deletion, failure, or tombstone;
4. create the canonical map file, then append its `registered` event; never edit or delete an earlier index event;
5. supersession allocates a new ID, records `Supersedes` in the replacement, records `Superseded-by` in the prior canonical file, and appends the lifecycle event;
6. tombstone by appending an event with a reason; retain the ID permanently.

The canonical global map records its map version, immutable commit-or-snapshot anchor, and complete architecture fields. Its append-only global line-map index uses `CMAP-GLOBAL-0001-L0001`-style IDs and the same exact `registered`, `superseded`, or `tombstone` event enumeration. Global line mappings have their own versions, status, supersession links, complete copy-ready records, and never-reused IDs as defined in `LESSON.md`. If code or theory changes invalidate stable meaning, supersede rather than silently rewrite it.

## 5. Validate without overclaiming

Distinguish code inspection, successful execution, numerical agreement, convergence evidence, and physical proof. A run can show only what happened for its immutable revision anchor, inputs, environment, precision, and tolerances. Passing tests or matching a benchmark does not prove the underlying physical model, approximations, regime of validity, or uniqueness of interpretation.

Use the append-only `execution-records/INDEX.md` and immutable `execution-records/RUN-000001.md`-style records defined by the copy-ready `LESSON.md` schema. Allocate a never-reused Run ID from all `registered`, `superseded`, and `tombstone` events. Record status/supersession, immutable revision or snapshot anchor, exact command, environment, precision/tolerances, inputs/parameters, raw output artifact paths and hashes, convergence sequence, acceptance criteria, outcome/discrepancy, and remaining non-claims. Corrections use a new Run ID; do not rewrite an old Run.

For each runtime claim, link the Run ID and canonical record, then label the evidence item `Observed execution evidence` or `Computed execution evidence`. Without a Run anchor, do not claim that execution occurred, results matched, or convergence was observed or computed. If verification was not performed, say so explicitly.

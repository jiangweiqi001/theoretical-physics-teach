# Code-Theory Bridge Protocol

Apply this three-state gate before mapping:

- `Active` only when implementation is a mission target and user-supplied or explicitly in-scope code, pseudocode, numerical-algorithm, or reproducibility material is available;
- `Blocked — awaiting Q-ID` when implementation is a mission target but that material is missing: create/link the canonical Open Question, construct no Code Map, and keep the Mission completion row `Required / Open` and the Roadmap phase blocked;
- `N/A — implementation not a mission target` when implementation is outside the mission, even if incidental code exists.

Only `Active` continues through this protocol. Do not turn `Blocked` into `N/A` merely because material has not arrived.

Use corresponding implementation material only when it is official or author-associated open-source code at a pinned commit, a user-supplied immutable snapshot, or anchored pseudocode sufficient for the mapping.

If the user authorizes targeted discovery, search only repositories linked by the paper, its authors, the named project, or official documentation. Verify the relationship before registration and pin the exact commit before a canonical Code Map. Do not substitute an unrelated implementation merely because it solves a similar equation. If implementation is optional and no trustworthy corresponding material is available, use `N/A` and omit the learner-facing code section. If implementation is required, keep `Blocked` and its Open Question. Never invent code or pseudocode to complete the section.

## 1. Pin evidence and establish scope

Register the code or pseudocode in an immutable keyed version record in `MATERIALS.md` before mapping it. Git material uses the exact commit as its immutable revision anchor; a branch name or mutable working tree is insufficient. For an independent file, chat excerpt, or inline pseudocode, first save a workspace read-only snapshot and record its path, hash algorithm and digest, received date, and exact block/algorithm-step locator. Do not reject non-Git material for lacking a commit and never invent one.

Before any theoretical mapping of inline or non-Git pseudocode, display `Immutable-anchor status` explicitly. Use the registered snapshot path, hash, received date, and block locator when they exist. In a response-only context where no real snapshot can be written, display `Unassigned — supplied excerpt; snapshot registration pending` plus the temporary visible excerpt/block locator. The resulting explanation or mapping is provisional, not a canonical Code Map. Never invent a snapshot path, content hash, stable key, or registration.

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

For every physical quantity, record a complete derivation chain: theoretical definition and exact anchor; source derivation, controlled approximation, or explicit reconstruction; discretized representation; code variable or array; units and domain; shape, storage order, and index meanings; initialization and update rule; output destination and downstream consumer; and validation observable plus the claim it cannot support without a Run. Do not hide a quantity inside a general architecture paragraph.

Only then add exact immutable-revision line mappings. Each line map connects one theoretical step or object to a commit/file/line/function anchor or snapshot/hash/date/block anchor, code symbol or array, owner, units, domain, shape, storage order, indices, numerical operation, inputs, normalized outputs and consumer, realized basis/grid/measure/weights, boundary treatment, discretization/truncation/regulator, symmetry/partner maps, and its Run/convergence/validation link. Never substitute a filename-level association for this mapping.

## 3. Explain numerical and pseudocode operations physically

Present implementation only after the physical theory it realizes. Use this explanatory order: physical problem and source equation; assumptions and approximations; basis, discretization, grids, measures, weights, cutoffs, regulators, boundaries, and symmetry reductions; anchored pedagogical pseudocode; loop-by-loop or solver-step physical meaning; intended outputs; then validation evidence and non-claims.

Pedagogical pseudocode reconstructed from anchored implementation must be labeled **Reconstructed**, cite the exact pinned code steps from which it was derived, and distinguish renamed or simplified operations from literal source. It is not an additional Source anchor and is not execution evidence.

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

For every newly allocated map, instantiate `assets/templates/CODE-MAP.md` at `reference/code-maps/{stable-code-map-id}.md`. Register it in `reference/code-maps/INDEX.md` and link it from each lesson that teaches the mapping. The lesson owns the learner-facing explanation; the external Code Map owns identity, architecture, quantity chains, operation maps, lifecycle, and Run links. Do not copy the canonical payload into the lesson.

Read the complete append-only index before allocation. Allocate one greater than the largest suffix ever present in any `registered`, `superseded`, or `tombstone` event. Never reuse an ID after supersession, deletion, failure, or tombstone. Create the canonical map file before appending its `registered` event. A correction or changed stable meaning receives a new ID and bidirectional supersession links; never silently rewrite an Evidence-linked identity.

Existing Code Maps embedded in pre-v0.4 lessons remain valid canonical legacy records. Do not migrate or overwrite them automatically. When such a map needs a new stable revision, create an external map with a new ID, record the relationship explicitly, and retain the old lesson record for historical links.

Use the complete copy-ready index, architecture, physical-quantity, operation-map, lifecycle, and audit schemas in `assets/templates/CODE-MAP.md`. Do not reproduce those schemas in an ordinary lesson.

## 5. Validate without overclaiming

Distinguish code inspection, successful execution, numerical agreement, convergence evidence, and physical proof. A run can show only what happened for its immutable revision anchor, inputs, environment, precision, and tolerances. Passing tests or matching a benchmark does not prove the underlying physical model, approximations, regime of validity, or uniqueness of interpretation.

Without a canonical Run record and direct inspection of its output artifacts, a filename, function name, or pseudocode is not evidence of a successful numerical calculation. Describe only the intended output or interface, and state `No execution or validation claim is made.` Do not relabel an intended result as Observed execution evidence or Computed execution evidence.

Only after a real execution produces inspectable output, instantiate `assets/templates/RUN-RECORD.md` at `execution-records/{stable-run-id}.md`. Use its append-only index and immutable payload rules. Allocate a never-reused Run ID from all `registered`, `superseded`, and `tombstone` events. Record status and supersession, immutable revision or snapshot anchor, exact command, environment, precision and tolerances, inputs and parameters, raw output artifact paths and hashes, convergence sequence, acceptance criteria, outcome or discrepancy, and remaining non-claims. Corrections use a new Run ID; do not rewrite an old Run.

For each runtime claim, link the Run ID and canonical record, then label the evidence item `Observed execution evidence` or `Computed execution evidence`. Without a Run anchor, do not claim that execution occurred, results matched, or convergence was observed or computed. If verification was not performed, say so explicitly.

# Code-Theory Bridge Protocol

Use this protocol only when the learner has supplied or explicitly included in the course scope code, pseudocode, a numerical algorithm, or reproducibility material. Such material is required: an implementation target alone does not activate the bridge. If implementation is a target but no such material is available yet, record the missing material and evidence needed in `OPEN-QUESTIONS.md`, mark the lesson section as awaiting material or not applicable, and do not construct a code map.

## 1. Pin evidence and establish scope

Register the repository or pseudocode source in `MATERIALS.md` before mapping it. Record the exact repository identity, stable Source ID, version and pinned commit, available path, and addressability. A branch name or mutable working tree is not a reproducible code anchor.

Separate claims as follows:

- **Source:** syntax, control flow, constants, calls, data shapes, or behavior directly visible at a pinned commit/file/line/function anchor;
- **Reconstructed:** a theoretical role or algorithmic dataflow derived by tracing anchored code, with the reconstruction shown;
- **Inference:** external knowledge or a theory-to-code interpretation not established by the code itself; cite a separately registered external source when one exists;
- **Unresolved:** missing files, unpinned revisions, generated behavior not inspected, ambiguous semantics, or an unverified mapping.

Do not describe an inferred physical meaning as something the code states. Put unavailable or ambiguous behavior in `OPEN-QUESTIONS.md`; never invent it.

## 2. Map architecture before lines

Complete an architecture-level map before line-by-line commentary. Identify:

1. the theoretical equation, object, functional, action, Hamiltonian, observable, or algorithm and its exact source anchor;
2. assumptions and controlled approximations;
3. repository, pinned commit, entry points, modules, call/data flow, and ownership of major arrays or objects;
4. inputs, parameters, physical meanings, units, domains, shapes, and indices;
5. outputs, observables, units, normalization, and how they are consumed;
6. discretization, basis and grids, integration/summation measure and weights, truncation, cutoff/regulator, boundary/initial conditions, and symmetry reductions or partner maps;
7. convergence and numerical-stability tests, validation observables and expected behavior, and explicit non-claims.

Only then add exact commit-pinned line mappings. Each line map connects one theoretical step or object to commit, file, exact line/range, function/class/module, code symbol or array, units, shape, indices/domain, numerical operation, inputs/outputs, realized discretization/truncation/regulator, and its convergence or validation link. Never substitute a filename-level association for this mapping.

## 3. Explain numerical and pseudocode operations physically

For every loop, vectorized operation, or solver step, state the physical quantity accumulated or updated and connect it to the corresponding term in the theory expression. Verify explicitly:

- the meaning and range of every loop/index variable;
- grid construction, spacing, measure, quadrature weights, normalization, and endpoint treatment;
- array shape/order and the correspondence between mathematical and storage indices;
- symmetry maps and partner maps such as momentum, frequency, spin, band, or lattice-site partners;
- boundary behavior, periodic wrapping, offsets, and whether each mapped index is in range;
- that contractions, paired indices, input/output domains, and update dependencies close consistently;
- the approximations, regulator/cutoff, and truncation realized by the operation.

If the map cannot be checked from supplied material, label the affected statement Unresolved and record the missing evidence.

## 4. Use canonical Code Map identities

A map used only by one lesson is canonical inside that lesson. Its ID includes the stable Lesson ID, for example `CMAP-L-000001-001`; its line IDs extend it, for example `CMAP-L-000001-001-L1`. Complete its architecture fields before adding its line records. Link this lesson-local ID from state and Evidence records; do not present it as a shared global map.

A map shared by multiple lessons is canonical at `reference/code-maps/CMAP-GLOBAL-0001.md`, registered in `reference/code-maps/INDEX.md`, and only linked from lessons. Never copy the shared architecture map into a lesson.

For a global ID:

1. create the index with the canonical `LESSON.md` event schema if it does not exist;
2. read every event and allocate one greater than the largest suffix ever used by any active, superseded, or tombstoned ID, zero-padded to four digits;
3. never reuse an ID after supersession, deletion, failure, or tombstone;
4. create the canonical map file, then append its `registered` event; never edit or delete an earlier index event;
5. supersession allocates a new ID, records `Supersedes` in the replacement, records `Superseded-by` in the prior canonical file, and appends the lifecycle event;
6. tombstone by appending an event with a reason; retain the ID permanently.

The canonical global map records its map version and code commit as well as the complete architecture fields. If code or theory changes invalidate a map's identity, supersede it rather than silently rewriting its stable meaning.

## 5. Validate without overclaiming

Distinguish code inspection, successful execution, numerical agreement, convergence evidence, and physical proof. A run can show only what happened for the tested commit, inputs, environment, precision, and tolerances. Passing tests or matching a benchmark does not prove the underlying physical model, approximations, regime of validity, or uniqueness of interpretation.

For each claimed implementation result, record the tested parameters and environment, convergence sequence or stability diagnostic, validation observable and expected limit/symmetry/conservation behavior, discrepancy and tolerance, and remaining non-claims. Link these records to the relevant theory and code anchors. If verification was not performed, say so explicitly.

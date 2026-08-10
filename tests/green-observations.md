# GREEN behavioral observations

Date: 2026-08-11

## Evaluation rule

Each scenario passes only when all six evaluator-only Core items pass. The final accepted responses are preserved verbatim in `tests/green-outputs/`. The evaluator sections were never dispatched as user prompts.

This record distinguishes two kinds of evidence:

- **clean forward pressure tests:** fresh agents received only an extracted user prompt and the current skill path;
- **accepted review fixtures:** responses corrected through RED/GREEN review and retained for deterministic re-evaluation.

The accepted fixtures are not represented as pristine one-shot blind outputs. Clean forward tests exposed real failures, including undefined dummy variables inside notation definitions, a continuation whose first H2 was not the required title, loss of a dated prior unaided capability during writeback, and code identifiers defined after first use. Those failures drove the notation dependency-graph, grouped-entry closure, exact continuation-heading, and dated-Evidence preservation rules now present in the skill.

The final independent reviewer read the complete current skill contract, all three scenario rubrics, and all three accepted raw fixtures. It returned **APPROVE** only after all 18 Core items and every production-contract check passed.

## Scenario 01 — conflicting notation

Result: **GREEN, 6/6.**

| Core item | Result | Accepted-fixture evidence |
| --- | --- | --- |
| Exact source anchors | PASS | `S1`, section 3.2, equations (18)–(19), and `S2`, section 2, equations (5)–(6), at lines 11–12. |
| Notation first | PASS | First H2 at line 5; dependency-ordered local definitions begin at line 15. |
| Preserve both source notations | PASS | $G(k,\omega)$ and $\mathcal G(p,p_0)$ remain separate at lines 32–33. |
| Relative and absolute free poles | PASS | Energy-origin map and the two pole coordinates are derived at lines 64, 161, and 189. |
| Conditional interacting equivalence | PASS | Variable/dispersion map and the missing self-energy relation are distinguished at lines 81, 109, and 123. |
| Auditable algebra and uncertainty | PASS | Denominator translation and pole algebra appear at lines 83, 147, and 167 without claiming unconditional equality. |

The final production correction adds inert local symbol IDs and defines $G_0(k,\omega)$ and $\mathcal G_0(p,p_0)$ in separate entries at lines 15 and 34–35.

## Scenario 02 — exact resume and writeback

Result: **GREEN, 6/6.**

| Core item | Result | Accepted-fixture evidence |
| --- | --- | --- |
| Resume at the regulated integral | PASS | The response resumes at the first unfinished integral at line 32 without reteaching the accepted $\theta(t)$ step. |
| Complete endpoint, sign, regulator, imaginary-part, and spectral derivation | PASS | The finite-bound derivation begins at line 93 and reaches $A(k,\omega)=2\pi\delta(\omega-\xi_k)$ at lines 484–493. |
| Preserve Fourier and spectral conventions | PASS | The source spectral convention is defined at line 25 and retained through the derivation. |
| Patch the existing lesson | PASS | The exact existing-lesson patch begins at lines 505–511 and replaces the paused block. |
| Advance the current snapshot | PASS | The current-state patch and exact new stop point appear at lines 679 and 689. |
| Preserve dated evidence categories | PASS | The 2026-08-10 self-report remains distinct from the 2026-08-09 unaided $\theta(t)$ range reduction at lines 644 and 663–674. |

The final notation correction defines set membership in the primitives entry and moves calculus notation until after $t$ and $\omega$ are defined, at lines 7, 9, and 12–13.

## Scenario 03 — code/theory bridge

Result: **GREEN, 6/6.**

| Core item | Result | Accepted-fixture evidence |
| --- | --- | --- |
| Overall RPA algorithm and loop map | PASS | The paper equation, finite approximation, and operation map appear at lines 81, 116, and 177. |
| Parameter, grid, accumulator, array, and unit meanings | PASS | Definitions and dimensional checks appear in the leading notation table and at line 207. |
| Discretization, cutoff, spin, regulator, and partner closure | PASS | Momentum/frequency discretization and $m\mapsto-m-1$ closure appear at lines 116 and 306. |
| Safe grid-change convergence requirements | PASS | $N_w$, momentum, external-grid, symmetry, and regulator checks begin at line 364. |
| No real-frequency collective-mode claim | PASS | The Matsubara-only boundary and analytic-continuation requirement appear at lines 430–449. |
| No invented implementation or validation | PASS | Pending anchors and the exact no-run statement appear at lines 67–75. |

The final notation correction removes forward references to code identifier `pi`, defines $q^2$ and real-frequency $\omega$, and closes all grouped-entry dependencies. The relevant repaired provenance cells are at lines 25–26, with `pi` defined later at line 55 only after no earlier entry refers to it.

## Production-contract result

| Contract | Scenario 01 | Scenario 02 | Scenario 03 |
| --- | --- | --- | --- |
| Exact provisional first line | PASS | PASS | PASS |
| First H2 exactly `Notation and conventions` | PASS | PASS | PASS |
| Dollar-delimited LaTeX only | PASS | PASS | PASS |
| No invented stable ID or live Obsidian link | PASS | PASS | PASS |
| No Unicode replacement or em-dash mojibake | PASS | PASS | PASS |
| Dependency-closed symbol/code/unit definitions | PASS | PASS | PASS |
| Exact non-write final line | PASS | PASS | PASS |

The reviewer confirmed the boundary lines at scenario 01 lines 1, 5, and 257; scenario 02 lines 1, 3, and 698; and scenario 03 lines 1, 5, and 492.

## Automated checks

The accepted outputs also pass `tests/green-contract.ps1`, which checks the response-only boundary, exact first H2, Markdown math delimiters, pending-ID policy, live-link prohibition, Unicode integrity, dated Evidence markers, the no-run statement, and the fermionic partner map. Static package rules are checked separately by `tests/static-contract.ps1`; inert bootstrap templates are checked by `tests/bootstrap-contract.ps1`.

Final behavioral conclusion: **GREEN — 18/18 Core items plus the production contract passed.**

# GREEN Behavioral Observations

Date: 2026-08-11

Each user prompt was isolated with `tests/extract-user-prompts.ps1` and dispatched to an independent agent. The responding agents were instructed to read and follow `SKILL.md` and its routed references/templates, but they were not given the scenario files, evaluator-only sections, baseline observations, or Core PASS checklists. A scenario passes only when all six Core PASS items pass.

## Run metadata

| Scenario | Agent task | Raw response | Final result |
| --- | --- | --- | --- |
| 01 | `green_s01` | `tests/green-outputs/01-conflicting-notation.md` | GREEN, 6/6 |
| 02 initial | `green_s02` | `tests/green-outputs/02-resume-and-writeback-initial.md` | 5/6; exposed invented source-registration metadata |
| 02 retry | `green_s02_retry` | `tests/green-outputs/02-resume-and-writeback.md` | GREEN, 6/6 |
| 03 initial | `green_s03` | `tests/green-outputs/03-code-theory-bridge-initial.md` | 5/6; exposed a missing explicit partner-map check |
| 03 retry | `green_s03_retry` | `tests/green-outputs/03-code-theory-bridge.md` | GREEN, 6/6 |

The agents inherited the session's default model; the orchestration interface did not expose a more specific model identifier. The five raw files preserve the complete accepted responses and the two instruction-revealing initial responses for re-evaluation.

## Scenario 01: conflicting notation

Result: **GREEN — 6/6 core items passed.**

The response begins with the requested Note title followed immediately by `## Notation and conventions`. Its leading table defines source-local state labels, energy variables, propagators, self-energies, the retarded prescription, units, and provenance before the comparison begins.

Representative output:

> The excerpts establish that both formulas are retarded propagators and that their **free-particle poles describe the same band excitation after the energy-coordinate shift**
> \[
> p_0=\omega+\mu.
> \]
> They do **not** establish that the full interacting propagators are the same physical object, because \(S2\) explicitly assumes no relation between \(\Sigma\) and \(\mathcal\Sigma\).

| Core item | Result | Auditable evidence |
| --- | --- | --- |
| Exact source anchors | PASS | The provenance table records `S1`, section 3.2, equations (18)–(19), and `S2`, section 2, equations (5)–(6), including adjacent convention statements. |
| Leading notation contract | PASS | The first level-two section is `Notation and conventions`; the table records meaning/domain, units, provenance, decorations, and source-local roles for every symbol used later. |
| Preserve source-local propagators | PASS | The answer keeps \(G(k,\omega)\) and \(\mathcal G(p,p_0)\) separate, then compares them only after stating the coordinate and dispersion maps. |
| Relative and absolute free poles | PASS | It derives \(\omega=0.20\,\mathrm{eV}-i0^+\) and \(p_0=\mu+0.20\,\mathrm{eV}-i0^+\), while distinguishing real-axis locations. |
| Conditional interacting map | PASS | It requires \(\mathcal\Sigma(p,\omega+\mu)=\Sigma(k,\omega)\) plus compatible state/operator conventions and says the excerpts do not supply that relation. |
| Auditable algebra and uncertainty | PASS | The denominator translation is shown line by line; missing self-energy and operator information is labeled unresolved rather than invented. |

The 15-minute constraint did not reduce the notation, algebra, source anchors, or uncertainty statements.

## Scenario 02: exact resume and writeback

Initial result: **5/6.** Its learning-record anchor invented an existing stable-version registration and used the template phrase `evaluator basis`, although no canonical version record was supplied. Commit `ea75b61` made unknown registration state explicit, added a pending-snapshot sentinel, prohibited invented keys/paths/hashes, and replaced evaluator-facing template language. Only this scenario was rerun.

Retry result: **GREEN — 6/6 core items passed.**

The response opens at the first unfinished operation:

> We resume at the first unfinished equation, after accepting the role and order of the convergence factor.

It introduces a finite upper bound, evaluates both endpoints, proves the upper-bound term vanishes, simplifies every factor of \(i\), and only then takes the retarded limit. It derives

\[
G^R(k,\omega)=\frac{1}{\omega-\xi_k+i0^+},
\qquad
A(k,\omega)=2\pi\delta(\omega-\xi_k).
\]

| Core item | Result | Auditable evidence |
| --- | --- | --- |
| Exact resume behavior | PASS | It starts from the already formed regulated integral, does not restart the propagator definition or the demonstrated \(\theta(t)\) range reduction, and proceeds through convergence and endpoint evaluation. |
| Complete transform and spectral derivation | PASS | The finite-\(R\) endpoint, \(R\to\infty\) limit, \(i\)-algebra, \(\eta\to0^+\) order, imaginary part, and supplied delta identity are all displayed. |
| Preserve supplied conventions | PASS | It uses the supplied forward kernel and \(A=-2\operatorname{Im}G^R\), obtaining the required factor \(2\pi\). |
| Patch active lesson | PASS | It names the stale pause marker and identifies the complete preceding continuation, from the convergence proof through the pole-sign check, as its replacement instead of creating a duplicate lesson. |
| Advance canonical state | PASS | It supplies a complete atomic replacement for `CURRENT-STATE.md` with the resolved obstacle and a precise new boundary: an unaided reconstruction. |
| Distinguish evidence types | PASS | The proposed new immutable record separates the 2026-08-10 self-report from the unchanged 2026-08-09 unaided \(\theta(t)\) work, assigns level 0, and leaves a concrete observable next check. It refuses to invent an `EV-*` identifier without the complete append-only index. |

The retry uses `Unassigned — supplied excerpt; snapshot registration pending` rather than inventing a stable source version. It preserves the historical 2026-08-09 record and does not inflate assisted teaching into learner mastery.

## Scenario 03: theory-to-code bridge

Initial result: **5/6.** The first response correctly described the symmetric Python range but did not explicitly prove closure under the fermionic partner map \(m\mapsto-m-1\). The smallest instruction gap was patched in commit `4316599` by requiring endpoint and full-set closure checks for finite discrete truncations. Only this scenario was rerun.

Retry result: **GREEN — 6/6 core items passed.**

Representative output after the patch:

> The symmetry is indexed by
> \[
> m\longmapsto -m-1,
> \]
> because \(\omega_{-m-1}=-\omega_m\). The endpoints map into one another:
> \[
> -256\mapsto255,\qquad255\mapsto-256.
> \]

| Core item | Result | Auditable evidence |
| --- | --- | --- |
| Overall RPA map | PASS | It maps the inner loops to the finite \(\Pi_0\) bubble, the quotient to RPA \(W\), and the saved shape to sampled Matsubara-axis values. |
| Parameters, arrays, and units | PASS | The leading notation table explains `beta`, `Nw`, `kappa_IR`, momentum points/weights, indices, \(\Pi_0\), \(W\), domains, shapes, and supplied units. |
| Discretization and partner closure | PASS | It identifies quadrature, 512-term Matsubara cutoff, external sampling, spin factor, RPA, regulator, and explicitly proves the endpoint partner map for `range(-Nw, Nw)`. |
| Convergence and consistency checks | PASS | It requires checks in \(N_w\), momentum nodes/weights/domain, largest bosonic index, small-\(q\) sampling, and \(\kappa_{\mathrm{IR}}\to0\), plus units, normalization, and denominator sensitivity. |
| No unsupported real-axis claim | PASS | It states that `W_matsubara.npy` is not evidence of a real-frequency collective mode and requires analytic continuation and separate validation. |
| No invented implementation or validation claim | PASS | It labels absent `xi(k+q)` boundary behavior unresolved, makes the `n=0,\ldots,11` range explicitly conditional, and prescribes future convergence checks without claiming that a run or validation has completed. |

## GREEN delta from baseline

All three accepted responses satisfy every Core PASS item. Relative to the RED baseline, the skill now reliably produces:

- a leading notation contract with source-local symbols defined before use;
- exact anchors and assumption-qualified multi-source translation;
- continuation from the exact saved boundary rather than restarting;
- canonical lesson, state, and evidence writeback without mastery inflation;
- architecture-first theory-to-code mapping with provenance and non-claim boundaries;
- explicit verification of subtle finite-grid partner maps instead of relying on the word “symmetric.”

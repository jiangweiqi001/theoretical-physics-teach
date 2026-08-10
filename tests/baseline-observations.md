# RED Baseline Observations

Date: 2026-08-10

The three prompts were extracted with `tests/extract-user-prompts.ps1` and dispatched to three independent agents without the new skill, repository context, evaluator rubric, or tools. A scenario passes only when every Core PASS item in its evaluator section passes.

## Run metadata

| Scenario | Agent task | Raw response |
| --- | --- | --- |
| 01 | `baseline_notation` | `tests/baseline-outputs/01-conflicting-notation.md` |
| 02 | `baseline_resume` | `tests/baseline-outputs/02-resume-and-writeback.md` |
| 03 | `baseline_code` | `tests/baseline-outputs/03-code-theory-bridge.md` |

The agents inherited the session's default model; the orchestration interface did not expose a more specific model identifier. They were explicitly denied tools and repository/skill/rubric access. The raw files preserve their complete responses for re-evaluation.

## Scenario 01: conflicting notation

Result: **RED — 4/6 core items passed.**

Observed strengths:

- Kept `G(k,\omega)` and `\mathcal G(p,p_0)` distinguishable.
- Derived the energy-origin map `p_0=\omega+\mu`.
- Made interacting equivalence conditional on
  `\Sigma(k,\omega)=\mathcal\Sigma(k,\omega+\mu)`.
- Computed the free poles as `0.20\,\mathrm{eV}` relative to `\mu` and `\mu+0.20\,\mathrm{eV}` in absolute energy.

Observed failures:

1. The answer referred to “S1” and “S2” but did not preserve the exact section and equation anchors required by the scenario.
2. It began with “Short answer” and only later gave “Definitions and energy conventions.” It did not begin with a Note-level notation section or define every new symbol's type/domain, dimensions, and source-local convention before first use.

Representative quotation:

> The two formulas have the same free-particle pole structure after shifting the energy origin by the chemical potential.

This is physically careful, but it introduces the comparison before a complete notation contract.

| Core item | Result | Auditable evidence |
| --- | --- | --- |
| Exact source anchors | FAIL | The raw answer says “From S1” and “From S2” but never records section 3.2 equations (18)-(19) or section 2 equations (5)-(6). |
| Leading notation contract | FAIL | The first headings are `Short answer` and `Definitions and energy conventions`; no glyph/type/domain/dimension/source table appears before first use. |
| Preserve source-local propagators | PASS | `G(\mathbf k,\omega)` and `\mathcal G(\mathbf p,p^0)` remain separate throughout. |
| Relative and absolute free poles | PASS | The boxes give `0.20\,\mathrm{eV}-i0^+` and `\mu+0.20\,\mathrm{eV}-i0^+`. |
| Conditional interacting map | PASS | Equality is conditional on the displayed shifted self-energy relation. |
| Auditable algebra and uncertainty | PASS | The denominator is transformed line by line and the absent self-energy relation is stated explicitly. |

## Scenario 02: exact resume and writeback

Result: **RED — 3/6 core items passed.**

Observed strengths:

- Resumed directly at the regulated integral.
- Displayed the finite-`T` endpoint, every factor of `i`, the `\eta\to0^+` order, the imaginary part, the delta-function limit, and the `2\pi` normalization.
- Proposed precise new `CURRENT-STATE.md` and learning-record content.
- Explicitly said independent reconstruction had not yet been observed.

Observed failures:

1. The response did not provide the patched ending of `lessons/04-retarded-free-propagator.md` and did not remove or replace its stale pause marker. The resolved explanation therefore remained partly outside the canonical lesson.
2. It replaced only four `CURRENT-STATE.md` entries, leaving the old resolved `Current obstacle` in place while advancing the resume point. The resulting state would contradict itself.
3. The new learning record said “The learner correctly stated” the 2026-08-10 convergence claims but did not label them explicitly as current-session self-report, distinct from the unaided `\theta(t)` work demonstrated on 2026-08-09.

Representative quotation:

> Replace the four corresponding entries in `CURRENT-STATE.md` with:

The state advanced, but the active lesson itself was not patched.

| Core item | Result | Auditable evidence |
| --- | --- | --- |
| Exact resume behavior | PASS | The first sentence is “Good—we resume at the regulated integral,” followed by finite-`T` evaluation. |
| Complete transform and spectral derivation | PASS | The raw output evaluates the endpoint, tracks `i`, derives the imaginary part and `2\pi\delta(\omega-\xi_k)`, and checks normalization. |
| Preserve supplied conventions | PASS | It uses the supplied forward transform and `A=-2\,\mathrm{Im}\,G^R` convention. |
| Patch active lesson | FAIL | No replacement block for `lessons/04-retarded-free-propagator.md` appears; its stale pause marker is untouched. |
| Advance canonical state | FAIL | It supplies a new resume point but leaves the supplied `Current obstacle: why e^{-\eta t}...` field untouched, so the resolved obstacle and advanced state coexist. |
| Distinguish evidence types | FAIL | The new record says “The learner correctly stated that” but does not label this as 2026-08-10 self-report or carry forward the distinct 2026-08-09 unaided `\theta(t)` evidence. Its later statement that independent reconstruction is unobserved prevents mastery inflation but does not preserve the two evidence categories required by the rubric. |

## Scenario 03: theory-to-code bridge

Result: **RED — 4/6 core items passed.**

Observed strengths:

- Correctly mapped the nested loops to `\Pi_0` and the RPA denominator to `W`.
- Explained `\beta`, `N_w`, the momentum quadrature, `\kappa_{\mathrm{IR}}`, sampled Matsubara grids, units, and important convergence studies.
- Correctly rejected `W_\text{Matsubara}` alone as evidence for a real-frequency collective mode.
- Added useful grid, symmetry, normalization, and provenance checks.

Observed failures:

1. It counted the 512 frequencies but did not explicitly verify that `m\in[-N_w,N_w-1]` is closed under the fermionic partner map `m\mapsto-m-1`.
2. It assumed the 12 nonnegative bosonic indices are `n=0,\ldots,11` and computed a largest frequency of `1.728\,\mathrm{eV}`, although the prompt gives only the count and not the index values.

Representative quotation:

> A hard `m`-cutoff is not invariant under the shift `m\mapsto m+n`, so large `n` values become unreliable first.

This is a useful external-frequency warning, but it does not perform the rubric's separate fermionic-pair closure check.

| Core item | Result | Auditable evidence |
| --- | --- | --- |
| Overall RPA map | PASS | The opening maps the inner loop to `\Pi_0`, the denominator to RPA `W`, and the file to Matsubara-axis data. |
| Parameters, arrays, and units | PASS | It explains `\beta`, `N_w`, `\kappa_{\rm IR}`, grids, weights, `\Pi_0`, `W`, and dimensional consistency. |
| Discretization and partner closure | FAIL | It identifies the 512-frequency cutoff but checks `m\mapsto m+n` rather than proving closure under `m\mapsto-m-1`. |
| Convergence and consistency checks | PASS | It covers `N_w`, momentum resolution/domain, regulator removal, symmetry, normalization, and limiting behavior. |
| No unsupported real-axis claim | PASS | It explicitly says the saved array does not demonstrate a real-frequency collective mode and requires continuation plus validation. |
| No invented implementation or validation claim | FAIL | It states “With `n=0,\ldots,11`” and derives a maximum frequency, but the supplied configuration does not specify which 12 nonnegative indices were selected. |

Optional observation: the answer adds a standard analytic Matsubara-sum form and temperature conversion without labeling their provenance. This motivates the future provenance protocol but is not counted as a failure under this scenario's current Core item 6.

## Baseline pattern

All three answers were mathematically stronger than a superficial response, yet all three failed the complete contract. The recurring gaps were:

- no mandatory notation-first Note structure;
- incomplete exact source provenance;
- state updates that did not always patch the canonical lesson;
- insufficient distinction between learner self-report and demonstrated mastery;
- missing explicit verification of a subtle grid convention.

These are the minimum behaviors the new skill must change in GREEN testing.

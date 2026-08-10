# RED Baseline Observations

Date: 2026-08-10

The three prompts were extracted with `tests/extract-user-prompts.ps1` and dispatched to three independent agents without the new skill, repository context, evaluator rubric, or tools. A scenario passes only when every Core PASS item in its evaluator section passes.

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

## Scenario 02: exact resume and writeback

Result: **RED — 4/6 core items passed.**

Observed strengths:

- Resumed directly at the regulated integral.
- Displayed the finite-`T` endpoint, every factor of `i`, the `\eta\to0^+` order, the imaginary part, the delta-function limit, and the `2\pi` normalization.
- Proposed precise new `CURRENT-STATE.md` and learning-record content.
- Explicitly said independent reconstruction had not yet been observed.

Observed failures:

1. The response did not provide the patched ending of `lessons/04-retarded-free-propagator.md` and did not remove or replace its stale pause marker. The resolved explanation therefore remained partly outside the canonical lesson.
2. The new learning record said “The learner correctly stated” the 2026-08-10 convergence claims but did not label them explicitly as current-session self-report, distinct from the unaided `\theta(t)` work demonstrated on 2026-08-09.

Representative quotation:

> Replace the four corresponding entries in `CURRENT-STATE.md` with:

The state advanced, but the active lesson itself was not patched.

## Scenario 03: theory-to-code bridge

Result: **RED — 4/6 core items passed.**

Observed strengths:

- Correctly mapped the nested loops to `\Pi_0` and the RPA denominator to `W`.
- Explained `\beta`, `N_w`, the momentum quadrature, `\kappa_{\mathrm{IR}}`, sampled Matsubara grids, units, and important convergence studies.
- Correctly rejected `W_\text{Matsubara}` alone as evidence for a real-frequency collective mode.
- Added useful grid, symmetry, normalization, and provenance checks.

Observed failures:

1. It counted the 512 frequencies but did not explicitly verify that `m\in[-N_w,N_w-1]` is closed under the fermionic partner map `m\mapsto-m-1`.
2. It introduced an analytic closed form for `\Pi_0` and a temperature conversion without labeling them as reconstructed results or external knowledge. Under the scenario's source-only constraint, these additions lack provenance.

Representative quotation:

> A useful check on the frequency sum is its analytic form:

The formula may be correct, but the response did not separate supplied source content from its own reconstruction.

## Baseline pattern

All three answers were mathematically stronger than a superficial response, yet all three failed the complete contract. The recurring gaps were:

- no mandatory notation-first Note structure;
- incomplete exact source provenance;
- state updates that did not always patch the canonical lesson;
- insufficient distinction between learner self-report and demonstrated mastery;
- correct extra knowledge presented without provenance labels;
- missing explicit verification of a subtle grid convention.

These are the minimum behaviors the new skill must change in GREEN testing.

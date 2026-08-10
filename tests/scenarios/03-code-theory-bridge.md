# Scenario 03: Explain a screened-interaction loop from theory to code

## User prompt

<!-- BEGIN USER PROMPT -->
I inherited the pseudocode below from a computational many-body project. I can read the loops, but I do not understand what calculation they represent physically. Explain what the code does using the accompanying paper excerpt, with enough detail that I could change the grids safely. Also tell me whether the saved array by itself demonstrates a real-frequency collective mode.

### Mock paper excerpt

**Source:** `S1`, *Finite-Temperature Screening on the Imaginary Axis*, section 4, equations (21)-(24).

> In the random-phase approximation (RPA), the screened interaction on the bosonic Matsubara axis is
> $$
> W(q,i\nu_n)=\frac{V_\kappa(q)}{1-V_\kappa(q)\Pi_0(q,i\nu_n)},
> \qquad
> V_\kappa(q)=\frac{4\pi e^2}{q^2+\kappa_{\mathrm{IR}}^2}.
> $$
> The noninteracting polarization is
> $$
> \Pi_0(q,i\nu_n)
> =-\frac{2}{\beta}\sum_{m=-\infty}^{\infty}
> \int\frac{d^3k}{(2\pi)^3}
> G_0(k,i\omega_m)G_0(k+q,i\omega_m+i\nu_n),
> $$
> with
> $$
> G_0(k,i\omega_m)=\frac{1}{i\omega_m-\xi_k},\quad
> \omega_m=\frac{(2m+1)\pi}{\beta},\quad
> \nu_n=\frac{2n\pi}{\beta}.
> $$
> The factor $2$ is the spin degeneracy. The positive $\kappa_{\mathrm{IR}}$ is a numerical infrared regulator, not a physical screening parameter, and must be removed through a convergence study. Real-frequency claims require analytic continuation and separate validation.

The project documentation says that `k_points` are three-dimensional momentum vectors and `k_weights[j]` already contains the quadrature measure approximating $d^3k/(2\pi)^3$. All energies use eV, momenta use inverse Angstrom, and the stored constants are chosen consistently with those units.

### Mock pseudocode

```python
W = complex_zeros((len(q_points), len(bosonic_indices)))

for iq, q in enumerate(q_points):
    Vq = 4 * pi * e2 / (dot(q, q) + kappa_IR**2)

    for inu, n in enumerate(bosonic_indices):
        nu = 2 * n * pi / beta
        Pi = 0j

        for j, k in enumerate(k_points):
            for m in range(-Nw, Nw):
                omega = (2 * m + 1) * pi / beta
                G_left = 1 / (1j * omega - xi(k))
                G_right = 1 / (1j * (omega + nu) - xi(k + q))
                Pi += k_weights[j] * G_left * G_right

        Pi *= -2 / beta
        W[iq, inu] = Vq / (1 - Vq * Pi)

save("W_matsubara.npy", W)
```

The run configuration is `beta = 40 eV^-1`, `Nw = 256`, `kappa_IR = 0.02 Angstrom^-1`, 80 `q_points`, 12 nonnegative bosonic indices, and 4096 weighted `k_points`.
<!-- END USER PROMPT -->

---

## Evaluator only - never dispatch

This section must never be sent to the responding agent. Dispatch only the output of `tests/extract-user-prompts.ps1`.

### Core PASS checklist

The scenario passes only if every item below passes.

- [ ] Identifies the overall RPA algorithm and maps the inner momentum/frequency loop to $\Pi_0$, the denominator to $W$, and the saved array to the sampled Matsubara-axis screened interaction.
- [ ] Maps `beta`, `Nw`, `kappa_IR`, momentum points and weights, Matsubara indices, `Pi`, and `W` to their physical or numerical meanings and supplied units.
- [ ] Identifies the momentum quadrature, finite Matsubara cutoff, sampled external grid, RPA approximation, spin factor, and numerical infrared regulator; recognizes that `range(-Nw, Nw)` is closed under $m\mapsto-m-1$.
- [ ] Requires convergence checks in `Nw`, momentum resolution/domain, and $\kappa_{\mathrm{IR}}$, plus relevant limiting-case or symmetry checks, before treating a grid change as safe.
- [ ] States that `W_matsubara.npy` is not by itself a real-frequency observable or evidence of a collective mode and that analytic continuation and separate validation are required.
- [ ] Does not invent implementation details, physical conclusions, or completed validation results absent from the supplied material.

### Optional observations

- Record exact quotations that reveal a missing equation-to-code map or an unsupported physical claim.
- Note especially clear architecture-first explanations or additional valid convergence diagnostics.

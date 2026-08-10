# Scenario 05: Conditional corresponding-code explanation

<!-- BEGIN USER PROMPT -->
I am studying two supplied papers together. Explain the theory first. At the end, explain corresponding code only where trustworthy implementation material is actually available. Pedagogical pseudocode is welcome, but it must be traced to the supplied implementation and must not be presented as evidence that a run succeeded.

### Paper A and its corresponding repository

**Source `S1`:** *Imaginary-Axis RPA Screening*, section 4, equation (21):
$$
W(q,i\nu_n)=\frac{V(q)}{1-V(q)\Pi_0(q,i\nu_n)}.
$$

**Code source `C1`:** author repository `example.org/authors/rpa-screening`, pinned mock commit `abc1234`, file `screening.py`, lines 40-48:

```python
for iq, q in enumerate(q_points):
    for inu, nu in enumerate(nu_points):
        Pi = 0j
        for ik, k in enumerate(k_points):
            Pi += k_weights[ik] * bubble(k, q, nu)
        W[iq, inu] = V(q) / (1 - V(q) * Pi)
```

The registered documentation states that `k_weights` includes the momentum integration measure, `bubble` returns the two-propagator integrand including its frequency sum and spin factor, momenta use inverse Angstrom, and energies use eV. No execution record or output artifact is supplied.

### Paper B without corresponding implementation material

**Source `S2`:** *Vertex-Corrected Density Response*, section 2, equation (7):
$$
\chi=\chi_0+\chi_0\Gamma\chi.
$$

No repository, source file, pseudocode, reproducibility instructions, or official project link is supplied for Paper B. Code understanding is optional for this paper.

For Paper A, explain what each loop does physically and trace every physical quantity from its theoretical definition through approximation or discretization to the code variable, units, shape or indices, update rule, output, and validation observable. For Paper B, do not fill the gap by inventing generic code.
<!-- END USER PROMPT -->

---

## Evaluator only - never dispatch

This section must never be sent to the responding agent. Dispatch only the output of `tests/extract-user-prompts.ps1`.

### Core PASS checklist

The scenario passes only if every item below passes.

- [ ] Activates the code bridge for Paper A at pinned commit `abc1234` and omits or marks it N/A for optional Paper B rather than fabricating an implementation.
- [ ] Presents the physical theory and approximations before the code explanation.
- [ ] Labels pedagogical pseudocode Reconstructed, anchors it to `screening.py` lines 40-48, and does not present it as literal additional source code.
- [ ] Maps every Paper A physical quantity through definition, approximation or reconstruction, discretization, code variable, units, shape or indices, initialization or update, output consumer, and validation observable.
- [ ] Explains the physical accumulation performed by each loop, including the momentum quadrature and sampled external momentum/frequency axes.
- [ ] States that no execution or validation claim is made without a canonical Run and does not infer numerical agreement, convergence, or a physical result from the snippet.

### Optional observations

- Record any generic invented implementation for Paper B or any code-first explanation.
- Note clear distinctions between visible source behavior, reconstructed physical role, inference, and unresolved details.

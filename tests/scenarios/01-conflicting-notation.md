# Scenario 01: Conflicting notation under time pressure

## User prompt

<!-- BEGIN USER PROMPT -->
I am preparing for a many-body theory discussion that starts in 15 minutes. Please give me a finished Obsidian-compatible Markdown lesson now; I will not be able to answer follow-up questions before the discussion.

The lesson should answer: are the two propagators below the same physical object, and how do their free-particle poles compare? Work only from the supplied excerpts. I need enough algebra to use the comparison in the discussion, not just a verbal summary.

### Mock source excerpt S1

**Source:** `S1`, *Condensed Matter Lecture Notes*, section 3.2, equations (18)-(19).

> We define the band energy relative to the chemical potential by
> $$
> \xi_k=\varepsilon_k-\mu.
> $$
> With $\hbar=1$, the retarded one-particle propagator is written
> $$
> G(k,\omega)=\frac{1}{\omega-\xi_k-\Sigma(k,\omega)+i0^+}.
> $$
> The frequency variable $\omega$ is an energy measured relative to $\mu$, so the Fermi surface is at $\omega=0$. We use the Fourier kernel $e^{-i\omega t}$ in the inverse transform.

### Mock source excerpt S2

**Source:** `S2`, *Relativistic-Style Green Functions for Electron Systems*, section 2, equations (5)-(6).

> The retarded propagator is denoted
> $$
> \mathcal G(p,p_0)=\frac{1}{p_0-E_p-\mathcal\Sigma(p,p_0)+i0^+}.
> $$
> Here $p_0$ is the absolute one-particle energy; the Fermi surface occurs at $p_0=\mu$. The symbol $E_p$ denotes the same normal-state band dispersion that is elsewhere called $\varepsilon_k$. We set $\hbar=1$ and use the Fourier kernel $e^{-ip_0t}$ in the inverse transform.
>
> No relation between $\Sigma$ and $\mathcal\Sigma$ is assumed in this notation section.

Please make the comparison, state what can and cannot be concluded from these excerpts, and work out the noninteracting pole in each source's variables for a state with band energy $\varepsilon_k=E_p=\mu+0.20\,\mathrm{eV}$.
<!-- END USER PROMPT -->

---

## Evaluator only - never dispatch

This section must never be sent to the responding agent. Dispatch only the output of `tests/extract-user-prompts.ps1`.

### Core PASS checklist

The scenario passes only if every item below passes.

- [ ] Identifies `S1`, section 3.2, equations (18)-(19), and `S2`, section 2, equations (5)-(6).
- [ ] Begins the proposed Note's content with a `Notation and conventions` section that defines every newly introduced symbol before first use, including its meaning, mathematical type/domain, dimensions or units when applicable, and source-local convention.
- [ ] Keeps $G(k,\omega)$ and $\mathcal G(p,p_0)$ distinguishable and does not silently normalize them into one notation.
- [ ] States that $\omega$ is relative to $\mu$, $p_0$ is absolute, and the free poles are $\omega=0.20\,\mathrm{eV}$ in S1 and $p_0=\mu+0.20\,\mathrm{eV}$ in S2.
- [ ] Makes any interacting equivalence conditional on an explicit variable/dispersion map and a corresponding self-energy relation, while noting that the excerpts do not supply the self-energy relation.
- [ ] Shows auditable algebra for the pole comparison and does not invent source facts or claim unconditional equivalence.

### Optional observations

- Record exact quotations that reveal silent normalization, unsupported equivalence, or appropriate uncertainty.
- Note whether the 15-minute deadline changes the depth or sourcing of the response.

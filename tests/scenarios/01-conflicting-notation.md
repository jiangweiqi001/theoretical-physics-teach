# Scenario 01: Conflicting notation under time pressure

## User prompt

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

---

## Evaluator only - do not include in the user prompt or intended response

Record observations, including exact quotations where useful:

- Whether the response identifies both sources by their supplied IDs and locations.
- Whether it keeps $G(k,\omega)$ and $\mathcal G(p,p_0)$ distinguishable while comparing them, or silently rewrites both into one notation.
- Whether it identifies the relative-energy versus absolute-energy convention and obtains both free-particle pole values.
- Whether any proposed mapping states its assumptions, including the energy shift and the unresolved relation between the two self-energies.
- Whether it claims unconditional equivalence, invents missing source information, or suppresses the conflict to save time.
- Whether the explanation contains enough explicit algebra to audit the comparison.

# Scenario 02: Resume at the exact transform and write back the result

## User prompt

Resume my Green-function course from the Obsidian state below. Yesterday I was stuck on why the convergence factor is legitimate. I now understand that $e^{-\eta t}$ with $\eta>0$ makes the upper limit converge and that the retarded prescription means taking $\eta\to0^+$ only after the integral is evaluated.

Continue from that point rather than restarting the lesson. My requirement is strict: show every mathematical step and every logical implication, even if the response becomes long. Do not hide a calculation behind words such as "obviously," "similarly," or "it follows." When the explanation is complete, show the exact Markdown updates you would make to the course state so the next session resumes from the new boundary.

### Mock source excerpt

**Source:** `S1`, *Condensed Matter Lecture Notes*, section 3.1, equations (12)-(14).

> For a free fermionic mode with $\xi_k=\varepsilon_k-\mu$, the time-domain retarded propagator is
> $$
> G^R(k,t)=-i\,\theta(t)e^{-i\xi_k t}.
> $$
> Our forward Fourier transform is
> $$
> G^R(k,\omega)=\int_{-\infty}^{\infty}dt\,e^{i\omega t}G^R(k,t).
> $$
> The spectral function convention used in these notes is
> $$
> A(k,\omega)=-2\,\operatorname{Im}G^R(k,\omega).
> $$
> You may use the distributional identity
> $$
> \lim_{\eta\to0^+}\frac{\eta}{x^2+\eta^2}=\pi\delta(x).
> $$

### Mock file: `CURRENT-STATE.md`

```markdown
# Current State

- Active lesson: `lessons/04-retarded-free-propagator.md`
- Source anchor: S1 section 3.1, equations (12)-(14)
- Exact resume point: evaluate the regulated integral for the transform from $G^R(k,t)$ to $G^R(k,\omega)$
- Current obstacle: why $e^{-\eta t}$ is inserted and why $\eta\to0^+$ is taken last
- Last evidence: learner correctly used $\theta(t)$ to change the integration range to $[0,\infty)$, but stopped before evaluating the integral
- Next action: after the convergence issue is resolved, finish the transform and derive $A(k,\omega)$
```

### Mock file: `lessons/04-retarded-free-propagator.md` (ending only)

```markdown
## Fourier transform

Using $\theta(t)$,
$$
G^R(k,\omega)
=-i\int_0^\infty dt\,e^{i(\omega-\xi_k)t}.
$$

To control the upper limit, replace the integrand by
$$
e^{[i(\omega-\xi_k)-\eta]t},\qquad \eta>0.
$$

> Session paused here: the learner has not yet accepted or evaluated the regulated integral.
```

### Mock file: `learning-records/2026-08-09.md` (latest entry)

```markdown
- Task: transform the free retarded propagator to frequency space
- Demonstrated unaided: used $\theta(t)$ to replace $(-\infty,\infty)$ by $(0,\infty)$
- Remaining gap: convergence factor and evaluation of the complex exponential integral
```

---

## Evaluator only - do not include in the user prompt or intended response

Record observations, including exact quotations where useful:

- Whether the response resumes at the regulated integral or unnecessarily restarts earlier material.
- Whether it explicitly evaluates the endpoint limit, simplifies the complex denominator, takes $\eta\to0^+$ in the stated order, computes the imaginary part, and applies the supplied delta-function identity.
- Whether any algebraic sign, factor of $i$, factor of $2$, or Fourier convention is skipped or changed.
- Whether the active lesson is patched rather than duplicated, and whether the stale pause marker is removed or replaced.
- Whether `CURRENT-STATE.md` advances the exact resume point and records the learner's newly reported understanding without falsely treating the report as an unaided derivation.
- Whether the learning record distinguishes prior demonstrated work from the learner's present self-report and leaves an appropriate next check.
- Whether the clarification remains only in chat or is represented in the proposed canonical Markdown updates.

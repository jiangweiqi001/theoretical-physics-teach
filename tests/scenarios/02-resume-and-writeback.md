# Scenario 02: Resume at the exact transform and write back the result

## User prompt

<!-- BEGIN USER PROMPT -->
This simulated session is dated 2026-08-10 and resumes from `learning-records/2026-08-09.md`. On 2026-08-09 I was stuck on why the convergence factor is legitimate. I now understand that $e^{-\eta t}$ with $\eta>0$ makes the upper limit converge and that the retarded prescription means taking $\eta\to0^+$ only after the integral is evaluated.

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
<!-- END USER PROMPT -->

---

## Evaluator only - never dispatch

This section must never be sent to the responding agent. Dispatch only the output of `tests/extract-user-prompts.ps1`.

### Core PASS checklist

The scenario passes only if every item below passes.

- [ ] Resumes at the regulated integral without restarting the earlier definition or the already demonstrated $\theta(t)$ step.
- [ ] Explicitly evaluates the endpoint limit, simplifies every factor of $i$ and sign, takes $\eta\to0^+$ only after integration, computes the imaginary part, and derives $A(k,\omega)=2\pi\delta(\omega-\xi_k)$ using the supplied convention.
- [ ] Preserves the supplied Fourier and spectral-function conventions without skipping a mathematical or logical transition.
- [ ] Patches `lessons/04-retarded-free-propagator.md` instead of duplicating it and removes or replaces the stale pause marker.
- [ ] Advances `CURRENT-STATE.md` to a precise new resume point and writes the resolved clarification into the canonical Markdown state rather than leaving it only in chat.
- [ ] Updates the learning record while distinguishing the learner's 2026-08-10 self-report from the unaided work demonstrated on 2026-08-09, and leaves an observable next mastery check.

### Optional observations

- Record exact quotations that conceal algebra or incorrectly inflate demonstrated mastery.
- Note unnecessary repetition, useful consistency checks, and any proposed state files beyond those supplied.

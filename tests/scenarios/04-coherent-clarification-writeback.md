# Scenario 04: Coherent clarification writeback

<!-- BEGIN USER PROMPT -->
Continue my existing Obsidian lesson rather than starting a new explanation in chat. I now understand why the regulator is needed, but I still do not understand the sign manipulation between the regulated integral and the final retarded denominator. Integrate the explanation into the lesson so the Note remains coherent, then update the exact resume state. End the learner-facing Note with one multiple-choice or true/false checkpoint.

### Mock source excerpt

**Source:** `S1`, *Condensed Matter Lecture Notes*, section 3.1, equations (12)-(14), using the forward transform $G^R(k,\omega)=\int dt\,e^{i\omega t}G^R(k,t)$.

### Mock file: `lessons/L-000004-retarded-propagator.md`

```markdown
# Lesson L-000004 — Free retarded propagator

## Notation and conventions

- $x=\omega-\xi_k$ is the real frequency difference, measured in energy units.
- $\eta>0$ is the convergence regulator, measured in energy units.
- $G^R(k,\omega)$ is the retarded frequency-space propagator.

## Complete derivation or proof

### Step 3 — Regulated integral

From S1 section 3.1,
$$
G^R(k,\omega)
=-i\lim_{\eta\to0^+}\int_0^\infty dt\,e^{(ix-\eta)t}.
$$

### Step 4 — Endpoint evaluation

$$
\int_0^\infty dt\,e^{(ix-\eta)t}
=\frac{1}{\eta-ix},
$$
so
$$
G^R(k,\omega)=\frac{1}{x+i\eta}.
$$

> Current pause: the sign manipulation in Step 4 remains unclear.

### Step 5 — Spectral consequence

The result above implies that the free spectral weight is concentrated at $x=0$.

## Mastery check and next dependency

- Next dependency: derive the imaginary part after the sign is understood.
```

### Mock file: `CURRENT-STATE.md`

```markdown
- Active Lesson: [[lessons/L-000004-retarded-propagator#Step 4 — Endpoint evaluation]]
- Last completed step: evaluation of the convergent upper endpoint
- First unfinished implication: simplify $-i/(\eta-ix)$ to the retarded denominator
- Current obstacle: sign manipulation in Step 4
- Next action: explain the sign manipulation
```

Patch the canonical lesson in place. Do not append a chat transcript or a detached clarification section at the end. Preserve the source convention and do not claim that I can reconstruct the derivation until I answer the checkpoint.
<!-- END USER PROMPT -->

---

## Evaluator only - never dispatch

This section must never be sent to the responding agent. Dispatch only the output of `tests/extract-user-prompts.ps1`.

### Core PASS checklist

The scenario passes only if every item below passes.

- [ ] Patches the leading notation section first if the clarification introduces any new symbol, decorated form, unit glyph, or convention.
- [ ] Inserts the sign explanation at Step 4 rather than appending a chat transcript or detached clarification appendix at the file end.
- [ ] Rewrites the transition into Step 4 and the transition to Step 5, removes the stale pause marker, and leaves one continuous mathematical argument.
- [ ] Preserves the supplied Fourier convention and provenance, shows the sign algebra without skipping steps, and repairs any affected step or link references.
- [ ] Replaces `CURRENT-STATE.md` with an exact section or block resume link, the new first unfinished implication, and one observable next action.
- [ ] Ends the learner-facing Note with one multiple-choice or true/false checkpoint and does not infer reconstruction mastery from an option answer alone.

### Optional observations

- Record detached appendices, duplicated derivations, stale obstacle text, or broken transitions.
- Note whether the final checkpoint targets the exact resolved sign boundary.

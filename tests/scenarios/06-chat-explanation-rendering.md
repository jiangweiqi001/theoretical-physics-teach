# Scenario 06: Renderer-safe ordinary chat explanation

<!-- BEGIN USER PROMPT -->
$theoretical-physics-teach

My Obsidian Note already renders correctly and must remain unchanged. I am not asking for a finished Note preview or an exact Markdown patch. I am asking for an ordinary chat explanation of the physical meaning of the quasiparticle residue in the formula below.

$$
Z_k=
\left[
1-
\left.
\partial_\omega\Sigma'(k,\omega)
\right|_{E_k}
\right]^{-1}.
$$

Your previous chat explanation left inline LaTeX visibly uncompiled. Restate the explanation in a renderer-safe form. Explain what the residue measures, why a noninteracting particle has residue one, what a value between zero and one means for the coherent spectral peak, and what the frequency derivative of the real self-energy is doing physically. Keep the paper's notation and do not turn this format correction into a new test of me.
<!-- END USER PROMPT -->

---

## Evaluator only - never dispatch

This section must never be sent to the responding agent. Dispatch only the output of `tests/extract-user-prompts.ps1`.

### Core PASS checklist

The scenario passes only if every item below passes.

- [ ] Classifies the requested output as ordinary conversational teaching, not a canonical Note, exact patch, or response-only finished Note preview.
- [ ] Because the learner already reported a rendering failure, uses Unicode/plain text throughout the conversational mathematics and contains no LaTeX delimiters or LaTeX commands.
- [ ] Correctly explains that Zₖ is the pole residue or coherent quasiparticle spectral weight, with Zₖ = 1 in the noninteracting limit and 0 < Zₖ < 1 meaning reduced coherent weight rather than reduced electric charge or literal particle number.
- [ ] Explains that the frequency dependence of the real self-energy changes the local slope of the inverse propagator and therefore the pole strength, while preserving the supplied source notation.
- [ ] Avoids formula-heavy Markdown tables and does not place mathematical markup in headings, table cells, list labels, option labels, or link labels; it leaves the canonical Obsidian Note unchanged.
- [ ] Treats the restatement as a format correction, not a new Diagnostic ID, learner attempt, Evidence record, or mastery advancement.

### Optional observations

- Record any raw dollar delimiters, backslash commands, formula-heavy table cells, or accidental conversion into a Note preview.
- Note whether the explanation remains mathematically precise without relying on the failed renderer.

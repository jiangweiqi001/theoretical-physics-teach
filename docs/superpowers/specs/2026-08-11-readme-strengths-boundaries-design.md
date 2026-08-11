# README Strengths and Boundaries Design

## Goal

Explain, in both public READMEs, why `theoretical-physics-teach` is useful for a researcher who enters another theoretical-physics subfield through deep paper reading, and state the corresponding limits without changing Skill behavior.

## Scope

- Add one English section, `## Strengths and practical boundaries for researchers`, after `## Who this is for`.
- Add the matching Chinese section, `## 面向研究者的优势与实际边界`, after `## 适合谁`.
- Add both headings to their README navigation lists.
- Pair each strength with its practical boundary in a compact two-column table.
- Record the documentation change under `CHANGELOG.md` → `Unreleased`.
- Extend the publication contract so both sections and their essential claim boundaries cannot silently disappear.

## Content model

The table will cover six paired claims:

1. prerequisite diagnosis reuses prior research training, but self-report is not mastery evidence;
2. source-local notation and anchors support faithful reading, but coverage is limited by the registered source corpus;
3. complete derivations support depth, but the Skill is not an instant-summary workflow;
4. cross-source comparison exposes assumptions and regimes, but unresolved conflicts remain unresolved;
5. exact resume and coherent writeback reduce repeated work, but persistent state does not guarantee physical correctness;
6. the optional code bridge explains implementation provenance, but no execution or convergence claim exists without a Run record.

The closing paragraph will state that speed comes from avoiding repeated orientation, notation loss, and reteaching—not from compressing away the theory.

## Compatibility and non-goals

- Do not modify `SKILL.md`, protocols, templates, examples, workspace schemas, or validators.
- Do not create a new onboarding mode or broaden the audience beyond theoretical physics.
- Do not duplicate the full `Limitations` section; the new table is a researcher-facing summary with direct strength-to-boundary pairings.
- Do not bump the release version for this documentation-only change.

## Verification

- Watch the new publication-contract assertions fail before editing the READMEs.
- Run the rebrand contract, static contract, public-link checker, package tests, full Python suite, and official Skill validator.
- Submit through a pull request and require Windows and Ubuntu CI before merging.


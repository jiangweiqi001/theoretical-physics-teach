# Learner-Aware Assessment Granularity Design

## Goal

Avoid spending a research learner's attention on detached elementary algebra or routine symbolic manipulation while preserving rigorous evidence boundaries and the ability to repair a real prerequisite when it blocks a non-trivial physics task.

## Approved behavior

- Do not separately assess isolated elementary algebra or routine symbolic manipulation when that task class is below the learner's explicitly established assessment granularity.
- Prefer high-diagnostic-value prompts about physical objects, interpretation, assumptions and validity, non-trivial derivation structure, source translation, cross-source comparison, and theory-to-code reasoning.
- Persist an explicit learner assessment-granularity preference in the canonical workspace so it survives across sessions.
- Keep route preference and mastery evidence separate. Declining or skipping a low-level task does not demonstrate the omitted operation.
- If a later non-trivial physics task reveals an elementary operation as the actual blocking dependency, teach and reassess it locally inside that derivation rather than reopening a detached drill.
- Preserve the existing rule that option recognition alone does not establish reconstruction. A non-trivial derivation target still requires produced work after instruction.

## Alternatives considered

### 1. Remove all elementary checks permanently

This is fast but unsafe. It turns a route preference into an unearned mastery claim and leaves no recovery path when an elementary step actually causes a physics error.

### 2. Keep every prerequisite check

This is evidence-conservative but wastes attention on low-information tasks and is poorly matched to researchers entering an adjacent field.

### 3. Persist learner-aware granularity with contextual recovery

This is the selected design. It skips detached low-level drills, preserves the untested boundary, and reopens a prerequisite only when later observable work shows that the prerequisite is genuinely blocking the physics.

## Canonical data flow

1. The learner explicitly states an assessment-granularity preference.
2. The response is stored verbatim in an immutable Evidence record because it is a learner self-report.
3. The preference is written to the canonical teaching-preference owner and summarized in the current snapshot.
4. Future diagnostic selection filters out detached tasks below that granularity.
5. Skipped tasks remain unproven; no Concept Node, Roadmap phase, Review, or Mission target advances from the preference alone.
6. A later observed error may reactivate the exact prerequisite in context and create new Evidence from the learner's actual attempt.

## Ownership

- SKILL.md owns the compact, non-negotiable assessment-granularity invariant.
- references/physics-pedagogy.md owns question selection, canonical persistence, evidence separation, and contextual recovery.
- tests/static-contract.ps1 prevents the four core policies from being removed.
- README.md and README.zh-CN.md explain the user-facing advantage and safety boundary.
- CHANGELOG.md records the unreleased behavior change.

No new workspace template or schema is needed. The existing NOTES.md, immutable Learning Record, and CURRENT-STATE.md ownership model already supports the data flow.

## Failure handling

- An explicit preference without an attempted task changes assessment routing but not mastery.
- A skipped task does not become a Review item unless later observable work demonstrates a weakness.
- A later in-context error triggers the smallest relevant repair at the dependency point; it does not justify restarting a broad elementary curriculum.
- If the agent cannot determine whether a task is below the learner's established granularity, it should prefer a paper-relevant physical question and let produced work reveal the actual dependency.

## Non-goals

- Do not shorten or skip required steps inside a real derivation.
- Do not prohibit arithmetic, algebra, or symbolic manipulation when they are integral to the non-trivial target.
- Do not infer that a learner has mastered every omitted foundational operation.
- Do not replace produced-work checks for reconstruction, proof, source translation, or implementation reasoning with option questions.
- Do not add a global fixed list of “easy” operations; granularity is learner- and task-dependent.

## Verification

- Add exact contract assertions before production wording and observe RED.
- Add the minimal invariant and operational rules, then observe GREEN.
- Verify bilingual documentation describes both the efficiency advantage and the evidence boundary.
- Run all existing contracts, Python tests, Skill validation, Markdown-link checks, package validation, workspace validation, and diff checks.
- Synchronize and validate the installed Skill only after the repository version passes, then push the verified commit to GitHub.

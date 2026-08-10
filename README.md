# theoretical-physics-math-teach

`theoretical-physics-math-teach` is an explicit-only Agent Skill for sustained study of theoretical physics from user-supplied papers, textbooks, lecture notes, and related implementation material.

It is physics-first: pure mathematics is introduced to support a physical theory, derivation, proof, structural comparison, or implementation, and may be expanded when that physical dependency needs more detail. The skill is source-driven and multi-source. It preserves each source's notation, records explicit translations and assumptions between sources, and writes durable, Obsidian-compatible Markdown lessons with long, step-by-step derivations when needed.

The skill never activates automatically. Invoke it explicitly with `$theoretical-physics-math-teach` or a direct request such as “用理论教学 skill 学这些论文”.

## What it does

- Registers supplied sources with stable IDs, versions, availability, and exact anchors before teaching from them.
- Preserves source-local notation and records translations in `NOTATION-CROSSWALK.md` instead of silently normalizing conventions.
- Compares assumptions, methods, approximations, results, and validity regimes in `SYNTHESIS.md`.
- Starts every lesson Note with `## Notation and conventions` and explains every new symbol before its first use.
- Shows intermediate algebra, transforms, integrals, sums, sign changes, assumptions, and logical implications without imposing a Note length cap or skipping derivation steps.
- Resumes from the exact recorded obstacle and writes substantive clarifications back to the canonical workspace.
- Advances mastery only from observable learner evidence, not confidence, recognition, or rereading alone.

## Installation

Codex is the primary tested environment. After the repository is published, clone the complete public repository into the Codex skills directory.

PowerShell:

```powershell
$skillsDirectory = Join-Path $env:USERPROFILE ".codex\skills"
New-Item -ItemType Directory -Force -Path $skillsDirectory | Out-Null
git clone https://github.com/jiangweiqi001/theoretical-physics-math-teach.git (Join-Path $skillsDirectory "theoretical-physics-math-teach")
```

macOS or Linux:

```sh
mkdir -p "$HOME/.codex/skills"
git clone https://github.com/jiangweiqi001/theoretical-physics-math-teach.git "$HOME/.codex/skills/theoretical-physics-math-teach"
```

You may also download the repository and copy the entire `theoretical-physics-math-teach` folder into the skills directory. Keep the root `SKILL.md`, `references/`, `assets/`, and metadata together.

For another Agent Skills-compatible tool, place the entire repository folder in that tool's skills directory and confirm that it discovers the root `SKILL.md`. `agents/openai.yaml` is Codex-specific display and invocation-policy metadata; the Markdown skill and its supporting files remain portable to compatible tools.

## Quick start

1. Choose a learning workspace in your Obsidian vault or another writable directory. It must be outside the installed skill directory.
2. Supply the papers, textbooks, lecture notes, or other study material. Multiple sources are welcome; give local paths or otherwise place their content explicitly in scope.
3. Invoke the skill and state the workspace, physical learning goal, materials, preferred explanatory language, and desired observable capabilities.
4. Continue in later sessions from `CURRENT-STATE.md`; learning files stay in the designated workspace and are never written into the installed skill folder.

Example with two papers that use different conventions:

```text
$theoretical-physics-math-teach

Use D:\Obsidian\many-body-course as my learning workspace.
Study these supplied papers together:
- D:\papers\paper-A.pdf, which writes G(k,\omega) and measures energy relative to \mu
- D:\papers\paper-B.pdf, which writes \mathcal G(p,p_0) and uses absolute energy

Teach me how their Green-function derivations are related. Preserve each paper's
symbols, build NOTATION-CROSSWALK.md and SYNTHESIS.md, and state the assumptions
behind every cross-source relation. Start each lesson with notation and conventions,
define every new symbol before use, and show the complete derivations without a
length cap or skipped steps.
```

## Workspace artifacts

| Path | Purpose |
| --- | --- |
| `MISSION.md` | Physical questions, constraints, supplied sources, and observable completion targets |
| `CURRENT-STATE.md` | Exact resume point, current obstacle, required anchors, and next action |
| `MATERIALS.md` | Source registry with stable IDs, versions, paths, roles, and availability |
| `ROADMAP.md` | Prerequisite-ordered phases, source anchors, mastery targets, and exit evidence |
| `lessons/*.md` | Dependency-sized teaching Notes with notation first and complete derivations |
| `learning-records/EV-*.md` | Immutable learner evidence and evidence-based mastery judgments |
| `NOTATION-CROSSWALK.md` | Source-local symbols, conventions, domains, dimensions, and qualified translations |
| `SYNTHESIS.md` | Cross-source relations, assumption maps, comparisons, and regimes of validity |
| `OPEN-QUESTIONS.md` | Missing evidence, ambiguities, conflicts, and their next verification steps |
| `reference/code-maps/*` | Optional equation-to-code maps when the code bridge is active |
| `execution-records/RUN-*.md` | Optional immutable records of actual runs and observed outputs |

The workspace may also include baseline diagnostics, a concept map, glossary, review queue, preferences, static assets, and other source-grounded reference Notes.

## Optional code-theory bridge

The code bridge is used only when implementation is a learning target and the supplied materials include code, pseudocode, numerical algorithms, or reproducibility instructions. It maps equations and approximations to code locations, variables, units, discretization, truncation, inputs, outputs, validation observables, and non-claims.

Git material is anchored to an exact commit. Non-Git files, chat excerpts, and inline pseudocode are first saved as read-only workspace snapshots with a recorded hash, received date, and exact locator. Without a linked Run record, the skill does not claim that code ran, results agreed, or a computation converged.

## Limitations

- Canonical teaching artifacts are Obsidian-compatible Markdown only. The skill does not create HTML, CSS, JavaScript, or browser-dependent lessons, and it requires no website or browser presentation.
- This skill supplements rather than replaces the original materials, independent calculation, or expert review. Its output is not a guarantee of correctness.
- It does not invent missing equations, citations, conventions, code behavior, or evidence. Unavailable or conflicting evidence remains explicitly unresolved.
- It does not silently reconcile contradictory notation, assumptions, approximations, or results.
- Mastery and completion require observable evidence of the stated capability; confidence or recognition alone is insufficient.
- Pure mathematics serves an identified physical dependency, although that supporting treatment can be expanded as far as the dependency requires.
- It remains explicit-only and will not start merely because a conversation happens to mention theoretical physics.

## License and attribution

This project is an MIT-licensed derivative of Matt Pocock's [`teach` skill](https://github.com/mattpocock/skills/tree/84fdeffd12f2ee307994d1eb6feb48173b6e0502/skills/productivity/teach) from [`mattpocock/skills`](https://github.com/mattpocock/skills). The upstream copyright notice is retained alongside the copyright for this project's original additions.

This is an independent project and is not endorsed by Matt Pocock. See [NOTICE.md](NOTICE.md) for the derivative-work notice and [LICENSE](LICENSE) for the MIT terms.

## Version

Initial release: `v0.1.0`.

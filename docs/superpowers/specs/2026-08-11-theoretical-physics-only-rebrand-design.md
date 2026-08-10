# Theoretical-Physics-Only Rebrand Design

Date: 2026-08-11

Status: Approved direction; written specification awaiting final review

Target release: `v0.3.0`

## Goal

Rename the published project and installed Agent Skill to `theoretical-physics-teach` and position it exclusively for sustained theoretical-physics study. Preserve every teaching behavior already delivered in `v0.2.0`, while removing pure-mathematics audience positioning and promotional requests to star the repository.

The current teaching workflow remains the product:

- exact equation-, heading-, or block-level resume state;
- coherent in-place clarification writeback;
- Obsidian-compatible Markdown Notes with dollar-delimited LaTeX;
- source-local notation and cross-source comparison;
- optional theory-to-code explanation only when trustworthy corresponding material exists;
- option-first diagnosis and review without treating recognition as reconstruction mastery.

## Scope boundary

The project serves theoretical physics only. It does not advertise, design, or maintain a separate pure-mathematics curriculum or a general mathematics-tutoring audience.

Technical language that is necessary to state a theoretical-physics contract remains valid. Examples include `mathematical type`, `display mathematics`, `mathematical step`, `mathematical correctness`, theorem hypotheses, proof steps used by a physical derivation, and the mathematical definition of a physical symbol. These phrases describe the formal machinery of theoretical physics; they do not create a second audience or curriculum.

Current production copy must not describe pure mathematics as a supported field, a parallel curriculum, an expandable independent track, or a target audience. Current production copy must not ask readers to star the repository or describe the project as a star,明星, or future star project.

Historical Git commits and already-published tags remain immutable. They may retain the former identifier in their historical contents. Current `main`, the new release, current repository metadata, the active installation, and all current invocation guidance use only the new identity.

## Identity migration

The canonical identity becomes:

| Surface | New value |
|---|---|
| Skill name | `theoretical-physics-teach` |
| Explicit invocation | `$theoretical-physics-teach` |
| GitHub repository | `jiangweiqi001/theoretical-physics-teach` |
| Codex display name | `Theoretical Physics Teach` |
| Personal install directory | `$HOME/.agents/skills/theoretical-physics-teach` |
| Windows install directory | `%USERPROFILE%\.agents\skills\theoretical-physics-teach` |
| Release | `v0.3.0 — theoretical-physics-only identity` |

Update all current production references, installation commands, CI badge URLs, examples, metadata, assertions, and package validation to use these values.

GitHub's repository rename redirect preserves old repository URLs for external visitors. The README does not advertise the former name. Release notes may describe this as an identity migration without presenting the former identifier as a supported invocation.

## Teaching behavior preserved

### Exact resume state

`CURRENT-STATE.md` continues to own the live atomic snapshot:

- active lesson;
- exact `[[Note#heading]]` or `[[Note#^block-id]]` resume link;
- last completed formula or implication;
- first unfinished formula or implication;
- current obstacle;
- one next observable action.

The skill resumes there without restarting completed material or silently skipping a dependency.

### Coherent clarification writeback

When the learner says that a step is unclear, the explanation is not left only in chat and is not appended as a clarification transcript. The skill rewrites the correct place in the canonical Note, repairs the leading notation section before any new symbol is used, rewrites transitions and downstream references as needed, and rechecks the whole edited Note for:

- conceptual continuity;
- complete logical and calculation steps;
- notation completeness and dependency order;
- source and cross-Note links;
- consistency with the recorded resume state.

The finished Note must read as though the clarification had been designed in place from the beginning.

### Note format

Canonical teaching artifacts remain `.md` only. They remain compatible with Obsidian and use:

- `$...$` for inline LaTeX;
- `$$...$$` for display LaTeX;
- `[[Note#heading]]` for section navigation;
- `[[Note#^block-id]]` when an exact formula or derivation step needs a stable resume target.

The validator remains read-only and continues checking resolvable Note, heading, and block links; unique block IDs; approved formula delimiters; and the absence of browser-dependent lesson artifacts.

### Conditional corresponding-code explanation

The code section remains optional. It is active only when implementation understanding is a learning target and one of these trustworthy corresponding materials is available:

- an official or author-associated open-source repository at an immutable revision;
- code supplied by the user as an immutable workspace snapshot;
- reliably anchored pseudocode supplied with the material.

If no corresponding material exists, the learner-facing code section is omitted. The skill does not invent generic code to make a lesson look complete.

When active, theory comes first. The code explanation then records each physical quantity's source, derivation or approximation, units or dimensions, representation in code, update rule, and role in the result. Reconstructed pseudocode is labeled and linked back to its source operations. Without a canonical Run record and inspected output, no execution, agreement, or convergence claim is made.

### Option-first assessment

Initial diagnosis, ordinary checks, and the end of each Note continue to default to one multiple-choice or true/false item at a time. Distractors correspond to meaningful misconceptions.

If the target capability is derivation, proof, calculation, cross-source translation, or implementation reasoning, an option item may locate the boundary but cannot establish reconstruction. The skill then requests the smallest necessary produced-work follow-up. Evidence records keep recognition, unaided reconstruction, hints, assisted work, and self-report distinct.

## Files and surfaces affected

Production changes include:

- `SKILL.md` frontmatter, title, invocation, and theoretical-physics-only scope;
- `agents/openai.yaml` display metadata and default prompt;
- `README.md` title, badge, repository links, installation, invocation examples, audience statement, limitations, release status, and promotional ending;
- `references/physics-pedagogy.md` removal of pure-mathematics-track wording while retaining physics-required proof/formalism guidance;
- `assets/templates/LESSON.md`, `MISSION.md`, and `CONCEPT-MAP.md` removal of parallel-mathematics-track wording while retaining formal prerequisites needed by physics;
- `tests/static-contract.ps1` and a focused rebrand contract for the new identity and prohibited positioning;
- current design and implementation documentation for this release;
- GitHub repository name, description, topics, CI badge target, and `v0.3.0` release;
- the active personal installation directory.

Historical specifications and older release tags are not rewritten. Current production tests do not treat immutable historical text as an active product surface.

## Test strategy

### RED

Before production edits, add assertions that fail against the current tree because:

- the Skill name and explicit invocation still use the former identity;
- production copy still advertises pure mathematics;
- README still asks readers to star the repository;
- metadata and install examples still use the former repository and folder;
- the current release label is not `v0.3.0`.

### GREEN

Make the minimum production changes required for the new assertions to pass. Then run every existing contract to prove that the v0.2.0 teaching behavior is unchanged:

- static package contract;
- bootstrap template contract;
- behavioral scenario isolation contract;
- accepted behavioral output contract;
- workspace validator unit tests;
- Skill structural validation;
- whitespace and encoding checks.

### Publication verification

Push the migration branch and merge only after local verification. Rename the GitHub repository, then confirm:

- the new repository URL resolves;
- the old URL redirects;
- CI succeeds on the exact release commit under the new repository name;
- `v0.3.0` targets that commit and is neither draft nor prerelease;
- repository description and topics describe theoretical physics only;
- current README badge resolves under the new name.

## Local installation migration

Do not delete the existing installation. Use a recoverable migration:

1. Create `$HOME/.agents/skills/theoretical-physics-teach` from the verified release tree.
2. Compare file hashes and run the complete installed-package validation there.
3. Resolve the old installation and backup paths to absolute paths before moving anything.
4. Move the former installed directory out of the Agent Skills discovery root into an explicitly named backup directory under the user's Obsidian temporary workspace.
5. Confirm only the new Skill identity is discoverable from the personal Agent Skills directory.

The development checkout may remain at its existing filesystem path because moving a repository that contains registered Git worktrees risks corrupting worktree metadata. After the remote rename, create a new correctly named checkout if a clean canonical local path is required; do not delete the historical checkout.

## Release and compatibility

This is `v0.3.0` because the explicit invocation and installation path change. Existing GitHub links receive platform redirects, but the former Skill invocation is not retained as an active alias because doing so would keep the unwanted identity visible and create duplicate discoverable skills.

The current project remains an independent MIT-licensed derivative with the existing upstream attribution in `LICENSE` and `NOTICE.md`. The rebrand does not change ownership, provenance, or license obligations.

## Completion criteria

The migration is complete only when:

- current `main` uses `theoretical-physics-teach` on every active identity surface;
- no production surface positions pure mathematics as an audience or separate curriculum;
- no production surface asks for a star or uses star-project promotional language;
- all v0.2.0 behavior contracts still pass;
- all new rebrand assertions pass;
- local and GitHub CI pass on the exact release commit;
- GitHub repository metadata and `v0.3.0` are published under the new identity;
- the new installed directory passes full validation;
- the old installed directory is preserved outside the discovery root rather than deleted.

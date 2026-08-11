# All-Chat Math Rendering Compatibility Design

## Goal

Make every learner-facing chat explanation readable when the host's inline-LaTeX renderer is absent or unreliable, while preserving canonical Obsidian Notes as exact, LaTeX-native teaching artifacts.

## Root cause

The existing compatibility contract applies only to assessment prompts. Ordinary explanations, answers to clarification questions, progress summaries, feedback, and navigation messages may therefore copy canonical Note formatting into renderer-fragile chat contexts. Inline LaTeX and LaTeX nested inside headings, tables, list labels, option labels, or link labels can remain visibly uncompiled even though the corresponding Obsidian Note renders correctly.

## Approved surface boundary

There are two output surfaces, selected by artifact type rather than by transport alone:

1. **Canonical artifact surface.** Canonical Notes, exact canonical patches, and response-only finished Note previews remain Obsidian-compatible Markdown. They use `$...$` for inline LaTeX and `$$...$$` for display LaTeX and keep the existing Note, notation, source, and writeback contracts.
2. **Conversational surface.** Every other learner-facing chat message—including explanations, clarification answers, assessment prompts, feedback, progress summaries, and navigation—uses renderer-safe mathematics. Short expressions use readable Unicode or plain text. An expression that cannot be represented faithfully and readably that way may use one standalone display block with its delimiters on separate lines and all prose outside the block.

The canonical artifact exception is explicit: a finished Note preview is still a canonical artifact payload even though chat transports it. Do not silently convert that payload to Unicode, because it must remain directly saveable to Obsidian.

## Conversational rendering rules

- Do not rely on inline LaTeX in conversational prose.
- Do not put LaTeX delimiters or commands in headings, Markdown table cells, list labels, option labels, or Markdown link labels.
- Prefer Unicode/plain-text forms such as `Zₖ`, `Eₖ`, `Γₖ`, `∂ωΣ′`, and `Γₖ > 0` when they preserve the intended notation clearly.
- Use a standalone display block only when Unicode/plain text would be ambiguous, materially incomplete, or unreadable. Put the opening and closing delimiters on lines by themselves and keep explanatory prose outside them.
- Do not use formula-heavy Markdown tables in chat. Prefer prose or bullets, with display blocks between items when needed.
- Preserve each source's notation, sign, indices, and mathematical content. Renderer adaptation changes presentation only.
- Link to the canonical Note and summarize it conversationally instead of pasting a complete Note into an ordinary chat explanation.

## Failure-state fallback

If the learner reports any uncompiled or unreadable mathematics in chat:

1. immediately restate the affected content completely in Unicode/plain text;
2. preserve the same mathematical claim, source notation, option order, Diagnostic ID, mastery criterion, and Evidence boundary;
3. treat the restatement as a format correction, not a new attempt or performance opportunity;
4. use Unicode/plain text for all later conversational mathematics in the current chat unless the learner explicitly requests a LaTeX retry;
5. keep canonical Note writeback in Obsidian LaTeX.

## Pre-delivery audit

Before sending a learner-facing chat message containing mathematics, classify the output as canonical artifact or conversational. For conversational output, scan headings, prose, tables, lists, options, and links for inline delimiters or LaTeX commands; convert short mathematics to Unicode/plain text and move unavoidable complex mathematics into standalone display blocks. After a reported failure, verify that the conversational response contains no LaTeX delimiters or commands at all.

## Instruction ownership and conflict resolution

- `SKILL.md` owns the non-negotiable artifact-type boundary and the current-chat fallback state.
- `references/physics-pedagogy.md` owns the operational conversational rendering procedure and pre-delivery audit. Assessment-specific rules inherit this procedure rather than redefining it.
- `assets/templates/LESSON.md` continues to own canonical Note structure only and must not acquire chat-format instructions.
- Public READMEs explain the distinction and fallback without becoming runtime policy owners.
- `tests/static-contract.ps1` and a behavioral scenario enforce the scope, the canonical-preview exception, forbidden nesting contexts, and fallback.

If wording elsewhere says only assessment prompts receive renderer-safe formatting, replace or narrow it so all conversational teaching inherits the general rule. If wording says every chat-delivered artifact must avoid inline LaTeX, add the canonical Note-preview exception. These two checks prevent the policy from becoming either too narrow or self-contradictory.

## Non-goals

- Do not change canonical Note LaTeX, notation-first requirements, source conventions, or Obsidian links.
- Do not ban standalone display mathematics when it is necessary and still renders.
- Do not introduce HTML, CSS, JavaScript, screenshots, browser lessons, or host-specific markup.
- Do not change physics content, evidence judgments, or diagnostic allocation during a format fallback.
- Do not attempt to prove a particular chat renderer's undocumented feature set.

## Verification

1. Add failing static assertions and a realistic ordinary-explanation scenario before changing runtime instructions.
2. Implement the minimal boundary in `SKILL.md` and `references/physics-pedagogy.md`.
3. Update bilingual public documentation and the changelog.
4. Audit all runtime instructions for ambiguous `chat`, `Note preview`, `inline LaTeX`, `assessment prompt`, and fallback wording.
5. Run every repository contract, Python test, official Skill validation, package test, link check, encoding check, and diff check.
6. Synchronize the installed Skill and push only after the repository version passes.

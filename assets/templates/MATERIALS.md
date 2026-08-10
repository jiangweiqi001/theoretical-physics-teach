# Materials Registry

> Bootstrap placeholder policy: {{...}} are inert schema placeholders, not registered entities. After bootstrap, any unfilled repeated entry or row remains schema-only and explicitly PENDING; it must not be interpreted as a record. A stable ID exists only after the applicable allocation protocol replaces the placeholder.

Assign each source a stable ID once and never silently reuse or renumber it. Under that Source ID, create append-only keyed version records such as `{{SOURCE_VERSION_KEY}}`. A content change creates a new version record, or a new Source ID when the material's identity changes; never rewrite an old version record or any anchor that names it.

## Material index

| Stable source ID | Short title | Type | Latest stable version key | Availability summary | Availability Open Question ID + link |
| --- | --- | --- | --- | --- | --- |
| {{SOURCE_ID}} |  | Paper, book, notes, code, or data | {{SOURCE_VERSION_KEY}} | Full, partial, metadata-only, or unavailable | {{QUESTION_ID}} — {{OBSIDIAN_LINK}}, when applicable |

## Version record index

This index is navigation only. The keyed version record is canonical and immutable.

| Stable version key | Stable source ID | Edition/version label | Immutable revision anchor | Availability |
| --- | --- | --- | --- | --- |
| {{SOURCE_VERSION_KEY}} | {{SOURCE_ID}} |  | Git commit or read-only snapshot path plus content hash | Full, partial, metadata-only, or unavailable |

## Material entries

Copy this keyed block for every registered source version.

### {{SOURCE_VERSION_KEY}}

| Field | Value |
| --- | --- |
| Stable source ID | {{SOURCE_ID}} |
| Stable version key | {{SOURCE_VERSION_KEY}} |
| Title and bibliographic data |  |
| Type | Paper, book, notes, code, or data |
| Edition or version label |  |
| Immutable revision-anchor kind | Git commit or workspace read-only snapshot |
| Git commit, when the material is in Git |  |
| Read-only snapshot path, for an independent file, chat excerpt, or inline pseudocode |  |
| Snapshot content hash, algorithm plus digest |  |
| Received date |  |
| Original local path or URL |  |
| Page, section, equation, theorem, block, algorithm-step, or code addressability |  |
| Role in mission | Primary, prerequisite, comparison, or implementation |
| Availability summary at registration | Full, partial, metadata-only, or unavailable |
| Availability Open Question ID + canonical link at registration | {{QUESTION_ID}} — {{OBSIDIAN_LINK}}, when applicable |
| Trust or access notes |  |

`OPEN-QUESTIONS.md` is the exclusive canonical owner of availability-gap details and lifecycle. Keep only the current availability summary and its Question ID plus link here.

## Registration and availability summary events

This table is append-only. Availability rows mirror only the current summary and canonical Question link; all gap details and lifecycle remain in `OPEN-QUESTIONS.md`.

| Date and sequence | Source ID | Event | Prior stable version key | New stable version key or new Source ID | Availability summary | Open Question ID + link | Consequence for existing anchors and lessons |
| --- | --- | --- | --- | --- | --- | --- | --- |
|  |  | registered, new version, new source, or availability summary |  |  |  |  |  |

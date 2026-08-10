# Materials Registry

Assign each source a stable ID once and never silently reuse or renumber it. Under that Source ID, create append-only keyed version records such as `S1-V001`. A content change creates a new version record, or a new Source ID when the material's identity changes; never rewrite an old version record or any anchor that names it.

## Material index

| Stable source ID | Short title | Type | Latest stable version key | Availability summary | Availability Open Question ID + link |
| --- | --- | --- | --- | --- | --- |
| S1 |  | Paper, book, notes, code, or data | S1-V001 | Full, partial, metadata-only, or unavailable | Q-001 — [[OPEN-QUESTIONS#Q-001]], when applicable |

## Version record index

This index is navigation only. The keyed version record is canonical and immutable.

| Stable version key | Stable source ID | Edition/version label | Immutable revision anchor | Availability |
| --- | --- | --- | --- | --- |
| S1-V001 | S1 |  | Git commit or read-only snapshot path plus content hash | Full, partial, metadata-only, or unavailable |

## Material entries

Copy this keyed block for every registered source version.

### S1-V001

| Field | Value |
| --- | --- |
| Stable source ID | S1 |
| Stable version key | S1-V001 |
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
| Availability Open Question ID + canonical link at registration | Q-001 — [[OPEN-QUESTIONS#Q-001]], when applicable |
| Trust or access notes |  |

`OPEN-QUESTIONS.md` is the exclusive canonical owner of availability-gap details and lifecycle. Keep only the current availability summary and its Question ID plus link here.

## Registration and availability summary events

This table is append-only. Availability rows mirror only the current summary and canonical Question link; all gap details and lifecycle remain in `OPEN-QUESTIONS.md`.

| Date and sequence | Source ID | Event | Prior stable version key | New stable version key or new Source ID | Availability summary | Open Question ID + link | Consequence for existing anchors and lessons |
| --- | --- | --- | --- | --- | --- | --- | --- |
|  |  | registered, new version, new source, or availability summary |  |  |  |  |  |

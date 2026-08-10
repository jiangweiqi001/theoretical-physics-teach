# Concept Map

> Bootstrap placeholder policy: {{...}} are inert schema placeholders, not registered entities. After bootstrap, any unfilled repeated entry or row remains schema-only and explicitly PENDING; it must not be interpreted as a record. A stable ID exists only after the applicable allocation protocol replaces the placeholder.

`CONCEPT-MAP.md` is the exclusive canonical owner of concept nodes and prerequisite edges. Assign stable IDs here. Other files may link to node and edge IDs but must not copy or redefine the dependency graph.

## Concept nodes

| Node ID | Physical concept or supporting mathematics | Scope | Exact source anchors | Mastery level | Status | Supporting Evidence ID + Obsidian link | Lesson path |
| --- | --- | --- | --- | --- | --- | --- | --- |
| {{CONCEPT_NODE_ID}} |  |  |  | Level 0, interpretation, reconstruction, synthesis, implementation, or blank | PENDING, not started, active, blocked, review, or complete |  |  |

A node cannot carry a positive mastery level or status `complete` unless `Supporting Evidence ID + Obsidian link` contains at least one pair such as {{EVIDENCE_ID}} — {{OBSIDIAN_LINK}} whose linked record demonstrates the required capability. Without such evidence, leave mastery blank or level 0 and do not mark the node complete.

## Explicit prerequisite edges

| Edge ID | Prerequisite node ID | Dependent node ID | Required capability | Why the edge is necessary | Source anchor or design rationale |
| --- | --- | --- | --- | --- | --- |
| {{CONCEPT_EDGE_ID}} |  |  |  |  |  |

## Cross-source concept relations

Do not classify Relations here. Reference source-local Notation Entry IDs from `NOTATION-CROSSWALK.md`, and reference canonical Relation IDs and Synthesis IDs from `SYNTHESIS.md`.

| Node ID | Source-local Notation Entry IDs | Relation ID + canonical link | Synthesis ID + canonical link |
| --- | --- | --- | --- |
|  |  | {{RELATION_ID}} — {{OBSIDIAN_LINK}} | {{SYNTHESIS_ID}} — {{OBSIDIAN_LINK}} |

Only structural or mastery-state changes caused by learner Evidence are recorded in an immutable Learning Record such as {{EVIDENCE_ID}} — {{OBSIDIAN_LINK}}. Bootstrap, planning, administrative, and source-availability structural updates require no learner Evidence; anchor them instead to the applicable canonical source/version/location, Open Question ID plus link, or Mission rationale. Such updates must not claim positive mastery or status `complete`. This file contains only the current canonical graph.

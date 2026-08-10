# Source Workflow Protocol

Use this protocol whenever material is added, replaced, cited, compared, or found unavailable. Treat the workspace templates as the canonical schemas; this file defines the operating sequence.

## 1. Register before use

1. Read all of `MATERIALS.md` before allocating an ID. Give every paper, book, note set, repository, dataset, or other supplied material one stable Source ID such as `S1`.
2. Never renumber, recycle, or silently repurpose a Source ID. A new edition, revision, repository state, or materially different artifact receives either an explicit version update in the same entry or a new Source ID when identity has changed. Record the change and its consequences under `Registration changes`.
3. Complete the keyed material entry before teaching from it: bibliographic identity, material type, exact edition/version/commit, local path or URL, mission role, addressability, availability, and trust/access notes. Keep the index narrow; the keyed entry is canonical.
4. Check that the recorded path resolves and that the portion required for the current task is actually readable. Classify availability as full, partial, metadata-only, or unavailable; a filename or citation alone is not evidence that its contents are available.

## 2. Anchor every material-dependent statement

Use the stable Source ID and recorded version on every anchor. Make the location precise enough for another agent to reopen the same evidence:

- print material: page plus section, equation, theorem, lemma, appendix, table, or figure identifier;
- addressable notes: heading/section plus equation or paragraph locator;
- code: repository and pinned commit, file, exact line or line range, and function/class/module or code object;
- pseudocode: source location plus loop, block, or algorithm step.

Do not cite a whole work when a more exact anchor exists. If pagination, equation numbering, or code lines are unstable, state that limitation and add the most stable available locator.

Give every important claim, equation, convention, derivation step, comparison premise, and code behavior exactly one provenance label:

- **Source:** directly stated or visibly implemented at the cited anchor;
- **Reconstructed:** an intermediate result derived from cited Source premises, with the reconstruction shown;
- **Inference:** a defensible interpretation or connection not explicitly stated by the cited source;
- **Unresolved:** unavailable, ambiguous, contradictory, or insufficient evidence.

Never upgrade Reconstructed or Inference to Source. Never invent a missing equation, citation, convention, theorem statement, appendix, or code behavior.

## 3. Handle unavailable or conflicting evidence

When required evidence is missing, stop only the claim or branch that depends on it. Add the gap to `MATERIALS.md` under `Availability gaps`, allocate a stable Open Question ID in `OPEN-QUESTIONS.md`, and record all available or missing source anchors, the blocked work, evidence needed, and next verification. Link that Question ID from affected notation, relation, synthesis, lesson, or state records. Ask for the source only when no safe branch can continue. Resolve the question only after adding resolving anchors and updating every listed canonical file or stable ID.

For disagreement, preserve both anchored statements. Do not average them, silently select one, or call them equivalent before the Relation protocol below is satisfied.

## 4. Preserve source-local notation

Never rewrite a source into another source's symbols. `NOTATION-CROSSWALK.md` is the exclusive canonical owner of source-local notation entries.

1. Allocate an append-stable Notation Entry ID such as `N-S1-001`; never renumber or reuse it.
2. Record the exact glyph and reading, mathematical type, domain, index ranges, physical meaning, units/dimensions, Source ID/version/exact location, and all sign, metric, Fourier-transform, normalization, natural-unit, boundary, and operator conventions. Give a meaning-changing decorated or indexed form its own entry.
3. Mark ambiguity and link an Open Question rather than guessing.
4. A correction or changed meaning receives a new ID. Populate `Supersedes` and `Superseded by`; retain both entries and their IDs.
5. For every cross-source connection involving the entry, place the Relation ID and canonical link directly in that notation entry. Store only a brief counterpart and assumption mirror there. The complete endpoints, type, status, and assumption map remain canonical in `SYNTHESIS.md`; repair the mirror whenever it disagrees with that Relation.

## 5. Register cross-source Relations canonically

`SYNTHESIS.md` is the exclusive canonical owner of the general Relation registry and of each Relation's assumption map. Allocate stable `REL-000001`-style IDs and use typed endpoints. An endpoint type must be exactly one of `notation entry`, `physical object`, `assumption`, `method`, `claim`, `result`, `theorem`, or `code object`; attach a stable ID when available and a canonical Source ID/version/exact-location/role/provenance anchor whenever provenance is needed.

Choose exactly one complete Relation type:

1. `same object, different notation`
2. `same notation, different object`
3. `equivalent only under stated assumptions`
4. `alternative approximation or renormalization scheme`
5. `apparent contradiction requiring resolution`
6. `historical or pedagogical restatement`

Do not use shorthand or invent a seventh class. Enforce the template's endpoint compatibility rules: notation relations include a notation endpoint; equivalence has comparable endpoints and a complete assumption map; alternative schemes name the differing approximation or scheme; contradictions identify conflicting statements and missing resolving evidence; restatements require historical or pedagogical evidence.

For each Relation, record both endpoints, exact evidence anchors, the comparison/translation map, assumptions required, differences that remain, status, and Open Question IDs. Never assert equivalence merely from similar symbols or results. Supersession creates a new stable Relation ID and links both directions; no ID is reused.

## 6. Build a cross-source synthesis

Organize comparison around one physical object, problem, observable, theorem, or implementation question rather than paper order. Allocate a stable Synthesis ID and create one source record per compared material. For every source, record:

- Hamiltonian and/or action, system and degrees of freedom;
- ensemble, state, boundary/initial conditions, and relevant symmetry assumptions;
- method and source-local assumptions;
- approximation, discretization or truncation when relevant, regulator or renormalization scheme, expansion parameter, and limit;
- observable or theorem target, result/conclusion, and validity regime;
- Source ID, version, exact anchor, role, and provenance.

Then link the required canonical Relation IDs, apply their assumption maps step by step, record any additional application conditions, translate without erasing source-local notation, and state the compared result, shared regime if any, and precisely what ceases to agree or be comparable outside it. A Synthesis entry may reference a Relation but must not duplicate its endpoint data, taxonomy, status, or canonical assumptions.

Finish by checking that each claim is reopenable from its anchor, each notation connection has both the notation-entry mirror and canonical Relation link, each equivalence has an explicit assumption map, and every gap is linked to `OPEN-QUESTIONS.md` rather than filled from memory.

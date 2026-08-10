Provisional response-only artifact; no canonical write performed.

# Comparing Two Retarded Propagators and Their Free Poles

## Notation and conventions

No canonical lesson, notation, relation, or evidence ID is allocated.

Both excerpts have immutable-anchor status `Unassigned — supplied excerpt; snapshot registration pending`.

- Prompt-local `S1` locator: *Condensed Matter Lecture Notes*, section 3.2, equations (18)–(19).
- Prompt-local `S2` locator: *Relativistic-Style Green Functions for Electron Systems*, section 2, equations (5)–(6).
- The labels `S1` and `S2` below identify only these visible excerpts; they are not newly registered canonical Source IDs.

| Inert local symbol ID | Local label | Exact glyph and reading | Mathematical type, domain, and indices | Physical meaning and units | Origin and local convention |
| --- | --- | --- | --- | --- | --- |
| `{{NOTATION_ID_PENDING}}-S01-001` | Arithmetic | $0$, $1$, $0.20$, $+$, $-$, $=$, and the fraction bar | Ordinary numerals and arithmetic operations; no indices | Used for energy differences and reciprocals | Defined here; ordinary algebra |
| `{{NOTATION_ID_PENDING}}-S01-002` | Energy unit | $\mathrm{eV}$, “electron-volt” | Energy unit; no indices | Unit used in the numerical example | Supplied in the request |
| `{{NOTATION_ID_PENDING}}-S01-003` | Imaginary unit | $i$, “eye” | Complex scalar; no indices | Produces the retarded complex displacement | `S1`, eq. (19); `S2`, eq. (5) |
| `{{NOTATION_ID_PENDING}}-S01-004` | Positive infinitesimal | $0^+$, “zero plus” | Positive infinitesimal energy; no indices; superscript $+$ means approach from positive values | Specifies the retarded boundary prescription | Both propagators contain $+i0^+$ |
| `{{NOTATION_ID_PENDING}}-S01-005` | Natural-unit constant | $\hbar$, “h-bar” | Physical constant with dimensions of action; no indices | Converts frequency to energy | Both sources set $\hbar=1$ |
| `{{NOTATION_ID_PENDING}}-S01-006` | Chemical potential | $\mu$, “mu” | Real energy; no indices | Energy of the Fermi surface | `S1`, section 3.2; `S2`, section 2 |
| `{{NOTATION_ID_PENDING}}-S01-007` | Source-S1 state label | $k$, “kay” | Momentum or band-state label; range and units not supplied | Labels the state in `S1` | `S1`, eqs. (18)–(19); no decoration |
| `{{NOTATION_ID_PENDING}}-S01-008` | Source-S2 state label | $p$, “pee” | Momentum or band-state label; range and units not supplied | Labels the state in `S2` | `S2`, eqs. (5)–(6); no identification with $k$ is supplied |
| `{{NOTATION_ID_PENDING}}-S01-009` | S1 band energy | $\varepsilon_k$, “epsilon sub kay” | Real energy indexed by $k$ | Normal-state band energy | `S1`, eq. (18); subscript $k$ selects the state |
| `{{NOTATION_ID_PENDING}}-S01-010` | S2 band energy | $E_p$, “capital E sub pee” | Real energy indexed by $p$ | The same normal-state band dispersion that is called $\varepsilon_k$ | `S2`, eq. (6); subscript $p$ selects the state |
| `{{NOTATION_ID_PENDING}}-S01-011` | Relative band energy | $\xi_k$, “xi sub kay” | Real energy indexed by $k$ | Band energy measured from $\mu$ | `S1`, eq. (18): $\xi_k=\varepsilon_k-\mu$ |
| `{{NOTATION_ID_PENDING}}-S01-012` | S1 energy variable | $\omega$, “omega” | Real energy variable with a retarded complex boundary prescription; no index | Energy measured relative to $\mu$; its Fermi-surface value is zero | `S1`, section 3.2; inverse-transform sign is negative |
| `{{NOTATION_ID_PENDING}}-S01-013` | S2 energy variable | $p_0$, “pee zero” | Absolute real energy variable with a retarded complex boundary prescription; no index range | Absolute one-particle energy; its Fermi-surface value is $\mu$ | `S2`, section 2; subscript $0$ is part of the source-local energy name |
| `{{NOTATION_ID_PENDING}}-S01-014` | S1 self-energy | $\Sigma(k,\omega)$, “Sigma of kay and omega” | Generally complex, energy-valued function of $k$ and $\omega$ | Interaction correction in `S1` | `S1`, eq. (19); no relation to the S2 self-energy is supplied |
| `{{NOTATION_ID_PENDING}}-S01-015` | S2 self-energy | $\mathcal\Sigma(p,p_0)$, “calligraphic Sigma of pee and pee zero” | Generally complex, energy-valued function of $p$ and $p_0$ | Interaction correction in `S2` | `S2`, eq. (5); calligraphic styling marks the source-local object |
| `{{NOTATION_ID_PENDING}}-S01-016` | S1 propagator | $G(k,\omega)$, “G of kay and omega” | Complex-valued function with units of inverse energy | Retarded one-particle propagator in relative-energy variables | `S1`, eq. (19) |
| `{{NOTATION_ID_PENDING}}-S01-017` | S2 propagator | $\mathcal G(p,p_0)$, “calligraphic G of pee and pee zero” | Complex-valued function with units of inverse energy | Retarded propagator in absolute-energy variables | `S2`, eq. (5) |
| `{{NOTATION_ID_PENDING}}-S01-018` | S1 free propagator | $G_0(k,\omega)$, “G zero of kay and omega” | Complex-valued function with units of inverse energy | Form obtained here by setting $\Sigma(k,\omega)=0$ | Subscript $0$ means noninteracting in this lesson |
| `{{NOTATION_ID_PENDING}}-S01-019` | S2 free propagator | $\mathcal G_0(p,p_0)$, “calligraphic G zero of pee and pee zero” | Complex-valued function with units of inverse energy | Form obtained here by setting $\mathcal\Sigma(p,p_0)=0$ | Subscript $0$ means noninteracting in this lesson |

Both inverse transforms use the same negative frequency–time sign. No metric, spatial boundary condition, or operator normalization beyond the displayed unit numerators is supplied.

## Mission connection and prerequisites

- **Objective:** decide whether the displayed propagators are demonstrably the same interacting object and translate their free poles between relative and absolute energy.
- **Prerequisite:** solving for a pole by setting a denominator to zero.
- **Prior learner evidence:** none supplied; no Evidence record is created.

## Exact source anchors and provenance

| Claim | Label | Prompt-local source | Version status | Exact anchor |
| --- | --- | --- | --- | --- |
| $\xi_k=\varepsilon_k-\mu$ and $\omega$ is relative to $\mu$ | Source | `S1` | `Unassigned — supplied excerpt; snapshot registration pending` | Section 3.2, eqs. (18)–(19) and following convention paragraph |
| $p_0$ is absolute energy, the Fermi surface is at $\mu$, and $E_p$ is the same dispersion as $\varepsilon_k$ | Source | `S2` | `Unassigned — supplied excerpt; snapshot registration pending` | Section 2, eqs. (5)–(6) and following notation paragraph |
| No relation between $\Sigma$ and $\mathcal\Sigma$ is assumed | Source | `S2` | `Unassigned — supplied excerpt; snapshot registration pending` | Final sentence of the supplied excerpt |
| The coordinate translation is $p_0=\omega+\mu$ | Reconstructed | `S1` and `S2` | Both pending | From their stated Fermi-surface origins |
| Equality of the full propagators requires an additional self-energy translation | Reconstructed | `S1` and `S2` | Both pending | Algebra below |
| The two free poles represent the same energy above the Fermi surface after translation | Reconstructed | `S1` and `S2` | Both pending | Free-pole calculation below |

## Physical question

Are the two formulas the same retarded one-particle propagator written with different energy zeros, and where is the noninteracting pole in each convention?

## Complete derivation

### 1. Translate the energy origin

`S1` places the Fermi surface at $\omega=0$, while `S2` places it at $p_0=\mu$. Therefore the same physical energy is represented by

$$
p_0=\omega+\mu,
$$

or equivalently,

$$
\omega=p_0-\mu.
$$

**Provenance:** Reconstructed from the frequency conventions in `S1`, section 3.2, and `S2`, section 2.

### 2. Compare the interacting denominators

Identify corresponding states provisionally as $p$ and $k$, and use the source-stated band correspondence $E_p=\varepsilon_k$. Substitute $p_0=\omega+\mu$ into `S2`:

$$
\mathcal G(p,\omega+\mu)
=
\frac{1}
{\omega+\mu-\varepsilon_k-\mathcal\Sigma(p,\omega+\mu)+i0^+}.
$$

Regroup the band and chemical-potential terms:

$$
\omega+\mu-\varepsilon_k
=
\omega-(\varepsilon_k-\mu)
=
\omega-\xi_k.
$$

Hence

$$
\mathcal G(p,\omega+\mu)
=
\frac{1}
{\omega-\xi_k-\mathcal\Sigma(p,\omega+\mu)+i0^+}.
$$

This equals the `S1` expression only if the additional translation rule

$$
\mathcal\Sigma(p,\omega+\mu)=\Sigma(k,\omega)
$$

holds for corresponding states, with the same underlying operator definition and normalization. Under those assumptions,

$$
\mathcal G(p,\omega+\mu)=G(k,\omega).
$$

**Provenance:** Reconstructed algebra from `S1`, eqs. (18)–(19), and `S2`, eqs. (5)–(6).

The excerpts explicitly do **not** assume the required self-energy relation. Therefore equality of the interacting propagators is **not established**.

### 3. Compute the free pole in `S1`

For the noninteracting comparison, set $\Sigma(k,\omega)=0$:

$$
G_0(k,\omega)
=
\frac{1}{\omega-\xi_k+i0^+}.
$$

A pole occurs when the denominator vanishes:

$$
\omega-\xi_k+i0^+=0.
$$

Solving gives

$$
\omega=\xi_k-i0^+.
$$

For $\varepsilon_k=\mu+0.20\,\mathrm{eV}$,

$$
\xi_k
=
\varepsilon_k-\mu
=
(\mu+0.20\,\mathrm{eV})-\mu
=
0.20\,\mathrm{eV}.
$$

Thus the retarded free pole in `S1` variables is

$$
\boxed{\omega=0.20\,\mathrm{eV}-i0^+}.
$$

### 4. Compute the free pole in `S2`

Set $\mathcal\Sigma(p,p_0)=0$:

$$
\mathcal G_0(p,p_0)
=
\frac{1}{p_0-E_p+i0^+}.
$$

Set the denominator to zero:

$$
p_0-E_p+i0^+=0,
$$

so

$$
p_0=E_p-i0^+.
$$

Using $E_p=\mu+0.20\,\mathrm{eV}$,

$$
\boxed{p_0=\mu+0.20\,\mathrm{eV}-i0^+}.
$$

Subtracting the energy origin verifies the mapping:

$$
p_0-\mu
=
0.20\,\mathrm{eV}-i0^+
=
\omega.
$$

**Provenance for both free-pole calculations:** Reconstructed from the displayed source propagators by setting their self-energies to zero.

## Physical interpretation and checks

The numerical pole coordinates are not identical because the sources choose different energy zeros. Physically, both free poles lie $0.20\,\mathrm{eV}$ above their stated Fermi-surface energy. Both have the same retarded displacement, $-i0^+$.

| Check | Calculation | Outcome |
| --- | --- | --- |
| Units | Every denominator term has energy units, so each propagator has inverse-energy units | Consistent |
| Fermi-surface limit | If the band energy equals $\mu$, then `S1` gives $\omega=0$ and `S2` gives $p_0=\mu$ | Correct energy-origin translation |
| Retarded sign | Solving a denominator containing $+i0^+$ places the pole at an energy containing $-i0^+$ | Same prescription in both |
| Energy shift | $(\omega+\mu)-\varepsilon_k=\omega-(\varepsilon_k-\mu)$ | Chemical-potential shift cancels exactly |
| Symmetry or conservation | No relevant symmetry or conservation statement is supplied | No further conclusion |

## Cross-source comparison

**Would-be Relation type:** `equivalent only under stated assumptions`; canonical Relation ID remains pending.

Required assumptions are:

1. $p$ and $k$ label the same one-particle state.
2. $E_p=\varepsilon_k$, as stated in `S2`.
3. $p_0=\omega+\mu$, reconstructed from the two energy origins.
4. $\mathcal\Sigma(p,\omega+\mu)=\Sigma(k,\omega)$.
5. The operator definition and normalization represent the same physical one-particle response.

Consequently:

- **Can conclude:** the formulas use compatible retarded prescriptions, their free denominators map by an energy-origin shift, and their free poles describe the same $0.20\,\mathrm{eV}$ excitation above the Fermi surface when the state labels correspond.
- **Cannot conclude:** the full interacting propagators are the same object, their self-energies are translated versions of one another, or their interacting poles, widths, and residues agree.

## Code–theory map

**Code bridge state:** N/A — implementation is not a mission target.

## Exercises

- **Retrieval:** Explain why $0.20\,\mathrm{eV}$ and $\mu+0.20\,\mathrm{eV}$ can locate the same excitation.
- **Reconstruction:** Starting from `S2`, substitute $p_0=\omega+\mu$ and state the exact condition on $\mathcal\Sigma$ required to recover `S1`.

## Mastery check and next dependency

No learner attempt was supplied, so mastery remains `level 0 - not yet demonstrated / insufficient evidence`. The next dependency is an explicit source relation between the two self-energies, or common operator definitions, before any interacting equivalence can be established.

## Response-only writeback patch

- **Would-be lesson patch:** the complete Markdown lesson above, under canonical lesson ID `{{LESSON_ID_PENDING}}`.
- **Would-be current-state patch:**
  - Active lesson: `{{LESSON_ID_PENDING}}`
  - Last completed step: translated the energy origin and derived both free poles.
  - First unfinished implication: determine whether the interacting self-energies transform into one another.
  - Obstacle: `S2` explicitly assumes no relation between the self-energies; source snapshots and canonical relation registration are also pending.
  - Latest learner evidence: none.
  - Next action: obtain an anchored self-energy or common operator-definition relation, then test the conditional equality.

Canonical writeback is not complete.

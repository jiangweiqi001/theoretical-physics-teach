# Are These Two Retarded Propagators the Same? Energy-Origin Translation and Free Poles

## Notation and conventions

| Symbol | Definition, domain, and physical meaning | Units | Provenance and convention |
| --- | --- | --- | --- |
| \(S1\), \(S2\) | Identifiers for the two supplied mock excerpts | none | Defined in the prompt |
| \(k\), \(p\) | Source-local labels for a one-particle momentum or band state; their ranges are not supplied | momentum | \(k\): \(S1\), section 3.2; \(p\): \(S2\), section 2 |
| \(\varepsilon_k\), \(E_p\) | Real normal-state band energies of the states labeled by \(k\) and \(p\); the subscripts indicate state dependence | energy | \(S1\), section 3.2, equation (18); \(S2\), section 2, equations (5)–(6). \(S2\) states that \(E_p\) is the dispersion elsewhere denoted \(\varepsilon_k\) |
| \(\mu\) | Chemical potential and reference energy of the Fermi surface | energy | \(S1\), section 3.2, equation (18) and adjacent text; \(S2\), section 2, adjacent text |
| \(\xi_k\) | Band energy relative to the chemical potential for state \(k\) | energy | Defined by \(S1\), section 3.2, equation (18) |
| \(\omega\) | \(S1\)'s real frequency-energy variable measured relative to \(\mu\), with complex continuation used to discuss poles | energy | \(S1\), section 3.2, equation (19) and adjacent text |
| \(p_0\) | \(S2\)'s absolute one-particle energy variable; the subscript \(0\) denotes the energy component, not a free-particle limit | energy | \(S2\), section 2, equations (5)–(6) and adjacent text |
| \(G(k,\omega)\) | Complex retarded one-particle propagator in \(S1\)'s variables | inverse energy in the displayed normalization | \(S1\), section 3.2, equation (19) |
| \(\mathcal G(p,p_0)\) | Complex retarded propagator in \(S2\)'s variables; the calligraphic typeface is source-local notation | inverse energy in the displayed normalization | \(S2\), section 2, equation (5) |
| \(\Sigma(k,\omega)\) | \(S1\)'s generally complex self-energy correction | energy | \(S1\), section 3.2, equation (19) |
| \(\mathcal\Sigma(p,p_0)\) | \(S2\)'s generally complex self-energy correction; no relation to \(\Sigma\) is supplied | energy | \(S2\), section 2, equation (5) and final sentence |
| \(G_0(k,\omega)\), \(\mathcal G_0(p,p_0)\) | Lesson-local notation for the free propagators obtained by setting the corresponding self-energy to zero; the subscript \(0\) means noninteracting | inverse energy | Defined here |
| \(i\) | Imaginary unit, satisfying \(i^2=-1\) | none | Standard mathematical notation used in both excerpts |
| \(0^+\) | A positive infinitesimal with energy units when it appears in these denominators; the superscript \(+\) specifies approach from positive values | energy | Both displayed propagators |
| \(i0^+\) | Retarded boundary prescription; a denominator containing \(+i0^+\) has its free pole infinitesimally below the real energy axis | energy | Both displayed propagators |
| \(t\) | Time variable in the inverse Fourier kernels | inverse energy because \(\hbar=1\) | Both excerpts |
| \(e\) | Base of the exponential in the Fourier kernels | none | Both excerpts |
| \(\hbar\) | Reduced Planck constant, set equal to one in both sources | one in the adopted natural units | Both excerpts |
| \(\mathrm{eV}\) | Electronvolt, the energy unit used in the numerical example | energy | Numerical condition in the prompt |

Both sources use inverse-transform kernels with a negative exponent: \(e^{-i\omega t}\) in \(S1\) and \(e^{-ip_0t}\) in \(S2\). No hats, bars, stars, or boldface occur. Apart from the explicitly described subscripts and superscripts, no additional index convention is assumed.

## Mission connection and prerequisites

The objective is to decide whether the two formulas represent the same full physical propagator and to translate their free-particle poles without confusing an energy-zero shift with a physical discrepancy.

The only prerequisites are solving a linear denominator for its zero and distinguishing an absolute energy from energy measured relative to the chemical potential.

> [!summary] Bottom line
> The excerpts establish that both formulas are retarded propagators and that their **free-particle poles describe the same band excitation after the energy-coordinate shift**
> \[
> p_0=\omega+\mu.
> \]
> They do **not** establish that the full interacting propagators are the same physical object, because \(S2\) explicitly assumes no relation between \(\Sigma\) and \(\mathcal\Sigma\). Full equality is therefore conditional, not a conclusion of the excerpts.

## Exact source anchors and provenance

| Statement used | Provenance | Exact anchor |
| --- | --- | --- |
| \(\xi_k=\varepsilon_k-\mu\) | **Source** | \(S1\), section 3.2, equation (18) |
| Formula for \(G(k,\omega)\), relative-energy meaning of \(\omega\), Fermi surface at \(\omega=0\), and kernel \(e^{-i\omega t}\) | **Source** | \(S1\), section 3.2, equation (19) and adjacent sentences |
| Formula for \(\mathcal G(p,p_0)\), absolute-energy meaning of \(p_0\), Fermi surface at \(p_0=\mu\), and kernel \(e^{-ip_0t}\) | **Source** | \(S2\), section 2, equations (5)–(6) and adjacent sentences |
| \(E_p\) and \(\varepsilon_k\) denote the same normal-state band dispersion | **Source** | \(S2\), section 2, sentence following equation (5) |
| No relation between the two self-energies is assumed | **Source** | \(S2\), section 2, final sentence |
| \(\varepsilon_k=E_p=\mu+0.20\,\mathrm{eV}\) for the state under study | **Source** | Numerical condition in the prompt |

The prompt supplies section and equation locators but no immutable source-version records. No version key or bibliographic detail beyond the mock citations is invented here.

## Physical question

Do \(G(k,\omega)\) and \(\mathcal G(p,p_0)\) denote the same particular retarded one-particle propagator, or do their denominators merely look different because the sources choose different energy zeros? How do their free poles compare for the specified state?

## Complete derivation

### 1. Translate the energy coordinates

\(S1\) says that \(\omega\) is measured relative to \(\mu\), while \(S2\) says that \(p_0\) is absolute. Therefore the coordinate translation is

\[
\omega=p_0-\mu,
\]

or, equivalently,

\[
p_0=\omega+\mu.
\]

**Reconstructed — from the energy-reference statements in \(S1\), section 3.2, and \(S2\), section 2.**

For corresponding band states, use the supplied dispersion identification

\[
E_p=\varepsilon_k.
\]

Then

\[
\begin{aligned}
p_0-E_p
&=(\omega+\mu)-\varepsilon_k
\\
&=\omega-\left(\varepsilon_k-\mu\right)
\\
&=\omega-\xi_k.
\end{aligned}
\]

The second line only regroups terms; the third uses \(\xi_k=\varepsilon_k-\mu\).

**Reconstructed — from \(S1\), equation (18), and \(S2\)'s identification of \(E_p\) with \(\varepsilon_k\).**

This is the central algebraic fact: the apparently different free denominators are the same denominator expressed relative to different energy zeros.

### 2. Free pole in \(S1\)'s variables

The noninteracting limit sets

\[
\Sigma(k,\omega)=0.
\]

Thus

\[
G_0(k,\omega)
=
\frac{1}{\omega-\xi_k+i0^+}.
\]

A pole occurs where the denominator vanishes:

\[
\omega-\xi_k+i0^+=0.
\]

Solving one algebraic step at a time,

\[
\omega-\xi_k=-i0^+,
\]

and therefore

\[
\omega=\xi_k-i0^+.
\]

Its real-axis location is \(\omega=\xi_k\), and the retarded prescription places it infinitesimally below the real axis.

**Reconstructed — from \(S1\), equations (18)–(19), after the explicitly stated noninteracting assumption.**

For the supplied state,

\[
\varepsilon_k=\mu+0.20\,\mathrm{eV}.
\]

Hence

\[
\begin{aligned}
\xi_k
&=\varepsilon_k-\mu
\\
&=\left(\mu+0.20\,\mathrm{eV}\right)-\mu
\\
&=0.20\,\mathrm{eV}.
\end{aligned}
\]

Therefore the \(S1\) free pole is

\[
\boxed{\omega=0.20\,\mathrm{eV}-i0^+},
\]

with real-axis location

\[
\boxed{\omega=0.20\,\mathrm{eV}}.
\]

### 3. Free pole in \(S2\)'s variables

The noninteracting limit now sets

\[
\mathcal\Sigma(p,p_0)=0.
\]

Then

\[
\mathcal G_0(p,p_0)
=
\frac{1}{p_0-E_p+i0^+}.
\]

The denominator vanishes when

\[
p_0-E_p+i0^+=0.
\]

Thus

\[
p_0-E_p=-i0^+,
\]

so

\[
p_0=E_p-i0^+.
\]

**Reconstructed — from \(S2\), equations (5)–(6), after the explicitly stated noninteracting assumption.**

Using the supplied band energy,

\[
E_p=\mu+0.20\,\mathrm{eV},
\]

gives

\[
\boxed{p_0=\mu+0.20\,\mathrm{eV}-i0^+},
\]

with real-axis location

\[
\boxed{p_0=\mu+0.20\,\mathrm{eV}}.
\]

Because no numerical value of \(\mu\) is supplied, this is the most specific absolute energy that can be given.

Relative to the Fermi-surface energy in \(S2\),

\[
\begin{aligned}
p_0-\mu
&=\left(\mu+0.20\,\mathrm{eV}\right)-\mu
\\
&=0.20\,\mathrm{eV}.
\end{aligned}
\]

Thus both poles lie \(0.20\,\mathrm{eV}\) above their respective Fermi-surface coordinates.

### 4. Direct free-propagator comparison

Insert \(p_0=\omega+\mu\) and \(E_p=\varepsilon_k\) into \(S2\)'s free expression:

\[
\begin{aligned}
\mathcal G_0(p,\omega+\mu)
&=
\frac{1}{(\omega+\mu)-E_p+i0^+}
\\
&=
\frac{1}{(\omega+\mu)-\varepsilon_k+i0^+}
\\
&=
\frac{1}{\omega-(\varepsilon_k-\mu)+i0^+}
\\
&=
\frac{1}{\omega-\xi_k+i0^+}
\\
&=
G_0(k,\omega).
\end{aligned}
\]

This equality assumes that \(p\) and \(k\) label the corresponding band state. It preserves the identical \(+i0^+\) prescription.

**Reconstructed — from both source formulas and the supplied energy/state identification.**

Therefore the two free poles are not physically displaced from each other. Their coordinates differ by exactly \(\mu\):

\[
\boxed{p_0=\omega+\mu}.
\]

### 5. Why the full interacting equality does not follow

Apply the same variable translation to \(S2\)'s interacting propagator:

\[
\begin{aligned}
\mathcal G(p,\omega+\mu)
&=
\frac{1}
{(\omega+\mu)-E_p-\mathcal\Sigma(p,\omega+\mu)+i0^+}
\\
&=
\frac{1}
{\omega-\xi_k-\mathcal\Sigma(p,\omega+\mu)+i0^+}.
\end{aligned}
\]

By contrast, \(S1\) gives

\[
G(k,\omega)
=
\frac{1}
{\omega-\xi_k-\Sigma(k,\omega)+i0^+}.
\]

After matching the state labels and energy variables, the written functions would agree if

\[
\boxed{\mathcal\Sigma(p,\omega+\mu)=\Sigma(k,\omega)}
\]

and if the propagators use the same operator definition and normalization.

**Reconstructed — this is the sufficient algebraic equality condition obtained by comparing the two denominators.**

But \(S2\) explicitly states that no relation between \(\Sigma\) and \(\mathcal\Sigma\) is assumed. Consequently,

\[
\boxed{\text{the equality of the full interacting propagators is unresolved from the excerpts.}}
\]

This is not evidence that they are different; it is evidence that their identity has not been established.

### 6. Fourier-kernel check

Under the same energy translation,

\[
\begin{aligned}
e^{-ip_0t}
&=e^{-i(\omega+\mu)t}
\\
&=e^{-i\mu t}e^{-i\omega t}.
\end{aligned}
\]

The second line uses the exponential identity for a sum in the exponent.

**Reconstructed — from the Fourier-kernel conventions stated in both excerpts.**

Thus changing the energy origin introduces the time-dependent phase \(e^{-i\mu t}\). This phase does not change the frequency-space pole correspondence, but it shows why raw time-domain expressions should not be declared literally identical without also translating the field or operator convention.

## Physical interpretation and checks

### Interpretation

Both formulas have the causal structure of a retarded propagator. The energy-zero convention differs:

- In \(S1\), the Fermi surface is at \(\omega=0\).
- In \(S2\), the Fermi surface is at \(p_0=\mu\).
- The same excitation \(0.20\,\mathrm{eV}\) above the Fermi surface is therefore written as \(\omega=0.20\,\mathrm{eV}\) or \(p_0=\mu+0.20\,\mathrm{eV}\).

The sources establish the same **kind** of object and a matching free-particle representation after translation. They do not establish the same particular interacting function.

### Checks

| Check | Calculation or argument | Outcome |
| --- | --- | --- |
| Units | Every term in each denominator is an energy; therefore each displayed propagator has inverse-energy units | Consistent |
| Fermi-surface limit | If \(\varepsilon_k=E_p=\mu\), then \(\xi_k=0\), so \(S1\)'s free pole is at \(\omega=0\), while \(S2\)'s is at \(p_0=\mu\) | The stated Fermi-surface locations map correctly |
| Retarded sign | Solving a denominator with \(+i0^+\) gives an energy minus \(i0^+\) | Both free poles lie infinitesimally below the real axis |
| Free residue | Each free denominator is linear in its own energy variable with coefficient one, and each numerator is one | Both free poles are simple and have unit residue in the displayed normalization |
| Fourier convention | Both inverse kernels have the same negative-exponent sign; the energy shift produces \(e^{-i\mu t}\) | Compatible after the expected phase translation |
| Interacting pole comparison | The two denominator equations contain unrelated self-energies | Pole positions, widths, and residues cannot be compared from the excerpts |
| Symmetry or conservation | No Hamiltonian, symmetry, or conservation statement is supplied | No further check is justified |

## Cross-source comparison

The best-supported relation class is **`equivalent only under stated assumptions`**.

| Question | Conclusion | Provenance |
| --- | --- | --- |
| Are the symbols \(G\) and \(\mathcal G\) automatically identical? | No. Similar formula structure and retarded labels do not prove identity | **Inference**, constrained by both excerpts |
| Are the free propagators equivalent? | Yes, for corresponding states, after \(E_p=\varepsilon_k\), \(p_0=\omega+\mu\), and both self-energies are set to zero | **Reconstructed** from \(S1\) and \(S2\) |
| Are the full interacting propagators equivalent? | Only if the self-energies translate as \(\mathcal\Sigma(p,\omega+\mu)=\Sigma(k,\omega)\), together with matching state/operator conventions | **Reconstructed conditional result** |
| Does the excerpt establish that self-energy relation? | No; \(S2\) explicitly says that no relation is assumed | **Source**, \(S2\), section 2, final sentence |
| Do their free poles represent the same excitation? | Yes: both are \(0.20\,\mathrm{eV}\) above the Fermi surface, with identical retarded placement | **Reconstructed** |
| Can the interacting poles, lifetimes, or spectral weights be compared? | No, not without a relation between the self-energies and fuller operator definitions | **Unresolved** |

## Code–theory map

**N/A — implementation is not a mission target and no code was supplied.**

## Discussion-ready statement

> The two expressions are retarded propagators written with different energy origins. With \(p_0=\omega+\mu\) and \(E_p=\varepsilon_k\), their free denominators coincide:
> \[
> p_0-E_p=\omega-\xi_k.
> \]
> Hence the state at \(\varepsilon_k=E_p=\mu+0.20\,\mathrm{eV}\) has a free pole at \(\omega=0.20\,\mathrm{eV}-i0^+\) in \(S1\), and at \(p_0=\mu+0.20\,\mathrm{eV}-i0^+\) in \(S2\). These are the same pole relative to the Fermi surface. The full interacting propagators cannot be identified from the excerpts because no relation between \(\Sigma\) and \(\mathcal\Sigma\) is assumed.

## Exercises

### Retrieval

Without looking back, state where each source places the Fermi surface and give the frequency-coordinate translation.

**Success criterion:** \(\omega=0\), \(p_0=\mu\), and \(p_0=\omega+\mu\).

### Reconstruction

Starting from \(p_0-E_p\), reproduce every step leading to \(\omega-\xi_k\), then state the additional self-energy condition required for the interacting denominators to match.

**Success criterion:** the derivation explicitly uses \(p_0=\omega+\mu\), \(E_p=\varepsilon_k\), and \(\xi_k=\varepsilon_k-\mu\), followed by  
\(\mathcal\Sigma(p,\omega+\mu)=\Sigma(k,\omega)\).

## Mastery check and next dependency

A successful synthesis is demonstrated by distinguishing these two claims:

1. The free poles coincide after an energy-origin translation.
2. The full interacting propagators are equal only under an additional, unsupplied self-energy map.

No learner attempt was provided, so no mastery judgment or evidence record is claimed.

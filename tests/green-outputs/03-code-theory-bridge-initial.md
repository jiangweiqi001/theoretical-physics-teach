# What the pseudocode computes

## Notation and conventions

| Symbol/code name | Meaning and domain | Units |
|---|---|---|
| \(i\) | Imaginary unit, \(i^2=-1\) | dimensionless |
| \(\beta\) | Inverse-temperature parameter | \(\mathrm{eV}^{-1}\) |
| \(\mathbf q_a\), `q_points[a]` | Three-dimensional external momentum; \(a=0,\ldots,79\) | \(\text{\AA}^{-1}\) |
| \(\mathbf k_j\), `k_points[j]` | Three-dimensional momentum quadrature node; \(j=0,\ldots,4095\) | \(\text{\AA}^{-1}\) |
| \(w_j\), `k_weights[j]` | Quadrature weight that already includes \(d^3k/(2\pi)^3\) | \(\text{\AA}^{-3}\) |
| \(\xi_{\mathbf k}\), `xi(k)` | Single-particle energy entering the noninteracting propagator | eV |
| \(m\) | Fermionic Matsubara index | integer |
| \(n_b\), `bosonic_indices[b]` | Bosonic Matsubara index stored in column \(b\) | nonnegative integer |
| \(\omega_m=(2m+1)\pi/\beta\) | Fermionic Matsubara energy | eV |
| \(\nu_n=2n\pi/\beta\) | Bosonic Matsubara energy | eV |
| \(G_0(\mathbf k,i\omega_m)\) | Noninteracting Green function | \(\mathrm{eV}^{-1}\) |
| \(\Pi_0(\mathbf q,i\nu_n)\) | Noninteracting polarization bubble | \(\mathrm{eV}^{-1}\text{\AA}^{-3}\) |
| \(\kappa_{\mathrm{IR}}\) | Positive numerical infrared regulator | \(\text{\AA}^{-1}\) |
| \(V_\kappa(\mathbf q)\) | Regulated Coulomb interaction | \(\mathrm{eV}\,\text{\AA}^3\) |
| \(W(\mathbf q,i\nu_n)\) | RPA screened interaction on the Matsubara axis | \(\mathrm{eV}\,\text{\AA}^3\) |
| \(D(\mathbf q,i\nu_n)=1-V_\kappa\Pi_0\) | Dimensionless RPA denominator | dimensionless |
| \(W^R,\Pi_0^R\) | Retarded, real-frequency quantities obtained only after analytic continuation | same units as \(W,\Pi_0\) |
| \(\Omega\) | Real-frequency energy variable | eV |

The code uses the Euclidean momentum norm, so `dot(q,q)` is \(|\mathbf q|^2\). Matsubara “frequencies” are represented as energies because the formulas and configuration use eV and \(\mathrm{eV}^{-1}\). The momentum weights already contain the complete integration measure; no additional grid-volume or \((2\pi)^{-3}\) factor should be inserted. **Source — project documentation supplied in the prompt.**

“Source” below means directly stated in the supplied excerpt or visibly present in the pseudocode. “Reconstructed” means obtained algebraically from those supplied statements. “Inference” marks implementation advice not explicitly stated there. “Unresolved” marks information absent from the prompt. No execution or numerical output was inspected.

## The physical calculation

The paper defines the finite-temperature, noninteracting density polarization as a fermion bubble,

\[
\Pi_0(\mathbf q,i\nu_n)
=
-\frac{2}{\beta}
\sum_{m=-\infty}^{\infty}
\int\frac{d^3k}{(2\pi)^3}
G_0(\mathbf k,i\omega_m)
G_0(\mathbf k+\mathbf q,i\omega_m+i\nu_n),
\]

and inserts it into

\[
W(\mathbf q,i\nu_n)
=
\frac{V_\kappa(\mathbf q)}
 {1-V_\kappa(\mathbf q)\Pi_0(\mathbf q,i\nu_n)},
\qquad
V_\kappa(\mathbf q)=
\frac{4\pi e^2}{|\mathbf q|^2+\kappa_{\mathrm{IR}}^2}.
\]

The factor \(2\) is spin degeneracy, and \(\kappa_{\mathrm{IR}}\) is a numerical regulator rather than physical screening. **Source — S1, section 4, Eqs. (21)–(24).**

For each stored momentum and bosonic index, the actual finite calculation is

\[
\begin{aligned}
\Pi_{\mathrm{code}}(\mathbf q_a,i\nu_{n_b})
={}&-\frac{2}{\beta}
\sum_{j=0}^{4095} w_j
\sum_{m=-256}^{255}
\frac{1}{i\omega_m-\xi_{\mathbf k_j}}
\\
&\times
\frac{1}
 {i(\omega_m+\nu_{n_b})
  -\xi_{\mathbf k_j+\mathbf q_a}},
\\[2mm]
W[a,b]
={}&
\frac{V_\kappa(\mathbf q_a)}
 {1-V_\kappa(\mathbf q_a)
       \Pi_{\mathrm{code}}(\mathbf q_a,i\nu_{n_b})}.
\end{aligned}
\]

Thus the infinite momentum integral is replaced by 4096 weighted nodes, and the infinite Matsubara sum is replaced by 512 terms. The output has shape `(80, 12)`, with row \(a\) belonging to `q_points[a]` and column \(b\) belonging to `bosonic_indices[b]`; it is not a momentum integral over the 80 external momenta. **Reconstructed — supplied pseudocode, initialization and nested-loop blocks.**

The shifted frequency on the right propagator is still fermionic:

\[
\omega_m+\nu_n
=
\frac{(2m+1)\pi}{\beta}+\frac{2n\pi}{\beta}
=
\frac{[2(m+n)+1]\pi}{\beta}
=
\omega_{m+n}.
\]

This is why a bosonic transfer connects two fermionic propagators without changing their fermionic boundary-condition class. **Reconstructed — S1, section 4, Matsubara-frequency definitions.**

Algebraically, where the geometric expansion converges,

\[
W=V_\kappa
  +V_\kappa\Pi_0V_\kappa
  +V_\kappa\Pi_0V_\kappa\Pi_0V_\kappa+\cdots .
\]

The denominator therefore resums repeated polarization insertions: the bare interaction produces a density response, which modifies the interaction seen by a subsequent particle. The closed quotient remains the implemented definition even where this literal series is not convergent, provided its denominator is nonzero. **Reconstructed — algebraic expansion of S1 Eq. (21).**

Under this sign convention, if a computed static polarization is real and negative, then \(1-V_\kappa\Pi_0>1\) for positive \(V_\kappa\), so the magnitude of the static interaction is reduced. That statement is conditional; the prompt does not itself establish the sign of the numerical result. **Reconstructed — S1 Eqs. (21)–(22).**

## What each loop is doing

1. `complex_zeros((len(q_points), len(bosonic_indices)))` allocates one complex Matsubara-axis interaction value for every external momentum and requested bosonic index. Complex storage does not itself imply a real-frequency result. **Source — supplied pseudocode, allocation statement.**

2. The `q` loop evaluates the regulated Coulomb kernel once per external momentum. There are no `q_weights`, so these 80 points are output sampling locations, not quadrature nodes in another integral. **Source — supplied pseudocode, outer loop and `Vq` assignment.**

3. The `n` loop selects the external energy transfer \(i\nu_n\). At fixed \(\beta\), changing this list changes which discrete Matsubara points are saved; it does not continuously refine the frequency spacing. **Reconstructed — S1 frequency definition and supplied `n` loop.**

4. The `k` loop replaces \(d^3k/(2\pi)^3\) by \(\sum_jw_j\). Changing the momentum nodes without regenerating matching weights changes the represented integral. Adding another \((2\pi)^{-3}\) or grid-cell factor would double-count the measure. **Reconstructed — project documentation and `Pi += k_weights[j] * ...`.**

5. The `m` loop evaluates the two propagators in the bubble. Python excludes the upper endpoint, so `range(-256,256)` means \(m=-256,\ldots,255\), exactly 512 terms. **Source — supplied pseudocode, Matsubara loop.**

6. `Pi *= -2 / beta` applies the Matsubara-sum normalization and spin factor after the finite sums. Moving this factor inside either loop is algebraically harmless, but omitting it or applying it twice changes the physics and units. **Reconstructed — S1 Eq. (22) and pseudocode.**

7. The final division applies the RPA resummation independently at every \((\mathbf q_a,i\nu_{n_b})\). No interpolation, analytic continuation, pole search, or real-frequency calculation occurs before saving. **Source — supplied pseudocode, final assignment and `save` call.**

## Numerical scales in this run

From \(\beta=40\ \mathrm{eV}^{-1}\),

\[
\beta^{-1}=0.025\ \mathrm{eV},\qquad
\frac{2\pi}{\beta}=0.1570796\ \mathrm{eV},\qquad
\frac{\pi}{\beta}=0.0785398\ \mathrm{eV}.
\]

The retained left-propagator frequencies run symmetrically from

\[
\omega_{-256}=-\frac{511\pi}{40}\ \mathrm{eV}
\quad\text{to}\quad
\omega_{255}=+\frac{511\pi}{40}\ \mathrm{eV},
\]

or approximately \(\pm40.134\ \mathrm{eV}\). **Reconstructed — supplied configuration and frequency formula.**

If, and only if, the 12 indices are `range(12)`, then \(n=0,\ldots,11\), so the saved bosonic energies run from \(0\) to \(22\pi/40\approx1.728\ \mathrm{eV}\). “Twelve nonnegative indices” alone does not prove that they are consecutive; inspect the actual list before assigning columns to those values. **Inference/Unresolved — the count is supplied, but the list contents are not.**

For \(n>0\), the right propagator uses index \(m+n\). Consequently, the left frequency cutoff is symmetric but the right-leg frequency range is shifted. This is not automatically an error—it is the direct finite truncation of the dummy \(m\)-sum—but it means convergence must be retested when the largest bosonic index changes. A finite truncated sum is also not exactly invariant under shifting \(m\mapsto m+n\). **Reconstructed — frequency identity and finite loop bounds.**

The nested loops evaluate

\[
80\times12\times4096\times512
=2{,}013{,}265{,}920
\]

Green-function products, before ordinary loop overhead. Runtime therefore grows linearly with each grid count and with \(2N_w\). **Reconstructed — supplied configuration and loop structure; not observed execution evidence.**

## Unit and normalization check

The weight, propagators, and Matsubara prefactor have dimensions

\[
[w_j]=\text{\AA}^{-3},\qquad
[G_0^2]=\mathrm{eV}^{-2},\qquad
[\beta^{-1}]=\mathrm{eV}.
\]

Therefore

\[
[\Pi_0]=\mathrm{eV}^{-1}\text{\AA}^{-3}.
\]

For \(V_\kappa\Pi_0\) to be dimensionless,

\[
[V_\kappa]=\mathrm{eV}\,\text{\AA}^3,
\qquad
[W]=\mathrm{eV}\,\text{\AA}^3.
\]

The stated unit consistency then implies that the stored `e2` has dimensions \(\mathrm{eV}\,\text{\AA}\) in this Fourier convention. **Reconstructed — S1 equations plus the supplied unit and quadrature statements.**

Useful algebraic checks are \(W=V_\kappa\) when \(\Pi_0=0\), and \(V_\kappa\to4\pi e^2/|\mathbf q|^2\) as \(\kappa_{\mathrm{IR}}\to0\) at fixed nonzero \(\mathbf q\). The point \(\mathbf q=0\) needs a separate regulated-limit analysis; the prompt does not establish its limiting behavior. **Reconstructed/Unresolved — S1 Eq. (21) and the regulator definition.**

## How to change the grids safely

| Change | What it really changes | Required checks |
|---|---|---|
| `q_points` | Sampling of the external momentum dependence; not an integration measure | Preserve \(\text{\AA}^{-1}\), retain physically important small-\(q\) coverage, and verify how `xi(k + q)` treats points outside its native domain |
| `k_points` | Quadrature approximation to the internal momentum integral | Regenerate `k_weights` with the same nodes and quadrature convention; never infer weights from the point count alone |
| `k_weights` | Measure and normalization of the momentum integral | Confirm they still include \(d^3k/(2\pi)^3\), endpoints, symmetry multiplicities, and any nonuniform-cell volumes |
| `bosonic_indices` | Which allowed Matsubara energies are evaluated | Use integers; keep the actual list with the output; include \(n=0\) only when the static value is wanted |
| `beta` | Physical inverse temperature and both Matsubara spacings | Do not treat it as a purely numerical refinement; changing it also changes the prefactor, every frequency, and the effective cutoff at fixed \(N_w\) |
| `Nw` | Truncation of the infinite fermionic sum | Keep symmetric bounds `range(-Nw, Nw)` and increase \(N_w\) until both \(\Pi_0\) and \(W\) meet a declared tolerance for the largest requested \(n\) |
| `kappa_IR` | Numerical regularization of small momentum | Repeat with successively smaller positive values and refine the small-\(q\) sampling together with it; do not report fixed-\(\kappa\) behavior as physical screening |

**Inference — numerical-safety consequences of the supplied discretization.**

The most important unresolved implementation detail is the domain of `xi(k + q)`. The prompt does not say whether `xi` is an analytic continuum dispersion, an interpolated table, or a periodic Brillouin-zone object requiring reciprocal-lattice wrapping. Changing either momentum grid before establishing this can silently evaluate the wrong dispersion or go out of domain. **Unresolved — absent from the excerpt and pseudocode.**

A defensible convergence study changes one numerical control at a time:

1. Increase \(N_w\) at fixed \(\beta\), momentum grids, and regulator.
2. Refine the \(\mathbf k\) quadrature while regenerating its weights.
3. Refine the external \(\mathbf q\) sampling, especially wherever the regulator makes \(V_\kappa\) vary rapidly.
4. Reduce \(\kappa_{\mathrm{IR}}>0\) and repeat the grid checks.
5. Repeat the checks at the largest retained bosonic index, not only at \(n=0\).

Monitor \(\Pi_0\) and \(D=1-V_\kappa\Pi_0\), not just \(W\). When \(D\) is small, a modest discretization error in \(\Pi_0\) is strongly amplified by the division used to form \(W\). Therefore an apparently sharp feature can move or disappear under grid refinement even when absolute changes in the bubble seem small. **Inference — sensitivity of the implemented quotient.**

If \(\beta\) is changed deliberately, the left cutoff is approximately \((2N_w-1)\pi/\beta\). Keeping a comparable energy cutoff therefore requires \(N_w\) to grow approximately in proportion to \(\beta\), followed by a fresh convergence test; matching the cutoff alone does not prove convergence. **Reconstructed/Inference — loop endpoint and Matsubara formula.**

Save the grid coordinates, actual bosonic-index list, \(\beta\), \(N_w\), \(\kappa_{\mathrm{IR}}\), weights or their immutable identifier, `xi` definition/version, and unit convention alongside `W`. Without that metadata, the column frequencies, momentum locations, regulator value, and normalization cannot be recovered reliably from the array alone. **Inference — reproducibility requirement implied by the array’s index meanings.**

## Does the saved array demonstrate a real-frequency collective mode?

No.

The saved values are \(W(\mathbf q,i\nu_n)\) at only 12 imaginary-axis points per momentum, with a finite momentum quadrature, finite Matsubara cutoff, and nonzero regulator. The pseudocode performs no analytic continuation and no real-frequency evaluation. **Source — supplied pseudocode and S1’s statement following Eqs. (21)–(24).**

After a separately justified analytic continuation, the corresponding retarded expression would be examined in the form

\[
W^R(\mathbf q,\Omega)
=
\frac{V_\kappa(\mathbf q)}
 {1-V_\kappa(\mathbf q)\Pi_0^R(\mathbf q,\Omega)}.
\]

A collective-mode claim would require a stable real-frequency pole or associated spectral feature, together with an assessment of damping and numerical stability. This is a reconstruction of what must be tested after continuation, not something established by the stored Matsubara array. **Reconstructed — continuation requirement stated in S1 and the RPA denominator.**

Even exact values at a finite set of imaginary frequencies do not uniquely determine a function on the real axis: infinitely many analytic continuations can agree at those discrete points while differing between them and near the real axis. A large Matsubara value or a small sampled Matsubara-axis denominator is therefore not, by itself, evidence of a real-frequency pole. **Inference — consequence of having only finitely many sampled values.**

At minimum, a real-frequency claim needs:

- an explicit continuation method and its assumptions;
- stability against the chosen Matsubara points and numerical uncertainty;
- convergence in \(N_w\), the momentum quadrature, the external momentum grid, and \(\kappa_{\mathrm{IR}}\to0\);
- validation against a separately justified real-frequency or spectral observable.

That is also the explicit boundary set by the excerpt: “Real-frequency claims require analytic continuation and separate validation.” **Source — S1, section 4, statement following Eqs. (21)–(24).**

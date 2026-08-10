# An imaginary-axis RPA screening calculation

## Notation and conventions

| Symbol/code name | Meaning | Domain and units |
|---|---|---|
| \(i\) | Imaginary unit | \(i^2=-1\) |
| \(\beta\) | Inverse temperature; the formulas use energy units for Matsubara frequencies | \(\mathrm{eV}^{-1}\) |
| \(\mathbf k,\mathbf q\) | Internal and external three-dimensional momenta | \(\mathrm{\AA}^{-1}\) |
| \(j\) | Index of a momentum quadrature point | \(0,\ldots,4095\) here |
| \(w_j=\texttt{k_weights[j]}\) | Quadrature weight, already including \(d^3k/(2\pi)^3\) | \(\mathrm{\AA}^{-3}\) |
| \(m\) | Fermionic Matsubara index | Integers; \(-N_w,\ldots,N_w-1\) in this code |
| \(n\) | Bosonic Matsubara index | Selected nonnegative integers |
| \(\omega_m=(2m+1)\pi/\beta\) | Fermionic Matsubara energy | eV |
| \(\nu_n=2n\pi/\beta\) | Bosonic Matsubara energy | eV |
| \(\xi_{\mathbf k}\) | Single-particle energy used by the noninteracting propagator | eV; its detailed dispersion is not supplied |
| \(G_0(\mathbf k,i\omega_m)\) | Noninteracting Green function | \(\mathrm{eV}^{-1}\) |
| \(e^2=\texttt{e2}\) | Coulomb prefactor in the project’s consistent unit convention | Consistent with eV and Å |
| \(\kappa_{\mathrm{IR}}\) | Numerical infrared regulator | \(\mathrm{\AA}^{-1}\) |
| \(V_\kappa(\mathbf q)\) | Regulated bare Coulomb interaction | \(\mathrm{eV\,\AA^3}\) |
| \(\Pi_0(\mathbf q,i\nu_n)\) | Noninteracting polarization bubble | \(\mathrm{eV}^{-1}\mathrm{\AA}^{-3}\) |
| \(D=1-V_\kappa\Pi_0\) | RPA denominator | Dimensionless |
| \(W(\mathbf q,i\nu_n)\) | RPA screened interaction on the Matsubara axis | \(\mathrm{eV\,\AA^3}\) |
| \(W^R,\Pi^R,\epsilon^R\) | Retarded interaction, polarization, and dielectric denominator used in a real-frequency analysis | Functions of real energy \(\omega\) |

The subscript \(0\) means noninteracting, \(\kappa\) records regulator dependence, and the superscript \(R\) means retarded. The code variables `omega` and `nu` contain the real numbers \(\omega_m\) and \(\nu_n\); multiplication by `1j` supplies their imaginary-axis arguments.

## What is being calculated

**Source — S1, section 4, Eqs. (21)–(24):** The target is the random-phase-approximation screened interaction

\[
W(\mathbf q,i\nu_n)
=
\frac{V_\kappa(\mathbf q)}
     {1-V_\kappa(\mathbf q)\Pi_0(\mathbf q,i\nu_n)},
\qquad
V_\kappa(\mathbf q)
=
\frac{4\pi e^2}{|\mathbf q|^2+\kappa_{\mathrm{IR}}^2}.
\]

The polarization entering the denominator is the noninteracting particle-hole bubble

\[
\Pi_0(\mathbf q,i\nu_n)
=
-\frac{2}{\beta}
\sum_{m=-\infty}^{\infty}
\int\frac{d^3k}{(2\pi)^3}
G_0(\mathbf k,i\omega_m)
G_0(\mathbf k+\mathbf q,i\omega_m+i\nu_n).
\]

The factor \(2\) is spin degeneracy. No self-energy or vertex correction appears in the supplied algorithm.

**Reconstructed from S1 and the pseudocode:** The actual finite numerical approximation is

\[
\begin{aligned}
\Pi_{\mathrm{num}}(\mathbf q,i\nu_n)
={}&-\frac{2}{\beta}
\sum_{j=0}^{4095}w_j
\sum_{m=-N_w}^{N_w-1}
\frac{1}{i\omega_m-\xi_{\mathbf k_j}}
\frac{1}{i(\omega_m+\nu_n)-\xi_{\mathbf k_j+\mathbf q}},\\
W_{\mathrm{num}}(\mathbf q,i\nu_n)
={}&
\frac{V_\kappa(\mathbf q)}
{1-V_\kappa(\mathbf q)\Pi_{\mathrm{num}}(\mathbf q,i\nu_n)}.
\end{aligned}
\]

Thus:

- The \(\mathbf k\) loop replaces the three-dimensional momentum integral by a weighted quadrature.
- The \(m\) loop truncates the infinite fermionic-frequency sum.
- The outer loops merely sample the answer at the supplied external momenta and bosonic indices.
- `W[iq, inu]` corresponds to `q_points[iq]` and `bosonic_indices[inu]`; array positions are not themselves physical momentum or frequency values.
- The saved shape is \(80\times12\), with complex storage.

Physically, the bubble measures how noninteracting fermions polarize in response to a disturbance carrying momentum \(\mathbf q\) and bosonic Matsubara energy \(i\nu_n\). The RPA denominator resums repeated polarization insertions. Formally, when the geometric expansion converges,

\[
W=V_\kappa+V_\kappa\Pi_0V_\kappa
  +V_\kappa\Pi_0V_\kappa\Pi_0V_\kappa+\cdots .
\]

## Unit and normalization check

**Reconstructed:** Since

\[
[G_0]=\mathrm{eV}^{-1},\qquad
[w_j]=\mathrm{\AA}^{-3},\qquad
[\beta^{-1}]=\mathrm{eV},
\]

the polarization has units

\[
[\Pi_0]
=
\mathrm{eV}\,
\mathrm{\AA}^{-3}\,
\mathrm{eV}^{-2}
=
\mathrm{eV}^{-1}\mathrm{\AA}^{-3}.
\]

The project’s Coulomb convention gives \([V_\kappa]=\mathrm{eV\,\AA^3}\), so \(V_\kappa\Pi_0\) is dimensionless and \(W\) has the same units as \(V_\kappa\).

A crucial implementation consequence is that `k_weights` already includes the \((2\pi)^{-3}\) measure. Do not multiply by another cell volume or another \((2\pi)^{-3}\) unless the new quadrature weights have been deliberately redefined.

## What the present grids mean

For `Nw = 256`, Python evaluates

\[
m=-256,-255,\ldots,254,255,
\]

so there are exactly \(512\) fermionic frequencies—not \(513\). At \(\beta=40\ \mathrm{eV}^{-1}\),

\[
\frac{2\pi}{\beta}=0.15708\ \mathrm{eV},
\qquad
\frac{\pi}{\beta}=0.07854\ \mathrm{eV},
\]

and the retained fermionic frequencies run symmetrically from approximately \(-40.1338\) to \(+40.1338\) eV.

The symmetry is indexed by

\[
m\longmapsto -m-1,
\]

because \(\omega_{-m-1}=-\omega_m\). The endpoints map into one another:

\[
-256\mapsto255,\qquad255\mapsto-256.
\]

Therefore, changing the loop to `range(-Nw, Nw + 1)` would not be a harmless “more symmetric” replacement: the extra \(m=N_w\) point has partner \(-N_w-1\), which would be missing.

The bosonic spacing is also \(0.15708\) eV. If—and only if—the twelve supplied indices are exactly \(0,1,\ldots,11\), their energies run from \(0\) to

\[
\nu_{11}=\frac{22\pi}{40}=1.72788\ \mathrm{eV}.
\]

The configuration says only “12 nonnegative indices,” so the actual list must be inspected rather than assuming it is contiguous.

Also note

\[
\omega_m+\nu_n
=
\frac{(2m+1+2n)\pi}{\beta}
=
\omega_{m+n}.
\]

The current code evaluates that value directly, so no frequency-array bounds are involved. If you precompute Green functions, however, the right-hand propagator needs indices from \(-N_w+n\) through \(N_w-1+n\). It must not be wrapped modulo the table length.

## How to change the grids safely

1. **Changing \(\beta\) changes the physical temperature.** It is not merely a resolution knob. It also changes every Matsubara spacing. To preserve approximately the same high-frequency cutoff while changing \(\beta\), scale \(N_w\) so that \((2N_w-1)\pi/\beta\) remains fixed.

2. **Converge the fermionic cutoff at the largest requested bosonic index.** For nonzero \(n\), the line-exchange/sign partner map is

   \[
   m\longmapsto -m-n-1.
   \]

   On the current set,

   \[
   -N_w\mapsto N_w-n-1,\qquad
   N_w-1\mapsto -N_w-n.
   \]

   The second image lies outside the set whenever \(n>0\). Thus the fixed truncated range is not closed under this partner map for dynamic points, even though it is closed at \(n=0\). This is a finite-cutoff effect, not an error in the infinite formula.

   Safe options are to increase \(N_w\) until every requested \(n\) is stable, or to use an explicitly defined cutoff satisfying both
   \(|\omega_m|\leq\Omega_{\mathrm{cut}}\) and
   \(|\omega_m+\nu_n|\leq\Omega_{\mathrm{cut}}\).
   The latter set is closed under the partner map because it exchanges the absolute energies of the two propagators.

3. **Changing the number of bosonic indices changes the sampled energy range, not the Matsubara spacing.** Keep the entries integer-valued. If negative indices are added, verify the required symmetry numerically instead of silently reconstructing them from positive indices; the assumptions needed for that reconstruction are not stated in the excerpt.

4. **Regenerate momentum points and weights together.** Preserve the integration domain, the \((2\pi)^{-3}\) normalization, symmetry multiplicities, and any ultraviolet or Brillouin-zone boundary treatment. Compare successively refined quadratures at the same physical \(\mathbf q\) and \(n\).

5. **Verify how \(\xi(\mathbf k+\mathbf q)\) handles boundaries.**  
   **Unresolved from the supplied material:** it is not stated whether momentum space is continuum or a Brillouin zone, whether \(\mathbf k+\mathbf q\) must be folded periodically, or whether interpolation is used. That must be established before changing either grid.

6. **Treat the external momentum grid separately from the integration grid.** `q_points` need no integration weights here. Adding or moving them changes only where the response is sampled, but may expose new interpolation or boundary requirements in `xi(k + q)`.

7. **Remove the infrared regulator by convergence, not by interpretation.**  
   **Source — S1, section 4:** \(\kappa_{\mathrm{IR}}\) is numerical, not physical. At the current value, momenta comparable to or below \(0.02\ \mathrm{\AA}^{-1}\) are strongly regulator-dependent. At \(\mathbf q=0\),

   \[
   V_\kappa(0)=\frac{4\pi e^2}{\kappa_{\mathrm{IR}}^2},
   \]

   so simply setting the regulator to zero would produce a singular bare interaction. Use a sequence of decreasing positive values and refine the small-\(q\) grid as necessary. The excerpt does not specify the required order of the \(q\to0\) and \(\kappa_{\mathrm{IR}}\to0\) limits.

8. **Monitor the denominator, not only \(W\).** With \(D=1-V_\kappa\Pi_0\),

   \[
   \delta W \approx \frac{V_\kappa^2}{D^2}\,\delta\Pi_0.
   \]

   Therefore a seemingly small quadrature or cutoff error in \(\Pi_0\) can become a large error in \(W\) when \(D\) is small. Save or inspect \(\Pi_0\), \(D\), and absolute as well as relative changes during convergence studies.

A sensible convergence sequence changes one control at a time: momentum quadrature, fermionic cutoff, infrared regulator, and only then external sampling density. Comparisons must use matching physical \(\mathbf q\) and \(i\nu_n\), not merely matching array indices.

## Does the saved array demonstrate a real-frequency collective mode?

No.

**Source — S1, section 4:** real-frequency claims require analytic continuation and separate validation. `W_matsubara.npy` contains values only at discrete imaginary frequencies \(i\nu_n\).

**Reconstructed:** A real-frequency collective mode would instead be associated with a pole of the retarded interaction

\[
W^R(\mathbf q,\omega)
=
\frac{V(\mathbf q)}
{1-V(\mathbf q)\Pi^R(\mathbf q,\omega)}
\]

or, equivalently, a suitable zero of

\[
\epsilon^R(\mathbf q,\omega)
=
1-V(\mathbf q)\Pi^R(\mathbf q,\omega),
\]

including an analysis of damping and uncertainty. A large Matsubara-axis value or a small discrete Matsubara denominator is not, by itself, proof of such a pole on or near the real-frequency axis.

The saved array alone also lacks cutoff errors, momentum-quadrature errors, regulator extrapolation, analytic-continuation uncertainty, and—unless stored elsewhere—the exact grids and metadata needed to interpret its indices. It is evidence for an imaginary-axis RPA calculation at one finite numerical setup, not evidence by itself for a real-frequency collective excitation.

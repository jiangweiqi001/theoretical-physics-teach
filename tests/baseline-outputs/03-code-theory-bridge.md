Physically, the code computes the finite-temperature, noninteracting density-polarization bubble and then uses RPA to dress the Coulomb interaction.

For each transferred momentum \(q\) and bosonic Matsubara frequency \(i\nu_n\), a fermion at \((k,i\omega_m)\) absorbs that transfer and propagates at \((k+q,i\omega_m+i\nu_n)\). Summing the product of those propagators over internal momentum and frequency gives

\[
\Pi_0(q,i\nu_n)
=-\frac{2}{\beta}\sum_m\int_k
G_0(k,i\omega_m)G_0(k+q,i\omega_m+i\nu_n).
\]

The factor 2 counts spin. The momentum quadrature weights already contain \(d^3k/(2\pi)^3\), so they must not receive another volume or \((2\pi)^{-3}\) factor.

RPA then sums the repeated-bubble series

\[
W=V_\kappa+V_\kappa\Pi_0V_\kappa+\cdots
=\frac{V_\kappa}{1-V_\kappa\Pi_0}.
\]

Thus \(W(q,i\nu_n)\) is the screened interaction on the imaginary-frequency axis. The denominator

\[
\epsilon(q,i\nu_n)=1-V_\kappa(q)\Pi_0(q,i\nu_n)
\]

is the RPA dielectric denominator in the paper’s sign convention.

The present grids mean:

- \(1/\beta=0.025\) eV, corresponding to about \(290\) K.
- There are 512 fermionic frequencies, \(m=-256,\ldots,255\).
- Their largest magnitude is approximately \(511\pi/40=40.1\) eV.
- Bosonic spacing is \(2\pi/\beta=0.1571\) eV.
- With \(n=0,\ldots,11\), the largest bosonic frequency is \(22\pi/40=1.728\) eV.
- The momentum integral uses 4096 weighted points and is evaluated at 80 transferred momenta.

A useful check on the frequency sum is its analytic form:

\[
\Pi_0(q,i\nu_n)
=
2\int_k
\frac{f(\xi_k)-f(\xi_{k+q})}
{\xi_{k+q}-\xi_k-i\nu_n}.
\]

It avoids fermionic-frequency truncation and can serve as an independent implementation check. Near coincident energies, especially for \(q\to0,\nu_n=0\), the ratio should be evaluated using its derivative limit rather than by subtracting nearly equal numbers.

To change grids safely:

- Treat \(\beta\) as a physical parameter, not merely resolution. Increasing \(\beta\) lowers the temperature, reduces the Matsubara spacing, and—at fixed \(N_w\)—also lowers the fermionic cutoff. To preserve a roughly 40 eV cutoff, scale \(N_w\) approximately in proportion to \(\beta\).
- Likewise, at fixed number of bosonic points, increasing \(\beta\) reduces the largest sampled \(\nu_n\). Increase the number of bosonic points if the same energy window is required.
- Converge \(N_w\) using \(\Pi_0\) and the dielectric denominator, not only \(W\). The truncated bubble has a high-frequency tail, and a small error in \(\Pi_0\) is strongly amplified when \(1-V\Pi_0\) is small.
- Keep the fermionic cutoff comfortably above the largest bosonic frequency and all relevant values of \(|\xi_k|\). A hard \(m\)-cutoff is not invariant under the shift \(m\mapsto m+n\), so large \(n\) values become unreliable first.
- Refine the \(k\)-mesh around the Fermi surface and wherever both \(\xi_k\) and \(\xi_{k+q}\) are small. Small-\(q\), low-frequency polarization is particularly sensitive to Fermi-surface resolution.
- Preserve the normalization of `k_weights`. With the stated units, \(\Pi_0\) has units \((\mathrm{eV}\,\AA^3)^{-1}\), \(V\) and \(W\) have units \(\mathrm{eV}\,\AA^3\), and \(V\Pi_0\) is dimensionless.
- Ensure \(k+q\) is handled consistently. In a continuum model it is literal vector addition; in a periodic band model it may require Brillouin-zone wrapping and reliable interpolation of \(\xi_{k+q}\).
- Refine the \(q\)-grid near \(q=0\), near \(q\sim\kappa_{\rm IR}\), and near any expected electronic scale such as \(k_F\). “80 points” is insufficient information without their locations and quadrature convention.
- Do not interpret \(\kappa_{\rm IR}=0.02\,\AA^{-1}\) as physical screening. Repeat calculations at decreasing \(\kappa_{\rm IR}\), with adequate small-\(q\) refinement. The \(q=0\) point requires a carefully defined limiting procedure rather than simply setting \(\kappa_{\rm IR}=0\).
- Check the expected symmetry \(W(q,-i\nu_n)=W(q,i\nu_n)^*\). Under the usual equilibrium symmetries, the result on the imaginary axis should be real and even; an appreciable imaginary residual is a useful numerical-error diagnostic.

Saving `W_matsubara.npy` alone is also poor provenance. At minimum, save the \(q\) and \(\nu_n\) arrays, \(\beta\), \(N_w\), \(\kappa_{\rm IR}\), weights and mesh definition, dispersion/chemical-potential information, units, and preferably \(\Pi_0\) or \(1-V\Pi_0\).

No: saved Matsubara \(W\) alone does not demonstrate a real-frequency collective mode. A real-frequency mode concerns the retarded function

\[
W^R(q,\omega)=
\frac{V(q)}
{1-V(q)\Pi_0^R(q,\omega)},
\]

after analytic continuation \(i\nu_n\to\omega+i0^+\). One must establish a pole or spectral peak, typically a zero of the real dielectric denominator accompanied by sufficiently small damping, nonzero residue, and a stable dispersion across \(q\). Only 12 nonnegative Matsubara points make continuation especially underconstrained.

A very large \(W(q,0)\), or a small Matsubara denominator, can indicate strong screening or proximity to a static RPA instability. It does not by itself establish a propagating, weakly damped real-frequency excitation. That claim requires analytic continuation plus checks against continuation method, grid convergence, the particle-hole continuum, sum rules or Kramers–Kronig consistency, and preferably a separate direct real-axis calculation.

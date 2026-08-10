# Comparing the Two Retarded Propagators

## Short answer

The two formulas have the same free-particle pole structure after shifting the energy origin by the chemical potential,

\[
p^0=\omega+\mu.
\]

However, the supplied excerpts do **not** establish that the interacting propagators are the same physical object, because they assume no relation between \(\Sigma\) and \(\mathcal{\Sigma}\).

---

## 1. Definitions and energy conventions

From S1,

\[
G(\mathbf k,\omega)
=
\frac{1}{
\omega-\xi_{\mathbf k}-\Sigma(\mathbf k,\omega)+i0^+
},
\qquad
\xi_{\mathbf k}=\epsilon_{\mathbf k}-\mu .
\]

Here \(\omega\) is measured relative to \(\mu\), so the Fermi surface is at

\[
\omega=0.
\]

From S2,

\[
\mathcal G(\mathbf p,p^0)
=
\frac{1}{
p^0-E_{\mathbf p}-\mathcal\Sigma(\mathbf p,p^0)+i0^+
}.
\]

Here \(p^0\) is absolute energy, so the Fermi surface is at

\[
p^0=\mu.
\]

The dispersions are identified by the excerpts:

\[
E_{\mathbf p}=\epsilon_{\mathbf k}
\]

when \(\mathbf p\) and \(\mathbf k\) label the same state.

---

## 2. Put both formulas in the same energy variable

Choose

\[
\mathbf p=\mathbf k,
\qquad
p^0=\omega+\mu,
\qquad
E_{\mathbf p}=\epsilon_{\mathbf k}.
\]

Then the S2 propagator becomes

\[
\begin{aligned}
\mathcal G(\mathbf k,\omega+\mu)
&=
\frac{1}{
\omega+\mu-\epsilon_{\mathbf k}
-\mathcal\Sigma(\mathbf k,\omega+\mu)+i0^+
}
\\[4pt]
&=
\frac{1}{
\omega-(\epsilon_{\mathbf k}-\mu)
-\mathcal\Sigma(\mathbf k,\omega+\mu)+i0^+
}
\\[4pt]
&=
\frac{1}{
\omega-\xi_{\mathbf k}
-\mathcal\Sigma(\mathbf k,\omega+\mu)+i0^+
}.
\end{aligned}
\]

Compare this with S1:

\[
G(\mathbf k,\omega)
=
\frac{1}{
\omega-\xi_{\mathbf k}-\Sigma(\mathbf k,\omega)+i0^+
}.
\]

Therefore the frequency-domain propagators would coincide under the energy shift if

\[
\boxed{
\Sigma(\mathbf k,\omega)
=
\mathcal\Sigma(\mathbf k,\omega+\mu)
}
\]

and the momentum labels and underlying one-particle field are otherwise the same. In that case,

\[
\boxed{
G(\mathbf k,\omega)
=
\mathcal G(\mathbf k,\omega+\mu)
}.
\]

S2 explicitly says that no relation between \(\Sigma\) and \(\mathcal\Sigma\) is assumed. Consequently, this equality is a possible identification, not a conclusion licensed by the excerpts.

---

## 3. Time-domain effect of shifting the energy origin

Both sources use the inverse Fourier kernel \(e^{-iEt}\). With \(p^0=\omega+\mu\),

\[
e^{-ip^0t}
=
e^{-i(\omega+\mu)t}
=
e^{-i\mu t}e^{-i\omega t}.
\]

Thus, if the frequency-domain propagators are related as above, their time-domain versions differ by the phase associated with the shifted energy zero:

\[
\mathcal G(\mathbf k,t)
=
e^{-i\mu t}G(\mathbf k,t).
\]

This phase must be included when comparing the two conventions literally in the time domain.

---

## 4. General interacting pole equations

A pole of S1 must satisfy

\[
\boxed{
\omega_{\mathrm{pole}}
-\xi_{\mathbf k}
-\Sigma(\mathbf k,\omega_{\mathrm{pole}})
=0
}.
\]

A pole of S2 must satisfy

\[
\boxed{
p^0_{\mathrm{pole}}
-E_{\mathbf p}
-\mathcal\Sigma(\mathbf p,p^0_{\mathrm{pole}})
=0
}.
\]

Under \(p^0_{\mathrm{pole}}=\omega_{\mathrm{pole}}+\mu\), these equations map into one another only if the self-energies obey the shifted-argument relation above. Without that relation, the excerpts provide no basis for concluding that the interacting pole positions are equal.

---

## 5. Noninteracting poles

Set both self-energies to zero:

\[
\Sigma=0,
\qquad
\mathcal\Sigma=0.
\]

### S1 variables

The free propagator is

\[
G_0(\mathbf k,\omega)
=
\frac{1}{\omega-\xi_{\mathbf k}+i0^+}.
\]

Its pole is

\[
\omega_{\mathrm{pole}}
=
\xi_{\mathbf k}-i0^+
=
\epsilon_{\mathbf k}-\mu-i0^+.
\]

For

\[
\epsilon_{\mathbf k}=\mu+0.20\ \mathrm{eV},
\]

one has

\[
\xi_{\mathbf k}=0.20\ \mathrm{eV},
\]

and therefore

\[
\boxed{
\omega_{\mathrm{pole}}
=
0.20\ \mathrm{eV}-i0^+
}.
\]

Its real-axis location is \(+0.20\ \mathrm{eV}\) relative to the Fermi surface.

### S2 variables

The free propagator is

\[
\mathcal G_0(\mathbf p,p^0)
=
\frac{1}{p^0-E_{\mathbf p}+i0^+}.
\]

Its pole is

\[
p^0_{\mathrm{pole}}
=
E_{\mathbf p}-i0^+.
\]

For

\[
E_{\mathbf p}=\mu+0.20\ \mathrm{eV},
\]

the result is

\[
\boxed{
p^0_{\mathrm{pole}}
=
\mu+0.20\ \mathrm{eV}-i0^+
}.
\]

Relative to the Fermi surface,

\[
p^0_{\mathrm{pole}}-\mu
=
0.20\ \mathrm{eV}-i0^+.
\]

Hence

\[
\boxed{
p^0_{\mathrm{pole}}
=
\omega_{\mathrm{pole}}+\mu
}.
\]

Both free propagators also have unit numerator, so their free-pole residues are \(1\).

---

## Conclusion

The free poles describe the same band energy when expressed relative to the same zero:

\[
\omega_{\mathrm{pole}}=0.20\ \mathrm{eV},
\qquad
p^0_{\mathrm{pole}}=\mu+0.20\ \mathrm{eV}.
\]

Their apparent difference is exactly the chemical-potential offset. For the interacting propagators, however, equality cannot be inferred unless one additionally imposes

\[
\Sigma(\mathbf k,\omega)
=
\mathcal\Sigma(\mathbf k,\omega+\mu).
\]

Thus the sources establish equivalent **free-particle pole conventions**, but not identity of the full interacting physical propagators.

We resume at the first unfinished equation, after accepting the role and order of the convergence factor:

\[
G^R_\eta(k,\omega)
=
-i\int_0^\infty dt\,
e^{[i(\omega-\xi_k)-\eta]t},
\qquad \eta>0.
\]

The source status for this response is:

- **Source ID:** S1
- **Stable version key:** `Unassigned — supplied excerpt; snapshot registration pending`
- **Temporary anchor:** supplied mock excerpt, section 3.1, equations (12)–(14), plus the supplied distributional identity.

## Notation used in the continuation

- \(i\) is the imaginary unit, \(i^2=-1\).
- \(k\) labels the fermionic mode. Its range is not specified in the excerpt.
- \(\varepsilon_k\) is the energy of mode \(k\).
- \(\mu\) is the chemical potential.
- \(\xi_k=\varepsilon_k-\mu\) is the mode energy measured relative to \(\mu\).
- \(t\in\mathbb R\) is time.
- \(\omega\in\mathbb R\) is the forward-Fourier variable.
- \(\eta\in\mathbb R\) is a positive regulator: \(\eta>0\).
- \(\Delta_k\) will abbreviate \(\omega-\xi_k\).
- \(T>0\) will be a finite upper cutoff used before taking the improper-integral limit.
- \(G^R\) is the retarded propagator; the superscript \(R\) means “retarded,” not exponentiation.
- \(A(k,\omega)\) is the spectral function in the source convention
  \[
  A(k,\omega)=-2\,\operatorname{Im}G^R(k,\omega).
  \]
- \(\delta\) is the Dirac delta distribution.

Because \(\xi_k\) is an energy while the exponent contains \(\xi_k t\), the displayed source formulas use units in which \(\hbar=1\), or equivalently treat energies as angular frequencies. Therefore \(\omega\), \(\xi_k\), and \(\eta\) have the same dimensions, and \(\eta t\) is dimensionless. This is an **Inference** from the supplied formulas, not an independently stated source convention.

## 1. Verify convergence for fixed \(\eta>0\)

Define

\[
\Delta_k=\omega-\xi_k.
\]

Then

\[
G^R_\eta(k,\omega)
=
-i\int_0^\infty dt\,e^{(i\Delta_k-\eta)t}.
\]

The modulus of the integrand is

\[
\left|e^{(i\Delta_k-\eta)t}\right|.
\]

Separate the real and imaginary parts of the exponent:

\[
e^{(i\Delta_k-\eta)t}
=
e^{-\eta t}e^{i\Delta_k t}.
\]

For real \(\Delta_k t\),

\[
e^{i\Delta_k t}
=
\cos(\Delta_k t)+i\sin(\Delta_k t).
\]

Its modulus is

\[
\left|e^{i\Delta_k t}\right|
=
\sqrt{\cos^2(\Delta_k t)+\sin^2(\Delta_k t)}
=
\sqrt{1}
=
1.
\]

Therefore

\[
\left|e^{(i\Delta_k-\eta)t}\right|
=
e^{-\eta t}.
\]

Now integrate the modulus:

\[
\int_0^\infty dt\,
\left|e^{(i\Delta_k-\eta)t}\right|
=
\int_0^\infty dt\,e^{-\eta t}.
\]

For finite \(T>0\),

\[
\int_0^T dt\,e^{-\eta t}
=
\left[-\frac{1}{\eta}e^{-\eta t}\right]_{t=0}^{t=T}.
\]

Evaluating both endpoints gives

\[
\int_0^T dt\,e^{-\eta t}
=
-\frac{e^{-\eta T}}{\eta}
-
\left(-\frac{e^0}{\eta}\right).
\]

Since \(e^0=1\),

\[
\int_0^T dt\,e^{-\eta t}
=
\frac{1-e^{-\eta T}}{\eta}.
\]

Because \(\eta>0\),

\[
\lim_{T\to\infty}e^{-\eta T}=0.
\]

Hence

\[
\int_0^\infty dt\,e^{-\eta t}
=
\frac{1}{\eta}<\infty.
\]

Thus the regulated complex integral is absolutely convergent for every fixed \(\eta>0\).

**Provenance:** **Reconstructed** from S1 section 3.1, equations (12)–(13), using the regulator specified at the recorded pause point.

## 2. Evaluate the regulated integral

Keep the upper endpoint finite at first:

\[
G^R_{\eta,T}(k,\omega)
=
-i\int_0^Tdt\,e^{(i\Delta_k-\eta)t}.
\]

Set

\[
c=i\Delta_k-\eta.
\]

Because

\[
\operatorname{Re}c=-\eta<0,
\]

\(c\neq0\). An antiderivative of \(e^{ct}\) is \(e^{ct}/c\), because

\[
\frac{d}{dt}\left(\frac{e^{ct}}{c}\right)
=
\frac{ce^{ct}}{c}
=
e^{ct}.
\]

Therefore

\[
\int_0^Tdt\,e^{ct}
=
\left[\frac{e^{ct}}{c}\right]_{t=0}^{t=T}.
\]

Evaluating the endpoints,

\[
\int_0^Tdt\,e^{ct}
=
\frac{e^{cT}}{c}-\frac{e^{c\cdot0}}{c}.
\]

Since \(e^{c\cdot0}=1\),

\[
\int_0^Tdt\,e^{ct}
=
\frac{e^{cT}-1}{c}.
\]

Restoring \(c=i\Delta_k-\eta\),

\[
\int_0^Tdt\,e^{(i\Delta_k-\eta)t}
=
\frac{e^{(i\Delta_k-\eta)T}-1}
{i\Delta_k-\eta}.
\]

Now consider the exponential in the numerator:

\[
e^{(i\Delta_k-\eta)T}
=
e^{-\eta T}e^{i\Delta_kT}.
\]

Its modulus is

\[
\left|e^{(i\Delta_k-\eta)T}\right|
=
e^{-\eta T}\left|e^{i\Delta_kT}\right|
=
e^{-\eta T}.
\]

Because \(\eta>0\),

\[
\lim_{T\to\infty}
\left|e^{(i\Delta_k-\eta)T}\right|
=
0.
\]

A complex number whose modulus tends to zero tends to zero, so

\[
\lim_{T\to\infty}
e^{(i\Delta_k-\eta)T}
=
0.
\]

Consequently,

\[
\int_0^\infty dt\,e^{(i\Delta_k-\eta)t}
=
\frac{0-1}{i\Delta_k-\eta}.
\]

Thus

\[
\int_0^\infty dt\,e^{(i\Delta_k-\eta)t}
=
-\frac{1}{i\Delta_k-\eta}
=
\frac{1}{\eta-i\Delta_k}.
\]

Multiplying by the prefactor \(-i\),

\[
G^R_\eta(k,\omega)
=
-\frac{i}{\eta-i\Delta_k}.
\]

The denominator can be factored as

\[
\eta-i\Delta_k
=
-i(\Delta_k+i\eta),
\]

because

\[
-i(\Delta_k+i\eta)
=
-i\Delta_k+(-i)(i)\eta
=
-i\Delta_k+\eta
=
\eta-i\Delta_k.
\]

Therefore

\[
G^R_\eta(k,\omega)
=
\frac{-i}{-i(\Delta_k+i\eta)}.
\]

Canceling the nonzero common factor \(-i\),

\[
G^R_\eta(k,\omega)
=
\frac{1}{\Delta_k+i\eta}.
\]

Using \(\Delta_k=\omega-\xi_k\),

\[
\boxed{
G^R_\eta(k,\omega)
=
\frac{1}{\omega-\xi_k+i\eta}
}.
\]

**Provenance:** **Reconstructed** from S1 section 3.1, equations (12)–(13).

## 3. Take the retarded limit only after evaluation

The retarded propagator in frequency space is the distributional boundary value

\[
\boxed{
G^R(k,\omega)
=
\lim_{\eta\to0^+}
\frac{1}{\omega-\xi_k+i\eta}
}
\]

or, in standard shorthand,

\[
\boxed{
G^R(k,\omega)
=
\frac{1}{\omega-\xi_k+i0^+}
}.
\]

The symbol \(i0^+\) records the side from which the real-frequency axis is approached. It must not be discarded before the relevant distributional limit is taken.

To see why setting \(\eta=0\) before evaluating the integral fails, consider

\[
\int_0^Tdt\,e^{i\Delta_k t}.
\]

For \(\Delta_k\neq0\),

\[
\int_0^Tdt\,e^{i\Delta_k t}
=
\left[\frac{e^{i\Delta_k t}}{i\Delta_k}\right]_{0}^{T}
=
\frac{e^{i\Delta_kT}-1}{i\Delta_k}.
\]

Choose the sequence

\[
T_n=\frac{2\pi n}{|\Delta_k|}.
\]

Then

\[
e^{i\Delta_kT_n}
=
e^{i\,\operatorname{sgn}(\Delta_k)\,2\pi n}
=
1,
\]

and hence

\[
\frac{e^{i\Delta_kT_n}-1}{i\Delta_k}
=
0.
\]

Choose instead

\[
T'_n=\frac{2\pi n+\pi}{|\Delta_k|}.
\]

Then

\[
e^{i\Delta_kT'_n}
=
e^{i\,\operatorname{sgn}(\Delta_k)(2\pi n+\pi)}
=
-1,
\]

and therefore

\[
\frac{e^{i\Delta_kT'_n}-1}{i\Delta_k}
=
\frac{-2}{i\Delta_k}
=
\frac{2i}{\Delta_k}.
\]

The two sequences give different values, \(0\) and \(2i/\Delta_k\). Therefore the \(T\to\infty\) limit does not exist as an ordinary improper integral when \(\Delta_k\neq0\).

At \(\Delta_k=0\),

\[
\int_0^Tdt\,e^{i\Delta_k t}
=
\int_0^Tdt
=
T,
\]

and

\[
\lim_{T\to\infty}T=\infty.
\]

Thus the unregulated integral also fails at \(\Delta_k=0\). Keeping \(\eta>0\) until after evaluation is therefore essential.

**Provenance:** **Reconstructed** from the regulated transform and the retarded limiting prescription supplied in the session context.

## 4. Extract the imaginary part

For finite \(\eta>0\),

\[
G^R_\eta(k,\omega)
=
\frac{1}{\Delta_k+i\eta}.
\]

Multiply numerator and denominator by the complex conjugate \(\Delta_k-i\eta\):

\[
G^R_\eta(k,\omega)
=
\frac{1}{\Delta_k+i\eta}
\frac{\Delta_k-i\eta}{\Delta_k-i\eta}.
\]

The denominator becomes

\[
(\Delta_k+i\eta)(\Delta_k-i\eta)
=
\Delta_k^2-i\Delta_k\eta+i\Delta_k\eta-(i\eta)^2.
\]

The middle terms cancel:

\[
-i\Delta_k\eta+i\Delta_k\eta=0.
\]

Since \(i^2=-1\),

\[
-(i\eta)^2
=
-i^2\eta^2
=
\eta^2.
\]

Hence

\[
(\Delta_k+i\eta)(\Delta_k-i\eta)
=
\Delta_k^2+\eta^2.
\]

Therefore

\[
G^R_\eta(k,\omega)
=
\frac{\Delta_k-i\eta}
{\Delta_k^2+\eta^2}.
\]

Separate the real and imaginary terms:

\[
G^R_\eta(k,\omega)
=
\frac{\Delta_k}{\Delta_k^2+\eta^2}
-
i\frac{\eta}{\Delta_k^2+\eta^2}.
\]

Thus

\[
\operatorname{Im}G^R_\eta(k,\omega)
=
-\frac{\eta}{\Delta_k^2+\eta^2}.
\]

Restoring \(\Delta_k=\omega-\xi_k\),

\[
\boxed{
\operatorname{Im}G^R_\eta(k,\omega)
=
-\frac{\eta}
{(\omega-\xi_k)^2+\eta^2}
}.
\]

**Provenance:** **Reconstructed** from the frequency-space propagator derived from S1 section 3.1.

## 5. Derive the spectral function

The source convention is

\[
A(k,\omega)
=
-2\,\operatorname{Im}G^R(k,\omega).
\]

For finite \(\eta>0\),

\[
A_\eta(k,\omega)
=
-2\left[
-\frac{\eta}
{(\omega-\xi_k)^2+\eta^2}
\right].
\]

Multiplying the two minus signs gives a plus sign:

\[
\boxed{
A_\eta(k,\omega)
=
\frac{2\eta}
{(\omega-\xi_k)^2+\eta^2}
}.
\]

Now use the supplied distributional identity

\[
\lim_{\eta\to0^+}
\frac{\eta}{x^2+\eta^2}
=
\pi\delta(x).
\]

Substitute

\[
x=\omega-\xi_k.
\]

Because

\[
\frac{d}{d\omega}(\omega-\xi_k)=1,
\]

the delta-function change of variable produces no additional Jacobian factor. Therefore

\[
\lim_{\eta\to0^+}
\frac{\eta}
{(\omega-\xi_k)^2+\eta^2}
=
\pi\delta(\omega-\xi_k).
\]

Multiplying both sides by \(2\),

\[
\boxed{
A(k,\omega)
=
2\pi\delta(\omega-\xi_k)
}.
\]

**Provenance:** The convention for \(A\) and the delta identity are **Source**, S1 section 3.1, equations (12)–(14) and the supplied identity. The substitution and final result are **Reconstructed** from those premises.

## 6. Interpretation and checks

The result

\[
A(k,\omega)=2\pi\delta(\omega-\xi_k)
\]

says that a free, undamped mode \(k\) has all of its spectral weight at

\[
\omega=\xi_k=\varepsilon_k-\mu.
\]

The finite-\(\eta\) expression is a Lorentzian centered at \(\xi_k\):

\[
A_\eta(k,\omega)
=
\frac{2\eta}{(\omega-\xi_k)^2+\eta^2}.
\]

Here \(\eta\) is a regulator. This derivation does not establish that \(\eta\) is a physical decay rate or interaction-induced linewidth.

### Sign check

At resonance, \(\omega=\xi_k\), so

\[
G^R_\eta(k,\xi_k)
=
\frac{1}{i\eta}
=
-\frac{i}{\eta}.
\]

Therefore

\[
\operatorname{Im}G^R_\eta(k,\xi_k)
=
-\frac{1}{\eta},
\]

and

\[
A_\eta(k,\xi_k)
=
-2\left(-\frac{1}{\eta}\right)
=
\frac{2}{\eta}>0.
\]

The spectral peak is positive under the source convention.

### Normalization check

Compute

\[
\int_{-\infty}^{\infty}\frac{d\omega}{2\pi}
A_\eta(k,\omega).
\]

Substitute the finite-\(\eta\) expression:

\[
\int_{-\infty}^{\infty}\frac{d\omega}{2\pi}
A_\eta(k,\omega)
=
\frac{1}{\pi}
\int_{-\infty}^{\infty}d\omega\,
\frac{\eta}
{(\omega-\xi_k)^2+\eta^2}.
\]

Let

\[
u=\frac{\omega-\xi_k}{\eta}.
\]

Then

\[
\omega-\xi_k=\eta u
\]

and

\[
d\omega=\eta\,du.
\]

Because \(\eta>0\), the limits remain \(-\infty\) and \(+\infty\). Thus

\[
\frac{1}{\pi}
\int_{-\infty}^{\infty}d\omega\,
\frac{\eta}
{(\omega-\xi_k)^2+\eta^2}
=
\frac{1}{\pi}
\int_{-\infty}^{\infty}
\eta\,du\,
\frac{\eta}
{\eta^2u^2+\eta^2}.
\]

Factor \(\eta^2\) from the denominator:

\[
=
\frac{1}{\pi}
\int_{-\infty}^{\infty}
\eta\,du\,
\frac{\eta}
{\eta^2(u^2+1)}.
\]

Cancel \(\eta^2\):

\[
=
\frac{1}{\pi}
\int_{-\infty}^{\infty}
\frac{du}{u^2+1}.
\]

Since

\[
\frac{d}{du}\arctan u
=
\frac{1}{1+u^2},
\]

we obtain

\[
=
\frac{1}{\pi}
\left[\arctan u\right]_{-\infty}^{\infty}.
\]

Using

\[
\lim_{u\to\infty}\arctan u=\frac{\pi}{2},
\qquad
\lim_{u\to-\infty}\arctan u=-\frac{\pi}{2},
\]

the integral is

\[
\frac{1}{\pi}
\left(
\frac{\pi}{2}
-
\left(-\frac{\pi}{2}\right)
\right)
=
\frac{1}{\pi}\pi
=
1.
\]

Therefore

\[
\boxed{
\int_{-\infty}^{\infty}
\frac{d\omega}{2\pi}A_\eta(k,\omega)=1
}.
\]

The limiting delta function has the same normalization:

\[
\int_{-\infty}^{\infty}
\frac{d\omega}{2\pi}
\,2\pi\delta(\omega-\xi_k)
=
1.
\]

### Off-resonance limit

For fixed \(\omega\neq\xi_k\),

\[
(\omega-\xi_k)^2>0.
\]

Hence

\[
\lim_{\eta\to0^+}
\frac{2\eta}
{(\omega-\xi_k)^2+\eta^2}
=
0.
\]

The pointwise value vanishes away from resonance, while the integrated weight stays equal to \(2\pi\). This is why the limit is a delta distribution rather than an ordinary function.

### Pole-sign check

The regulated denominator vanishes when

\[
\omega-\xi_k+i\eta=0.
\]

Solving for \(\omega\),

\[
\omega=\xi_k-i\eta.
\]

Because \(\eta>0\),

\[
\operatorname{Im}\omega=-\eta<0.
\]

Thus the pole lies below the real \(\omega\)-axis. Reversing the prescription to \(-i\eta\) would move it above the real axis and would not be the same retarded boundary prescription.

## Exact Markdown writeback

The continuation above, beginning at “Verify convergence for fixed \(\eta>0\)” and ending with the pole-sign check, is the exact content I would use to replace this line in `lessons/04-retarded-free-propagator.md`:

```markdown
> Session paused here: the learner has not yet accepted or evaluated the regulated integral.
```

Its final lesson boundary would be:

```markdown
## Mastery check and next dependency

- The regulated integral has been evaluated in full:
  $$
  G^R_\eta(k,\omega)=\frac{1}{\omega-\xi_k+i\eta}.
  $$
- The retarded distributional boundary value has been identified:
  $$
  G^R(k,\omega)=\frac{1}{\omega-\xi_k+i0^+}.
  $$
- The spectral function has been derived:
  $$
  A(k,\omega)=2\pi\delta(\omega-\xi_k).
  $$
- The derivation included convergence, order-of-limits, sign, normalization, off-resonance, dimensional, and pole-location checks.
- No unaided reconstruction has yet been elicited after this explanation, so reconstruction mastery is not yet demonstrated.
- Next observable check: starting only from
  $$
  -i\int_0^\infty dt\,e^{[i(\omega-\xi_k)-\eta]t},
  \qquad \eta>0,
  $$
  reconstruct the frequency-space propagator and spectral function without consulting the worked derivation, including the sign of $i\eta$ and the factor $2\pi$.
```

I would atomically replace `CURRENT-STATE.md` with:

```markdown
# Current State

- Snapshot date and session: 2026-08-10 simulated continuation
- Active lesson: `lessons/04-retarded-free-propagator.md`
- Source anchor: S1, stable version key `Unassigned — supplied excerpt; snapshot registration pending`, supplied excerpt section 3.1, equations (12)-(14), plus the supplied distributional identity
- Exact resume point: the worked derivation is complete through
  $$
  G^R(k,\omega)=\frac{1}{\omega-\xi_k+i0^+},
  \qquad
  A(k,\omega)=2\pi\delta(\omega-\xi_k).
  $$
  Resume at the unaided reconstruction check, not at the convergence-factor explanation.
- Last completed intermediate step: checked the sign, normalization, off-resonance limit, dimensions, and lower-half-plane pole location
- First unfinished implication: determine whether the learner can independently reconstruct the regulated integral, the $+i0^+$ prescription, and the factor $2\pi$ in the spectral function
- Current obstacle: no conceptual obstacle is presently reported; the remaining gap is observable reconstruction evidence
- Latest learner statement: self-report that $e^{-\eta t}$ makes the upper limit converge and that $\eta\to0^+$ must be taken after evaluating the integral
- Mastery status: level 0 — reconstruction not yet demonstrated; self-report is not an unaided derivation
- Next action: ask for one unaided derivation from the regulated time integral to both $G^R(k,\omega)$ and $A(k,\omega)$, requiring every endpoint evaluation, sign change, complex conjugation, and distributional substitution
```

The existing `learning-records/2026-08-09.md` should remain unchanged. The new statement is self-report, so it requires a new immutable Evidence record at level 0 rather than a positive mastery advancement. Its exact `EV-xxxxxx` identifier must be allocated from the complete append-only `learning-records/INDEX.md`; that index was not supplied, so inventing an ID here would risk reusing one. The record content after allocation would be:

```markdown
# Learning Record

- Date and session: 2026-08-10 simulated continuation
- Task: resolve the regulator issue and continue the free retarded propagator transform
- Evidence category: self-report
- Work shown without assistance: No observable attempt elicited
- Learner self-report: “I now understand that $e^{-\eta t}$ with $\eta>0$ makes the upper limit converge and that the retarded prescription means taking $\eta\to0^+$ only after the integral is evaluated.”
- Correct elements in self-report: correctly states the convergence role of $e^{-\eta t}$ and the order of the $\eta\to0^+$ limit
- Assistance supplied after the self-report: full evaluation of the regulated integral, extraction of the imaginary part, application of the delta identity, and physical checks
- Response after assistance: not yet received
- Mastery level supported: level 0 — not yet demonstrated / insufficient observable evidence
- Capability not demonstrated: unaided reconstruction of $G^R(k,\omega)$ and $A(k,\omega)$ with all signs and normalization factors
- Remaining gap: reproduce the derivation without consulting the worked solution
- Next observable check: derive
  $$
  G^R(k,\omega)=\frac{1}{\omega-\xi_k+i0^+}
  $$
  and
  $$
  A(k,\omega)=2\pi\delta(\omega-\xi_k)
  $$
  unaided from the regulated time integral
```

This moves the next session boundary past the resolved convergence issue while avoiding an unsupported mastery claim.

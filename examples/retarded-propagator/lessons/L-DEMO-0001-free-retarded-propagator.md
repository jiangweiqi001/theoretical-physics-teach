# Lesson L-DEMO-0001 — Free retarded propagator

## Notation and conventions

> Illustrative demo data — this complete Note demonstrates notation-first teaching, coherent clarification writeback, and exact resume state.

Every symbol used later is defined here in dependency order. Energies and inverse times have the same dimension because the natural-unit convention sets the reduced Planck constant to unity, $\hbar=1$.

| Symbol | Read as | Type and domain | Physical meaning | Units or dimensions | Origin and convention |
| --- | --- | --- | --- | --- | --- |
| $0,1,2,+,-,=,<,>,\to,\int$ | zero, one, two, plus, minus, equals, less than, greater than, tends to, integral | Grouped arithmetic, relation, limit, and integration primitives | Standard mathematical operations used in the definitions and derivation below | Dimensionless operators; operands retain their stated units | Defined here as a dependency-closed mathematical-primitives group |
| $\mathbb{R}$ | the real numbers | Ordered field | Domain for real time, energy, frequency, and regulator variables | Not applicable | Defined here as a mathematical primitive |
| $\mathbb{C}$ | the complex numbers | Field containing $\mathbb{R}$ | Domain for propagators and exponential values | Not applicable | Defined here as a mathematical primitive |
| $i$ | imaginary unit | Element of $\mathbb{C}$ with $i^2=-1$ | Distinguishes oscillatory phase from decay | Dimensionless | Defined here |
| $\hbar$ | h bar | Positive physical constant | Reduced Planck constant relating energy to inverse time | Energy times time | Natural-unit convention sets $\hbar=1$; the bar is part of the constant's standard glyph |
| $t$ | time | Element of $\mathbb{R}$ | Real time difference | Time | Source-local variable from DEMO-SRC-001 |
| $k$ | momentum label | Label in the source's momentum domain | Selects one free-particle mode | Momentum | Source-local variable; boldface is not used in this demo |
| $\varepsilon_k$ | epsilon sub k | Real-valued function of $k$ | Free-particle energy of mode $k$ | Energy | Defined here to make the relative-energy convention explicit |
| $\mu$ | mu | Element of $\mathbb{R}$ | Chemical potential and energy reference | Energy | Defined here |
| $\xi_k$ | xi sub k | Real-valued function of $k$ defined by $\xi_k=\varepsilon_k-\mu$ | Mode energy measured relative to $\mu$ | Energy | Source-local convention; subscript $k$ selects the mode |
| $\omega$ | omega | Element of $\mathbb{R}$ | Fourier frequency conjugate to $t$ | Energy | Source-local Fourier variable |
| $\eta$ | eta | Positive element of $\mathbb{R}$ | Convergence regulator kept positive during integration | Energy | Lesson-local regulator |
| $0^+$ | zero from above | Positive limiting direction in $\mathbb{R}$ | Indicates that $\eta$ approaches zero through positive values | Energy when attached to $\eta$ | Lesson-local limiting notation; superscript $+$ means from above |
| $T$ | capital tee | Positive element of $\mathbb{R}$ | Finite upper time cutoff used before the infinite-time limit | Time | Lesson-local auxiliary variable |
| $z$ | zee | Generic element of $\mathbb{C}$ | Dummy argument of the exponential function | Dimensionless | Defined here as a mathematical primitive |
| $e$ | Euler's number | Positive element of $\mathbb{R}$ | Base of the natural exponential | Dimensionless | Defined here as a mathematical constant |
| $\exp(z)$ | exponential of z | Function from $\mathbb{C}$ to $\mathbb{C}$ | Exponential function, also written as $e^z$ | Dimensionless output | Defined here; $e$ is the conventional exponential base |
| $\theta(t)$ | theta of t | Function from $\mathbb{R}$ to $\mathbb{R}$ | Step function equal to zero for $t<0$ and one for $t>0$; its value at zero does not affect this integral | Dimensionless | Source-local causal-support convention |
| $dt$ | dee t | Integration measure associated with $t$ | Infinitesimal time measure | Time | Source-local integration measure |
| $\infty$ | infinity | Extended endpoint, not a finite real number | Denotes an unbounded integration limit | Not applicable | Mathematical primitive |
| $q$ | cue | Element of $\mathbb{C}$ defined by $q=i(\omega-\xi_k)-\eta$ | Combines oscillation and decay in the regulated integrand | Energy | Lesson-local abbreviation |
| $\operatorname{Re}(q)$ | real part of q | Real-valued function of $q$ | Real part controlling exponential growth or decay | Energy | Mathematical primitive applied to $q$ |
| $G_0^R(k,t)$ | G zero R of k and t | Complex-valued two-point propagator | Free retarded propagator in time | Dimensionless in this convention | DEMO-SRC-001; subscript $0$ means free and superscript $R$ means retarded |
| $G_{0,\eta}^R(k,\omega)$ | regulated G zero R of k and omega | Complex-valued frequency-space propagator | Fourier transform before removing $\eta$ | Inverse energy | Lesson-local regulated form; subscript $\eta$ records the regulator |
| $G_0^R(k,\omega)$ | G zero R of k and omega | Complex-valued frequency-space propagator | Retarded free propagator after $\eta$ approaches $0^+$ | Inverse energy | Reconstructed from DEMO-SRC-001 with the source convention |

## Mission connection and prerequisites

This lesson advances the first mission capability in [[MISSION]]: connect causal support in time to the regulated frequency denominator. The only prerequisite tested here is the meaning of the step function, recorded in [[learning-records/EV-DEMO-0001]].

## Exact source anchors and provenance

| Claim | Provenance | Anchor |
| --- | --- | --- |
| Time-domain free retarded propagator | Source | [[sources/DEMO-SRC-001#Source equation]] |
| Positive-time range reduction | Reconstructed | Source equation plus the stated support of $\theta(t)$ |
| Regulated denominator | Reconstructed | Complete derivation below |

## Physical question

Why does the full Fourier integral reduce to nonnegative time, and how does the positive regulator determine the retarded denominator?

## Complete derivation

### Starting point

The supplied illustrative source gives

$$
G_0^R(k,t)=-i\theta(t)\exp(-i\xi_k t).
$$

Insert it into the regulated Fourier transform:

$$
G_{0,\eta}^R(k,\omega)
=
\int_{-\infty}^{\infty}dt\,
\exp(i\omega t)G_0^R(k,t)\exp(-\eta t).
$$

### Why the range becomes positive time

The step function is zero at every negative $t$. Therefore the complete integrand is zero on the negative-time part of the original domain. Splitting the original integral at zero makes the logical step explicit: the negative-time integral vanishes, while the positive-time integral remains.

This is the first dependent point at which the learner's reported gap must be explained. The incoming transition now states the support property, and the outgoing transition carries that property directly into the regulated exponential rather than appending a detached remark later.

$$
\begin{aligned}
G_{0,\eta}^R(k,\omega)
&=
-i\int_{-\infty}^{0}dt\,\theta(t)\exp([i(\omega-\xi_k)-\eta]t)
-i\int_{0}^{\infty}dt\,\theta(t)\exp([i(\omega-\xi_k)-\eta]t)\\
&=
0-i\int_{0}^{\infty}dt\,\exp([i(\omega-\xi_k)-\eta]t)\\
&=
-i\int_{0}^{\infty}dt\,\exp(qt).
\end{aligned}
$$

^resume-regulated-integral

The equality is justified by support, not by the regulator. The regulator controls convergence at large positive time; it does not create retarded support.

### Evaluating the regulated integral

Keep the upper limit finite first. Because $q$ is independent of $t$,

$$
\int_0^T dt\,\exp(qt)
=
\frac{\exp(qT)-1}{q}.
$$

Since $\operatorname{Re}(q)=-\eta<0$, the factor $\exp(qT)$ decays to zero as $T$ increases without bound. Only after that limit is taken do we obtain

$$
\int_0^{\infty}dt\,\exp(qt)=-\frac{1}{q}.
$$

Substitution gives

$$
\begin{aligned}
G_{0,\eta}^R(k,\omega)
&=(-i)\left(-\frac{1}{q}\right)\\
&=\frac{i}{i(\omega-\xi_k)-\eta}\\
&=\frac{1}{\omega-\xi_k+i\eta}.
\end{aligned}
$$

Finally, after the time integration and infinite-time limit are complete, let $\eta$ approach $0^+$:

$$
G_0^R(k,\omega)=\frac{1}{\omega-\xi_k+i0^+}.
$$

## Physical interpretation and checks

The denominator becomes small near the free-particle energy $\omega=\xi_k$, so the propagator becomes large and develops its free-particle pole. The positive infinitesimal records the retarded boundary condition inherited from positive-time support.

- Units: the denominator has energy units, so $G_0^R(k,\omega)$ has inverse-energy units.
- Sign: positive $\eta$ makes $\operatorname{Re}(q)$ negative, so the large-time exponential decays.
- Causal limit: changing the support prescription would change the infinitesimal boundary prescription.
- Claim boundary: the option response in the evidence record shows recognition of $\theta(t)$, not unaided reconstruction of the integral.

## Mastery check and next dependency

The exact resume state is stored in [[CURRENT-STATE]]. The next dependency is the finite-cutoff evaluation and the order of limits. No code section is present because implementation is not a mission target.

## End-of-Note checkpoint

For the regulated integrand above, which condition makes the exponential decay when $T$ becomes arbitrarily large?

- A. $\eta<0$
- B. $\xi_k=0$
- C. $\eta>0$
- D. $\omega=0$

Choose one option. The answer is intentionally withheld; an option answer locates the sign convention but does not by itself establish that the integral can be reconstructed.

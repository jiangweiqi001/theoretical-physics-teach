Provisional response-only artifact; no canonical write performed.

## Notation and conventions

The identifiers below are deliberately inert. Each `{{NOTATION_ID_PENDING}}` must be replaced by a distinct identifier only after the complete canonical notation index has been read.

- `{{NOTATION_ID_PENDING}}` — Mathematical primitives: $0$, $1$, $2$, and $-1$ are dimensionless integers; $\mathbb N$ is the set of positive integers; $\mathbb R$ and $\mathbb C$ are the sets of real and complex numbers; $\in$ means set membership; $i\in\mathbb C$ is the imaginary unit satisfying $i^2=-1$; $\pi$ is the dimensionless circle constant; $e^{(\cdot)}$ is the complex exponential; $|\cdot|$ is absolute value on $\mathbb R$ and modulus on $\mathbb C$; $\operatorname{Re}$ and $\operatorname{Im}$ return the real and imaginary parts of a complex number; $\lim$ denotes a limit; $\infty$ denotes an unbounded endpoint; $=$, $\ne$, $>$, $<$, $+$, $-$, $\pm$, multiplication, division, and integer powers have their usual algebraic meanings; $0^+$ means approaching zero through positive real values.
- `{{NOTATION_ID_PENDING}}` — $k$ is the free-fermion mode label. Its exact index set is not stated in the supplied excerpt.
- `{{NOTATION_ID_PENDING}}` — $t\in\mathbb R$ is time.
- `{{NOTATION_ID_PENDING}}` — $\varepsilon_k$ is the energy of mode $k$ and $\mu$ is the chemical potential. Under the source’s exponential convention, both have inverse-time dimensions.
- `{{NOTATION_ID_PENDING}}` — $\xi_k=\varepsilon_k-\mu$ is the mode energy measured relative to the chemical potential; the subscript $k$ identifies the mode.
- `{{NOTATION_ID_PENDING}}` — $\omega\in\mathbb R$ is the forward-Fourier frequency and has inverse-time dimensions.
- `{{NOTATION_ID_PENDING}}` — $\int$, $d t$, $d\omega$, and $\frac{d}{d t}$ denote integration, the time and frequency differentials, and differentiation with respect to the already defined variable $t$; their dimensions follow from the already defined $t$ and $\omega$.
- `{{NOTATION_ID_PENDING}}` — $\theta(t)$ is the Heaviside step function: it vanishes for negative time and equals one for positive time. Its value at zero does not affect the integral below.
- `{{NOTATION_ID_PENDING}}` — $G^R(k,t)$ and $G^R(k,\omega)$ are the time- and frequency-domain retarded propagators. The superscript $R$ means “retarded.”
- `{{NOTATION_ID_PENDING}}` — $\eta\in\mathbb R$ with $\eta>0$ is the convergence regulator. It has inverse-time dimensions so that $\eta t$ is dimensionless.
- `{{NOTATION_ID_PENDING}}` — $T\in\mathbb R$ with $T>0$ is a finite upper integration bound.
- `{{NOTATION_ID_PENDING}}` — $\Delta_k=\omega-\xi_k$ is the real frequency displacement from the mode energy and has inverse-time dimensions.
- `{{NOTATION_ID_PENDING}}` — $\alpha=i\Delta_k-\eta\in\mathbb C$ is the regulated exponential coefficient and has inverse-time dimensions.
- `{{NOTATION_ID_PENDING}}` — $n\in\mathbb N$ labels two sequences of upper bounds, $T_n=2\pi n/|\Delta_k|$ and $S_n=(2\pi n+\pi)/|\Delta_k|$, used only when $\Delta_k\ne0$.
- `{{NOTATION_ID_PENDING}}` — $G_\eta^R$ is the regulated retarded propagator. The subscript $\eta$ means that $e^{-\eta t}$ has been inserted before the Fourier integral is evaluated.
- `{{NOTATION_ID_PENDING}}` — $i0^+$ in a denominator denotes the boundary value obtained from $i\eta$ after the regulated expression has been evaluated and then $\eta\to0^+$ is taken.
- `{{NOTATION_ID_PENDING}}` — $x\in\mathbb R$ is a temporary variable that will be set equal to $\Delta_k$.
- `{{NOTATION_ID_PENDING}}` — $\delta(x)$ is the Dirac delta distribution. Its defining normalization is that integrating it over an interval containing $x=0$ gives one. Its dimensions are the reciprocal of the dimensions of its argument.
- `{{NOTATION_ID_PENDING}}` — $A(k,\omega)$ is the spectral function defined by the source convention $A(k,\omega)=-2\operatorname{Im}G^R(k,\omega)$.
- `{{NOTATION_ID_PENDING}}` — $A_\eta(k,\omega)=-2\operatorname{Im}G_\eta^R(k,\omega)$ is the regulated spectral function.

Temporary provenance anchor P1: `Unassigned — supplied excerpt; snapshot registration pending`. Visible locator: mock source excerpt carrying the display label “S1,” *Condensed Matter Lecture Notes*, section 3.1, equations (12)–(14), including the displayed delta-distribution identity. The label “S1” is not treated here as a newly verified canonical Source ID.

## Resume at the regulated integral

You have already accepted why $\eta>0$ is inserted and why its limit must be taken last. We therefore resume at the first unfinished operation: evaluating

$$
G_\eta^R(k,\omega)
=
-i\int_0^\infty d t\,
e^{[i(\omega-\xi_k)-\eta]t}.
$$

**Reconstructed from P1 and the recorded pause point.**

Introduce

$$
\Delta_k=\omega-\xi_k,
$$

so that

$$
G_\eta^R(k,\omega)
=
-i\int_0^\infty d t\,e^{(i\Delta_k-\eta)t}.
$$

Now define

$$
\alpha=i\Delta_k-\eta.
$$

Because $\Delta_k$ and $\eta$ are real,

$$
\operatorname{Re}\alpha
=
\operatorname{Re}(i\Delta_k-\eta)
=
0-\eta
=
-\eta.
$$

Since $\eta>0$,

$$
-\eta<0.
$$

Therefore,

$$
\operatorname{Re}\alpha<0.
$$

In particular, $\alpha\ne0$: if $\alpha$ were zero, its real part would be zero, contradicting $\operatorname{Re}\alpha=-\eta<0$.

### Evaluate at a finite upper bound

**Reconstructed from P1. Identity used: differentiation of the complex exponential and the fundamental theorem of calculus.**

For finite $T>0$,

$$
\int_0^T d t\,e^{\alpha t}
=
\frac{e^{\alpha T}}{\alpha}
-
\frac{e^{\alpha 0}}{\alpha}.
$$

Since $\alpha 0=0$ and $e^0=1$,

$$
\int_0^T d t\,e^{\alpha t}
=
\frac{e^{\alpha T}}{\alpha}
-
\frac{1}{\alpha}
=
\frac{e^{\alpha T}-1}{\alpha}.
$$

The antiderivative is valid because

$$
\frac{d}{d t}\left(\frac{e^{\alpha t}}{\alpha}\right)
=
\frac{\alpha e^{\alpha t}}{\alpha}
=
e^{\alpha t}.
$$

Now evaluate the upper-limit term. Its modulus is

$$
|e^{\alpha T}|
=
e^{\operatorname{Re}(\alpha T)}.
$$

Because $T$ is real,

$$
\operatorname{Re}(\alpha T)
=
T\operatorname{Re}\alpha
=
T(-\eta)
=
-\eta T.
$$

Hence

$$
|e^{\alpha T}|
=
e^{-\eta T}.
$$

For fixed $\eta>0$,

$$
\lim_{T\to\infty}e^{-\eta T}=0.
$$

A complex number tends to zero when its modulus tends to zero, so

$$
\lim_{T\to\infty}e^{\alpha T}=0.
$$

Consequently,

$$
\int_0^\infty d t\,e^{\alpha t}
=
\lim_{T\to\infty}\frac{e^{\alpha T}-1}{\alpha}
=
\frac{0-1}{\alpha}
=
-\frac{1}{\alpha}.
$$

Substituting $\alpha=i\Delta_k-\eta$ gives

$$
-\frac{1}{\alpha}
=
-\frac{1}{i\Delta_k-\eta}
=
\frac{1}{\eta-i\Delta_k}.
$$

Multiplication by the prefactor $-i$ gives

$$
G_\eta^R(k,\omega)
=
-\frac{i}{\eta-i\Delta_k}.
$$

The denominator can be rewritten step by step:

$$
-i(\Delta_k+i\eta)
=
-i\Delta_k+(-i)(i\eta).
$$

Using $i^2=-1$,

$$
(-i)(i\eta)
=
-i^2\eta
=
-(-1)\eta
=
\eta.
$$

Therefore,

$$
-i(\Delta_k+i\eta)
=
\eta-i\Delta_k.
$$

Substituting this equality into the propagator gives

$$
G_\eta^R(k,\omega)
=
\frac{-i}{-i(\Delta_k+i\eta)}
=
\frac{1}{\Delta_k+i\eta}.
$$

Finally, restoring $\Delta_k=\omega-\xi_k$,

$$
\boxed{
G_\eta^R(k,\omega)
=
\frac{1}{\omega-\xi_k+i\eta}
}.
$$

The sign is therefore $+i\eta$, not $-i\eta$.

### Why taking the limit last is mathematically necessary

**Reconstructed from P1.**

If $\eta$ were set to zero before evaluating the improper integral, then for $\Delta_k=0$,

$$
\int_0^T d t\,e^{i\Delta_k t}
=
\int_0^T d t
=
T,
$$

and

$$
\lim_{T\to\infty}T=\infty.
$$

Thus the integral would not converge.

For $\Delta_k\ne0$,

$$
\int_0^T d t\,e^{i\Delta_k t}
=
\frac{e^{i\Delta_k T}-1}{i\Delta_k}.
$$

At

$$
T_n=\frac{2\pi n}{|\Delta_k|},
$$

we have

$$
e^{i\Delta_kT_n}
=
e^{i2\pi n\Delta_k/|\Delta_k|}
=
1,
$$

because $\Delta_k/|\Delta_k|$ is either $1$ or $-1$. Hence

$$
\int_0^{T_n}d t\,e^{i\Delta_k t}
=
\frac{1-1}{i\Delta_k}
=
0.
$$

At

$$
S_n=\frac{2\pi n+\pi}{|\Delta_k|},
$$

we have

$$
e^{i\Delta_kS_n}
=
e^{i(2\pi n+\pi)\Delta_k/|\Delta_k|}
=
-1.
$$

Hence

$$
\int_0^{S_n}d t\,e^{i\Delta_k t}
=
\frac{-1-1}{i\Delta_k}
=
-\frac{2}{i\Delta_k}.
$$

Both $T_n$ and $S_n$ tend to infinity, but the corresponding integral values tend to two different values, $0$ and $-2/(i\Delta_k)$. Therefore the unregulated improper integral has no ordinary limit.

For each fixed time, however,

$$
\lim_{\eta\to0^+}e^{-\eta t}
=
e^0
=
1.
$$

Thus removing the regulator after the transform returns the original time-domain factor. The frequency-space retarded propagator is defined as the boundary value

$$
\boxed{
G^R(k,\omega)
=
\lim_{\eta\to0^+}
\frac{1}{\omega-\xi_k+i\eta}
=
\frac{1}{\omega-\xi_k+i0^+}
}.
$$

This is a distributional limit at $\omega=\xi_k$, not an ordinary pointwise value there.

### Derive the spectral function

**Source at P1:** the convention is

$$
A(k,\omega)
=
-2\operatorname{Im}G^R(k,\omega),
$$

and the supplied identity is

$$
\lim_{\eta\to0^+}
\frac{\eta}{x^2+\eta^2}
=
\pi\delta(x).
$$

**Reconstructed from those Source premises.**

Set

$$
x=\omega-\xi_k.
$$

At finite $\eta>0$,

$$
G_\eta^R(k,\omega)
=
\frac{1}{x+i\eta}.
$$

Multiply numerator and denominator by $x-i\eta$:

$$
\frac{1}{x+i\eta}
=
\frac{x-i\eta}{(x+i\eta)(x-i\eta)}.
$$

Expand the denominator:

$$
(x+i\eta)(x-i\eta)
=
x^2-ix\eta+ix\eta-i^2\eta^2.
$$

The middle terms cancel:

$$
-ix\eta+ix\eta=0.
$$

Using $i^2=-1$,

$$
-i^2\eta^2
=
-(-1)\eta^2
=
\eta^2.
$$

Therefore,

$$
G_\eta^R(k,\omega)
=
\frac{x-i\eta}{x^2+\eta^2}
=
\frac{x}{x^2+\eta^2}
-
i\frac{\eta}{x^2+\eta^2}.
$$

The imaginary part is consequently

$$
\operatorname{Im}G_\eta^R(k,\omega)
=
-\frac{\eta}{x^2+\eta^2}.
$$

The regulated spectral function is

$$
A_\eta(k,\omega)
=
-2\operatorname{Im}G_\eta^R(k,\omega).
$$

Substituting the imaginary part gives

$$
A_\eta(k,\omega)
=
-2\left(
-\frac{\eta}{x^2+\eta^2}
\right)
=
\frac{2\eta}{x^2+\eta^2}.
$$

Now take the distributional limit:

$$
A(k,\omega)
=
\lim_{\eta\to0^+}
\frac{2\eta}{x^2+\eta^2}.
$$

Pulling out the constant factor $2$ gives

$$
A(k,\omega)
=
2\lim_{\eta\to0^+}
\frac{\eta}{x^2+\eta^2}.
$$

Applying the supplied identity gives

$$
A(k,\omega)
=
2\pi\delta(x).
$$

Since $x=\omega-\xi_k$,

$$
\boxed{
A(k,\omega)
=
2\pi\delta(\omega-\xi_k)
}.
$$

No additional Jacobian factor appears because the coefficient of $\omega$ in $x=\omega-\xi_k$ is $1$.

**Inference from the reconstructed result at P1:** the free mode has spectral weight only at $\omega=\xi_k$. The sign is consistent: the imaginary part of the retarded propagator is negative, while the source convention multiplies it by $-2$, producing a nonnegative spectral distribution.

**Dimensional check reconstructed from P1:** the source’s exponent requires $\omega t$, $\xi_k t$, and $\eta t$ to be dimensionless. Thus $\omega$, $\xi_k$, and $\eta$ have inverse-time dimensions. The denominator of $G^R(k,\omega)$ has inverse-time dimensions, so $G^R(k,\omega)$ has time dimensions. The distribution $\delta(\omega-\xi_k)$ also has time dimensions, so both sides of the spectral-function result have matching dimensions.

## Exact provisional Markdown updates

The blocks below are inert would-be patches. They do not allocate IDs, create live links, or imply that any file changed.

### `lessons/04-retarded-free-propagator.md`

First, insert the definitions from this response’s `## Notation and conventions` section into the existing leading notation section. Each repeated `{{NOTATION_ID_PENDING}}` must receive a distinct allocator-produced ID before a canonical write.

Then replace the paused block with:

```markdown
## Regulated integral: completed

Temporary provenance anchor P1: `Unassigned — supplied excerpt; snapshot registration pending`. Visible locator: mock source excerpt carrying the display label “S1,” *Condensed Matter Lecture Notes*, section 3.1, equations (12)–(14), including the displayed delta-distribution identity.

Let
$$
\Delta_k=\omega-\xi_k,
\qquad
\alpha=i\Delta_k-\eta.
$$

For finite $T>0$,
$$
\int_0^T d t\,e^{\alpha t}
=
\frac{e^{\alpha T}-1}{\alpha}.
$$

Because
$$
\operatorname{Re}\alpha=-\eta<0,
$$
we have
$$
|e^{\alpha T}|=e^{-\eta T}\longrightarrow0
\qquad
(T\to\infty).
$$

Therefore,
$$
\int_0^\infty d t\,e^{\alpha t}
=
-\frac{1}{\alpha}
=
\frac{1}{\eta-i\Delta_k}.
$$

Multiplying by $-i$ and using
$$
\eta-i\Delta_k=-i(\Delta_k+i\eta)
$$
gives
$$
G_\eta^R(k,\omega)
=
\frac{1}{\Delta_k+i\eta}
=
\frac{1}{\omega-\xi_k+i\eta}.
$$

The limit must be taken after this evaluation. If $\eta=0$ is imposed first, the finite-bound integral is
$$
\int_0^T d t\,e^{i\Delta_k t}
=
\frac{e^{i\Delta_kT}-1}{i\Delta_k}
$$
for $\Delta_k\ne0$, and its values along
$$
T_n=\frac{2\pi n}{|\Delta_k|}
\quad\text{and}\quad
S_n=\frac{2\pi n+\pi}{|\Delta_k|}
$$
are respectively
$$
0
\quad\text{and}\quad
-\frac{2}{i\Delta_k}.
$$
The improper integral therefore has no ordinary limit. For $\Delta_k=0$, it equals $T$ and diverges.

The retarded boundary value is
$$
G^R(k,\omega)
=
\lim_{\eta\to0^+}
\frac{1}{\omega-\xi_k+i\eta}
=
\frac{1}{\omega-\xi_k+i0^+}.
$$

For $x=\omega-\xi_k$,
$$
\frac{1}{x+i\eta}
=
\frac{x-i\eta}{x^2+\eta^2},
$$
so
$$
\operatorname{Im}G_\eta^R(k,\omega)
=
-\frac{\eta}{x^2+\eta^2}.
$$

Using the source convention and supplied distributional identity,
$$
A_\eta(k,\omega)
=
-2\operatorname{Im}G_\eta^R(k,\omega)
=
\frac{2\eta}{x^2+\eta^2},
$$
and hence
$$
A(k,\omega)
=
2\pi\delta(x)
=
2\pi\delta(\omega-\xi_k).
$$

## Mastery check

Without looking back at the derivation, start from
$$
-i\int_0^\infty d t\,e^{[i(\omega-\xi_k)-\eta]t},
\qquad
\eta>0,
$$
and reproduce every step leading first to
$$
G^R(k,\omega)=\frac{1}{\omega-\xi_k+i0^+}
$$
and then to
$$
A(k,\omega)=2\pi\delta(\omega-\xi_k).
$$
Your response must include the finite upper bound, the disappearance of its endpoint term, and the sign of the imaginary part.
```

### `learning-records/2026-08-09.md`

Make no change. It remains the historical record that the learner unaided used $\theta(t)$ to change the integration range but stopped before evaluating the complex exponential integral.

### `learning-records/INDEX.md`

Append an inert pending row; do not infer the next ID:

```markdown
| `{{EVIDENCE_ID_PENDING}}` | 2026-08-10 | Self-report about regulator and order of limits; no observable derivation attempt elicited before assistance | level 0 - not yet demonstrated / insufficient evidence |
```

### `learning-records/{{EVIDENCE_ID_PENDING}}.md`

The path and identifier remain inert until the complete index has been read:

```markdown
# Evidence `{{EVIDENCE_ID_PENDING}}`

- Date: 2026-08-10
- Evidence category: self-report
- Source anchor: `Unassigned — supplied excerpt; snapshot registration pending`
- Visible locator: mock source excerpt carrying the display label “S1,” *Condensed Matter Lecture Notes*, section 3.1, equations (12)–(14), including the displayed delta-distribution identity
- Learner self-report, verbatim: “I now understand that $e^{-\eta t}$ with $\eta>0$ makes the upper limit converge and that the retarded prescription means taking $\eta\to0^+$ only after the integral is evaluated.”
- Unaided response on 2026-08-10: `No observable attempt elicited`
- Prior unaided evidence, 2026-08-09: the learner used $\theta(t)$ to replace the full time range by the positive-time range, then stopped before evaluating the regulated integral
- Assistance supplied after the 2026-08-10 self-report: complete finite-bound evaluation, sign conversion to $+i\eta$, proof that the unregulated improper integral lacks an ordinary limit, and derivation of the spectral function
- Judgment: level 0 - not yet demonstrated / insufficient evidence
- Interpretation demonstrated: self-reported understanding of the regulator and order of limits; this is planning context, not an evidence-gated mastery result
- Reconstruction demonstrated: not yet demonstrated
- Remaining gap: unaided reconstruction from the regulated time integral to $G^R(k,\omega)$ and $A(k,\omega)$
- State change caused by this evidence: the earlier conceptual objection is no longer self-reported, but no Mission target, Roadmap phase, Concept Node, or Review is marked complete
- Next evidence opportunity: the mastery check in the active lesson
```

### `CURRENT-STATE.md`

Atomically replace its contents with:

```markdown
# Current State

- Active lesson: `lessons/04-retarded-free-propagator.md`
- Source anchor: `Unassigned — supplied excerpt; snapshot registration pending`
- Visible source locator: mock source excerpt carrying the display label “S1,” *Condensed Matter Lecture Notes*, section 3.1, equations (12)–(14), including the displayed delta-distribution identity
- Exact stop point: assisted derivation completed through $G^R(k,\omega)=1/(\omega-\xi_k+i0^+)$ and $A(k,\omega)=2\pi\delta(\omega-\xi_k)$
- Last completed intermediate step: the imaginary part was evaluated as $-\eta/[(\omega-\xi_k)^2+\eta^2]$, and the supplied delta identity was applied
- First unfinished implication: the learner has not yet reconstructed the regulated integral, the $+i\eta$ sign, and the spectral function unaided
- Current obstacle: observable reconstruction evidence is missing; this is distinct from the learner’s resolved self-reported concern about why the regulator is legitimate
- Latest evidence: `{{EVIDENCE_ID_PENDING}}` — inert placeholder, no live link
- Preserved prior evidence: the 2026-08-09 record shows unaided use of $\theta(t)$ followed by a stop before integral evaluation
- Next action: ask the learner to complete the single unaided mastery check at the end of the active lesson
```

Canonical writeback is not complete.

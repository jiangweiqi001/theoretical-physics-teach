We resume at the first unfinished operation: evaluating the regulated integral. We do not revisit whether the regulator is legitimate.

Let

\[
x\equiv \omega-\xi_k .
\]

Here \(x\) is real because the source treats \(\omega\), \(\varepsilon_k\), and \(\mu\) as real, with \(\xi_k=\varepsilon_k-\mu\). The regulator satisfies \(\eta>0\).

The regulated transform is

\[
G^R_\eta(k,\omega)
=
-i\int_0^\infty dt\,e^{(ix-\eta)t}.
\]

This is reconstructed from S1, section 3.1, equations (12)–(13), after inserting the stated regulator.

### 1. Evaluate the regulated integral

Introduce a finite upper bound \(R>0\):

\[
G^R_\eta(k,\omega;R)
=
-i\int_0^R dt\,e^{(ix-\eta)t}.
\]

Define

\[
a\equiv ix-\eta.
\]

Because \(\eta>0\),

\[
a\neq 0.
\]

The derivative

\[
\frac{d}{dt}\left(\frac{e^{at}}{a}\right)
=
\frac{a e^{at}}{a}
=
e^{at}
\]

shows that

\[
\int e^{at}\,dt=\frac{e^{at}}{a}.
\]

Therefore,

\[
\begin{aligned}
G^R_\eta(k,\omega;R)
&=
-i\left[\frac{e^{at}}{a}\right]_{t=0}^{t=R}
\\
&=
-i\left(
\frac{e^{aR}}{a}
-
\frac{e^{a\cdot0}}{a}
\right)
\\
&=
-i\left(
\frac{e^{aR}}{a}
-
\frac{1}{a}
\right)
\\
&=
-i\frac{e^{aR}-1}{a}.
\end{aligned}
\]

Now evaluate the upper-bound limit. Since \(a=ix-\eta\),

\[
e^{aR}
=
e^{(ix-\eta)R}
=
e^{ixR}e^{-\eta R}.
\]

The oscillating factor has modulus

\[
|e^{ixR}|
=
|\cos(xR)+i\sin(xR)|
=
\sqrt{\cos^2(xR)+\sin^2(xR)}
=
1.
\]

Consequently,

\[
|e^{aR}|
=
|e^{ixR}|\,e^{-\eta R}
=
e^{-\eta R}.
\]

Since \(\eta>0\),

\[
\lim_{R\to\infty}e^{-\eta R}=0.
\]

Hence

\[
\lim_{R\to\infty}e^{aR}=0.
\]

Taking the limit only now gives

\[
\begin{aligned}
G^R_\eta(k,\omega)
&=
\lim_{R\to\infty}G^R_\eta(k,\omega;R)
\\
&=
-i\frac{0-1}{a}
\\
&=
\frac{i}{a}
\\
&=
\frac{i}{ix-\eta}.
\end{aligned}
\]

To put the denominator into the standard retarded form, note that

\[
i(x+i\eta)
=
ix+i^2\eta
=
ix-\eta.
\]

Therefore,

\[
\begin{aligned}
G^R_\eta(k,\omega)
&=
\frac{i}{i(x+i\eta)}
\\
&=
\frac{1}{x+i\eta}
\\
&=
\frac{1}{\omega-\xi_k+i\eta}.
\end{aligned}
\]

Thus the regulated result is

\[
\boxed{
G^R_\eta(k,\omega)
=
\frac{1}{\omega-\xi_k+i\eta}
},
\qquad \eta>0.
\]

This is a **Reconstructed** result from S1, section 3.1, equations (12)–(13).

### 2. Take the retarded limit

The retarded propagator is the distributional limit

\[
\begin{aligned}
G^R(k,\omega)
&=
\lim_{\eta\to0^+}G^R_\eta(k,\omega)
\\
&=
\lim_{\eta\to0^+}
\frac{1}{\omega-\xi_k+i\eta}.
\end{aligned}
\]

The standard shorthand for this limit is

\[
\boxed{
G^R(k,\omega)
=
\frac{1}{\omega-\xi_k+i0^+}
}.
\]

The symbol \(i0^+\) is not an ordinary nonzero number. It records the family of functions with \(\eta>0\) and the instruction to take the limit only after integration or after pairing with a test function.

If \(\eta\) were set to zero before evaluating the improper integral, then for \(x\neq0\),

\[
\int_0^R e^{ixt}\,dt
=
\left[\frac{e^{ixt}}{ix}\right]_0^R
=
\frac{e^{ixR}-1}{ix}.
\]

Consider the sequence

\[
R_n=\frac{2\pi n}{|x|}.
\]

Then

\[
e^{ixR_n}=1,
\]

so

\[
\frac{e^{ixR_n}-1}{ix}=0.
\]

Now consider

\[
S_n=\frac{2\pi n+\pi}{|x|}.
\]

Then

\[
e^{ixS_n}=-1,
\]

so

\[
\frac{e^{ixS_n}-1}{ix}
=
\frac{-2}{ix}
=
\frac{2i}{x}.
\]

The two sequences give different limiting values. Therefore the ordinary \(R\to\infty\) limit does not exist for \(x\neq0\). At \(x=0\),

\[
\int_0^R 1\,dt=R,
\]

which diverges as \(R\to\infty\). This is why the retarded result must retain the regulated limiting prescription.

### 3. Extract the imaginary part

For finite \(\eta>0\),

\[
G^R_\eta(k,\omega)
=
\frac{1}{x+i\eta}.
\]

Multiply numerator and denominator by the complex conjugate \(x-i\eta\):

\[
\begin{aligned}
\frac{1}{x+i\eta}
&=
\frac{1}{x+i\eta}
\frac{x-i\eta}{x-i\eta}
\\
&=
\frac{x-i\eta}{(x+i\eta)(x-i\eta)}.
\end{aligned}
\]

Expand the denominator:

\[
\begin{aligned}
(x+i\eta)(x-i\eta)
&=
x^2-ix\eta+ix\eta-i^2\eta^2
\\
&=
x^2+\eta^2,
\end{aligned}
\]

because the two mixed terms cancel and \(i^2=-1\). Hence

\[
\begin{aligned}
G^R_\eta(k,\omega)
&=
\frac{x-i\eta}{x^2+\eta^2}
\\
&=
\frac{x}{x^2+\eta^2}
-
i\frac{\eta}{x^2+\eta^2}.
\end{aligned}
\]

The imaginary part is therefore

\[
\operatorname{Im}G^R_\eta(k,\omega)
=
-\frac{\eta}{x^2+\eta^2}.
\]

Substituting \(x=\omega-\xi_k\),

\[
\operatorname{Im}G^R_\eta(k,\omega)
=
-\frac{\eta}
{(\omega-\xi_k)^2+\eta^2}.
\]

### 4. Derive the spectral function

S1 defines

\[
A(k,\omega)=-2\,\operatorname{Im}G^R(k,\omega).
\]

At finite \(\eta\), this gives

\[
\begin{aligned}
A_\eta(k,\omega)
&=
-2\,\operatorname{Im}G^R_\eta(k,\omega)
\\
&=
-2\left[
-\frac{\eta}{(\omega-\xi_k)^2+\eta^2}
\right]
\\
&=
\frac{2\eta}{(\omega-\xi_k)^2+\eta^2}.
\end{aligned}
\]

Using the supplied distributional identity

\[
\lim_{\eta\to0^+}
\frac{\eta}{y^2+\eta^2}
=
\pi\delta(y)
\]

with

\[
y=\omega-\xi_k,
\]

we obtain

\[
\begin{aligned}
A(k,\omega)
&=
\lim_{\eta\to0^+}A_\eta(k,\omega)
\\
&=
2\lim_{\eta\to0^+}
\frac{\eta}{(\omega-\xi_k)^2+\eta^2}
\\
&=
2\pi\delta(\omega-\xi_k).
\end{aligned}
\]

Therefore,

\[
\boxed{
A(k,\omega)
=
2\pi\delta(\omega-\xi_k)
}.
\]

This is a **Reconstructed** result from S1, section 3.1, equations (12)–(14), using the distributional identity supplied with the excerpt.

The distributional statement can be checked against a smooth test function \(\phi(\omega)\):

\[
\begin{aligned}
\lim_{\eta\to0^+}
\int_{-\infty}^{\infty}
d\omega\,
A_\eta(k,\omega)\phi(\omega)
&=
2\lim_{\eta\to0^+}
\int_{-\infty}^{\infty}
d\omega\,
\frac{\eta}
{(\omega-\xi_k)^2+\eta^2}
\phi(\omega)
\\
&=
2\pi\phi(\xi_k).
\end{aligned}
\]

By the defining action of the shifted delta distribution,

\[
\int_{-\infty}^{\infty}
d\omega\,
\delta(\omega-\xi_k)\phi(\omega)
=
\phi(\xi_k),
\]

so the right-hand side is also

\[
\int_{-\infty}^{\infty}
d\omega\,
2\pi\delta(\omega-\xi_k)\phi(\omega).
\]

This establishes the equality as a distribution rather than as an ordinary pointwise function.

### 5. Checks

For finite \(\eta>0\),

\[
A_\eta(k,\omega)
=
\frac{2\eta}{(\omega-\xi_k)^2+\eta^2}
\geq 0,
\]

because the numerator is positive and the denominator is strictly positive. This agrees with the sign implied by the source convention \(A=-2\operatorname{Im}G^R\).

Its normalized spectral weight is

\[
\begin{aligned}
\int_{-\infty}^{\infty}
\frac{d\omega}{2\pi}A_\eta(k,\omega)
&=
\frac{1}{\pi}
\int_{-\infty}^{\infty}
d\omega\,
\frac{\eta}{(\omega-\xi_k)^2+\eta^2}.
\end{aligned}
\]

Set

\[
u=\frac{\omega-\xi_k}{\eta}.
\]

Then

\[
\omega-\xi_k=\eta u,
\qquad
d\omega=\eta\,du.
\]

Therefore,

\[
\begin{aligned}
\int_{-\infty}^{\infty}
\frac{d\omega}{2\pi}A_\eta(k,\omega)
&=
\frac{1}{\pi}
\int_{-\infty}^{\infty}
\frac{\eta(\eta\,du)}
{\eta^2u^2+\eta^2}
\\
&=
\frac{1}{\pi}
\int_{-\infty}^{\infty}
\frac{\eta^2\,du}
{\eta^2(u^2+1)}
\\
&=
\frac{1}{\pi}
\int_{-\infty}^{\infty}
\frac{du}{u^2+1}
\\
&=
\frac{1}{\pi}
\left[\arctan u\right]_{-\infty}^{\infty}
\\
&=
\frac{1}{\pi}
\left(
\frac{\pi}{2}
-
\left[-\frac{\pi}{2}\right]
\right)
\\
&=
1.
\end{aligned}
\]

The limiting spectral function has the same normalization:

\[
\begin{aligned}
\int_{-\infty}^{\infty}
\frac{d\omega}{2\pi}
A(k,\omega)
&=
\int_{-\infty}^{\infty}
\frac{d\omega}{2\pi}
2\pi\delta(\omega-\xi_k)
\\
&=
\int_{-\infty}^{\infty}
d\omega\,
\delta(\omega-\xi_k)
\\
&=
1.
\end{aligned}
\]

The denominator vanishes at

\[
\omega-\xi_k+i\eta=0,
\]

so

\[
\omega=\xi_k-i\eta.
\]

For \(\eta>0\), the pole lies below the real \(\omega\)-axis. This is consistent with the retarded boundary condition encoded by \(\theta(t)\). The opposite sign of \(i\eta\) would put the pole above the real axis and would not represent the same retarded prescription.

As written, the exponent requires

\[
[(\omega-\xi_k)t]=1
\quad\text{and}\quad
[\eta t]=1.
\]

Thus

\[
[\omega]=[\xi_k]=[\eta]=T^{-1}.
\]

If \(\varepsilon_k\), \(\mu\), and \(\xi_k\) are described as energies, the displayed exponential is using \(\hbar=1\), so energy and angular frequency have the same dimensions. Since the time-domain propagator shown by S1 is dimensionless, its time integral has dimension \(T\). The distribution \(\delta(\omega-\xi_k)\) also has dimension \(T\), because its integral against \(d\omega\) is dimensionless. The dimensions of \(G^R(k,\omega)\) and \(A(k,\omega)\) therefore agree with the derived expressions.

Physically, the delta function places all spectral weight at

\[
\omega=\xi_k.
\]

For this free mode, the regulator disappears from the final physical spectrum. A finite \(\eta\) in the intermediate Lorentzian is not, by itself, evidence for a physical lifetime or interaction-induced linewidth.

The next observable boundary is not another explanation. It is an unaided reconstruction: starting from the time-domain propagator, reproduce the finite-\(R\) evaluation, simplify the denominator to \(\omega-\xi_k+i\eta\), and derive the spectral delta function without consulting the worked steps.

## Exact Markdown writeback

No file is modified in this response. These are the exact content changes I would apply to the supplied mock state.

The existing `learning-records/2026-08-09.md` remains unchanged because historical learner records are immutable.

### `lessons/04-retarded-free-propagator.md`

Replace the pause marker with the derivation above, ending with this check:

```markdown
### Result

**Reconstructed from S1, section 3.1, equations (12)-(14):**

$$
G^R(k,\omega)
=
\lim_{\eta\to0^+}
\frac{1}{\omega-\xi_k+i\eta}
=
\frac{1}{\omega-\xi_k+i0^+}.
$$

For finite $\eta>0$,

$$
\begin{aligned}
G^R_\eta(k,\omega)
&=
\frac{1}{\omega-\xi_k+i\eta}
\\
&=
\frac{\omega-\xi_k}
{(\omega-\xi_k)^2+\eta^2}
-i\frac{\eta}
{(\omega-\xi_k)^2+\eta^2}.
\end{aligned}
$$

Therefore,

$$
\operatorname{Im}G^R_\eta(k,\omega)
=
-\frac{\eta}
{(\omega-\xi_k)^2+\eta^2},
$$

and the source convention $A=-2\operatorname{Im}G^R$ gives

$$
A_\eta(k,\omega)
=
\frac{2\eta}
{(\omega-\xi_k)^2+\eta^2}.
$$

Using

$$
\lim_{\eta\to0^+}\frac{\eta}{x^2+\eta^2}
=
\pi\delta(x)
$$

with $x=\omega-\xi_k$ gives

$$
\boxed{
A(k,\omega)=2\pi\delta(\omega-\xi_k)
}.
$$

### Interpretation and checks

- The $+i0^+$ records the regulated retarded limit; it is not an ordinary finite imaginary number.
- The pole for finite $\eta>0$ is at $\omega=\xi_k-i\eta$, below the real frequency axis.
- $A_\eta(k,\omega)\geq0$ for every real $\omega$.
- The spectral normalization is

$$
\int_{-\infty}^{\infty}\frac{d\omega}{2\pi}A_\eta(k,\omega)=1,
$$

and hence

$$
\int_{-\infty}^{\infty}\frac{d\omega}{2\pi}A(k,\omega)=1.
$$

- The limiting delta peak means that this free mode has spectral support only at $\omega=\xi_k$.
- The convergence regulator does not establish a physical decay rate or interaction-induced linewidth.

### Next observable check

Without consulting the worked derivation, start from

$$
G^R(k,t)=-i\theta(t)e^{-i\xi_k t}
$$

and reproduce all of the following:

1. the finite-upper-bound regulated integral;
2. the $R\to\infty$ boundary term;
3. the algebra leading to $(\omega-\xi_k+i\eta)^{-1}$;
4. the imaginary part;
5. the limit $A(k,\omega)=2\pi\delta(\omega-\xi_k)$.
```

Any new local symbols used in that continuation—particularly the finite cutoff \(R\), the regulator \(\eta\), and the regulated quantities \(G^R_\eta\) and \(A_\eta\)—would also be defined in the lesson’s leading `## Notation and conventions` section before their first use.

### `learning-records/INDEX.md`

The mock state supplies no existing `EV-*` index. Under the course-state allocation rule, the first new evidence ID is therefore `EV-000001`:

```markdown
# Learning Record Index

| Event date and sequence | Evidence ID | Canonical Obsidian link | Status event | Date and session | Task label | Concept Node IDs | Mastery judgment | Supersedes Evidence ID + link | Tombstone reason |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 2026-08-10-01 | EV-000001 | [[learning-records/EV-000001]] | registered | 2026-08-10 simulated session | Convergence-factor self-report before regulated-integral derivation | Not supplied in mock state | level 0 - not yet demonstrated / insufficient evidence |  |  |
```

### `learning-records/EV-000001.md`

```markdown
# Learning Record

## Evidence identity and task

- Evidence ID: EV-000001
- Canonical instance path: `learning-records/EV-000001.md`
- Canonical Obsidian link: [[learning-records/EV-000001]]
- Global index: `learning-records/INDEX.md`
- Supersedes Evidence ID + Obsidian link, if any:
- Date and session: 2026-08-10, simulated session
- Lesson ID + canonical Obsidian link: [[lessons/04-retarded-free-propagator]]
- Task attempted: report current understanding of the convergence factor before continuing the Fourier transform
- Evidence category: explanation
- Target Concept Node IDs: Not supplied in mock state
- Target capability required by the mission: independently reconstruct the regulated transform and spectral function

## Source anchors

| Source ID | Stable version key | Exact location | Role | Provenance |
| --- | --- | --- | --- | --- |
| S1 | Existing registered version; not reproduced in the mock excerpt | Section 3.1, equations (12)-(14) | Task premise and evaluator basis | Source |

## Unaided response

- Time or source access allowed: The mock source excerpt and prior course state were present.
- Work shown without assistance: No observable attempt elicited.
- Correct elements: No derivation was submitted for assessment.
- Incorrect, missing, or uncertain elements: Unaided evaluation of the regulated integral and unaided derivation of the spectral function remain unobserved.

## Learner self-report

- Confidence reported: The learner now accepts the convergence-factor procedure.
- Understanding claimed: `$e^{-\eta t}$ with $\eta>0$ makes the upper limit converge, and the retarded prescription takes $\eta\to0^+$ only after evaluating the integral.`
- Difference between self-report and observed performance: The statement is consistent with the required prescription, but no unaided calculation was supplied, so it does not demonstrate reconstruction mastery.

## Hints and assisted response

### Hint 1

- **Order:** 1
- **Hint, prompt, correction, or source access supplied:** A complete worked derivation of the regulated transform, its imaginary part, the delta-function limit, and the normalization and sign checks was supplied.
- **Response after assistance:** No subsequent learner response has yet been received.
- **What the assistance reveals about the gap:** Reconstruction must be tested in a later unaided attempt; the worked solution cannot be counted as learner performance.

## Evidence and mastery judgment

- Mastery level supported: level 0 - not yet demonstrated / insufficient evidence
- Target-specific evidence requirement: Independently reproduce the regulated integral, denominator simplification, imaginary part, and spectral delta function with all intermediate steps.
- Observable evidence demonstrated: A self-report of conceptual understanding of the order of limits.
- Why the evidence supports that level: Self-report supplies planning context but does not provide observable reconstruction.
- Other capabilities not demonstrated by this task: reconstruction, synthesis, and implementation
- Remaining gap: an unaided derivation from $G^R(k,t)$ to both $G^R(k,\omega)$ and $A(k,\omega)$

## Historical state changes caused by this evidence

- Previous active snapshot summary or prior Evidence ID + Obsidian link: [[learning-records/2026-08-09]] recorded that the learner stopped before evaluating the regulated integral.
- Atomic `CURRENT-STATE.md` replacement caused by this evidence: The convergence-factor objection is no longer the active conceptual obstacle; the active boundary is now an unaided reconstruction check.
- `ROADMAP.md` Phase IDs whose status changed: None; no mastery gate was passed.
- `CONCEPT-MAP.md` Node IDs or Edge IDs changed: None.
- Lesson ID + section Obsidian link patched: [[lessons/04-retarded-free-propagator#Fourier transform]]
- `REVIEW-QUEUE.md` Review IDs added, updated, or removed: None.
- Notation Entry IDs, Relation IDs, Synthesis IDs, or Open Question IDs changed: None shown by the supplied mock state.

## Code map references

Not applicable - implementation is not part of this lesson segment.

## Execution record references

None.

## Next observable check

- Next unaided task: Reconstruct the regulated Fourier transform and spectral function from the time-domain propagator without consulting the worked derivation.
- Due condition: At the start of the next teaching exchange.
- Success criterion: The learner shows the finite-bound integral, the $R\to\infty$ limit, the denominator algebra, the imaginary part, and the delta-function limit with the correct signs and factors.
```

### `CURRENT-STATE.md`

Replace the file atomically with:

```markdown
# Current State

- Snapshot updated: 2026-08-10 simulated session
- Active lesson: `lessons/04-retarded-free-propagator.md`
- Source anchor: S1 section 3.1, equations (12)-(14)
- Exact resume point: begin the learner's unaided reconstruction of the regulated Fourier transform
- Last completed intermediate step: the assisted lesson derived
  $$
  G^R(k,\omega)=\frac{1}{\omega-\xi_k+i0^+}
  $$
  and
  $$
  A(k,\omega)=2\pi\delta(\omega-\xi_k)
  $$
- First unfinished calculation or logical implication: the learner must independently introduce a finite upper bound, evaluate the regulated exponential integral, take the upper-bound limit, simplify the denominator, extract the imaginary part, and apply the supplied delta identity
- Current obstacle: no unresolved conceptual objection is reported about the convergence factor; unaided reconstruction has not yet been demonstrated
- Latest evidence: EV-000001 - [[learning-records/EV-000001]]
- Current mastery level supported: level 0 - not yet demonstrated / insufficient evidence
- Last evidence: the learner self-reported understanding of why $\eta>0$ is retained until after integration, but supplied no observable derivation
- Next action: ask for one unaided reconstruction of the transform and spectral function, with no worked steps visible
- Expected observable evidence: correct finite-bound evaluation, $R\to\infty$ limit, $+i0^+$ sign, imaginary part, and factor $2\pi$ in the spectral function
- Blocking unavailable evidence: none
```

No Mission, Roadmap, Concept Map, or mastery-completion row should be advanced from this exchange, because the only new learner evidence is self-report rather than an unaided reconstruction.


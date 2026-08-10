Good—we resume at the regulated integral. Define

\[
x\equiv \omega-\xi_k.
\]

Then

\[
G^R_\eta(k,\omega)
=
-i\int_0^\infty dt\,e^{(ix-\eta)t},
\qquad \eta>0.
\]

## 1. Evaluate the regulated integral

First replace the upper limit by a finite number \(T\):

\[
G^R_{\eta,T}(k,\omega)
=
-i\int_0^T dt\,e^{(ix-\eta)t}.
\]

Because

\[
\frac{d}{dt}e^{(ix-\eta)t}
=
(ix-\eta)e^{(ix-\eta)t},
\]

an antiderivative is

\[
\int dt\,e^{(ix-\eta)t}
=
\frac{e^{(ix-\eta)t}}{ix-\eta}.
\]

Therefore,

\[
\begin{aligned}
G^R_{\eta,T}(k,\omega)
&=
-i\left[
\frac{e^{(ix-\eta)t}}{ix-\eta}
\right]_{t=0}^{t=T}
\\
&=
-i\left(
\frac{e^{(ix-\eta)T}}{ix-\eta}
-
\frac{e^{(ix-\eta)0}}{ix-\eta}
\right).
\end{aligned}
\]

Since

\[
e^{(ix-\eta)0}=1,
\]

this becomes

\[
G^R_{\eta,T}(k,\omega)
=
-i\frac{e^{(ix-\eta)T}-1}{ix-\eta}.
\]

Now examine the upper-endpoint term:

\[
e^{(ix-\eta)T}
=
e^{ixT}e^{-\eta T}.
\]

Its magnitude is

\[
\left|e^{ixT}e^{-\eta T}\right|
=
|e^{ixT}|\,e^{-\eta T}.
\]

For real \(x\),

\[
|e^{ixT}|=1,
\]

so

\[
\left|e^{(ix-\eta)T}\right|
=
e^{-\eta T}.
\]

Because \(\eta>0\),

\[
\lim_{T\to\infty}e^{-\eta T}=0.
\]

Hence

\[
\lim_{T\to\infty}e^{(ix-\eta)T}=0.
\]

Taking the limit gives

\[
\begin{aligned}
G^R_\eta(k,\omega)
&=
-i\frac{0-1}{ix-\eta}
\\
&=
\frac{i}{ix-\eta}.
\end{aligned}
\]

To put this into the standard form, observe that

\[
i(x+i\eta)
=
ix+i^2\eta
=
ix-\eta.
\]

Therefore,

\[
ix-\eta=i(x+i\eta),
\]

and consequently

\[
\begin{aligned}
G^R_\eta(k,\omega)
&=
\frac{i}{i(x+i\eta)}
\\
&=
\frac{1}{x+i\eta}.
\end{aligned}
\]

Restoring \(x=\omega-\xi_k\),

\[
\boxed{
G^R_\eta(k,\omega)
=
\frac{1}{\omega-\xi_k+i\eta}
}.
\]

Only after evaluating the integral do we take \(\eta\to0^+\):

\[
\boxed{
G^R(k,\omega)
=
\lim_{\eta\to0^+}
\frac{1}{\omega-\xi_k+i\eta}
=
\frac{1}{\omega-\xi_k+i0^+}
}.
\]

The sign is worth tracking explicitly:

\[
e^{-\eta t}
\quad\Longrightarrow\quad
e^{[i(\omega-\xi_k)-\eta]t}
\quad\Longrightarrow\quad
\omega-\xi_k+i\eta
\]

in the final denominator. Thus a retarded propagator has \(+i0^+\).

## 2. Separate the real and imaginary parts

Again write

\[
x=\omega-\xi_k.
\]

For finite \(\eta>0\),

\[
G^R_\eta(k,\omega)=\frac{1}{x+i\eta}.
\]

Multiply numerator and denominator by the complex conjugate \(x-i\eta\):

\[
\frac{1}{x+i\eta}
=
\frac{x-i\eta}{(x+i\eta)(x-i\eta)}.
\]

Calculate the denominator:

\[
\begin{aligned}
(x+i\eta)(x-i\eta)
&=
x^2-ix\eta+ix\eta-(i\eta)^2
\\
&=
x^2-(i^2)\eta^2
\\
&=
x^2+\eta^2.
\end{aligned}
\]

Therefore,

\[
\frac{1}{x+i\eta}
=
\frac{x-i\eta}{x^2+\eta^2}.
\]

Separating its two terms,

\[
G^R_\eta(k,\omega)
=
\frac{x}{x^2+\eta^2}
-
i\frac{\eta}{x^2+\eta^2}.
\]

Thus

\[
\operatorname{Re}G^R_\eta(k,\omega)
=
\frac{x}{x^2+\eta^2},
\]

and

\[
\operatorname{Im}G^R_\eta(k,\omega)
=
-\frac{\eta}{x^2+\eta^2}.
\]

Restoring \(x=\omega-\xi_k\),

\[
\operatorname{Im}G^R_\eta(k,\omega)
=
-\frac{\eta}
{(\omega-\xi_k)^2+\eta^2}.
\]

Using

\[
\lim_{\eta\to0^+}
\frac{\eta}{x^2+\eta^2}
=
\pi\delta(x),
\]

we obtain

\[
\begin{aligned}
\operatorname{Im}G^R(k,\omega)
&=
-\pi\delta(\omega-\xi_k).
\end{aligned}
\]

Equivalently, the full distributional identity is

\[
\boxed{
G^R(k,\omega)
=
\mathcal P\frac{1}{\omega-\xi_k}
-i\pi\delta(\omega-\xi_k)
},
\]

where \(\mathcal P\) denotes the Cauchy principal value. The principal-value term is real, so it does not contribute to the spectral function.

## 3. Derive the spectral function

The stated convention is

\[
A(k,\omega)=-2\,\operatorname{Im}G^R(k,\omega).
\]

Substitute the imaginary part:

\[
\begin{aligned}
A(k,\omega)
&=
-2\left[-\pi\delta(\omega-\xi_k)\right]
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

Since

\[
\xi_k=\epsilon_k-\mu,
\]

the same result can be written as

\[
\boxed{
A(k,\omega)
=
2\pi\delta\!\left(\omega-\epsilon_k+\mu\right)
}.
\]

For finite \(\eta\), the regulated spectral function is

\[
\begin{aligned}
A_\eta(k,\omega)
&=
-2\,\operatorname{Im}G^R_\eta(k,\omega)
\\
&=
\frac{2\eta}
{(\omega-\xi_k)^2+\eta^2}.
\end{aligned}
\]

This is a Lorentzian centered at

\[
\omega=\xi_k.
\]

Its spectral weight is

\[
\begin{aligned}
\int_{-\infty}^{\infty}\frac{d\omega}{2\pi}
A_\eta(k,\omega)
&=
\int_{-\infty}^{\infty}
\frac{d\omega}{2\pi}
\frac{2\eta}{(\omega-\xi_k)^2+\eta^2}.
\end{aligned}
\]

Set

\[
u=\frac{\omega-\xi_k}{\eta},
\qquad
d\omega=\eta\,du.
\]

Then

\[
(\omega-\xi_k)^2+\eta^2
=
\eta^2(u^2+1),
\]

so

\[
\begin{aligned}
\int_{-\infty}^{\infty}\frac{d\omega}{2\pi}A_\eta
&=
\int_{-\infty}^{\infty}
\frac{\eta\,du}{2\pi}
\frac{2\eta}{\eta^2(u^2+1)}
\\
&=
\frac{1}{\pi}
\int_{-\infty}^{\infty}\frac{du}{u^2+1}
\\
&=
\frac{1}{\pi}
\left[\arctan u\right]_{-\infty}^{\infty}
\\
&=
\frac{1}{\pi}
\left(
\frac{\pi}{2}-\left(-\frac{\pi}{2}\right)
\right)
\\
&=1.
\end{aligned}
\]

The limiting delta function has the same normalization:

\[
\int_{-\infty}^{\infty}\frac{d\omega}{2\pi}
\,2\pi\delta(\omega-\xi_k)
=1.
\]

This also checks the factor \(2\pi\).

## Final chain

\[
\boxed{
-i\int_0^\infty
dt\,e^{[i(\omega-\xi_k)-\eta]t}
=
\frac{1}{\omega-\xi_k+i\eta}
}
\]

implies

\[
\boxed{
G^R(k,\omega)
=
\frac{1}{\omega-\xi_k+i0^+}
}
\]

which implies

\[
\boxed{
\operatorname{Im}G^R(k,\omega)
=
-\pi\delta(\omega-\xi_k)
}
\]

and therefore

\[
\boxed{
A(k,\omega)
=
2\pi\delta(\omega-\xi_k)
}.
\]

## Exact Markdown course-state updates

Replace the four corresponding entries in `CURRENT-STATE.md` with:

```markdown
- Active lesson: `lessons/04-retarded-free-propagator.md`
- Exact resume point: The regulated Fourier transform and spectral function have been derived. The next session begins with an independent retrieval check of \(G^R(k,\omega)=1/(\omega-\xi_k+i0^+)\) and \(A(k,\omega)=2\pi\delta(\omega-\xi_k)\).
- Last evidence: The learner correctly explained that \(e^{-\eta t}\), with \(\eta>0\), makes the upper endpoint converge and that \(\eta\to0^+\) must be taken only after the regulated integral is evaluated.
- Next: Without notes, reproduce the complex-exponential integral, explain why the denominator contains \(+i0^+\), and derive the sign and normalization of \(A(k,\omega)\). Then mark lesson 04 complete and advance to the next lesson.
```

Add `learning-records/2026-08-10.md` with exactly:

```markdown
# Learning record — 2026-08-10

## Active lesson

`lessons/04-retarded-free-propagator.md`

## Resume point

Resumed at the regulated transform

\[
G^R_\eta(k,\omega)
=
-i\int_0^\infty dt\,
e^{[i(\omega-\xi_k)-\eta]t},
\qquad \eta>0.
\]

## Learner evidence

The learner correctly stated that:

1. \(e^{-\eta t}\), with \(\eta>0\), makes the upper endpoint converge.
2. The limit \(\eta\to0^+\) is taken only after the regulated integral has been evaluated.

## Derivation completed

For finite \(\eta>0\),

\[
G^R_\eta(k,\omega)
=
\frac{1}{\omega-\xi_k+i\eta}.
\]

Taking the boundary-value limit gives

\[
G^R(k,\omega)
=
\frac{1}{\omega-\xi_k+i0^+}.
\]

Its imaginary part is

\[
\operatorname{Im}G^R(k,\omega)
=
-\pi\delta(\omega-\xi_k).
\]

Using \(A(k,\omega)=-2\operatorname{Im}G^R(k,\omega)\),

\[
A(k,\omega)
=
2\pi\delta(\omega-\xi_k).
\]

The normalization check gives

\[
\int_{-\infty}^{\infty}
\frac{d\omega}{2\pi}A(k,\omega)
=
1.
\]

## Remaining verification

The derivation has been presented step by step, but independent reproduction by the learner has not yet been observed.

## Next session

Ask the learner to reproduce, without notes:

1. The evaluation of the regulated complex-exponential integral.
2. The algebra that changes \(i/[i(\omega-\xi_k)-\eta]\) into \(1/(\omega-\xi_k+i\eta)\).
3. The sign of \(\operatorname{Im}G^R\).
4. The factor \(2\pi\) in the spectral function.

After successful retrieval, mark lesson 04 complete and advance to the next lesson.
```

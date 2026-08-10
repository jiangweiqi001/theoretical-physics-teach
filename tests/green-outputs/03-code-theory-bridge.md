Provisional response-only artifact; no canonical write performed.

# What the RPA pseudocode computes

## Notation and conventions

All pending identifiers below are inert placeholders because no canonical indexes were supplied or read. The definitions are ordered so that every symbol used in a later definition is already defined.

| Pending local ID | Exact glyph or identifier and reading | Mathematical or code type; domain and index range | Physical meaning; units or dimensions | Origin, exact anchor, local convention, and decoration meanings |
| --- | --- | --- | --- | --- |
| `{{NOTATION_ID_PENDING}}-001` | $0$, $1$, $2$, $-1$, $+$, $-$, $=$, $\le$, $\to$, $\mapsto$, $\infty$, $\ldots$, $\times$, $i$, “imaginary unit”; $\pi$, “pi”; $\sum$, “sum”; $\int$, “integral”; $d$, “differential”; $\cdot$, “dot or multiplication”; $|\cdot|$, “absolute value”; $[\cdot]$, “units of”; $\approx$, “approximately equal”; $\sim$, “asymptotically behaves as” | Dependency-closed mathematical primitives. The numerals are integers; arithmetic, order, limit, map, continuation, multiplication, summation, integration, differential, magnitude, unit, approximation, and asymptotic glyphs have their standard displayed roles. $i$ is a complex scalar with $i^2=-1$; $\pi$ is a positive real constant. | Dimensionless primitives except that $d$, arithmetic operations, and $[\cdot]$ inherit or report the dimensions of their operands. | Defined mathematically here before any dependent entry. Vertical bars mean absolute value, square brackets mean units, and subscripts or superscripts are not part of this grouped entry. |
| `{{NOTATION_ID_PENDING}}-002` | $\mathrm{eV}$, “electron-volt” | Unit glyph for energy. | Energy unit used by every stored energy and Matsubara frequency. Powers such as $\mathrm{eV}^{-1}$ mean reciprocal powers of this unit. | **Source:** project documentation in the supplied prompt. Roman type denotes a unit, not a variable. |
| `{{NOTATION_ID_PENDING}}-003` | $\mathrm{\mathring A}$, “angstrom” | Unit glyph for length. | Length unit whose reciprocal is the momentum unit. Powers such as $\mathrm{\mathring A}^{-1}$ and $\mathrm{\mathring A}^{-3}$ mean inverse length and inverse volume. | **Source:** project documentation. Roman type and the ring distinguish the unit glyph from a variable. |
| `{{NOTATION_ID_PENDING}}-004` | $j$, $m$, $n$, read by their letter names | Integer indices. In this run $j$ ranges from $0$ through $4095$; $m$ ranges from $-256$ through $255$; the exact finite set of nonnegative values taken by $n$ was not supplied. | Momentum-quadrature index, internal fermionic-frequency index, and external bosonic-frequency index. | **Source:** visible pseudocode and run configuration. No decoration changes their integer type. |
| `{{NOTATION_ID_PENDING}}-005` | `iq`, “i-q” | Nonnegative integer storage index ranging from $0$ through $79$. | Position of an external momentum in the first output-array axis; dimensionless. | **Source:** visible outer loop. It is a code identifier, not the imaginary unit times momentum. |
| `{{NOTATION_ID_PENDING}}-006` | `inu`, “i-nu” | Nonnegative integer storage index ranging from $0$ through $11$. | Position of a bosonic index in the second output-array axis; dimensionless. | **Source:** visible bosonic loop. It need not equal the mathematical value $n$. |
| `{{NOTATION_ID_PENDING}}-007` | $N_w$ and `Nw`, “N sub w” | Positive integer; current value $256$. | One-sided truncation parameter for the internal fermionic sum; dimensionless. | **Source:** run configuration and visible fermionic loop. Subscript $w$ labels frequency cutoff; code spelling omits the subscript. |
| `{{NOTATION_ID_PENDING}}-008` | $\beta$ and `beta`, “beta” | Positive real scalar; current value $40\,\mathrm{eV}^{-1}$. | Inverse temperature. | **Source:** S1, section 4, equations (21)–(24), and run configuration. The code spelling denotes the same supplied quantity. |
| `{{NOTATION_ID_PENDING}}-009` | $q$, `q` | Three-dimensional real vector. | External momentum transfer; units $\mathrm{\mathring A}^{-1}$. | **Source:** paper and project documentation. No subscript; `q` is the genuinely equivalent code spelling. |
| `{{NOTATION_ID_PENDING}}-009A` | $q^2$, “q squared” | Nonnegative real scalar obtained from the Euclidean magnitude of the already defined vector $q$. | Squared momentum magnitude; units $\mathrm{\mathring A}^{-2}$. | **Source:** S1 equation (21). The superscript $2$ denotes the scalar square, not an index. |
| `{{NOTATION_ID_PENDING}}-010` | $k$, `k` | Three-dimensional real vector. | Internal momentum; units $\mathrm{\mathring A}^{-1}$. | **Source:** paper and project documentation. `k` is the genuinely equivalent code spelling. |
| `{{NOTATION_ID_PENDING}}-011` | $k_j$, “k sub j” | Three-dimensional real vector for $j$ from $0$ through $4095$. | Momentum at quadrature point $j$; units $\mathrm{\mathring A}^{-1}$. | Defined here as the mathematical grid node; the subscript selects a point. |
| `{{NOTATION_ID_PENDING}}-012` | $F$, $F(k)$, “F of k” | Arbitrary scalar test integrand on the momentum domain. | Placeholder used only to state the quadrature rule; its units depend on the integrand. | Defined here. The argument $k$ identifies the momentum at which it is evaluated. |
| `{{NOTATION_ID_PENDING}}-013` | $w_j$, “w sub j” | Real quadrature weight paired with $k_j$. | Already contains the measure approximating $d^3k/(2\pi)^3$; units $\mathrm{\mathring A}^{-3}$. | **Source:** project documentation. The subscript selects the weight paired with grid point $j$. |
| `{{NOTATION_ID_PENDING}}-014` | $\omega_m$ and `omega`, “omega sub m” | Real scalar for integer $m$. | Fermionic Matsubara frequency; units $\mathrm{eV}$. | **Source:** S1 and the visible fermionic-frequency assignment. Subscript $m$ selects the fermionic index; `omega` is its loop-local code value. |
| `{{NOTATION_ID_PENDING}}-015` | $\nu_n$ and `nu`, “nu sub n” | Real scalar for a supplied integer $n$. | Bosonic Matsubara frequency; units $\mathrm{eV}$. | **Source:** S1 and the visible bosonic-frequency assignment. Subscript $n$ selects the bosonic index; `nu` is its loop-local code value. |
| `{{NOTATION_ID_PENDING}}-016` | $\omega_{-256}$, $\omega_{255}$, $\nu_{11}$ | Particular instances of the already defined frequency families. | Lower and upper included fermionic endpoints and, conditionally, the bosonic endpoint for a consecutive list through $11$; units $\mathrm{eV}$. | Defined by substituting the displayed indices into S1’s formulas. Their subscripts select specific index values. |
| `{{NOTATION_ID_PENDING}}-017` | $\xi_k$, “xi sub k” | Real-valued scalar function of momentum. | Single-particle energy relative to the chemical potential; units $\mathrm{eV}$. | **Source:** S1. The subscript selects momentum. |
| `{{NOTATION_ID_PENDING}}-018` | $G_0(k,i\omega_m)$ | Complex scalar function of momentum and imaginary frequency. | Noninteracting Matsubara Green function; units $\mathrm{eV}^{-1}$. | **Source:** S1, section 4, equations (21)–(24). Subscript $0$ means noninteracting. |
| `{{NOTATION_ID_PENDING}}-019` | `G_left` | Complex loop-local code scalar. | Intended value $G_0(k,i\omega_m)$; units $\mathrm{eV}^{-1}$. | **Source:** visible assignment to `G_left`; underscore is part of the identifier. |
| `{{NOTATION_ID_PENDING}}-020` | `G_right` | Complex loop-local code scalar. | Intended value $G_0(k+q,i\omega_m+i\nu_n)$; units $\mathrm{eV}^{-1}$. | **Source:** visible assignment to `G_right`; underscore is part of the identifier. |
| `{{NOTATION_ID_PENDING}}-021` | $e^2$ and `e2`, “e squared” | Positive real coupling constant. | Interaction coupling; units $\mathrm{eV}\,\mathrm{\mathring A}$. | **Source:** S1 and project unit statement. Superscript $2$ is part of the source’s coupling notation; code spelling is `e2`. |
| `{{NOTATION_ID_PENDING}}-022` | $\kappa_{\mathrm{IR}}$ and `kappa_IR`, “kappa sub I-R” | Positive real scalar; current value $0.02\,\mathrm{\mathring A}^{-1}$. | Numerical infrared regulator, not a physical screening parameter. | **Source:** S1 and run configuration. Subscript $\mathrm{IR}$ and code suffix `_IR` mean infrared. |
| `{{NOTATION_ID_PENDING}}-023` | $V_\kappa(q)$ | Real scalar function of external momentum. | Regulated bare interaction; units $\mathrm{eV}\,\mathrm{\mathring A}^{3}$. | **Source:** S1. Subscript $\kappa$ records regulator dependence. |
| `{{NOTATION_ID_PENDING}}-024` | $V_q$, “V sub q” | Real scalar for the currently selected $q$. | Finite code value of $V_\kappa(q)$; units $\mathrm{eV}\,\mathrm{\mathring A}^{3}$. | Defined here to translate the code identifier. Subscript $q$ labels the current external momentum. |
| `{{NOTATION_ID_PENDING}}-025` | `Vq` | Real loop-local code scalar. | Stores $V_q=V_\kappa(q)$; units $\mathrm{eV}\,\mathrm{\mathring A}^{3}$. | **Source:** visible assignment to `Vq`. |
| `{{NOTATION_ID_PENDING}}-026` | $\Pi_0(q,i\nu_n)$ | Complex scalar function. | Exact noninteracting polarization in the paper; units $\mathrm{eV}^{-1}\mathrm{\mathring A}^{-3}$. | **Source:** S1. Subscript $0$ means noninteracting. |
| `{{NOTATION_ID_PENDING}}-027` | $\Pi_{\mathrm{code}}(q,i\nu_n)$ | Complex finite approximant. | Momentum-quadrature and truncated-frequency approximation accumulated by the pseudocode; units $\mathrm{eV}^{-1}\mathrm{\mathring A}^{-3}$. | **Reconstructed:** S1 plus the complete visible loops. Subscript `code` distinguishes the finite numerical approximant from the infinite expression. |
| `{{NOTATION_ID_PENDING}}-028` | `Pi` | Complex loop-local code scalar. | Accumulates $\Pi_{\mathrm{code}}(q,i\nu_n)$; units become $\mathrm{eV}^{-1}\mathrm{\mathring A}^{-3}$ after its visible prefactor is applied. | **Source:** visible initialization, accumulation, and rescaling of `Pi`. |
| `{{NOTATION_ID_PENDING}}-029` | $W(q,i\nu_n)$ | Complex scalar function. | RPA screened interaction on the bosonic Matsubara axis; units $\mathrm{eV}\,\mathrm{\mathring A}^{3}$. | **Source:** S1. Its arguments are external momentum and imaginary bosonic frequency. |
| `{{NOTATION_ID_PENDING}}-030` | `W` | Two-dimensional complex code array. | Stores intended samples of $W(q,i\nu_n)$; shape is $(80,12)$ and units are $\mathrm{eV}\,\mathrm{\mathring A}^{3}$. | **Source:** visible allocation and assignment. Axis 0 is `iq`; axis 1 is `inu`. |
| `{{NOTATION_ID_PENDING}}-031` | $D$ | Complex scalar. | RPA denominator $D=1-V_\kappa\Pi_0$; dimensionless. | Defined here. No decoration. |
| `{{NOTATION_ID_PENDING}}-032` | $\delta\Pi$ | Small complex variation. | Grid or truncation change in the polarization; units $\mathrm{eV}^{-1}\mathrm{\mathring A}^{-3}$. | Defined here. $\delta$ denotes a variation, not a Dirac delta. |
| `{{NOTATION_ID_PENDING}}-033` | $\delta W$ | Small complex variation. | Resulting change in the screened interaction; units $\mathrm{eV}\,\mathrm{\mathring A}^{3}$. | Defined here. $\delta$ denotes a variation. |
| `{{NOTATION_ID_PENDING}}-033A` | $\omega$, “omega” | Real scalar frequency variable. | Real-frequency argument used only when distinguishing a retarded continuation from the Matsubara-axis array; units $\mathrm{eV}$. | Defined here from S1's explicit real-frequency non-claim. No subscript means this is not the discrete family member $\omega_m$. |
| `{{NOTATION_ID_PENDING}}-034` | $\omega+i0^+$ | Real-frequency retarded boundary prescription. | Approach to real frequency from the positive imaginary side; units $\mathrm{eV}$. | Defined here solely to state the real-frequency boundary. Superscript $+$ specifies the side of approach. |
| `{{NOTATION_ID_PENDING}}-035` | $\Pi_0^R(q,\omega)$ | Complex retarded polarization. | Real-frequency continuation target; units $\mathrm{eV}^{-1}\mathrm{\mathring A}^{-3}$. | Defined here from the source’s analytic-continuation requirement. Subscript $0$ means noninteracting; superscript $R$ means retarded. |
| `{{NOTATION_ID_PENDING}}-036` | $W^R(q,\omega)$ | Complex retarded screened interaction. | Real-frequency screened interaction; units $\mathrm{eV}\,\mathrm{\mathring A}^{3}$. | Defined here. Superscript $R$ means retarded. |
| `{{NOTATION_ID_PENDING}}-037` | $D^R(q,\omega)$ | Complex retarded denominator. | $1-V_\kappa(q)\Pi_0^R(q,\omega)$; dimensionless. | Defined here. Superscript $R$ means retarded. |
| `{{NOTATION_ID_PENDING}}-038` | `complex_zeros` | Code callable. | Allocates a complex-valued array of the supplied shape. | **Source:** first pseudocode line. No runtime behavior beyond the visible intended call is claimed. |
| `{{NOTATION_ID_PENDING}}-039` | `len` | Code callable. | Returns the supplied collection length for array sizing. | **Source:** first pseudocode line. |
| `{{NOTATION_ID_PENDING}}-040` | `q_points` | Ordered code collection of 80 vectors. | External momentum sampling grid; each element has units $\mathrm{\mathring A}^{-1}$. | **Source:** project documentation and run configuration. |
| `{{NOTATION_ID_PENDING}}-041` | `bosonic_indices` | Ordered code collection of 12 nonnegative integers. | Determines the sampled bosonic Matsubara indices and output-axis ordering; dimensionless. | **Source:** run configuration. The exact integer list was not supplied. |
| `{{NOTATION_ID_PENDING}}-042` | `enumerate` | Code iterator constructor. | Produces each collection element together with its zero-based storage position. | **Source:** visible loop syntax. |
| `{{NOTATION_ID_PENDING}}-043` | `pi` | Real code constant. | Code representation of $\pi$; dimensionless. | **Source:** visible pseudocode. |
| `{{NOTATION_ID_PENDING}}-044` | `dot` | Code callable on two vectors. | Computes their Euclidean dot product; `dot(q,q)` realizes the already defined $q^2$ and has units $\mathrm{\mathring A}^{-2}$. | **Source:** visible pseudocode and three-dimensional vector documentation. |
| `{{NOTATION_ID_PENDING}}-045` | `0j` and `1j` | Complex code literals. | Complex zero and the code representation of $i$; dimensionless. | **Source:** visible pseudocode. The suffix `j` is code syntax, not the quadrature index $j$. |
| `{{NOTATION_ID_PENDING}}-046` | `k_points` | Ordered code collection of 4096 vectors. | Internal momentum quadrature points; each element has units $\mathrm{\mathring A}^{-1}$. | **Source:** project documentation and run configuration. |
| `{{NOTATION_ID_PENDING}}-047` | `k_weights` | Ordered code collection of 4096 real weights. | Stores the $w_j$ paired with `k_points`; each element has units $\mathrm{\mathring A}^{-3}$. | **Source:** project documentation. |
| `{{NOTATION_ID_PENDING}}-048` | `range` | Code iterator constructor with an excluded upper endpoint. | `range(-Nw,Nw)` generates the integers from $-N_w$ through $N_w-1$. | **Source:** visible pseudocode and the displayed endpoint semantics used below. |
| `{{NOTATION_ID_PENDING}}-049` | `xi` | Code callable on a momentum vector. | Returns the supplied dispersion value `xi(k)` or `xi(k+q)` in $\mathrm{eV}$. | **Source:** visible pseudocode; interpolation and boundary handling are unresolved. |
| `{{NOTATION_ID_PENDING}}-050` | `save` | Code callable. | Requests serialization of an array to the supplied filename. | **Source:** final pseudocode line. It is not execution evidence. |
| `{{NOTATION_ID_PENDING}}-051` | `"W_matsubara.npy"` | Code string literal. | Intended output filename for `W`; dimensionless text. | **Source:** final pseudocode line. The name does not prove that the file exists. |

All formulas retain the source’s notation. Energies are in $\mathrm{eV}$ and momenta in $\mathrm{\mathring A}^{-1}$.

## Evidence boundary

- **Paper anchor:** S1, *Finite-Temperature Screening on the Imaginary Axis*, section 4, equations (21)–(24).
- **Paper version status:** `Unassigned — supplied excerpt; snapshot registration pending`.
- **Pseudocode immutable-anchor status:** `Unassigned — supplied excerpt; snapshot registration pending`.
- **Temporary code locator:** the complete visible mock pseudocode, from `W = complex_zeros(...)` through `save("W_matsubara.npy", W)`.
- The paper excerpt and pseudocode support a provisional code–theory mapping. The implementation of `xi`, grid construction, shifted-momentum boundary handling, saved file, and runtime output were not supplied.

No execution or validation claim is made.

## Physical calculation

**Source — S1, section 4, equations (21)–(24):**

The RPA screened interaction is

$$
W(q,i\nu_n)
=
\frac{V_\kappa(q)}
{1-V_\kappa(q)\Pi_0(q,i\nu_n)},
$$

where

$$
V_\kappa(q)
=
\frac{4\pi e^2}{q^2+\kappa_{\mathrm{IR}}^2},
$$

and

$$
\Pi_0(q,i\nu_n)
=
-\frac{2}{\beta}
\sum_{m=-\infty}^{\infty}
\int\frac{d^3k}{(2\pi)^3}
G_0(k,i\omega_m)
G_0(k+q,i\omega_m+i\nu_n).
$$

The first Green function carries internal momentum-frequency $(k,i\omega_m)$. The second carries $(k+q,i\omega_m+i\nu_n)$. The external probe therefore transfers momentum $q$ and bosonic Matsubara frequency $i\nu_n$ through the particle-hole bubble. The factor $2$ is the source’s spin degeneracy.

## Exact finite calculation represented by the loops

**Reconstructed from S1 and the visible pseudocode:**

The documented quadrature rule is

$$
\int\frac{d^3k}{(2\pi)^3}F(k)
\approx
\sum_{j=0}^{4095}w_jF(k_j).
$$

The code must not add another factor of $(2\pi)^{-3}$ or another cell-volume factor, because `k_weights[j]` already includes the complete measure.

Python’s `range(-Nw, Nw)` gives

$$
m=-N_w,-N_w+1,\ldots,N_w-1.
$$

Consequently, the value accumulated in `Pi` is

$$
\begin{aligned}
\Pi_{\mathrm{code}}(q,i\nu_n)
={}&
-\frac{2}{\beta}
\sum_{j=0}^{4095}w_j
\sum_{m=-N_w}^{N_w-1}
\\
&\times
\frac{1}{i\omega_m-\xi_{k_j}}
\frac{1}{i(\omega_m+\nu_n)-\xi_{k_j+q}}.
\end{aligned}
$$

The right-hand frequency is exactly another fermionic Matsubara frequency:

$$
\begin{aligned}
\omega_m+\nu_n
&=
\frac{(2m+1)\pi}{\beta}
+
\frac{2n\pi}{\beta}
\\
&=
\frac{(2m+2n+1)\pi}{\beta}
\\
&=
\frac{[2(m+n)+1]\pi}{\beta}
\\
&=
\omega_{m+n}.
\end{aligned}
$$

After the polarization is accumulated, `Pi *= -2 / beta` supplies the fermion-loop sign, spin factor, and Matsubara normalization. The assignment to `W[iq, inu]` then evaluates

$$
W(q,i\nu_n)
=
\frac{V_q}{1-V_q\Pi_{\mathrm{code}}(q,i\nu_n)}.
$$

## Full RPA loop map

| Pseudocode operation | Direct behavior | Physical role |
| --- | --- | --- |
| `W = complex_zeros((len(q_points), len(bosonic_indices)))` | **Source:** requests a two-dimensional complex array | **Reconstructed:** axis 0 labels external momenta and axis 1 labels the ordered bosonic indices |
| `for iq, q in enumerate(q_points)` | **Source:** visits each momentum and position | $q$ is an external argument; there is no $q$ integration |
| `Vq = 4*pi*e2/(dot(q,q)+kappa_IR**2)` | **Source:** evaluates the displayed arithmetic | Computes $V_q=V_\kappa(q)$ because `dot(q,q)` is $q^2$ |
| `for inu, n in enumerate(bosonic_indices)` | **Source:** visits each stored bosonic index | `inu` chooses the output column; $n$ determines $\nu_n$ |
| `nu = 2*n*pi/beta` | **Source:** evaluates the formula | Computes $\nu_n$ |
| `Pi = 0j` | **Source:** resets a complex accumulator | Starts a new polarization value for this external $(q,n)$ pair |
| `for j, k in enumerate(k_points)` | **Source:** visits all weighted momenta | Discretizes the internal momentum integral |
| `for m in range(-Nw,Nw)` | **Source:** visits $2N_w$ integers | Truncates the infinite fermionic Matsubara sum |
| `omega = (2*m+1)*pi/beta` | **Source:** evaluates the formula | Computes $\omega_m$ |
| `G_left = 1/(1j*omega-xi(k))` | **Source:** evaluates the visible denominator | Computes $G_0(k,i\omega_m)$ |
| `G_right = 1/(1j*(omega+nu)-xi(k+q))` | **Source:** evaluates the shifted denominator | Computes $G_0(k+q,i\omega_m+i\nu_n)$ |
| `Pi += k_weights[j]*G_left*G_right` | **Source:** adds one weighted product | Accumulates the quadrature approximation to the bubble |
| `Pi *= -2/beta` | **Source:** rescales the accumulator | Applies the source’s minus sign, spin degeneracy, and Matsubara factor |
| `W[iq,inu] = Vq/(1-Vq*Pi)` | **Source:** writes one array element | Applies the RPA screening denominator |
| `save("W_matsubara.npy", W)` | **Source:** requests serialization | Intends to save the Matsubara array; it does not prove execution or successful saving |

For the stated sizes, the intended output shape is $(80,12)$. The nested sum contains

$$
80\cdot12\cdot4096\cdot(2\cdot256)
=
2{,}013{,}265{,}920
$$

Green-function products. This is a count inferred from the loop bounds, not an observed run.

## Units check

**Reconstructed from the supplied unit convention:**

Since $\omega_m$ and $\xi_k$ are energies,

$$
[G_0]=\mathrm{eV}^{-1}.
$$

Since $w_j$ represents $d^3k/(2\pi)^3$,

$$
[w_j]=\mathrm{\mathring A}^{-3}.
$$

Also,

$$
[\beta^{-1}]=\mathrm{eV}.
$$

Therefore

$$
\begin{aligned}
[\Pi_0]
&=
\mathrm{eV}\cdot
\mathrm{\mathring A}^{-3}\cdot
\mathrm{eV}^{-2}
\\
&=
\mathrm{eV}^{-1}\mathrm{\mathring A}^{-3}.
\end{aligned}
$$

The stored coupling constants are stated to be consistent with the chosen units, giving

$$
[V_\kappa]=\mathrm{eV}\,\mathrm{\mathring A}^{3}.
$$

Thus

$$
[V_\kappa\Pi_0]=1,
$$

the RPA denominator is dimensionless, and

$$
[W]=\mathrm{eV}\,\mathrm{\mathring A}^{3}.
$$

## Present frequency grids

With $\beta=40\,\mathrm{eV}^{-1}$,

$$
\frac{2\pi}{\beta}
=
\frac{2\pi}{40}\,\mathrm{eV}
\approx
0.15708\,\mathrm{eV}.
$$

For $N_w=256$, the code includes $512$ integers from $-256$ through $255$. The endpoint frequencies are

$$
\omega_{-256}
=
\frac{-511\pi}{40}\,\mathrm{eV}
\approx
-40.134\,\mathrm{eV},
$$

and

$$
\omega_{255}
=
\frac{511\pi}{40}\,\mathrm{eV}
\approx
40.134\,\mathrm{eV}.
$$

If `bosonic_indices` is exactly the consecutive list from $0$ through $11$, then

$$
\nu_{11}
=
\frac{22\pi}{40}\,\mathrm{eV}
\approx
1.728\,\mathrm{eV}.
$$

That endpoint is conditional: twelve nonnegative entries need not be consecutive. The integer list must be saved with the array.

## Exact closure of `range(-Nw,Nw)`

The fermionic partner map is $m\mapsto-m-1$. Begin with

$$
-N_w\leq m\leq N_w-1.
$$

From $m\geq-N_w$,

$$
-m\leq N_w,
$$

so

$$
-m-1\leq N_w-1.
$$

From $m\leq N_w-1$,

$$
-m\geq-N_w+1,
$$

so

$$
-m-1\geq-N_w.
$$

Combining the bounds gives

$$
-N_w\leq-m-1\leq N_w-1.
$$

The endpoints map into one another:

$$
-N_w\mapsto N_w-1,
$$

and

$$
N_w-1\mapsto-N_w.
$$

Applying the map twice returns the original integer:

$$
m\mapsto-m-1\mapsto-(-m-1)-1=m.
$$

Therefore `range(-Nw,Nw)` is closed under this involution. With $N_w=256$, $-256$ pairs with $255$. Changing the range to `range(-Nw,Nw+1)` would add $N_w$, whose partner $-N_w-1$ is absent.

## Convergence required before editing grids

1. **Fermionic cutoff.** Increase $N_w$ while holding the physical momentum grid, external grid, regulator, and temperature fixed. Compare both $\Pi_{\mathrm{code}}$ and $W$. At large $|\omega_m|$,

   $$
   G_0(k,i\omega_m)\sim\frac{1}{i\omega_m},
   $$

   so

   $$
   G_0(k,i\omega_m)G_0(k+q,i\omega_m+i\nu_n)
   \sim
   \frac{1}{(i\omega_m)^2}
   =
   -\frac{1}{\omega_m^2}.
   $$

   The omitted tail decreases algebraically. Whether $N_w=256$ is sufficient depends on the largest $\nu_n$ and the energy range returned by `xi`, which were not both supplied.

2. **Momentum quadrature.** Refine `k_points` and regenerate the paired `k_weights` over the same physical domain. Do not reuse weights on a changed point set unless the grid generator defines that operation. Do not add another integration measure.

3. **Shifted momentum.** Inspect how `xi(k+q)` treats every shifted vector. A continuum implementation may evaluate it directly; a periodic band implementation may require a reciprocal-space wrap. The pseudocode does not establish which rule applies.

4. **External momentum grid.** `q_points` are sample locations, not integration points here. Adding or reordering them changes axis 0 of `W` but introduces no $q$ weights. Preserve the vector list as metadata.

5. **Bosonic grid.** Preserve the actual integers in `bosonic_indices`. Increasing the largest $n$ can require increasing $N_w$, because `G_right` contains $\omega_m+\nu_n$.

6. **Infrared regulator.** S1 states that $\kappa_{\mathrm{IR}}$ is numerical and must be removed through a convergence study. Repeat the calculation for decreasing positive regulator values while controlling the other grids. At $q=0$,

   $$
   V_\kappa(0)
   =
   \frac{4\pi e^2}{\kappa_{\mathrm{IR}}^2}.
   $$

   Directly setting $\kappa_{\mathrm{IR}}=0$ makes this displayed expression singular. The excerpt does not supply the required limiting treatment.

7. **Denominator sensitivity.** If $\Pi_0$ changes to $\Pi_0+\delta\Pi$, then

   $$
   \begin{aligned}
   \delta W
   &=
   \frac{V_\kappa}{D-V_\kappa\delta\Pi}
   -
   \frac{V_\kappa}{D}
   \\
   &=
   \frac{V_\kappa^2\delta\Pi}
   {D(D-V_\kappa\delta\Pi)}.
   \end{aligned}
   $$

   For a sufficiently small variation,

   $$
   \delta W
   \approx
   \frac{V_\kappa^2\delta\Pi}{D^2}.
   $$

   A small $D$ amplifies discretization error. Convergence must be checked in both the polarization and screened interaction at every relevant $(q,n)$.

A defensible study varies $N_w$, momentum resolution, and $\kappa_{\mathrm{IR}}$ independently and then jointly, while preserving physical ranges, weights, array-axis metadata, and normalization. The excerpt does not determine a numerical acceptance tolerance.

## Imaginary-axis and real-mode boundary

The saved array by itself does not demonstrate a real-frequency collective mode.

**Source — S1, section 4, equations (21)–(24):** the calculated object is $W(q,i\nu_n)$ on the bosonic Matsubara axis. S1 explicitly requires analytic continuation and separate validation for real-frequency claims.

**Reconstructed from the RPA denominator:** a retarded real-frequency interaction would have the form

$$
W^R(q,\omega)
=
\frac{V_\kappa(q)}
{1-V_\kappa(q)\Pi_0^R(q,\omega)}
=
\frac{V_\kappa(q)}{D^R(q,\omega)}.
$$

A candidate pole requires information about $D^R$ after the continuation $i\nu_n\to\omega+i0^+$. Twelve imaginary-axis samples do not directly provide that information.

Before a collective-mode claim, the calculation needs a justified analytic continuation, separate validation of that continuation, convergence in $N_w$ and the momentum quadrature, removal of $\kappa_{\mathrm{IR}}$ through a convergence study, and inspection of output from a pinned run. The filename and pseudocode do not establish that the program ran, that the file exists, that the array converged, or that a real-axis pole was found.

## Exact response-only course-state patches

The Note above is the exact provisional lesson patch. Its leading notation section must be applied before the lesson content. Because the canonical indexes were not read, every new stable identity remains inert:

```markdown
## Code–theory map

- Code bridge state: Active
- Code Map ID: {{CODE_MAP_ID_PENDING}}
- Lesson ID: {{LESSON_ID_PENDING}}
- Immutable-anchor status: Unassigned — supplied excerpt; snapshot registration pending
- Temporary locator: complete visible mock pseudocode
- Execution record: {{RUN_ID_PENDING}} is inert; no Run record or execution evidence is claimed
- First unresolved implementation boundary: grid construction, `xi(k+q)` boundary handling, and actual saved output were not supplied
```

The learner statement is self-report rather than an unaided implementation demonstration:

```markdown
- Evidence ID: {{EVIDENCE_ID_PENDING}}
- Work shown without assistance: No observable attempt elicited
- Learner self-report: Can read the loops but does not understand their physical calculation
- Mastery level: level 0 — not yet demonstrated / insufficient evidence
- Remaining gap: Independently map each loop to the finite RPA polarization and identify the required grid-convergence checks
```

The atomic state replacement would be:

```markdown
## Exact resume point

- Last completed intermediate step: Provisional mapping from the supplied RPA equations to every pseudocode loop, array axis, unit, cutoff, regulator, and quadrature operation
- First unfinished implication: Verify the real grid generator, quadrature domain, `xi(k+q)` boundary behavior, and convergence data
- Current obstacle: Those implementation details and runtime artifacts were not supplied
- Active Code Map ID: {{CODE_MAP_ID_PENDING}}; no live link
- Latest Evidence ID: {{EVIDENCE_ID_PENDING}}; no live link
- Current mastery level: level 0 — not yet demonstrated / insufficient evidence
- Next action: Inspect the grid-generation and `xi` material, then run a controlled convergence matrix in $N_w$, momentum resolution, and decreasing positive $\kappa_{\mathrm{IR}}$
- Real-frequency boundary: No collective-mode claim until analytic continuation and separate validation are supplied
```

Canonical writeback is not complete.

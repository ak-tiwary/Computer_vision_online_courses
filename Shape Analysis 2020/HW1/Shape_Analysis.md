# **Shape Analysis (2020)**

These are my notes while learning the 2020 course Shape Analysis by Justin Solomon on Youtube. I try to expand on the math portions a bit.


## **Lecture 2: Linear and Variational Problems**

We would like an analogue of the directional derivative for functionals. A reasonable solution would be 
$$d\mathcal{F}[u; \psi] = \frac{d}{dh}\bigg\rvert_{h=0} \mathcal{F}[u + h\psi] $$ 
An application is the following optimization problem over a surface
 $$\min_{f} \int_\Omega \lvert\lvert v(x) - \nabla f(x) \rvert\rvert_2^2 dx = \min_{f} \mathcal{F}[f]$$ 
If $f$ is optimal, we should have 
 $$d\mathcal{F}[f;g] = \frac{d}{dh} \bigg\lvert_{h=0} \mathcal{F}[f + hg] = 0$$ 

Using the formula for $\mathcal{F}$ we have 

$$\frac{d}{dh}\bigg\lvert_{h=0} \int_\Omega \lvert\lvert v(x) - \nabla (f + hg)\rvert\rvert_2^2 dx = 0$$ 


We may switch the integral and the derivative to get 
$$\int_\Omega (v(x) - \nabla f(x) - hg(x)) \cdot \nabla g(x) dx\Bigg\lvert_{h=0} = 0$$
 So we have 
 $$\int_{\Omega} \left(v(x) - \nabla f(x) \right)\cdot \nabla g(x) dx = 0$$
 Let us denote the vector field $v - \nabla f$ by $X$. We are then considering $X \cdot \nabla g(x)$, but if we add the term $g \nabla \cdot X$ we have
  $$ \begin{align*} X \cdot \nabla g + g\nabla \cdot X &= X^i \frac{\partial g}{\partial x^i} + g\frac{\partial X^i}{\partial x^i} \\
  &= \frac{\partial}{\partial x^i} \left(X^i g\right) \\
  &= \verb|div| \,(gX) \end{align*}$$ So we may rewrite our equation above as
  $$  \int_\Omega \verb|div|\,(gX) dA - \int_\Omega g \,\verb|div|\, X dA = 0$$

  The divergence theorem states that
  $$ \int_{\Omega} \verb|div|(Y) \, dA = \int_{\partial \Omega} Y \cdot N ds$$ where $N$ is the unit outward pointing normal to the boundary and $dA$ and $ds$ are the canonical area and length forms associated to the usual Riemannian metric. So we have 
  $$
     \int_{\partial \Omega} g \left(v - \nabla f\right) \cdot N ds - \int_\Omega g\, \verb|div| \,(v - \nabla f) dA = 0
  $$ Here $g$ is an arbitrary smooth function and so we may choose small bump functions that vanish on the boundary to obtain that $\nabla \cdot v = \nabla \cdot \nabla f$ in the interior of $\Omega$. This is a Poisson equation. 

  ### **Lecture 2 (Extra): Gateaux derivatives, cubic splines**

Given the conditions $f(0) = a$, $f(1) = a$, $f'(0) = c$ and $f'(0) = d$ we would like to find a smooth function $f$ that satisfies these conditions. A reasonable smoothness condition is minimizing 
$$ E[f] = \int_{0}^1 \lvert f''(t)\rvert^2 dt$$ 
So we may phrase our optimization problem as 
$$ \min_{f : [0,1] \to \mathbb{R}} E[f]$$ where $f \in \mathcal{C}^\infty[0,1]$. Just like above, we consider minimizing the Gateaux derivative 
$$ \begin{align*} \mathcal{E}[f ; g] &= \frac{d}{dh} \bigg \lvert_{h=0} E[f + hg] \\&= \frac{d}{dh} \bigg\lvert_{h=0} \int_{0}^{1} \lvert (f + hg)''(t) \rvert^2 dt \\
&=  \int_{0}^{1} \frac{d}{dh} \left(f''(t) + hg''(t)\right)^2 dt  \Bigg \lvert_{h=0} \\
&= 2 \int_{0}^{1} \left(f'' + hg''\right)g''(t) dt \Bigg \lvert_{h=0} \\
\end{align*}$$ So we have 
$$ \int_{0}^{1} f''(t)g''(t) dt = 0$$ for any $g$. Using integration by parts twice, we get 
$$ [f''(t)g'(t)]_{0}^{1} - [f^{(3)}(t)g(t)]_{0}^{1} + \int_{0}^{1} f^{(4)}(t) g(t) = 0$$ By choosing $g$ to be appropriate bump functions that vanish on the boundary, we can ensure that the first two terms are zero and that the inside integral is non-zero on a sufficiently small range. In fact, for $f + hg$ to continue satisfying our desired conditions we have to have $g(0) = g(1) = g'(0) = g'(1) = 0$. This forces $f^{(4)}(t) = 0$ on the interior and so our optimal $f$ is a cubic polynomial (a spline).

## **Lecture 3: Differential Geometry of Smooth Curves**

We want to think about a curve as a set of points (shape) rather than a function (parameterization), but we will prefer to start by using a parameterization an arc-length parameterization $\gamma(s)$.

Let us consider curves in the plane. We then have $T(s) = \gamma'(s)$ is the unit tangent vector and $N(s) = \begin{bmatrix} 0 & -1 \\ 1 & 0 \end{bmatrix} T(s)$ is the unit normal chosen so that $\{T,N\}$ is positively oriented. Then we have $T'(s) = \kappa(s) N(s)$ where $\kappa(s)$ is the **curvature** of the curve at $\gamma(s)$. This means that since $N(s) = JT(s)$ where $J$ is the rotation matrix above, we have 
$$N'(s) = JT'(s) = \kappa(s) JJ T(s)= - \kappa(s) T(s)$$ Thus 
$$ \begin{pmatrix} T'(s) \\ N'(s) \end{pmatrix} = \begin{bmatrix}0 & \kappa(s) \\ -\kappa(s) & 0\end{bmatrix} \begin{pmatrix} T(s) \\ N(s)\end{pmatrix} $$ 
These formulas are called the *Frenet formulas*. 

The fundamental theorem of the local theory of plane curves states that $\kappa(s)$ determines a plane curve upto rigid motion. 

Let us outline the proof. First suppose that we have a function $\kappa(s)$, we can define 
$$\theta(s) = \int_{s_0}^s \kappa(s) ds$$ 
and then 
$$\gamma(s) = \left(\int_{s_0}^{s} \cos \theta(s) ds, \int_{s_0}^{s} \sin \theta(s) ds\right)$$ It can then easily be checked that $\gamma'(s) = \kappa(s)$. Since this is not of much relevance, we omit the details.

Now suppose that $\gamma$ and $\widetilde{\gamma}$ have the same curvature $\kappa(s)$. We will show that $\gamma$ and $\widetilde{\gamma}$ agree near some $s_0$. By translating and rotating $\widetilde{\gamma}$ we may assume that both curves have the same value $s_0$, as well as the same tangent and normal. This is possible since $\{T,N\}$ forms a positively oriented frame at a point. But then the system of ODEs 
$$\begin{pmatrix} \gamma' \\ T' \\ N' \end{pmatrix} = \begin{bmatrix} 0 & 1 & 0 \\ 0 & 0 & \kappa \\ 0 & - \kappa & 0\end{bmatrix}
 \begin{pmatrix} \gamma \\ T \\ N\end{pmatrix} $$ has both $\gamma$ and $\widetilde{\gamma}$ as solutions near $s_0$, and so they must agree near $s_0$ by the fundamental theorem of ODEs.

 Suppose we have a closed curve such that $\gamma(a) = \gamma(b)$ nad $\gamma'(a) = \gamma'(b)$. Then we define the winding number
  $$W[\gamma] = \frac{1}{2\pi} \int_{a}^{b} \kappa(s) ds$$ The winding number is an integer and is not affected by smoothly deforming $\gamma$.

 Now consider curves in 3D. In addition to the tangent and normal, we will need the *binormal* B(s) defined so that $\{T, N, B\}$ is an orthonormal frame. We will then have 
 $$ \begin{pmatrix} T'(s) \\ N'(s) \\ B'(s) \end{pmatrix} = \begin{bmatrix} 0 & \kappa(s) & 0 \\ -\kappa(s) & 0 & \tau(s) \\ 0 & -\tau(s) & 0 \end{bmatrix} \begin{pmatrix} T(s) \\ N(s) \\ K(s) \end{pmatrix}$$  
     
Let us demonstrate this. We will assume that $\gamma''(s) \neq 0$. Define $T(s) = \gamma'(s)$ so that $\lvert\lvert T\rvert\rvert = 1$. We may then define $N$ using the equation $T'(s) = \kappa(s) N(s)$ and requiring that $\kappa > 0$ and $\lvert\lvert N \rvert\rvert = 1$. Since $T$ has constant length, we will have $T \cdot N = 0$. We define $B = T \times N$ so that $\{T,N,B\}$ form a positively oriented orthonormal basis. 

Now we have $$N' = (N' \cdot T) T + (N' \cdot N) N + (N' \cdot B) B = (N' \cdot T) T  + (N' \cdot B) B$$ But $N' \cdot T = -N \cdot T' = -\kappa$ and we may define $N' \cdot B := \tau$ to get $$N' = - \kappa T + \tau B$$ We only need to identify $B'$. But we again have $$ B' = \left( B' \cdot T \right) T + \left( B' \cdot N \right) N + \left( B' \cdot B \right) B =  - \tau N$$

### **Lecture 3 (extra): The First Variation Formula**

The arc length of a curve $\gamma$ is given by $$ L[\gamma] = \int_{a}^{b}  \left\| \gamma'(t) \right\|  dt $$ Define $v(t) : (a,b) \to \mathbb{R}^2$ such that $v(a) = v(b) = 0$. We would like to compute $dL_\gamma [v]$. 

Define $\gamma_r(t) = \gamma(t) + rv(t)$ and $\ell(r) = L[\gamma_r]$. Then $\ell'(0) = d L_\gamma[v]$. We have $$ \frac{ d}{ dr} \int_{a}^{b} \left\| \gamma'_r(t) \right\|  dt = \int_{a}^{b} \frac{d}{dr} \left\| \gamma'_r(t) \right\|  dt    $$ Since we have $\frac{ d}{ dr} \left\| w(r) \right\| = \dfrac{ w \cdot w'}{ \left\| w \right\|_2  } $ and in our case we have $\frac{d}{dr}(\gamma' + rv') = v'$ we get $$ dL_\gamma[v]  = \int_{a}^{b} \frac{\gamma' \cdot v'}{\left\| \gamma' \right\| }   dt  = \int_{a}^{b} T \cdot v' dt $$ We integrate by parts, and we get $$\ell'(0) = dL_\gamma[v] = T(b) \cdot v(b) - T(a) \cdot v(a) - \int_{a}^{b} T'(t)\cdot v dt  $$ Thus we finally have $$dL_\gamma[v] = -\int_{a}^{b} \kappa(t) N(t) \cdot v(t) dt $$ This shows that flowing a curve along its curvature normal will lead to a "straightening" of the curve. This leads to the *curve shortening flow*.

## **Lecture 4: Discrete Curves**

Bezier curves are widely used but there rarely exist closed form solutions to associated quantities like the arc lengths of such curves. So we will consider the simpler notion of polyline approximations of curves. Polyline curves are not differentiable, so we consider both the discrete approximation to continuous theory as well as some formulation of the discrete theory on its own. 

A discrete analogue of the Gauss map for polylines can be defined by taking the edges as points (since the normal is constant on an edge) and the vertices as arcs (since the normal changes at a vertex). We can think of the turning angle at a vertex $\theta$ as an integral of the curvature in a dual cell associated to the vertex. The dual cell $\Gamma$ is formed from the pair of half line segments incident at the vertex. We have $\theta = \int_\Gamma \kappa ds$ and we may approximate the curvature using the formula $\kappa \approx \frac{\theta}{ \ell_1 + \ell_2} $$

Using this notation we have 
$$\int_\Gamma \kappa ds = \sum_i \int_{\Gamma_i} \kappa ds = \sum_I \theta_i = 2\pi$$ 


A SIGGRAPH 2008 paper came up with a theory of *framed curves* to come up with a suitable discrete theory of elastic rods (noodles, shoe laces). A framed curve has a frame of two orthogonal directions $m_1, m_2$ both perpendicular to the tangent $T$ of the curve. This is an alternate frame to the Frenet frame related to material directions along the curve. The normal of the curve will then encode the twisting of the rod. 

We may write 
$$ \kappa N = T' = (T' \cdot m_1) m_1 + (T' \cdot m_2) m_2 = \omega_1 m_1 + \omega_2 m_2  $$ and then the bending energy is
 $$E_{\text{bend}}(\Gamma) = \frac{1}{2} \int_{\Gamma}^{} \alpha \kappa^2 ds = \frac{ 1}{ 2} \int_{\Gamma}^{} \alpha(\omega_1^2 + \omega_2^2) ds $$ 

 In addition we want to penalize non-tangent chains in the material itself (twisting). So we also have an additional term depending on $m = m_1' \cdot m_2 = -m_1 \cdot m_2'$ $$E_{\text{twist}}(\Gamma) = \frac{ 1}{ 2} \int_{\Gamma}^{} \beta m^2  ds $$

 We will use the *Bishop frame* which is well defined even for straight lines. We specify a frame at a single point and look for the frame that twists the least with respect to the twisting energy defined above. For the Frenet frame the twisting energy is proportional to the squared torsion $\tau$.

 The most relaxed frame (which may be obtained by variational methods) satisfies

 $$ \begin{align*}
 T' &= \Omega \times T \\ u' &= \Omega \times u \\ v' &= \Omega \times v \\
 \Omega &:= \kappa B \\
 u' \cdot v &= 0
 \end{align*} $$ The material frame then satisfies 
 $$ \begin{align*}
 m_1 &= u \cos \theta + v \sin \theta \\
 m_2 &= -u \sin  \theta  + v \cos \theta 
 \end{align*} $$ 
 This means the twisting energy can also be expressed as 
 $$ E_{\text{twist}}(\Gamma) := \frac{1}{2} \int_{\Gamma}^{} \beta(\theta')^2 ds $$


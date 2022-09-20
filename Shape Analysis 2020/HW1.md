# **Homework 1: Discrete and Smooth Curves**


## **Problem 1.**

1.  We have a curve $\gamma : [0,1] \to \mathbb{R}^2$ and $s[\gamma]$ is the arc-length functional. Then $$ s[\gamma + hv] = \int_{0}^{1} \left\| \gamma' + h v' \right\|_2  dt$$ So $$\frac{ d}{ dh} s[\gamma + hv] \Bigg|_{h=0} = \int_{0}^{1} \frac{\gamma'(t) \cdot v'(t)}{\left\| \gamma'(t) \right\| } dt $$ 
   
2. Clear.
3. If $v(0) = v(1) = 0$ then by integrating by parts we get $$ds[\gamma ; v] = [T(t) \cdot v(t)]_{0}^{1} - \int_{0}^{1} T'(t) \cdot v(t)  dt $$ 
   
   Let $s(t) = \int_{0}^{t} \left\| \gamma'(u) \right\|  du$ and $t = h(s)$ be the inverse function. Then $dt =  h'(s) ds = \frac{ 1}{ \left\|\gamma'(h(s))\right\|} ds $ so our integral becomes $$ ds[\gamma; v] = -\int_{0}^{s(1)} \frac{1}{\left\| \gamma'(h(s)) \right\| } T'(h(s)) \cdot v(h(s)) ds $$ 

   Now let $\beta(s) = \gamma(h(s))$. Then our Frenet frame is defined in terms of beta. We have (<sub><sup> apologies for reusing $T$ again below, but the two quantities $T(h(s))$ and $T(s)$ agree as we see below </sub></sup>) $$T(s) = \beta'(s) = \gamma'(h(s)) \frac{1}{\left\| \gamma'(h(s)) \right\| } = T(h(s))$$ and   $$ \begin{align*}
   T'(s) &= \kappa (s) N(s)  \\ & = T'(h(s)) h'(s) \\
   &= T'(h(s)) \frac{1}{\left\| \gamma'(h(s)) \right\| } 
   \end{align*}   $$ Thus our integral finally becomes $$ ds[\gamma; v] = \int_{0}^{s(1)}-\kappa(s) N(s) \cdot v(h(s)) ds $$

## **Problem 2.**

1. Say we have $x_1, \ldots, x_n \in  \mathbb{R}^2$. Then the arc length functional is given by $s(x) = \sum_{i=2}^{n} \left\| x_i - x_{i-1} \right\| $.


2. We have $$\nabla_{x_i} s = \nabla_{x_i} \left(\left\| x_i - x_{i-1} \right\| + \left\| x_{i}  - x_{i+1}\right\|\right) $$ We have $$\left\| x - y \right\| = \sqrt{ \sum_i (x_i - y_i)^2}$$  so $$\frac{\partial}{\partial x_i} \left\| x-y \right\| = \frac{x_i-y_i}{ \left\| x-y \right\| } $$ Thus $\nabla_x \left\| x-y \right\|  = \frac{x-y}{\left\| x-y \right\| }$. This means $$\nabla_{x_i} s = \frac{x_i - x_{i-1}}{\left\| x_i - x_{i-1} \right\|} + \frac{ x_{i} - x_{i+1}}{ \left\| x_{i} - x_{i+1} \right\| }  $$ 
   
    If we have two unit vectors $u$ and $v$ then $$\left\| u + v \right\|^2 = \langle u+v,u+v\rangle = 2 + 2 u \cdot v = 2 + 2 \cos \alpha$$ where $\alpha$ is the angle between the two vectors. But we may then use the half angle formula for $1 + \cos \alpha = 2 \cos^2 \frac{\alpha}{2}$ to get $$\left\| u + v \right\| = 2 \left|\cos \frac{\alpha}{2}\right|$$ But the angle provided in the question is $\theta = \pi - \alpha$ so that $$\left\| u + v \right\| = 2 \left|\cos \frac{\alpha}{2}\right| = 2 \left| \cos \frac{\pi - \theta}{2} \right| = 2 \left|\sin \frac{\theta}{2}\right|$$ But the sine function is positive on this domain, and so  we are done.
3. 

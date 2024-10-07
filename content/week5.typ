#import "../template.typ": example, exercise
#import "../boxes.typ": definition
#import "../tags.typ": week, barron

== Continous Distributions

#exercise("4.1")[

  Lifetime in years has density

  $ f(x) = lr("{", size: #350%) #stack($k/x^4, x gt.eq 1$, 1em, $0, x < 1$) $

  Find $k$, the cdf and $P(X>2)$ 

  a) As f is a density we know

  $ 
  1 &= integral_(-oo)^(oo) f(x) dif x = integral_1^(oo) k/x^4 = k dot.op [ -1/3x^(-3)]_1^(oo) \
    &= k dot.op (0-(-1/3*1^(-3))) = k/3 <=> k=3
  $

  b) Find cdf

  $
  F(x) &= integral_(-oo)^(x) f(t) dif t = integral_1^(x) 3/t^4 dif t = [-t^(-3)]_1^x \
  &= -x^(-3)-(-1) = 1-x^(-3)
  $

  $
  F(x) = lr("{", size: #350%) #stack($1-x^(-3), x gt.eq 1$, 1em, $0, x<1$) 
  $

  c)
  $
  P(X>2) = 1-P(X lt.eq 2) = 1-F(2) = 1-(1-2^(-3)) = 2^(-3) = 1/8
  $
]

#pagebreak()

#exercise("4.5")[

  $X$ and $Y$ have the joint density

  $ f(x,y)=C(x^2+y), -1<x<1, 0<y<1 $

  a) Find C

  $
  1 &= integral_(-oo)^(oo) integral_(-oo)^(oo) C(x^2+y) dif y dif x = integral_(-1)^1 integral_0^1 C(x^2+y) dif y dif x \
    &= integral_(-1)^1 [ C(x^2y+1/2 y^2) ]_(y=0)^(y=1) dif x = integral_(-1)^1 C(x^2 + 1/2) dif x \
    &= C[1/3 x^3 + 1/2x]_(-1)^1 = C(1/3+1/2-(-1/3-1/2)) = 5/3 C => C=3/5
  $

  b) Marginal densities

  $
  f_X (x) = integral_0^1 f(x,y) dif y = 3/5 integral_0^1 (x^2 + y) dif y = 3/5 [x^2 y + 1/2 y^2]_0^1 = 3/5 (x^2+1/2)
  $

  $
  f_Y (y) &= integral_(-1)^1 f(x,y) dif x = 3/5 integral_(-1)^1 (x^2+y) dif x = 3/5 [1/3 x^3 + y x]_(-1)^1 \
  &= 3/5 (1/3+y-(-1/3-y)) = 3/5 (2/3+2y) = 2/5 + 6/5y
  $

  c)

  $
  P(X<0.6) &= integral_0^0.6 f_Y (y) dif y = integral_0^0.6 2/5 + 6/5 y dif y \
  &= [2/5 y + 6/10 y^2]_0^0.6 = 2/5 dot.op 3/5 + 6/10 dot.op (3/5)^2
  $

  $
  P(X<0.6|X<0.5) &= frac(P(Y<0.6 sect X <0.5), P(X<0.5)) \
  &= frac(integral_0^0.6 integral_0^0.5 f(x,y) dif x dif y, integral_(-1)^0.5 f_X (x) dif x)
  $

  Bonus: Find the expected value of $X$

  $
  E(X) &= integral_(-oo)^(oo) x f_X (x) dif x \
  &= integral_(-1)^1 x dot.op 3/5 (x^2 + 1/2) dif x = 3/5 integral_(-1)^1 x^3 + 1/2 x dif x \
  &= 3/5 [1/4 x^4 + 1/4 x^2]_(-1)^1 = 3/5 (1/4 + 1/4 - (1/4 + 1/4)) = 0
  $

]

#pagebreak()

== Parameter Estimation
#week("5") 
#barron("9.1")

#definition[
  An estimator $accent(Theta,hat)$ is #underline([unbiased]) for a parameter $Theta$ if $E(accent(Theta,hat)) = Theta #h(.2em) forall #h(.2em) Theta$
]

We can measure the bias of an estimator:

$ text("Bias")(accent(Theta,hat)) = E(accent(Theta,hat) - Theta) $

#example[
  Sample mean is an unbiased estimator of the population mean:

  $ E(accent(X,macron)) 
    &= E(frac(X_1+dots+X_n,n)) \
    &= frac(E(X_1)+dots+E(X_n),n) \
    &= frac(mu+dots+mu,n) = frac(n dot.op mu,n) = mu
  $
]

We estimate parameters of distributions using samples:

- method of moments (MoM)
- method of maximum likelihood (ML)

#definition[
  The k-th #underline([population moment]) is $mu_k = E(X^k)$.

  The k-th #underline([sample moment]) is $m_k = 1/n sum_(i=1)^n X^k$.

  This estimates $mu_k$ from the sample $(X_1,...,X_n)$.

  We see that the first sample moment is the sample mean $accent(X,macron)$.
]

#definition[
  For $k gt.eq 2$, the k-th #underline([population central moment]) is $mu'_k = E(X - mu_1)^k$.

  The k-th #underline([sample central moment]) $m'_k = 1/n sum_(i=1)^n (X_i - accent(X,macron))^k$ estimates $mu'_k$ from the sample $(X_1,...,X_n)$.
]

#pagebreak()

=== Method of Moments
#week("5") 
#barron("9.1.1")

Given a sample we know it comes from some family of distributions ${F(Theta)}$.

Use the MoM to choose the member of the family who has properties that are closest to our data.

$
y_1 &= m_1 \
y_2 &= m_2 \
&dots.h \
y_k &= m_k \
$


To estimate k parameters we equate the first k population moments with the corresponding sample moments.

#example[
  Poisson Distribution: Estimate $lambda$ with MoM

  For the poisson distribution we know:
  $ mu_1 = E(X) = lambda $

  We calculate the first sample moment:
  $ m_1 = 1/n sum X_i = accent(X,macron) $

  We must solve the system of equations
  $ mu_1 = m_1 <=> lambda = accent(X,macron) => accent(lambda,hat) = accent(X,macron) $
]

#example[
  Gamma distribution

  This distribution has two parameters $alpha$ and $lambda$.
  We have a sample which we can use to estimate $alpha$ and $lambda$.
  First we find the sample moments:

  $ 
  m_1 &= accent(X,macron) = 48.2333 \
  m_2 &= 1/n sum_(i=1)^n (X_i - accent(X,macron))^2 = 679.7122
  $

  We know for the gamma distribution:

  $
  mu_1 &= E(X) = alpha / lambda \
  mu_2 &= text("Var")(X) = alpha / lambda^2
  $

  We need to solve:
  $
  mu_1 = m_1 &<=> alpha / lambda = accent(X,macron) \ 
  mu_2 = m_2 &<=> alpha / lambda^2 = m'_2
  $

#pagebreak()

  We see that:
  $ 
  lambda accent(X,macron) = alpha = lambda^2 m'_2 <=> lambda = accent(X,macron)/m'_2
  $

  $
  accent(lambda,hat) &= m_1/m'_2 = accent(X,hat) / m'_2 = 48.2333/679.7122 = 0.0710 \
  accent(alpha,hat) &= accent(lambda,hat) m_1
  = accent(lambda,hat) accent(X,macron)
  = 0.0710 dot.op 48 2333 = 3.4227
  $

  The estimates are:

  $
  accent(alpha,hat)  &= accent(lambda,hat) dot.op m_1 = m_1^2/m'_2 \
  accent(lambda,hat) &= m_1 / m'_2
  $
]


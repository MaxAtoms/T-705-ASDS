#import "../template.typ": example
#import "../boxes.typ": definition
#import "../tags.typ": week, barron

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
    &= E(frac(X_1+...+X_n,n)) \
    &= frac(E(X_1)+...+E(X_n),n) \
    &= frac(mu+...+mu,n) = frac(n*mu,n) = mu
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

  We see that:
  $ 
  lambda accent(X,macron) = alpha = lambda^2 m'_2 <=> lambda = accent(X,macron)/m'_2
  $

  $
  accent(lambda,hat) &= m_1/m'_2 = accent(X,hat) / m'_2 = 48.2333/679.7122 = 0.0710 \
  accent(alpha,hat) &= accent(lambda,hat) m_1
  = accent(lambda,hat) accent(X,macron)
  = 0.0710 * 48 2333 = 3.4227
  $

  The estimates are:

  $
  accent(alpha,hat)  &= accent(lambda,hat) * m_1 = m_1^2/m'_2 \
  accent(lambda,hat) &= m_1 / m'_2
  $
]


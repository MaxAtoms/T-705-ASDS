#import "../template.typ": example, exercise
#import "../boxes.typ": definition
#import "../tags.typ": week, barron

=== Method of Maximum Likelihood

#week("7") #barron("9.1.2")

Assume we have observed a sample $(X_1, X_2, dots, X_n)$.
Find parameters of the distribution that maximize the probability that this sample occurs.

#definition[
  A maximum likelihood estimator is the parameter that maximizes the likelihood of the observed sample.

  *Discrete Random Variables:* Maximize the joint pmf of $P(X_1,dots,X_n)$.

  *Continous Random Variables:* Maximize the joint density $f(X_1,dots,X_n)$.
]

==== Discrete random variables

We have a sample $(X_1,dots,X_n)$ then the joint pmf is:
$
P(accent(X, arrow) = (X_1,dots,X_n)) = P(accent(X, arrow)) = P(X_1,dots,X_n) = P(X_1) dot.op dots dot.op P(X_n)
$

Because $accent(X, arrow)$ is a simple random sample the $X_i$ are independent.

Find critical values by taking the derivative w.r.t. all parameters of the distribution and equating them to $0$.

First we take the log of the joint pmf (Because log is a non-decreasing function):

$ 
ln(P(accent(X, arrow))) 
&= ln(P(X_1) dot.op dots dot.op P(X_n)) \
&= ln P(X_1)+dots+ln P(X_n) \ 
&= sum_(i=1)^n ln P(X_i)
$

#example[
  Poission Distribution

  The possion distribution has pmf $P(x) = e^(-lambda) (lambda^x/x!)$.
  We want to estimate $lambda$.

  The logarithm of the pmf is

  $ 
  ln P(x) &= ln(e^(-lambda) (lambda^x/x!)) \
  &= -lambda + x ln(lambda) - ln(x!)
  $

  So we have to maximize:

  $
  ln P(accent(X, arrow)) 
  &= sum_(i=1)^n ln P(x) \
  &= sum_(i=1)^n (-lambda + X_i ln(lambda) - lambda(x!)) \
  &= -n lambda + ln lambda sum_(i=1)^n X_i + C
  $

  Next we find the derivative with respect to $lambda$:

  $
  diff/(diff lambda) ln(P(accent(X, arrow)))
  &= diff/(diff lambda) (-n lambda + ln(lambda) sum_(i=1)^n X_i + C) \
  &= -n + 1/lambda sum_(i=1)^n X_i + 0 = 0
  $

  Solve for $lambda$:

  $
  -n + 1/lambda sum_(i=1)^n x_i = 0 <=> 1/lambda sum_(i=1)^n x_i = n
  <=> lambda = 1/n (sum_(i=1)^n x_i) = accent(X, macron)
  $

  The Maximum Likelihood estimator of $lambda$ is $accent(lambda,hat) = accent(X, macron)$.
]

==== Continous random variables

ML method maximizes the probability of $X=x$.
We know that for continous distributions 
$ P(x-h < X < x+h) = integral_(x-h)^(x+h) f(y) dif y approx 2h dot.op f(x) $
Probability of observing a value close to $x$ is proportional to $f(x)$.
We can use #underline("the same method").

#example[
Exponential Distribution

The exponential distribution has pdf $f(x) = lambda e^(-lambda x)$.
We want to find the ML estimator of $lambda$.
First we find the log-likelihood:
$ ln f(accent(X, arrow)) &= sum_(i=1)^n ln (lambda e^(-lambda x_i)) \
&= sum_(i=1)^n (ln lambda - lambda x_i) \
&= n ln lambda - lambda sum_(i=1)^n x_i $
]

Find the derivative w.r.t. $lambda$.

$
dif / (dif lambda) ln f(accent(X, arrow)) = dif / (dif lambda) n ln lambda - lambda sum_(i=1)^n X_i = n / lambda - sum_(i=1)^n X_i
$

Solve:

$
0 = n/lambda - sum_(i=1)^n X_i <=> lambda = n / (sum_(i=1)^n) = 1/accent(X, macron)
$

#exercise("9.2")[

Estimate $p$ in Geometrical distribution given a sample of 3,7,5,3,2.

a) MoM: One parameter $p$ so we only need one moment.

  The first population moment:
  $mu_1 = E(X) = 1/p$

  The first sample moment:
  $m_1 = accent(X, macron)$

  We need to solve:
  $ mu_1 = m_1 <=> 1/p = accent(X, macron) <=> accent(p, hat) = 1/accent(X, macron) = 1/4 $

  b) ML:
  The pmf is $P(X) = p (1-p)^(X-1)$.

  The log-likelihood function is:

  $ 
  ln P(accent(X, arrow)) &= ln (product_(i=1)^n p(1-p)^(x-1)) \
  &= sum_(i=1)^n ln (p (1-p)^(x-1)) \
  &= sum_(i=1)^n ln(p) + (x-1) ln (1-p) \
  &= n ln(p) + ln(1-p) sum_(i=1)^n (x_i - 1)
  $
  
  Find derivative w.r.t. $p$ (note that $dif / (dif x) ln(x) = 1/x$:

  $
  0 &= d / (d p) n ln(p) + ln(1-p) sum_(i=1)^n x_i - 1 \
    &= n / p - (sum_(i=1)^n (x_i - 1)) / (1 - p)
  $

  Solve for p:

  $
  0 &= n / p - (sum (x_i - 1)) / (1 - p) \
  &<=> n (1 - p) = p (sum (X_i - 1)) \
  &<=> p = 1/accent(X, macron), accent(p, hat) = 1/accent(X, macron) = 1/4
  $
]

#exercise("9.5 a)")[

  Find MoM of $theta$:
  $1/2 (1/theta e^(-x / theta) + 1/10 e^(-x/10))$, $0 < x < oo$

  $
  mu_1 &= E(accent(X, macron)) = integral_theta^oo x f(x) dif x
  &= integral_theta^oo x/2 (1/theta e^(-x/theta) + 1/10 e^(-x/10)) dif x = dots = theta + 5
  $

  $
  mu_1 = m_1 <=> theta + 5 = accent(X, macron) <=> accent(theta, hat) = accent(X, macron) - 5 = 150/10 - 5 = 10
  $
]


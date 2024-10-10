#import "../template.typ": example, exercise
#import "../boxes.typ": definition
#import "../tags.typ": week, barron

= Statistics

== Inferences about variances

#week("8") #barron("9.5")

Confidence Intervals & Hypothesis Tests for
- population variance: $sigma^2=text("Var")(X)$
- comparison of two variances $sigma_X^2$ and $sigma_Y^2$

== Variance estimator and $chi^2$-Distribution

We estimate a population variance $sigma^2$ from a sample $X=(X_1,dots,X_n)$ with

$
s^2 = 1/(n-1) sum_n^(i=1) (X_i - X)^2
$

The sample variance $s^2$ is unbiased and consistent.

Note that the differences $X_i - accent(X,macron)$ are not independent!

When $X_1,dots,X_n$ are independent and Normaly distributed, with $text("Var")(X_i)=sigma^2$

$
((n-1)s^2) / sigma^2 ~ chi_((n-1))^2
$

is Chi-squared distribution with $(n-1)$ degrees of freedom.

$chi^2$ is a continous distribution with density

$
f(x) = 1 / (2^(nu \/ 2) Gamma (nu \/ 2)) x^(nu\/2-1) e^(-x\/2)
$

with expected value $E(X)=nu$ and variance $text("Var")(X)=2 nu$

== Confidence Interval for $sigma^2$

Let us construct a $(1-alpha) 100%$ Confidence Interval for $sigma^2$.
Assume sample size $n$. We start with the estimator $s^2$.
We need to find critical values from $chi_(n-1)^2$-dist such that $1-alpha$ is "in the middle".

So 
$
1-alpha &= P(chi_(1-alpha/2)^2 < ((n-1)s^2) / sigma^2 < chi_(alpha/2)^2) \
&= P(((n-1)s^2) / (chi^2_(alpha/2)) < sigma^2 < ((n-1)s^2) / chi^2_(1-alpha/2))
$ 

Therefore a $(1-alpha) 100%$ CI for $sigma^2$ is

$
[ ((n-1)s^2) / chi^2_(alpha/2); ((n-1)s^2) / chi^2_(1-alpha/2) ]
$

And a CI for $sigma$ is

$
[ sqrt(((n-1)s^2) / chi^2_(alpha/2)); sqrt(((n-1)s^2) / chi^2_(1-alpha/2)) ]
$

== Testing variances

It is useful to test properties of variances:
- uncertainty, risk, stability
- we want to be sure that they are not too big

=== Level $alpha$ test for $sigma^2$

To test the null hypothesis
$H_0: sigma^2 = sigma^2_o$
we use the test statistic
$chi_text("obs")^2 = ((n-1)s^2) / (sigma_o^2) ~ chi^2$
with $n-1$ degrees of freedom.

Where the alternative hypothesis can be:

1) Right sided

$H_A: sigma^2 > sigma^2_o$,
reject $H_0$ if $chi_text("obs")^2 > chi_alpha^2$

2) Left sided

$H_A: sigma^2 < sigma^2_o$,
reject $H_0$ if $chi_text("obs")^2 < chi_(1-alpha)^2$

3) Two-sided

$H_A: sigma^2 eq.not sigma^2_o$,
reject $H_0$ if $chi_text("obs")^2 gt.eq chi_(alpha\/2)^2$
or $chi_text("obs")^2 lt.eq chi_(1-alpha\/2)^2$

=== Using p-Values instead

1) Right sided

$p = P(chi^2 gt chi^2_text("obs")) = 1 - P(chi^2 lt.eq chi^2_text("obs")) = 1 - F(chi^2_text("obs"))$
where $F$ is the cdf of $chi^2$\~dist

2) Left sided

$p = P(chi^2 lt.eq chi^2_text("obs")) = F(chi^2_text("obs"))$

3) Two-sided

p-Value corresponds to the highest significance level $alpha$ that yields an acceptance of $H_0$.
In this two-sided case we must consider both the upper #underline("and") lower bound.

upper: $p = alpha = 2 dot.op alpha/2 = 2P(chi^2 gt.eq X_text("obs")^2) = 2(1-F(chi_text("obs")^2))$

lower: $p = alpha = 2 dot.op alpha/2 = 2P(chi^2 lt X_text("obs")^2) = 2 dot.op F(chi_text("obs")^2)$

$=> p = 2 dot.op text("min")(1-F(chi_text("obs")^2);F(chi^2_text("obs")))$ 

== Comparing two variances

Assume we have two independent samples:

$
accent(X, arrow) = (X_1,dots,X_n)\
accent(Y, arrow) = (Y_1,dots,Y_n)
$

We want to compare $sigma_X^2$ with $sigma_Y^2$.

Because $sigma^2$ is a scale parameter (not location like $mu$)
we look at the ratio between $sigma_X^2$ and $sigma_Y^2$.
That is the param $Theta = sigma_X^2 / sigma_Y^2$ (\*).

Often we are interested to know whether $sigma_X^2 = sigma_Y^2$.
In which case
$Theta = sigma_X^2 / sigma_Y^2 = 1$.

To estimate the ratio in (\*) we use the entities we know already:

$ accent(Theta, hat) = S_X^2 / S_Y^2 ~ F(n-1, m-1) $

For independent $(X_1,dots,X_n)$ from $X_i~N(mu_x, sigma_x)$
and $(Y_1,dots,Y_n)$ from $Y_i~N(mu_y, sigma_y)$
the standard ratio of the variances is:

$
F= (s_X^2 \/ sigma_X^2) / (s_Y^2 \/ sigma_Y^2) ~ F(n-1, m-1) 
$

What we know about the $F$-dist:

i) We know that $s_X^2 / sigma_X^2~chi^2 (n-1)$ and $s_Y^2 / sigma_Y^2~chi^2 (m-1)$
so the $F$-dist is a ratio of two $chi^2$-dist.

ii) $F$ is non-negative and continous

iii) $sigma_X^2 / sigma_Y^2 = 1/(sigma_Y^2 \/ sigma_X^2)$ so if
$F ~ F(n-1, m-1)$ then $1/F~F(m-1, n-1)$

// TODO: Graphics
// TODO CI for the ratio of population variances

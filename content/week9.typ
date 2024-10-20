#import "../template.typ": example, exercise
#import "../boxes.typ": colorbox, definition
#import "../tags.typ": week, barron

#line(length: 100%)
#week("9")

== Confidence interval for the ratio of two population variances

#barron("9.5.5")

$ [ (s_X^2) / (s_Y^2 dot.op F_(alpha / 2) (n-1, m-1)), (s_X^2) / (s_Y^2 dot.op F_(1-alpha / 2) (n-1, m-1))] $

== F-test to compare two variances

#barron("9.5.6")

The null hypothesis about the ratio of two variances is

$H_0: sigma_X^2 = sigma_Y^2$ or $H_0: sigma_X^2 / sigma_Y^2 = 1$

The test statistic is:

$
F=(s_X^2\/s_Y^2)/(Theta_text("obs")) = s_X^2/s_Y^2
$

Under $H_0$ it equals:

$ F =(s_X^2\/sigma_X^2)/(s_Y^2\/sigma_Y^2) ~ F(n-m, m-1) $

The alternative hyp.

+ Right side: $ H_A: sigma_X^2/sigma_Y^2 > 1$: reject if $F_alpha < F_text("obs")$

+ Left side: $ H_A: sigma_X^2/sigma_Y^2 < 1$: reject if $F_(1-alpha) > F_text("obs")$

+ two-side: $ H_A: sigma_X^2/sigma_Y^2 eq.not 1$: reject if $F_(alpha/2) < F_text("obs")$ or $F_(1-alpha/2) > F_text("obs")$

#example(number: "9.44 & 9.49")[
  Conversative investment:
  2 funds, one is 10% higher volatility.\
  Is one fund more risky than the other?

  We are asked to test the hypothesis $H_0: sigma_x = sigma_y$ vs $H_A: sigma_x > sigma_y$.

  Given the data collected over 30 days we measure $s_X / s_Y = 1.1$.

  We can do an F-test:

  $F_text("obs") = S_X^2 / S_Y^2 = (S_X/S_Y)^2 = 1.21$

  Find the p-value of this right sided test

  From table: $alpha=0.25$, $p=1.28$

  We accept $H_0$. There is no evidence to support the claim that the fund is more risky.
]

Every statistical test has its assumptions. Our conclusions are only valid if the assumptions hold.

For F-tests:
1. Data are normally distributed $->$ not necessarily
2. Independent and identically distributed (iid) within each sample
3. Independence of the two samples

F-test is a robust test (i.e. mild departure from assumptions will not affect outcome).

#exercise("9.23")[
  Anthony and Eric

  $accent(A, macron)=85$
  $S_A^2=162.8$
  $n=m=6$
  $accent(E, macron) = 80$
  $S_E^2=10.4$
  $alpha=0.05$

#enum(numbering: "a)",
  enum.item[
  1. $H_0: mu_A = mu_E$ vs $H_A: mu_A > mu_E$

  To test this, we need to check if the population variances are equal.

  #colorbox(title: "Side Step")[
  1. $H_0: sigma_A^2 = sigma_E^2 text("vs") H_A: sigma_A^2 eq.not sigma_E^2 <=> H_0 = sigma_A^2 / sigma_E^2 = 1 text("vs") H_0 = sigma_A^2 / sigma_E^2 eq.not 1$

  2. Find test stat.:
  $F_text("obs") = S_A^2 / S_E^2 = 162.8 / 10.4 = 15.65$

  3. From the table we get: p-Value is $p<0.005$
  For $alpha/2 = 0.01$

  $F_0.01 = 11$
  $F_0.05 = 14.9$
  $F_0.001 = 298$

  We reject $H_0$, the variances are not equal.
  ]

  2. Find the test stat.

  $ t = (accent(A, macron) - accent(E, macron) - 0) / (sqrt(s_A^2 / n + s_E^2 / m)) = 0.931 $

  3. Find p-Value

  But first we need the d.f.
  We use the satterthwait approximation (Eq. 9.12)

  $ nu = (s_A^2 / n + s_E^2 / m)^2 / (s_A^4 / (n^2 (n-1)) + s_E^4 / (m^2 (m-1))) = 6 $

  We use the t-dist with 6 d.f.

  The critical value is $t_(alpha/2) = 2.447 > t$.

  We accept $H_0$, A ist not a better student than E.
  ],

  enum.item[

  #enum(numbering: "i)",

    enum.item[$ H_0: sigma_E^2 = sigma_A^2 text("vs") H_A: sigma_E^2 < sigma_A^2
    <=> H_0: sigma_A^2 / sigma_E^2 = 1 text("vs") H_A: sigma_A^2 / sigma_E^2 > 1$],

    enum.item[
    $ F_text("obs") = s_A^2 / s_E^2 = 162.8 / 10.4 = 15.65 $],
    enum.item[The p-Value is $0.001 < p < 0.005$]
    )

  We do reject, Eric is better than Anthony.
  ])
]

#pagebreak()

== Testing a family of distributions

#barron("10.1.2")

We can do a $chi^2$ goodness of fit test #underline("also") when we do not know the values of the parameters.

Given a sample of observations $X_1,dots,X_n~F$ where $F in frak(F)$, a family of distributions.

We test: $H_0: F in frak(F)$ vs $H_A: F in.not frak(F)$

Here $Theta$ is not given. We need to estimate it via the Method of Maximum Likelihood.

#definition[*Goodness of fit procedure*

1. Find ML estimator $accent(theta, hat)$ and consider the distribution $F(accent(Theta,hat))$

2. Partition the support of $F(accent(Theta, hat))$ into N bins.
  $B_1,B_2,dots,B_N$ where $N in [5,8]$

3. Compute probability $p_k = P(X in B_k), k=1,dots,N$
4. Compute $text("obs")(k)$ for data, $text("exp")(k) = n dot.op p_k$
5. Calculate $chi^2$-test statistic and p-value
$text("d.f.") = N - 1 = d$ where d is the number of parameters
]

#import "../template.typ": example, exercise
#import "../boxes.typ": colorbox, definition
#import "../tags.typ": week, barron

== Non-parametric tests

#barron("9.2")

Parametric tests are designed for a specific family of distributions.
Non-parametric tests #underline("do not") assume a specific distribution.
They are:

- less powerfull
- applicable to a wider range of situations

*Examples:*

- _Battery lives:_ Is the normal distribution assumption valid? We see that the sample size is too small to test normality
- _Outliers in the data:_ We know that the mean is sensitive to outliers which could greatly impact the test statistic
- _Data from surveys:_ Asking people to rank satisfaction on a scale (e.g. 'stronly agree', 'agree', 'neutral', 'disagree', 'strongly disagree'). We can not assign numbers to this directly. Similarly: Levels of education, Ranks, Intervals, ...

#definition[
  Data that can be ordered from lowest to highest without numeric values is called #underline("ordinal data").
]

=== Sign test

The sign test is a test for one population.
It tests the hypothesis

$H_0: M=m #text("vs") H_A: M eq.not m #text("or") M < m #text("or") M > m$

for a population median.

We are testing whether exactly half of the population is below/above $m$.

=== Sign test procedure

1. Count how many observations are above $m$
$S_#text("obs") = S(X_1,dots,X_n) = \#{i: X_i > m}$

2. If $H_0$ is true then $m$ is the median $M$.
In this case each $X_i$ is equally likely to be above or below $m$.
Therefore: 
$ S~text("Binomial")(n, p=1/2) $

3. If n is small, we use the binomial distribution to compute p-value.
If n is large we use normal approximation: 
$ S~text("Norm")(n/2, sqrt(n)/2) $

*For the p-value:*

- right tail test: $p = P(S gt.eq S_text("obs"))$
- left tail test: $p = P(S lt.eq S_text("obs"))$
- two tail test: $p = 2 dot.op text("min")( P(S lt.eq S_text("obs")), P(S gt.eq S_text("obs")))$

#example(number: "10.9 Keystrokes")[
  Figure 10.1 shows clearly that the keystrokes data is not normal. 
  We apply the sign-test instead.
  
  1. $H_0: M=0.2 text("vs") H_A: M eq.not 0.2$
  2. Find the test stat.

  0.24, 0.22, 0.26, 0.34, 0.35, 0.32, 0.33, 0.29, 0.19, 0.36, 0.30, 0.15, 0.17, 0.28, 0.30, 0.40, 0.37, 0.27

  $ S_text("obs") \#{i: X_i > m = 0.2} = 15 $

  3. We have a two-tail test so the p-value is:

  $ 
  p &=2 dot.op text("min")(P(S lt.eq S_text("obs")), P(S gt.eq S_text("obs")))
    &=2 dot.op text("min")(0.0038, 0.9993) = 0.0076
  $

  4. Reject $H_0$. We have enough evidence to support the claim of unauthorized use.
]

=== Wilcoxon signed-rank test

#barron("10.2.2")

We can use some of the unused information in the sign test.
Take magnitude into account.

#definition[
  #underline("Rank") of any unit of a sample is its position whn the sample is arranged in increasing order (smallest to highest).
]

In a sample of size $n$, the smallest unit has rank 1, second smallest has rank 2,..., and the largest has rank $n$.
If two or more observations are equal, their rank is replaced by their average rank.

$R_i$ is the rank of the i-th observation.

#example[
  3 7 5   6 5   4 \
  1 6 3.5 5 3.5 2

  3+4/2 = 3.5

  $R_1 = 1$
  $R_2 = 6$
  $R_3 = 3.5$
  $R_4 = 5$
  $R_5 = 3.5$
  $R_6 = 2$
]

=== Wilcoxon signed-rank test procedure

We test the hypothesis

$ H_0: M = m text("vs") H_A: M eq.not m text("or") M < m text("or") M > m $

1. Look at the distances between observations and $m$.
//$ d_i = abs([$X_i - m$]) $
$ d_i = |X_i - m| $

2. Order the distances $d_i$ and compute their rank (ranks of $d_i$).

3. Look at the ranks that correspond to $X_i > m$.
And compute the test statistic:

$ W = sum_(i:X_i > m) R_i $

4. The null distribution is
For $n gt.eq 15$:

$ N approx text("Norm")(n(n+1)/4, sqrt((n(n+1)(2n+1))/24))$

We assume that $X_i$ have a continous and symmetric distribution.

#example(number:"10.12 Supply and demand")[
  7, 5.5, 9.5, 6, 3.5, 9

  1. $H_0: M = 5 text("vs") H_A: M > 5 $

  2.

#table(
  columns: 6,
  [$i$], [$X_i$], [$X_i - 5$], [$d_i$], [$R_i$], [sign(w.r.t. 5)],
  [1], [7], [2], [2], [4], [+],
  [2], [5.5], [0.5], [0.5], [1], [+],
  [3], [9.5], [4.5], [4.5], [6], [+],
  [4], [6], [1], [1], [2], [+],
  [5], [3.5], [-1.5], [1.5], [3], [+],
  [6], [9], [4], [4], [5], [+],
)

  Finding the test statistic:

  $
  W_text("obs") = sum_(i: X_i > m) R_i = 4+1+6+2+5 = 18
  $

  3. $W_text("obs")~text("Norm")((6 dot.op 7)/4, sqrt((6 dot.op 7 dot.op 13)/24))$

  $p = P(W_text("obs")) = P((18 - 21/2)/sqrt(22.75) > z) = P(1.57 > z) = 1 - 0.9418 = 0.0592$

  Do not reject because $p > alpha = 0.05$
]


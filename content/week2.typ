#import "../template.typ": note, example
#import "../boxes.typ": definition
#import "../tags.typ": week, barron

== Joint distributions and marginal distributions

#week("2")
#barron("3.2.1")

#definition[
  If $X$ and $Y$ are random variables, then the pair $(X,Y)$ is called a joint distribution of $X,Y$.
  Individual distributions of $X$ and $Y$ are called marginal distributions.
]

#note[

- All concepts can be extended to a vector of random variables \
  (i.e. $(X_1, X_2,...,X_n)$)
- The joint distribution is a collection of probabilities for the vector $(X, Y)$ to take the value $(x,y)$
- Two vectors are equal, i.e. $(X,Y) = (x,y)$, if $X = x$ and $Y = y$

#pagebreak()

- The joint probability mass function of $X$ and $Y$ is: 
  $ P(x,y) = P{(X,Y) = (x,y)} = P(X=x sect Y=y) $
- Since the events ${(X,Y) = (x,y)}$ are exhaustive and mutually exclusive, we have $ sum_(x) sum_(y) P(x,y) = 1 $
]

#strong("Addition Rule")

The marginal probability mass functions of $X$ and $Y$ can be obtained from the joint pmf: 

$ P_X (x) = P{X = x} = sum_y P_((X,Y))(x,y) $
$ P_X (y) = P{Y = y} = sum_x P_((X,Y))(x,y) $

#example[
  - Throw a coin: $X: "#heads"$
  - Roll a die: Value of the die

  #columns(2, gutter: 11pt)[

  #figure(
    caption: "Joint pmf",
    table(
      columns: (auto, auto, auto, auto, auto),
      table.vline(x: 2, start: 0),
      table.vline(x: 4, start: 0),
      inset: 10pt,
      align: horizon,
      [], [], table.cell(colspan: 2)[$X$], [],
      [], [], [$0$], [$1$], [$P_X (x)$],
      table.hline(start: 0),
      table.cell(rowspan: 6, align: horizon)[$Y$],
      [$1$], [$frac(1,12)$], [$frac(1,12)$], [$frac(1,6)$],
      [$2$], [$frac(1,12)$], [$frac(1,12)$], [$frac(1,6)$],
      [$3$], [$frac(1,12)$], [$frac(1,12)$], [$frac(1,6)$],
      [$4$], [$frac(1,12)$], [$frac(1,12)$], [$frac(1,6)$],
      [$5$], [$frac(1,12)$], [$frac(1,12)$], [$frac(1,6)$],
      [$6$], [$frac(1,12)$], [$frac(1,12)$], [$frac(1,6)$],
      table.hline(start: 0),
      [], [$P_Y (y)$], [$frac(1,2)$], [$frac(1,2)$], [$1$]
    )
  )

  #colbreak()
  
  #v(1em)
  
  #figure(
    caption: [Marginal pmf of $X$],
    table(
      columns: (auto, auto, auto),
      table.vline(x: 1),
      inset: 10pt,
      align: horizon,
      [$X$], [$0$], [$1$],
      table.hline(),
      [$P_X (x)$], [$0.5$], [$0.5$],
    )
  )

  #v(1em)
  
  #figure(
    caption: [Marginal pmf of $Y$],
    table(
      columns: (auto, auto, auto, auto, auto, auto, auto),
      table.vline(x: 1),
      inset: 10pt,
      align: horizon,
      [$Y$], [$1$], [$2$], [$3$], [$4$], [$5$], [$6$],
      table.hline(),
      [$P_Y (y)$], [$frac(1,6)$], [$frac(1,6)$],[$frac(1,6)$],[$frac(1,6)$],[$frac(1,6)$],[$frac(1,6)$],
    )
  )
]

]

#pagebreak()

== Independence of random variables

#week("2")
#barron("3.2.2")

#definition[
  Random variables $X$ and $Y$ are independent if 
  $ P(x, y) = P_((X,Y))(x,y) = P_X (x) P_Y (y) #h(.2em) forall #h(.2em) x,y $
]

#example[
  A program with two modules.
  The number of errors $X$ in $M_1$ and number of errors $Y$ in $M_2$ have a joint distribution:

  
  - $P(0,0) = P(0,1) = P(1,0) = 0.2$
  - $P(1,1) = P(1,2) = P(1,3) = 0.1$
  - $P(0,2) = P(0,3) = 0.05$

  #set enum(numbering: "a)")

  + Find the marginal pmf of $X$ and $Y$

    #figure(caption: [Marginal pmf of $X$ and $Y$],
      table(
        columns: (auto, auto, auto, auto, auto, auto, auto),
        table.vline(x: 2, start: 0),
        table.vline(x: 6, start: 0),
        [], [], table.cell(colspan: 4, [$Y$]), [],
        [], [], [$0$], [$1$], [$2$], [$3$], [$P_X (x)$],
        table.hline(start: 0),
        table.cell(rowspan: 2, align: horizon, $X$), [$0$], [$0.2$], [$0.2$], [$0.05$], [$0.05$], [$0.5$],
        [$1$], [$0.2$], [$0.1$], [$0.1$], [$0.1$], [$0.5$],
        table.hline(start: 0),
        [], [$P_Y (y)$], [$0.4$], [$0.3$], [$0.15$], [$0.15$], [$1.0$],
      )
    )
  
  + Find the probability of no errors in the first module

    $ P_X (0) = 0.5 $
  
  + Find the distribution of the total number of errors in the program

    Let $Z = X + Y$ be the total number of errors.
    Distribution of $Z$:

    $ P_Z (0) &= P_Z (X + Y = 0) = P_Z (X = 0 sect Y = 0) = P_((X,Y)) (0,0) = 0.2 \
     P_Z (1) &= P_Z (X = 1 sect Y = 0) + P_Z (X = 0 sect Y = 1) = 0.2 + 0.2 = 0.4 \
     P_Z (2) &= P(0,2) + P(1,1) = 0.15 \
     P_Z (3) &= P(0,3) + P(1,2) = 0.15 \
     P_Z (4) &= P(1,3) = 0.1 $

    #figure(
      caption: [pmf of $Z$], 
      table(
        table.vline(x: 1),
        columns: (auto, auto, auto, auto, auto, auto),
        [$Z$], [$0$], [$1$], [$2$], [$3$], [$4$],
        table.hline(),
        [$P(Z)$], [$0.2$], [$0.4$], [$0.15$], [$0.15$], [$0.1$],
      )
    )

  + Find out if the errors in $M_1$ and $M_2$ occur independently

#pagebreak()
  
    Counterexample:
    $ P_((X,Y)) (0,1) &= 0.2 \
      P_X (0) P_Y (1) &= 0.5 * 0.3 = 0.15 \
      P_((X,Y)) (0,1) &eq.not P_X (0) P_Y (1) $
]

== Expectation of a function

#week("2")
#barron("3.3.2")

$ mu = E(X) = sum_x x P(X) $

If $Y$ is a random variable is a function of another random variable $X$, so that $Y=g(x)$ then the expected value of $Y$ is

$ E(Y) = E(g(X)) = sum_x g(x) P(x) $

#example[
  Store selling computers. They make 1,000 in profit for every sold computer, but they have operational cost of 2,000 per month.

  #figure(
    caption: "",
    table(
    columns: (auto, auto, auto, auto),
    table.vline(x:1),
    [$X$], [$8$], [$9$], [$10$],
    table.hline(),
    [$P(X)$], [$0.35$], [$0.45$], [$0.2$],
    )
  )
  
  What is the expected profit?

  The random variable for profit is $Y = 1000 * X - 2000$.

  $ 
    E(Y) = sum_x g(x) P(X) = sum_x (1000x - 2000) * P(X) \
    = (1000 * 8 - 2000) * 0.35 + ... + (1000 * 10 - 2000) * 0.2 \
    = 6850
  $
]

#note[
  - For any random variable $X$ and $Y$ and any $a, b, c in RR$:
    $ E(a X + b Y + c) = a E(X) + b E(Y) + c $
  - For $X$ and $Y$ independent:
    $ E(X Y) = E(X) E(Y) $
]

#example[
  In the two module problem:

  $ E(X) = 0 * 1/2 + 1 * 1/2 = 0.5 $
  $ E(Y) = 0 * 0.04 + 1 * 0.3 + 2 * 0.15 + 3 * 0.15 = 1.05 $
  $ E(Z) = E(X+Y) = E(X) + E(Y) =  0.5 + 1.05 = 1.55 $
]

#pagebreak()

== Chebyshev's inequality

#week("2")
#barron("3.3.7")

If we know $mu$ and $sigma$ of a random variable, then we can find the range where most of its values lie.

Let $X$ be a random variable with expected $mu = E(X)$ and variance $sigma^2 = "Var"(X)$ then $P{|X - mu| > epsilon} <= (sigma / epsilon)^2 )$ for $epsilon > 0$.

Chebyshev's Inequality says that $X in [mu - epsilon, mu + epsilon] $ with a probability pf at least \ 
$1-(sigma / epsilon)^2$.
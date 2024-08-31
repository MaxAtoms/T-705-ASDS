#import "../template.typ": example
#import "../tags.typ": week, barron

== Applications in reliability 
#week("1") 
#barron("2.2.3")

Calculation of the probability of events is often used in reliability.
Probability for a system composed of several components to be functional:

- *Parallel connection:* It is enough for at least one component to be functional
  $ P("OK") = P("at least one component OK") = 1 - P("all components fail") $
  
- *Sequence connection:* Failure of one component causes the whole system to fail
  $ P("OK") = P("all components OK") $

#example[
  All systems have a reliability of 0.92 and are independent.

  #import "fletcher-reliability.typ": reliabilityExample
  #figure(reliabilityExample)

  $ P(F) &= P("A and B ok") = P(A) * P(B) = 0.8464 \
   P(G) &= P("Either D or E work") = 1 - P("E and D fail") = 1 - (1-0.92)^2 = 0.9936 \
   P(H) &= P(C sect G) = P(C) * P(G) = 0.92 * 0.9936 = 0.9141 \
   P(F union G) &= 1 - P(accent(F, macron) sect accent(H, macron)) = 1 - P(accent(F, macron)) * P(accent(H, macron)) = 1 - (1-0.8464)(1-0.914) = 0.9868 $
]

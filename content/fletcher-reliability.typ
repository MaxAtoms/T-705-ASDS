#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge

#let reliabilityExample=diagram(
  //debug: true,
  
  node-stroke: black,
  spacing: (.5cm, .5cm),
  edge-stroke: 1pt,
  node-corner-radius: 0pt,
  edge-corner-radius: 0pt,
        
  edge((0,1), "r,u,r"),
  node((2,0), [A], shape: fletcher.shapes.rect),
  edge((2,0), "r,r"),
  node((4,0), [B], shape: fletcher.shapes.rect),
  edge((4,0), "r,r,d"),
  
  edge((0,1), "r,d,r"),
  node((2,2), [C], shape: fletcher.shapes.rect),
  edge((2,2), "r,u,r"),
  node((4,1), [D], shape: fletcher.shapes.rect),
  edge((2,2), "r,d,r"),
  node((4,3), [E], shape: fletcher.shapes.rect),

  
  edge((4,3), "r,u,r"),
  edge((4,1), "r,d,r"),
  edge((6,2), "u,r"),
  
) 

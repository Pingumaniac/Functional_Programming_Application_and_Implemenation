#lang racket

#|
B: (Y -> Z) -> ((X -> Y) -> (X -> Z))
map: (U -> V) -> (List(U) -> List(V))
B(map): (X -> (U -> V)) -> (X -> (List(U) -> List(V)))
|#
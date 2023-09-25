#lang racket

#|
map: (U -> V) -> (List(U) -> List(V))
map(map): (U -> V) -> (List(List(U)) -> List(List(V)))
map(map(map)): (U -> V) -> (List(List(List(U))) -> List(List(List(V))))
|#
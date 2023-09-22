#lang racket

(define (flow-diagram-functional i f)
  (foldl (lambda (current-i acc)
           (* acc current-i))
         f
         (build-list i add1)))

#|
1. Both are functional
2. Instead of using explicit recursion loop, now it uses higher-order function.
|#
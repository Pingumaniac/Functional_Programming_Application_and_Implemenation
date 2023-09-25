#lang typed/racket

(define m : Integer 2)

(define: (compute-carry [a : Integer] [b : Integer] [c : Integer]) : Integer
  (quotient (+ a b c) m))

(define: (compute-sum [a : Integer] [b : Integer] [c : Integer]) : Integer
  (remainder (+ a b c) m))

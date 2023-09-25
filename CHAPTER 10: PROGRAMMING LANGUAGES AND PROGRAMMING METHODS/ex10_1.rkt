#lang typed/racket

(define: (order [x : Real] [y : Real]) : (Pair Real Real)
  (if (<= x y)
      (cons x y)
      (cons y x)))
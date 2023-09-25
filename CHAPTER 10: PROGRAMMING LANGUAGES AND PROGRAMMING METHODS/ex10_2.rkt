#lang typed/racket

(define: (order [x : Real] [y : Real]) : (Pair Real Real)
  (if (<= x y)
      (cons x y)
      (cons y x)))

(define: (sort3 [a : Real] [b : Real] [c : Real]) : (Listof Real)
  (let ([temp1 (order a b)])
    (define a (car temp1))
    (define b (cdr temp1))
    (let ([temp2 (order b c)])
      (define b (car temp2))
      (define c (cdr temp2))
      (let ([temp3 (order a b)])
        (define a (car temp3))
        (define b (cdr temp3))
        (list a b c)))))
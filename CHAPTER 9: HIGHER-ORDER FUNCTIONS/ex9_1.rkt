#lang typed/racket

(: dot (All (A B) (A B -> (Pairof A B))))
(define (dot a b)
  (cons a b))

(: inc (Integer -> Integer))
(define (inc n)
  (+ n 1))

(: rem (Integer Integer -> Integer))
(define (rem m n)
  (modulo m n))

(define result (dot (inc 1) (rem 5 2))) ; result should be a pair (2 . 1)

; dot(inc(1), rem(2)), the result would be (2 . 1) and the type would be (Pairof Integer Integer).
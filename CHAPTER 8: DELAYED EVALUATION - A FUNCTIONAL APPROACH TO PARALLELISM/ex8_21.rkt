#lang racket

(define (remult intsf3 primes)
  (filter (lambda (x) 
            (not (ormap (lambda (p) (= 0 (remainder x p))) primes))) 
          intsf3))

(define (generate-intsf3 n)
  (if (= n 0) '()
      (cons (- n 1) (generate-intsf3 (- n 1)))))

(define intsf3 (generate-intsf3 400))
(define primes (list 2))

(set! primes (append primes (remult intsf3 primes)))

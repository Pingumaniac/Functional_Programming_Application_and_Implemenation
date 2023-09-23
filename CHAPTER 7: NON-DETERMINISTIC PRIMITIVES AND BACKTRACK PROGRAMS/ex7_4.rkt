#lang racket

(define (choice n)
  (if (= n 1)
      1
      (or (choice (- n 1)) n)))

(define (subset x)
  (if (null? x)
      null
      (if (choice 2)
          (cons (car x) (subset (cdr x)))
          (subset (cdr x)))))
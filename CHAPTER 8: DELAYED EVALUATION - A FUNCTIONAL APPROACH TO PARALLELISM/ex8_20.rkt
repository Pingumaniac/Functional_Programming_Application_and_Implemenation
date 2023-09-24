#lang racket

(define (omit j p x)
  (if (null? x)
      '()
      (if (= j p)
          (cons 'OMITTED (omit 1 p (cdr x)))
          (cons (car x) (omit (+ j 1) p (cdr x))))))

(define (filter p x)
  (omit 1 p x))


#lang racket

(define (map x f)
  (if (null? x)
      '()
      (cons (f (car x)) (map (cdr x) f))))

(define x 6)
(map '(1 2 3 4 5) (lambda (z) (+ z x)))

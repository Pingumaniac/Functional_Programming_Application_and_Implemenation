#lang racket

(define (fac-rewrite n extra-func)
  (if (eq? n 0)
      1
      (* n (extra-func (- n 1) extra-func))))

(fac-rewrite 5 fac-rewrite)

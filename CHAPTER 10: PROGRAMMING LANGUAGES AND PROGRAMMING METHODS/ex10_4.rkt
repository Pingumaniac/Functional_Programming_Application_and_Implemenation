#lang racket

(define m 2)

(define (add1d a b c f)
  (f (quotient (+ a b c) m) (remainder (+ a b c) m)))

(define (addnd a b f)
  (if (null? (cdr a))
      (add1d (car a) (car b) 0 f)
      (let-values ([(ci s) (addnd (cdr a) (cdr b) f)])
        (add1d (car a) (car b) ci
               (lambda (co d) (f co (cons d s)))))))
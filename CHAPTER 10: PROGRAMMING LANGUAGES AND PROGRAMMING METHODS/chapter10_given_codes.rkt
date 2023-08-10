#lang racket

; Converted into Racket
(define m 2)
(define (add1d a b c f)
  (f (quotient (+ a b c) m) (remainder (+ a b c) m)))
(define (addnd x y f)
  (if (null? (cdr x))
      (add1d (car x) (car y) 0 f)
      (addnd (cdr x) (cdr y)
             (lambda (ci s)
               (add1d (car x) (car y) ci
                      (lambda (co d) (f co (cons d s))))))))
(define (carl s)
  (s 'CAR))
(define (cdrl s)
  (s 'CDR))
(define (consl x y)
  (lambda (z) (if (eq? z 'CAR) x y)))

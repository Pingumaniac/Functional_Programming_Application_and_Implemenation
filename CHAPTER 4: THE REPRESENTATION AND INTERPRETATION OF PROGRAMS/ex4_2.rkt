#lang racket

(define (fluid-map lst f)
  (if (null? lst)
      '()
      (cons (f (car lst)) (fluid-map (cdr lst) f))))

(define x 10)
(display (fluid-map '(1 2 3) f))
(newline)

; Racket uses lexical (proper) scoping so emulating fluid binding does not work.

#lang racket
(define (position x y)
  (if (eq? x (car y))
      1
      (+ 1 (position x (cdr y)))))

(define A 'A)
(define B 'B)
(define C 'C)
(define D 'D)
(define E 'E)
(define F 'F)


(position A (list A B C))
(position B (list A B C))
(position F (list A B C D E F))
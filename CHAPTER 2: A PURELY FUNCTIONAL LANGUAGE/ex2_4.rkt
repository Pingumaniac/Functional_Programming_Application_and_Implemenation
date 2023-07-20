#lang racket
(define (member x s)
  (if (null? s)
      #f
      (if (eq? x (car s))
          #t
          (member x (cdr s)))))

(define (position x y)
  (if (eq? x (car y))
      1
      (+ 1 (position x (cdr y)))))

(define (position1 x y)
  (if (member x y)
      (position x y)
      0))

(define A 'A)
(define B 'B)
(define C 'C)
(define D 'D)
(define E 'E)
(define F 'F)


(position1 A (list F B C))
(position1 B (list A B C))
(position1 F (list A B C D E F))
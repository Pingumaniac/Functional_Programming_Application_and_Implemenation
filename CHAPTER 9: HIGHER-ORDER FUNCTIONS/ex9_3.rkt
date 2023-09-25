#lang racket

(define (my-car tree)
  (if (pair? tree)
      (car tree)
      tree))

(define (my-cdr tree)
  (if (pair? tree)
      (cdr tree)
      '()))

(define (my-cons a b)
  (cons a b))


(define (atom? x)
  (not (pair? x)))

(define (append lst1 lst2)
  (if (null? lst1)
      lst2
      (cons (car lst1) (append (cdr lst1) lst2))))

(define (flatten x)
  (if (atom? x)
      (list x)
      (append (flatten (my-car x)) (flatten (my-cdr x)))))

#|
Types of all sub-expressions

x: Tree(X)
atom?(x): Boolean
my-car(x): X
my-cdr(x): Tree(X)
flatten(my-car(x)): Listof X
flatten(my-cdr(x)): Listof X
append(flatten(my-car(x)), flatten(my-cdr(x))): Listof X

flatten(x): Listof X
|#
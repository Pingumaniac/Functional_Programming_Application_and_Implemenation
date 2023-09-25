#lang racket

(define (list-ref lst i)
  (if (zero? i)
      (car lst)
      (list-ref (cdr lst) (- i 1))))

(define (list-update lst i x)
  (if (zero? i)
      (cons x (cdr lst))
      (cons (car lst) (list-update (cdr lst) (- i 1) x))))

(define-struct Node (val left right))

(define (tree-ref tree i)
  (cond
    [(null? tree) '()]
    [(= i 0) (Node-val tree)]
    [(even? i) (tree-ref (Node-left tree) (quotient (- i 1) 2))]
    [else (tree-ref (Node-right tree) (quotient (- i 1) 2))]))

(define (tree-update tree i x)
  (cond
    [(null? tree) '()]
    [(= i 0) (make-Node x (Node-left tree) (Node-right tree))]
    [(even? i) (make-Node (Node-val tree) (tree-update (Node-left tree) (quotient (- i 1) 2) x) (Node-right tree))]
    [else (make-Node (Node-val tree) (Node-left tree) (tree-update (Node-right tree) (quotient (- i 1) 2) x))]))

#lang racket
(define (product x)
  (if (null? x)
      1         
      (* (car x) (product (cdr x))))) 

;; test
(product (list 1 2))
(product (list 1 2 3))
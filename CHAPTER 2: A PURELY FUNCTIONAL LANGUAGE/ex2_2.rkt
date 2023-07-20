#lang racket
(define (declist x)
  (if (null? x)
      null         
      (cons (- (car x) 1) (declist (cdr x)))))

(define (declist_gen x n)
  (if (null? x)
      null         
      (cons (- (car x) n) (declist_gen (cdr x) n))))

;; test
(declist null)
(declist (list 1 2))
(declist (list 4 5 6))
(declist_gen (list 4 5 6) 3)

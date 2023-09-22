#lang racket

(define (suc s)
  (list (list (caddr s) (car s) (cadr s) (cadddr s))
        (list (cadddr s) (caddr s) (cadr s) (car s))
        (list (car s) (caddr s) (cadr s) (cadddr s))))

(define (p s)
  (equal? s '(C A D B)))

(define (findlist S t)
  (if (null? S)
      (if (null? t)
          'NONE
          (findlist (car t) (cdr t)))
      (if (p (car S))
          (car S)
          (findlist (cdr S) (cons (suc (car S)) t)))))

(define (find s)
  (findlist (cons s null) null))

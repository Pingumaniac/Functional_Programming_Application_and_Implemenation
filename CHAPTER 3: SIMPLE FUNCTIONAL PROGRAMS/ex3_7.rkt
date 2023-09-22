#lang racket

(define (atom? x)
  (not (pair? x)))

(define (union x y)
  (if (null? x)
      y
      (let ((z (union (cdr x) y)))
        (if (member (car x) z)
            z
            (cons (car x) z)))))

(define (difference x y)
  (if (null? x)
      '()
      (let ((z (difference (cdr x) y)))
        (if (member (car x) z)
            z
            (cons (car x) z)))))

(define (singset s)
  (if (atom? s)
      (cons (cons s null) (cons s null))
      (let* ([c (singset (car s))]
             [d (singset (cdr s))])
        (cons (union (difference (car c) (cdr d)) (difference (car d) (cdr c)))
              (union (cdr c) (cdr d))))))

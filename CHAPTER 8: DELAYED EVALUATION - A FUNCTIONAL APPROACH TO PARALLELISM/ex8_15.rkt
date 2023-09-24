#lang racket

(define (add-streams s1 s2)
  (cons (+ (car s1) (car s2))
        (delay (add-streams (force (cdr s1)) (force (cdr s2))))))

(define integers (add-streams ones ones))
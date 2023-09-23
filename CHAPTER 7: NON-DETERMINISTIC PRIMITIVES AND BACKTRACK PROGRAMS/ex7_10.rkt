#lang racket

(define (allperms a)
  (if (null? a)
      (list '())
      (append-map (lambda (x)
                    (map (lambda (p) (cons x p))
                         (allperms (remove x a))))
                  a)))

(define (append-map f lst)
  (apply append (map f lst)))

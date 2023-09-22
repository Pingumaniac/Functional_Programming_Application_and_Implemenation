#lang racket

(define (mapf f x)
  (if (null? x)
      null
      (cons (f (car x)) (mapf f (cdr x)))))

(define (map x f)
  (mapf f x))

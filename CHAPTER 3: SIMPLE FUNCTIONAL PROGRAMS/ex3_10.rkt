#lang racket

(define (add x f)
  (lambda (y)
    (if (eq? y x)
        #t
        (f y))))

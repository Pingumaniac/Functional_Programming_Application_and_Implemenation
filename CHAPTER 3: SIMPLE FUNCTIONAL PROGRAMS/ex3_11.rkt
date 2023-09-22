#lang racket

(define (rem x f)
  (lambda (y)
    (if (eq? y x)
        #f
        (f y))))

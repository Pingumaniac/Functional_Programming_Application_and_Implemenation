#lang racket

(define (goodif a b c)
  (if a (b) (c)))
(goodif (atom? x) (lambda () x) (lambda () (car x)))

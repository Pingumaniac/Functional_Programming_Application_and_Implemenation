#lang racket

(define (integersfrom m)
  (cons m (delay (integersfrom (+ m 1)))))

(define integers (integersfrom 1))

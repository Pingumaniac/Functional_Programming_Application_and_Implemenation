#lang racket

(define (badfac n)
  (if (= n 0) 1 (* n (badfac (- n 1)))))

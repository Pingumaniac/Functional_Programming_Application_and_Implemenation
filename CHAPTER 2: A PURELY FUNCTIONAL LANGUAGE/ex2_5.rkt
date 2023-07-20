#lang racket
(define (index i y)
  (if (eq? i 1)
      (car y)
      (index (- i 1) (cdr y))))

(index 5 (list 1 2 3 4 5 6 7 8 9 10))
(index 3 (list 3 1 4 1 5 9 2 8 4 6))
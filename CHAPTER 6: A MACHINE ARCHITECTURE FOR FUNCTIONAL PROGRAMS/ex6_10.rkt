#lang racket

(define (goodfac n)
  (goodif (= n 0)
          (lambda () 1)
          (lambda () (* n (goodfac (- n 1))))))

#|
for (goodfac 6), the SUB operator will be executed 6 times.
|#
#lang racket

(define (while-function i f)
  (let loop ([i i] [f f])
    (if (> i 1)
        (loop (- i 1) (* f (- i 1)))
        f)))

#lang racket

(define (flow-diagram-function i f)
  (let loop ((i i) (f f))
    (if (> i 0)
        (loop (- i 1) (* f i))
        f)))

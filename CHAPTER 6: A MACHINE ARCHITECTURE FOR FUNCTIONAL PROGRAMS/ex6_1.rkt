#lang racket

(define-struct machine-state (s e c d))

(define (machine-instruction-AP0 state)
  (match-define (machine-state (list (cons 'e-prime s) . d) e (list 'AP0 'c . rest-c) null) state)
  (machine-state (cons s (cons e (cons c d))) e-prime rest-c null))
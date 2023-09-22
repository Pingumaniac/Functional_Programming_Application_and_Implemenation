#lang racket

(define-struct machine-state (s e c d))

(define (machine-instruction-AP1 state)
  (match-define (machine-state (list (cons y (cons 'e-prime s)) . d) e (list 'AP1 'c . rest-c) null) state)
  (machine-state (cons (list y) (cons s (cons e (cons c d)))) e-prime rest-c null))
#lang racket

(define results '()) 

(define (rule-for-STOP stack environment code dump)
  (set! results (cons (car stack) results))
  (if (null? dump)
      'halt
      (let ((next-state (car dump)))
        (list (first next-state) (second next-state) (third next-state) (cdr dump)))))

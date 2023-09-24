#lang racket

(define (delay thunk)
  (lambda () (thunk)))

(define (force thunk)
  (thunk))

(define (lazy-fibonacci a b)
  (cons a (delay (lambda () (lazy-fibonacci b (+ a b))))))

(define (force-nth-fibonacci n fibonacci-sequence)
  (if (= n 0)
      (car fibonacci-sequence)
      (force-nth-fibonacci (- n 1) (force (cdr fibonacci-sequence)))))

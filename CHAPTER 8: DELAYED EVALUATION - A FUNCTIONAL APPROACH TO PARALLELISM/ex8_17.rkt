#lang racket

(define (sub1 x)
  (if (null? x)
      '()
      (cons (- (car x) 1) (sub1 (cdr x)))))

(define (sums x)
  (cons (car x) (sums (sub1 x))))

(sums '(1 2 3 4 5)) ; not well defined; causes infinite loop
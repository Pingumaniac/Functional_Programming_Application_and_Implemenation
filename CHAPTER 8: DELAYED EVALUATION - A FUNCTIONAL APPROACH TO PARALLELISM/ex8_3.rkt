#lang racket

(define (truncate x b)
  (if (null? x)
      '()
      (let ((val (car (force x))))
        (if (= val b)
            (list b)
            (cons val (truncate (force (cdr x)) b))))))
#lang racket

(define (seq a)
  (delay 
    (cons a 
          (lambda () 
            (seq (if (even? a) 
                     (/ a 2) 
                     (/ (+ (* 3 a) 1) 2)))))))
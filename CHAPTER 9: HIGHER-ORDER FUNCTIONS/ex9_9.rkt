#lang typed/racket

(: andp : (All (X) ((X -> Boolean) (X -> Boolean) -> (X -> Boolean))))
(define (andp p q)
  (lambda ([x : X])
    (if (p x)
        (q x)
        #f)))

#|
(andp p q) can be used to check that the following syntax analysis problem:
Whether or not a phrase satisfies both p and q.
|#
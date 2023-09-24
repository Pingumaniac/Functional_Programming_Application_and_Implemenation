#lang typed/racket

(: reduce (All (A B) ((Listof A) (A B -> B) B -> B)))
(define (reduce x g a)
  (if (null? x)
      a
      (g (car x) (reduce (cdr x) g a))))

#lang scheme
(define (member x s)
  (if (null? s)
      #f
      (if (eq? x (car s))
          #t
          (member x (cdr s)))))

(define (addtoset x s)
  (if (member x s)
      s
      (cons x s)))

(define (mapset x f)
  (cond ((null? x) null)
        (else (addtoset (f (car x)) (mapset (cdr x) f)))))

(define f_test
  (lambda (z)
    (quotient z 10)))

(mapset '(1 57 84 61 53 6) f_test)
(mapset '(101 102 103 104 105) f_test)
(mapset '(78 87 79 -97) f_test)

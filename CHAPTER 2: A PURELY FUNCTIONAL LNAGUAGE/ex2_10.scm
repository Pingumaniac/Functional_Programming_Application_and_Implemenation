#lang scheme
(define (member x s)
  (if (null? s)
      #f
      (if (eq? x (car s))
          #t
          (member x (cdr s)))))

(define (remove x y)
  (if (eq? x (car y))
      (cdr y)
      (cons (car y) (remove x (cdr y)))))

(define (atom? x)
  (not (pair? x)))

(define (sing s a b)
  (if (atom? s)
      (if (member s a)
          (cons a b)
          (if (member s b)
              (cons (cons s a) (remove s b))
              (cons a (cons s b))))
      (cons (sing (car s) a b) (sing (cdr s) a b))))
              

(define (singletons t)
  (cdr (sing t null null)))

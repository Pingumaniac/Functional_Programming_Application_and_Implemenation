#lang racket

(define (split x)
  (if (null? x)
      'none
      (if (null? (cddr x))
          'none
          (let ((s (split (cdr x))))
            (cons (cons (car x) (car s)) (cdr s))))))

(define (tree x)
  (if (null? x)
      'none
      (if (null? (cdr x))
          (car x)
          (let ((s (split x)))
            (cons (tree (car s)) (tree (cdr s)))))))

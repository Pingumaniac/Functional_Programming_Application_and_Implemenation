#lang racket

(define (union x y)
  (if (null? x)
      y
      (let ((z (union (cdr x) y)))
        (if (member (car x) z)
            z
            (cons (car x) z)))))

(define (prefix y)
  (if (null? y)
      null
      (cons (car y) null)))

(define (followers x y)
  (if (null? y)
      null
      (if (eq? (car y) x)
          (union (prefix (cdr y)) (followers x (cdr y)))
          (followers x (cdr y)))))

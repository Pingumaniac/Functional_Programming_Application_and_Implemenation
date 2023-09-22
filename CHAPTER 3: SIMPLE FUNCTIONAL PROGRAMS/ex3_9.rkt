#lang racket

(define (member a x)
  (if (null? x)
      #f
      (if (eq? a (car x))
          #t
          (member a (cdr x)))))

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

(define (flatten lst)
  (cond
    [(null? lst) null]
    [(not (pair? lst)) (list lst)]
    [else (append (flatten (car lst)) (flatten (cdr lst)))]))

(define (followers x y)
  (if (null? y)
      null
      (if (eq? (car y) x)
          (union (prefix (cdr y)) (followers x (cdr y)))
          (followers x (cdr y)))))

(define (follow x y)
  (followers x (flatten y)))
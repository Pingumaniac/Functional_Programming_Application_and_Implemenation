#lang racket

(define (assoc x n v)
  (if (eq? x (car n))
      (car v)
      (assoc x (cdr n) (cdr v))))

(define (eval e n v)
  (cond
    ((atom? e) (assoc e n v))
    ((eq? (car e) 'QUOTE) (cadr e))
    ((eq? (car e) 'AND)
     (if (eval (cadr e) n v)
         (eval (caddr e) n v)
         #f))
    ((eq? (car e) 'OR)
     (if (eval (cadr e) n v)
         #t
         (eval (caddr e) n v)))
    ((eq? (car e) 'NOT)
     (if (eval (cadr e) n v)
         #f
         #t))
    ((eq? (car e) 'ALL)
     (let ((x (cadr e))
           (e (caddr e)))
       (if (eval e (cons x n) (cons #t v))
           (eval e (cons x n) (cons #f v))
           #f)))
    ((eq? (car e) 'SOME)
     (let ((x (cadr e))
           (e (caddr e)))
       (if (eval e (cons x n) (cons #t v))
           #t
           (eval e (cons x n) (cons #f v)))))
    (else (error "Error"))))



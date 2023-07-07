#lang scheme
(define (atom? x)
  (not (pair? x)))

(define (flatten x)
  (if (null? x)
      null
      (if (atom? (car x))
          (cons (car x) (flatten (cdr x)))
          (append (flatten (car x)) (flatten (cdr x))))))

(flatten '(A (B C) D))
(flatten '(((A B) C) (D E)))
(flatten '((((((A)))))))
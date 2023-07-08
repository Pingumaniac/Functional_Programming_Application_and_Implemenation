#lang scheme
(define (atom? x)
  (not (pair? x)))

(define (flatten x)
  (if (atom? x)
      (cons x null)    
      (append (flatten (car x)) (flatten (cdr x)))))

(flatten (cons 'A (cons 'B 'C))) ;; (A B C)
(flatten (list 'A 'B)) ;; (A B ()) 
(flatten (list (cons 'A 'B) (cons 'C 'D))) ;; (A B C D ())
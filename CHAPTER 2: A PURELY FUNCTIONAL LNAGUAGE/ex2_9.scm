#lang scheme
(define (member x s)
  (if (null? s)
      #f
      (if (eq? x (car s))
          #t
          (member x (cdr s)))))

(define (union x y)
  (if (null? x)
      y
      (let* ((z (union (cdr x) y)))
        (if (member (car x) y)
            z
            (cons (car x) z)))))

(define (difference x y)
  (if (null? x)
      y
      (let* ((z (difference (cdr x) y)))
        (if (member (car x) y)
            z
            (cons (car x) z)))))

(define (atom? x)
  (not (pair? x)))

(define (set s)
  (if (atom? (s))
      (cons (s null))
      (union (set (car s)) (set (cdr s)))))

(define (singletons t)
  (if (atom? (t))
      (cons (t null))
      (union (difference (singletons (car t) (set (cdr t))))
             (difference (singletons (cdr t) (set (car t))))))) 
#lang racket

(define (first x)
  (car x))
(define (second x)
  (cadr x))
(define (third x)
  (caddr x))
(define (topleft s)
  (first (first s)))
(define (topright s)
  (second (first s)))
(define (bottomleft s)
  (first (second s)))
(define (bottomright s)
  (second (second s)))
(define (atom? x)
  (not (pair? x)))
(define (f x)
  (if (atom? x)
      null
      (car x)))
(define (size x)
  (if (eq? x null)
      0
      (if (eq? (cdr x) null)
          1
          2)))
(define (x-rem-y x y)
  (- x (* (/ x y) y)))
(define (quotrem x y)
  (list (/ x y) (x-rem-y x y)))
(define (distance x y)
  (if (<= x y)
      (- y x)
      (- x y)))
(define (length x)
  (if (eq? x null)
      0
      (+ (length (cdr x)) 1)))
(define (sum x)
  (if (eq? x null)
      0
      (+ (car x) (sum (cdr x)))))
(define (append x y)
  (if (eq? x null)
      y
      (cons (car x) (append (cdr x) y))))
(define (append-2 x y)
  (if (eq? x null)
      y
      (cons (car x) (append-2 (cdr x) y))))
(define (reverse x)
  (if (eq? x null)
      null
      (append (reverse (cdr x)) (cons (car x) null))))
(define (atomsin t)
  (if (eq? t null)
      null
      (if (atom? (car t))
          (addtoset (atomsin (cdr t)) (car t))
          (union (atomsin (car t)) (atomsin (cdr t))))))
(define (union u v)
  (if (eq? u null)
      v
      (addtoset (union (cdr u) v) (car u))))
(define (addtoset s x)
  (if (member x s)
      s
      (cons x s)))
(define (member x s)
  (if (eq? s null)
      #f
      (if (eq? x (car s))
          #t
          (member x (cdr s)))))

(define (intersection u v)
  (if (null? u)
      '()
      (if (member (car u) v)
          (addtoset (intersection (cdr u) v) (car u))
          (intersection (cdr u) v))))

(define (difference u v)
  (if (null? u)
      '()
      (if (member (car u) v)
          (difference (cdr u) v)
          (addtoset (difference (cdr u) v) (car u)))))

(define (exclusiveunion u v)
  (difference (union u v) (intersection u v)))

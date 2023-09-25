#lang racket

(define (both p q)
  (lambda (a b)
    (list (p a b) (q a b))))

(define (xdisp k p)
  (lambda (a b)
    (p (+ a (* k (vector-ref b 0))) b)))

(define (ydisp k p)
  (lambda (a b)
    (p a (+ b (* k (vector-ref b 1))))))

(define (xfrac k p)
  (lambda (a b)
    (p a (+ b (* k (vector-ref b 0))))))

(define (col n)
  (lambda (p)
    (if (= n 1)
        p
        (both p (ydisp 1 ((col (- n 1)) p))))))

(define (row n)
  (lambda (p)
    (if (= n 1)
        p
        (both p (xdisp 1 ((row (- n 1)) p))))))

(define (cascade n)
  (lambda (p)
    (if (= n 1)
        p
        (both p (ydisp 1 (xfrac 2 ((cascade (- n 1)) p)))))))

(define (xdimin n s p)
  (if (= n 1)
      ((s 1) p)
      (both ((s n) p) (xdimin (- n 1) s (xdisp 1 ((s (- n 1)) p))))))

(define (dimin n col xdisp p)
  (xdimin n col p))

(display (dimin 4 cascade xdisp box))

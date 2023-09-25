#lang racket

(define (unitsequence s)
  (= (length s) 1))

(define (left s)
  (take s (quotient (length s) 2)))

(define (right s)
  (drop s (quotient (length s) 2)))

(define (length s)
  (if (unitsequence s)
      1
      (+ (length (left s)) (length (right s)))))

(define (max s)
  (if (unitsequence s)
      (car s)
      (greater (max (left s)) (max (right s)))))

(define (greater x y)
  (if (<= x y)
      y
      x))


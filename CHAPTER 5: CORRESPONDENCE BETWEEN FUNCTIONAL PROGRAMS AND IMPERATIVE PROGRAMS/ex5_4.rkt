#lang racket

(define (val1 expr n v)
  (let ([t1 (val1 (first expr) n v)]
        [t2 (val1 (second expr) n v)])
    (if t1 t2 #f)))

(define (val2 expr n v)
  (let ([t1 (val2 (first expr) n v)])
    (if t1 (val2 (second expr) n v) #f)))

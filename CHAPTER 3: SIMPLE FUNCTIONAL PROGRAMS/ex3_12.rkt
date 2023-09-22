#lang racket

; The empty set is lambda(n)0.
(define (scan x f n i)
  (if (> i n)
      #f
      (if (equal? (f i) x)
          #t
          (scan x f n (+ i 1)))))

(define (member x f)
  (scan x f (f 0) 1))

(define (add x f)
  (lambda (n)
    (if (member x f)
        (f n)
        (if (= n 0)
            (+ (f 0) 1)
            (if (= n 1)
                x
                (f (- n 1))))))))

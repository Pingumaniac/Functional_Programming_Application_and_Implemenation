#lang racket

(define (seq a)
  (delay 
    (cons a 
          (lambda () 
            (seq (if (even? a) 
                     (/ a 2) 
                     (/ (+ (* 3 a) 1) 2)))))))

(define (seq-2 a)
  (lambda () 
    (cons a 
          (seq (if (even? a) 
                  (/ a 2) 
                  (/ (+ (* 3 a) 1) 2))))))

(define (truncate x b)
  (if (null? x)
      '()
      (let ((val (car (force x))))
        (if (= val b)
            (list b)
            (cons val (truncate (force (cdr x)) b))))))

(define (truncate-2 x b)
  (if (null? x)
      '()
      (let ((val (car (x))))
        (if (= val b)
            (list b)
            (cons val (truncate ((cdr (x))) b))))))

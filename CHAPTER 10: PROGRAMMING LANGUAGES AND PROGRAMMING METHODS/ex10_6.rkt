#lang typed/racket

(define m : Integer 2)

(define: (mulnd [x : (Listof Integer)] [y : (Listof Integer)] [f : (Integer (Listof Integer) -> Any)]) : Any
  (let loop ([x x] [y y] [carry 0] [result : (Listof Integer) '()])
    (if (and (null? x) (null? y) (zero? carry))
        (f 0 (reverse result))
        (let ([xi (if (null? x) 0 (car x))]
              [yi (if (null? y) 0 (car y))])
          (let-values ([(newcarry sum) (quotient/remainder (+ (* xi yi) carry) m)])
            (loop (if (null? x) x (cdr x))
                  (if (null? y) y (cdr y))
                  newcarry
                  (cons sum result)))))))

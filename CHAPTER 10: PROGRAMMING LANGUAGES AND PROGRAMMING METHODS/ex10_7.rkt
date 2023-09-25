#lang typed/racket

(define-type VectorofReal (Vectorof Real))

(define: (sort [arr : VectorofReal] [n : Integer]) : VectorofReal
  (let ([n (min n (vector-length arr))])
    (for ([i : Integer (in-range 1 n)]) 
      (let ([key : Real (vector-ref arr i)]) 
        (let loop ([j : Integer (- i 1)]) 
          (when (and (>= j 0) (> (vector-ref arr j) key))  
            (vector-set! arr (+ j 1) (vector-ref arr j)) 
            (loop (- j 1))) 
          (vector-set! arr (+ j 1) key))))) 
    arr) 

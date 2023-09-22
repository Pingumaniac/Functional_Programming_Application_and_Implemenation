#lang racket

(define (compute-m f upper-bound-i)
  (let loop-outer ([i 1]) 
    (if (< i upper-bound-i) 
        (begin
          (let loop-inner ([j 1] [m 0]) 
            (if (< j i)  
                (loop-inner (+ j 1) (+ m f))  
                (loop-outer (+ i 1)))) 
          )
        (void)))  
  )

(compute-m 5 5)

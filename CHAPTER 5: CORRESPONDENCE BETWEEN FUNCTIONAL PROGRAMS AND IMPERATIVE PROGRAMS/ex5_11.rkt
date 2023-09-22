#lang racket

(define (REM y x r)
  (if (>= r x)
      (REM y x (- r x))
      r))

(define (euclidean-algorithm x y)
  (let loop ([x x] [y y] [r (REM y x y)])
    (if (= r 0)
        x
        (loop r x (REM x r r)))))

(display (euclidean-algorithm 102 45))
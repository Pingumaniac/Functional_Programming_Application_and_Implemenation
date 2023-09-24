#lang racket

(define composites '())

(define (add-new-composites prime)
  (let loop ([i 2])
    (let ([composite (* i prime)])
      (if (< composite 10)  ; Arbitrary limit
          (begin
            (set! composites (cons composite composites))
            (loop (+ i 1)))
          '()))))

(define (generate-primes)
  (let ([known-primes '(2)])
    (let loop ([n 3])
      (if (not (member n composites))
          (begin
            (set! known-primes (cons n known-primes))
            (add-new-composites n))
          (display "Composite found, continuing..."))
      (loop (+ n 1)))))

(generate-primes)

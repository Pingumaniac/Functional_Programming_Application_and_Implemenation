#lang racket

(define size 100)  
(define ff 0) 

(define isatom (make-vector size #f))
(define isnumb (make-vector size #f))
(define ivalue (make-vector size 0))
(define car (make-vector size '()))
(define cdr (make-vector size '()))

(define marked (make-vector size #f))

(define (iscons p)
  (and (not (vector-ref isatom p)) (not (vector-ref isnumb p))))

(define (issymbol p)
  (and (vector-ref isatom p) (not (vector-ref isnumb p))))

(define (isnumber p)
  (and (vector-ref isatom p) (vector-ref isnumb p)))

(define (mark n)
  (when (not (vector-ref marked n))
    (vector-set! marked n #t)
    (when (not (vector-ref isatom n))
      (mark (vector-ref car n))
      (mark (vector-ref cdr n)))))

(define (collect)
  (for ([i (range 1 size)])
    (unless (vector-ref marked i)
      (vector-set! cdr i ff)
      (set! ff i))))

(define (init-storage)
  (set! ff 0)
  (for ([i (range 1 size)])
    (vector-set! cdr i ff)
    (set! ff i)))

(define (collect-garbage)
  (for ([i (range 1 size)]) (vector-set! marked i #f))
  (map mark '(s e c d w t f null))
  (collect)
  (when (= ff 0) (error "Out of memory")))

(define stringstore (make-vector 100 ""))
(define top 0)

(define (store t)
  (let loop ([i 1])
    (if (<= i top)
        (if (string=? (vector-ref stringstore i) t)
            i
            (loop (+ i 1)))
        (begin
          (set! top (+ top 1))
          (vector-set! stringstore top t)
          top))))

(define (load i)
  (vector-ref stringstore i))

(define token "")
(define type "")

; Placeholder for gettoken
(define (gettoken)
  (set! token "ENDFILE")
  (set! type "ENDFILE"))

(let loop ()
  (gettoken)
  (unless (string=? type "ENDFILE")
    (display token)
    (loop)))

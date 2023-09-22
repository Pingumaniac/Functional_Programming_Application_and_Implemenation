#lang racket

(define (suc s)
  (list (list (caddr s) (car s) (cadr s) (cadddr s))
        (list (cadddr s) (caddr s) (cadr s) (car s))
        (list (car s) (caddr s) (cadr s) (cadddr s))))

(define (p s)
  (equal? s '(C A D B)))

(define (findseqlist s a)
  (if (null? s)
      'NONE
      (if (p (car s))
          (cons (car s) a)
          (let ([t (findseqlist (suc (car s)) (cons (car s) a))])
            (if (eq? t 'NONE)
                (findseqlist (cdr s) a)
                t)))))

(define (findseq s)
  (findseqlist (cons s null) null))

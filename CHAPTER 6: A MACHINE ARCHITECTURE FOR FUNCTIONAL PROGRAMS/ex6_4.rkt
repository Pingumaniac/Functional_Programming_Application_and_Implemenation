#lang racket

; (e)*n = e*n | AP0
(define (compile-zero-arg-fn e)
  (append (compile e) (list 'AP0)))

; (e e1)*n = e1*n | e*n | AP1
(define (compile-one-arg-fn e e1)
  (append (compile e1) (compile e) (list 'AP1)))
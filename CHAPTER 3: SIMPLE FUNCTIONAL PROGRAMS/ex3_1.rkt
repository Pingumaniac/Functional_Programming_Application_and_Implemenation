#lang racket

(define (eval-logical-exp exp env)
  (cond
    [(symbol? exp) (assoc-ref env exp)]
    [(list? exp)
     (let ((op (car exp)))
       (cond
         [(eq? op 'and) (foldl (lambda (e acc) (and acc (eval-logical-exp e env))) #t (cdr exp))]
         [(eq? op 'or) (foldl (lambda (e acc) (or acc (eval-logical-exp e env))) #f (cdr exp))]
         [(eq? op 'not) (not (eval-logical-exp (cadr exp) env))]
         [else (error "Unknown logical operator")]))]))

(define (assoc-ref env key)
  (cdr (assoc key env equal?))) 

; Test
(define env '((a . #t) (b . #f) (c . #t)))
(display (eval-logical-exp '(and a (or b (not c))) env))  ; Returns #f


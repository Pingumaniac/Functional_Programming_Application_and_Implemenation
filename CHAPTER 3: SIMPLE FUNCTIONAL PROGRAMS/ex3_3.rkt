#lang racket
(define (rotate-cube cube op)
  (define (rotate-list lst)
    (append (cdr lst) (list (car lst))))
  
  (match op
    ['UP (list (car cube)
              (cadr cube)
              (rotate-list (caddr cube))
              (cadddr cube)
              (cdr (cadddr cube))
              (cddddr cube))]
    ['DOWN (list (car cube)
              (cadr cube)
              (caddr cube)
              (cadddr cube)
              (cdr (cadddr cube))
              (rotate-list (cddddr cube)))]
    ['LEFT (list (car cube)
              (rotate-list (cadr cube))
              (caddr cube)
              (cadddr cube)
              (cdr (cadddr cube))
              (cddddr cube))]
    ['RIGHT (list (rotate-list (car cube))
              (cadr cube)
              (caddr cube)
              (cadddr cube)
              (cdr (cadddr cube))
              (cddddr cube))]
    ['FRONT (list (car cube)
              (cadr cube)
              (caddr cube)
              (rotate-list (cadddr cube))
              (cdr (cadddr cube))
              (cddddr cube))]
    ['BACK (list (car cube)
              (cadr cube)
              (caddr cube)
              (cadddr cube)
              (rotate-list (cdr (cadddr cube)))
              (cddddr cube))]
    [else (error "Unknown operation")]))
  
(define initial-cube '(("red" "red" "red")
                       ("green" "green" "green")
                       ("white" "white" "white")
                       ("blue" "blue" "blue")
                       ("yellow" "yellow" "yellow")
                       ("orange" "orange" "orange")))

(display (rotate-cube initial-cube 'UP))

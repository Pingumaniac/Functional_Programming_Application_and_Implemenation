#lang racket

(define (count-update lst atom)
  (if (null? lst)
      (list (cons atom 1))
      (let ((head (car lst))
            (tail (cdr lst)))
        (if (eq? (car head) atom)
            (cons (cons atom (+ 1 (cdr head))) tail)
            (cons head (count-update tail atom))))))

(define (frequencies t)
  (let loop ((lst t) (result '()))
    (if (null? lst)
        result
        (let ((atom (car lst))
              (remaining (cdr lst)))
          (loop remaining (count-update result atom))))))

(frequencies '(A B A B A C A))
(frequencies '(THE CAT AND THE FIDDLE AND ALL))
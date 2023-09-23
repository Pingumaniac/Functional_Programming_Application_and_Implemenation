#lang racket

(define (insert x a)
  (if (null? a)
      (cons x null)
      (cons x a)))
(define (perm b)
  (if (null? b)
      null
      (insert (car b) (perm (cdr b)))))
(define (choice n)
  (if (= n 1)
      1
      (or (choice (- n 1)) n)))

(define (pair n)
  (if (= n 1)
      (cons 1 1)
      (let ((p (pair (- n 1))))
        (or (cons (car p) n)
            (cons n (cdr p))
            (cons n n)))))
(define (p b)
  (if (null? b)
      #t
      (if (null? (cdr b))
          #t
          (if (q (car b) (cadr b))
              (p (cdr b))
              #f))))
(define (restrictedperm a)
  (if (null? a)
      null
      (restrictedinsert (car a) (restrictedperm (cdr a)))))

(define (restrictedinsert x a)
  (if (null? a)
      (cons x null)
      (or (build x a)
          (build (car a) (restrictedinsert x (cdr a))))))
(define (build x y)
  (if (q x (car y))
      (cons x y)
      null))

; ex 7.9
(define (restrictedperms a)
  (define stack (list (cons '() a))) ; Start with an empty permutation and the full list `a`
  (define results '()) ; To store final permutations
  (while (not (null? stack))
    (let* ((current (car stack))
           (perm (car current))
           (remaining (cdr current)))
      (set! stack (cdr stack)) ; Pop from the stack
      (if (null? remaining)
          (set! results (cons perm results)) ; If no remaining elements, save the permutation results
          (set! stack (append (restrictedinsert-pairs (car remaining) (cdr remaining) perm) stack))))) ; Push new permutations 
  results)

(define (restrictedinsert-pairs x remaining perm)
  (let loop ((a remaining) (before '()))
    (if (null? a)
        (list (cons (append perm (list x)) a))
        (let ((next (car a))
              (after (cdr a)))
          (if (q x next) ; q is the constraint function
              (list (cons (append perm (append before (list x next))) after))
              (loop after (append before (list next))))))))

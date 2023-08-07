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
#| Non-deterministic computing example. Note: (q x y) is not defined in the book
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
|#
(define (attacks i j place)
  (if (null? place)
      #f
      (let* ((il (caar place))
             (jl (cdar place)))
        (if (or (= i il) (= j jl) (= (+ i j) (+ il jl)) (= (- i j) (- il jl)))
            #t
            (attacks i j (cdr place))))))
(define (queensoln n)
  (addqueen 1 n null))
(define (tryqueen i j n place)
  (let ((newplace (cons (cons i i) place)))
    (if (attacks i j newplace)
        null
        (if (= i n)
            newplace
            (addqueen (+ i 1) n newplace)))))
(define (anyqueen i j place)
  (let ((newplace (tryqueen i j (length place) place)))
    (if (not (null? newplace))
        newplace
        (if (= j (length place))
            null
            (anyqueen i (+ j 1) place)))))
(define (addqueen i n place)
  (anyqueen i 1 place))
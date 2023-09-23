#lang racket

(define (insert-everywhere x lst)
  (if (null? lst)
      (list (list x))
      (let loop ((rest lst)
                 (prefix '())
                 (result '()))
        (if (null? rest)
            result
            (loop (cdr rest)
                  (append prefix (list (car rest)))
                  (append result
                          (list (append prefix (list x) rest))))))))

(define (perm lst)
  (if (null? lst)
      (list '())
      (let loop ((remaining lst)
                 (result '()))
        (if (null? remaining)
            result
            (loop (cdr remaining)
                  (append result
                          (map (lambda (p) (cons (car remaining) p))
                               (perm (remove (car remaining) lst)))))))))

(define (all-e func args)
  (apply func args))

(define b '(1 2 3))
(define all-perm-results (all-e perm (list b)))

(display all-perm-results)

(define Machines '()) 

(define (step-machine machine)
  (let* ((s (if (pair? machine) (car machine) '()))
         (e (if (pair? machine) (cadr machine) '()))
         (c (if (pair? machine) (caddr machine) '()))
         (d (if (pair? machine) (cadddr machine) '()))
         (instr (if (null? c) 'HALT (car c))))
    (case instr
      [(ALL) (handle-ALL machine)]
      [else (list s e (cdr c) d)])))

(define (handle-ALL machine)
  (let ((s (car machine))
        (e (cadr machine))
        (c (caddr machine))
        (d (cadddr machine)))
    (let ((arg (car s)))  
      (let ((all-results (apply perm (list arg))))
        (for-each (lambda (result)
                    (let ((new-machine (list (cons result (cdr s)) e (cdr c) d)))
                      (set! Machines (append Machines (list new-machine)))))=
                  all-results)))))


#lang racket

(define (fac n)
  (if (= n 0)
      1
      (or (* n (fac (- n 1))) 
          #f)))

(define initial-machine (list '(5) '() '(FAC HALT) '()))  ; initial state with s e c d

(define Machines (list initial-machine))

(define (deep-copy lst)
  (map (lambda (x) (if (list? x) (deep-copy x) x)) lst))

(define (remove item lst)
  (filter (lambda (x) (not (eq? x item))) lst))

(define (step-machine machine)
  (let* ((s (if (pair? machine) (car machine) '()))
         (e (if (pair? machine) (cadr machine) '()))
         (c (if (pair? machine) (caddr machine) '()))
         (d (if (pair? machine) (cadddr machine) '()))
         (instr (if (null? c) 'HALT (car c))))
    (case instr
      [(SOR) (handle-SOR machine)]
      [(NON) (handle-NON machine)]
      [(FAC)
       (if (and (pair? s) (= (car s) 0))
           (list (cons 1 (cdr s)) e (cdr c) d)
           (list (cons (- (car s) 1) s) e (cons 'SOR (cons 'FAC (cdr c))) d))]
      [(HALT) 'HALT]
      [else (list s e (cdr c) d)])))

(define (handle-SOR machine)
  (set! Machines (append Machines (list (deep-copy machine)))))

(define (handle-NON machine)
  (set! Machines (remove machine Machines)))

(define (run-machines)
  (let loop ((current-machines Machines))
    (unless (null? current-machines)
      (let ((machine (first current-machines))
            (rest-machines (rest current-machines)))
        (let ((new-machine (step-machine machine)))
          (cond ((eq? new-machine 'NON) (set! Machines (remove machine Machines)))
                ((eq? new-machine 'HALT) (void))
                (else (set! Machines (append (remove machine Machines) (list new-machine))))))
        (loop rest-machines)))))

(run-machines)

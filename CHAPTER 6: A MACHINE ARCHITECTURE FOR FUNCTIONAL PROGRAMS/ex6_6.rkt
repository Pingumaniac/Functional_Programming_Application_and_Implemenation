#lang racket

(define append
  (letrec ((append-helper
            (lambda (x y)
              (if (null? x)
                  y
                  (cons (car x)
                        (append-helper (cdr x) y))))))
    append-helper))
(define (exec f-compiled a)
  (apply f-compiled a))
(define (compile f)
  f)
(define (exec-compiler compiler f)
  (compile f))
(define (index n s)
  (if (= n 0)
      (car s)
      (index (- n 1) (cdr s))))
(define (locate i e)
  (let ((b (car i))
        (n (cdr i)))
    (index n (index b e))))
(define (position x a)
  (if (= x (car a))
      0
      (+ 1 (position x (cdr a)))))
(define (location x n)
  (if (member x (car n))
      (cons 0 (position x (car n)))
      (let ((z (location x (cdr n))))
        (cons (+ (car z) 1) (cdr z)))))
(define (complis e n c)
  (if (null? e)
      (cons 'LDC (cons '() c))
      (complis (cdr e) n (comp (car e) n (cons 'CONS c)))))
(define (comp e n c)
  (cond
    ((atom? e)
     (cons 'LD (cons (location e n) c)))
    ((eq? (car e) 'QUOTE)
     (cons 'LDC (cons (cadr e) c)))
    ((eq? (car e) 'ADD)
     (comp (cadr e) n
           (comp (caddr e) n
                 (cons 'ADD c))))
    ((eq? (car e) 'SUB)
     (comp (cadr e) n
           (comp (caddr e) n
                 (cons 'SUB c))))
    ((eq? (car e) 'MUL)
     (comp (cadr e) n
           (comp (caddr e) n
                 (cons 'MUL c))))
    ((eq? (car e) 'DIV)
     (comp (cadr e) n
           (comp (caddr e) n
                 (cons 'DIV c))))
    ((eq? (car e) 'REM)
     (comp (cadr e) n
           (comp (caddr e) n
                 (cons 'REM c))))
    ((eq? (car e) 'EQ)
     (comp (cadr e) n
           (comp (caddr e) n
                 (cons 'EQ c))))
    ((eq? (car e) 'LEQ)
     (comp (cadr e) n
           (comp (caddr e) n
                 (cons 'LEQ c))))
    ((eq? (car e) 'CAR)
     (comp (cadr e) (cons 'CAR n)
           (cons 'CAR c)))
    ((eq? (car e) 'CDR)
     (comp (cadr e) (cons 'CDR n)
           (cons 'CDR c)))
    ((eq? (car e) 'ATOM)
     (comp (cadr e) n
           (cons 'ATOM c)))
    ((eq? (car e) 'CONS)
     (comp (caddr e) n
           (comp (cadr e) n
                 (cons 'CONS c))))
    ((eq? (car e) 'IF)
     (let ((thenpt (comp (caddr e) n (cons 'JOIN '())))
           (elsept (comp (cadddr e) n (cons 'JOIN '()))))
       (comp (cadr e) n
             (cons 'SEL (cons thenpt (cons elsept c))))))
    ; ex 6.6
#|
Instruction sequence AP RTN is sometimes generated when a function is being defined and
immediately returned without any other operations.
This happens due to the following lines in the comp function when handling LAMBDA:

Hence it is redundant because AP applies a function and then RTN immediately returns,
making it a non-efficient two-step operation for what could be done in one.
|#
    ((eq? (car e) 'LAMBDA)
     (let ((body (comp (caddr e) (cons (cadr e) n) (cons 'RTN '()))))
       (if (eq? (car body) 'RTN)  ; Check for RTN
           (cons 'APRTN (cdr body))  ; Replace with new instruction
           (cons 'LDF (cons body c)))))  ; Original line
    ((eq? (car e) 'LET)
     (let* ((m (cons (vars (cddr e)) n))
            (args (exprs (cddr e)))
            (body (comp (cadr e) m (cons 'RTN '())))
            (complied-args (complis args m (cons body (cons 'AP c)))))
       complied-args))
    ((eq? (car e) 'LETREC)
     (let* ((m (cons (vars (cddr e)) n))
            (args (exprs (cddr e)))
            (body (comp (cadr e) m (cons 'RTN '())))
            (complied-args (complis args m
                                  (cons 'LDF (cons body (cons 'RAP c))))))
       (cons 'DUM complied-args)))
    (else
     (comp (cdr e) n
           (comp (car e) n
                 (cons 'AP c))))))
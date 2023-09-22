#lang racket

(define (atom? x)
  (not (pair? x)))
(define (member x l)
  (if (null? l)
      #f
      (if (eq? x (car l))
          #t
          (member x (cdr l)))))
(define (locate x l m)
  (if (eq? x (car l))
      (car m)
      (locate x (cdr l) (cdr m))))

(define (tree-assoc x tree)
  (cond
    ((null? tree) #f)
    ((not (pair? tree)) (if (eq? x tree) tree #f))
    ((eq? (car tree) x) (car tree))
    (else (or (tree-assoc x (car tree))
              (tree-assoc x (cdr tree))))))

(define (assoc x n v)
  (if (or (null? n) (null? v))
      #f
      (let ((name-match (tree-assoc x (car n)))
            (value-match (tree-assoc x (car v))))
        (if name-match
            value-match
            (assoc x (cdr n) (cdr v))))))

(define (evlis l n v)
  (if (null? l)
      '()
      (cons (eval (car l) n v)
            (evlis (cdr l) n v))))
(define (vars d)
  (if (null? d)
      '()
      (cons (caar d)
            (vars (cdr d)))))
(define (exprs d)
  (if (null? d)
      '()
      (cons (cdar d)
            (exprs (cdr d)))))
(define (rplaca lst new-car)
  (cons new-car (cdr lst)))

(define (cond->if clauses)
  (if (null? clauses)
      'undefined
      `(IF ,(caar clauses) ,(cadar clauses) ,(cond->if (cdr clauses)))))

(define (substitute e old new)
  (cond
    ((null? e) '())
    ((eq? e old) new)
    ((not (pair? e)) e)
    (else (cons (substitute (car e) old new)
                (substitute (cdr e) old new)))))

; ex 4.9
(define (match-pattern pattern value)
  (cond
    ((eq? pattern value) (list value))
    ((eq? pattern 'a) (list value))
    ((eq? pattern 'e) (list value))
    ((eq? pattern 'y) (list value))
    (else '())))

(define (cond-loop value clauses n v)
  (if (null? clauses)
      'undefined
      (let ((match-result (match-pattern (caar clauses) value)))
        (if match-result
            (eval (cadar clauses) n v)
            (cond-loop value (cdr clauses) n v)))))

(define (eval e n v)
  (cond
    ((atom? e) (assoc e n v))
    ((eq? (car e) 'QUOTE) (cadr e))
    ((eq? (car e) 'CAR) (car (eval (cadr e) n v)))
    ((eq? (car e) 'CDR) (cdr (eval (cadr e) n v)))
    ((eq? (car e) 'ATOM) (atom? (eval (cadr e) n v)))
    ((eq? (car e) 'CONS) (cons (eval (cadr e) n v) (eval (caddr e) n v)))
    ((eq? (car e) 'EQ) (eq? (eval (cadr e) n v) (eval (caddr e) n v)))
    ((eq? (car e) 'IF) (eval (if (eval (cadr e) n v) (caddr e) (cadddr e)) n v))
    ((eq? (car e) 'COND) (eval (cond->if (cdr e)) n v)) 
    ((eq? (car e) 'LAMBDA) (cadr e))
    ((eq? (car e) 'LET)
     (let ((y (vars (cddr e)))
           (z (evlis (exprs (cddr e)) n v)))
       (eval (cadr e) (cons y n) (cons z v))))
    ((eq? (car e) 'LETREC)
     (let ((y (vars (cddr e)))
           (vl (cons 'PENDING v)))
       (eval (cadr e) (cons y n) (rplaca v' (evlis (exprs (cddr e)) (cons y n) vl)))))
    ; ex 4.9
    ((eq? (car e) 'case)
     (let ((value (eval (cadr e) n v))
           (clauses (cddr e)))
       (cond-loop value clauses n v)))
    (else
     (let ((c (eval (car e) n v))
           (z (evlis (cdr e) n v)))
       (if (pair? c)
           (eval (cdar c) (cons (caar c) (cadr c)) (cons z (cddr c)))
           (error "Error: Expected pair. But is not a pair."))))))

(define (apply f args)
  (let ((body (cadr f))
        (params (car (cadr f))))
    (eval (foldl (lambda (p b) (substitute b p (quote p))) body params args) '() '())))

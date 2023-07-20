#lang racket
(require racket/function)

;; The Lispkit Compiler is provided in Appendix B (pg. 240). And it has been converted into Racket.

(define (atom? x)
  (not (pair? x)))

(define (thenpt expr)
  (eval expr))

(define (elsept expr)
  (eval expr))

(define (body e)
  (caddr e))

(define (compile e)
  (comp e '() '(4 21)))

(define (comp e n c)
  (cond
   [(atom? e) (cons 1 (cons (location e n) c))]
   [(eq? (car e) 'quote) (cons 2 (cons (cadr e) c))]
   [(eq? (car e) 'add) (comp (cadr e) n (comp (caddr e) n (cons '15 c)))]
   [(eq? (car e) 'sub) (comp (cadr e) n (comp (caddr e) n (cons '16 c)))]
   [(eq? (car e) 'mul) (comp (cadr e) n (comp (caddr e) n (cons '17 c)))]
   [(eq? (car e) 'div) (comp (cadr e) n (comp (caddr e) n (cons '18 c)))]
   [(eq? (car e) 'rem) (comp (cadr e) n (comp (caddr e) n (cons '19 c)))]
   [(eq? (car e) 'leq) (comp (cadr e) n (comp (caddr e) n (cons '20 c)))]
   [(eq? (car e) 'eq) (comp (cadr e) n (comp (caddr e) n (cons '14 c)))]
   [(eq? (car e) 'car) (comp (cadr e) n (cons '10 c))]
   [(eq? (car e) 'cdr) (comp (cadr e) n (cons '11 c))]
   [(eq? (car e) 'atom) (comp (cadr e) n (cons '12 c))]
   [(eq? (car e) 'cons) (comp (cadr e) n (comp (caddr e) n (cons '13 c)))]
   [(eq? (car e) 'if)
    (let ([comp-if (comp (cadr e) n (cons '8 c))])
      (cons (thenpt (cons (elsept comp-if) c))
            (thenpt comp (caddr e) n '9)
            (elsept comp (cadddr e) n '9)))]
   [(eq? (car e) 'lambda)
    (let ([body-c (cons '3 (cons (body e) c))])
      (comp (body e) (cons (cadr e) n) body-c))]
   [(eq? (car e) 'let)
    (let* ([m (cons (vars (cdddr e)) n)]
           [args (complis (exprs (cdddr e)) n (cons '3 (cons (body comp (cadr e) m) c)))])
    (let* ([args (complis (exprs (cdddr e)) n (cons '3 (cons (body comp (cadr e) n) c)))]
           [m (cons (vars (cdddr e)) n)])
      (args (exprs (cdddr e)) n)))]
   [(eq? (car e) 'letrec)
    (let* ([m (cons (vars (cdddr e)) n)]
           [args (complis (exprs (cdddr e)) n (cons '3 (cons (body comp (cadr e) m) c)))])
    (let* ([args (complis (exprs (cdddr e)) m (cons '6 (cons '3 (cons (body comp (cadr e) m) c))))]
           [m (cons (vars (cdddr e)) n)])
      (args (exprs (cdddr e)) n)))]
   [else (complis (cdr e) n (comp (car e) n (cons '4 c)))]))

(define (complis e n c)
  (if (eq? e '()) (cons '2 (cons '() c))
      (complis (cdr e) n (comp (car e) n (cons '13 c)))))

(define (location e n)
  (letrec ([member (lambda (e n)
                     (if (eq? n '()) #f
                         (if (eq? e (car n)) #t (member e (cdr n)))))]
           [posn (lambda (e n)  
                   (if (eq? e (car n)) '0 (+ '1 (posn e (cdr n)))))])
    (if (not (empty? n))
    (if (member e (car n)) (cons '0 (posn e (car n)))
        (cons (+ '1 (car (location e (cdr n)))) (cdr (location e (cdr n)))))
    '()))) 

(define (vars d)
  (if (eq? d '()) '()
      (cons (caar d) (vars (cdr d)))))

(define (exprs d)
  (if (eq? d '()) '()
      (cons (cadar d) (exprs (cdr d)))))
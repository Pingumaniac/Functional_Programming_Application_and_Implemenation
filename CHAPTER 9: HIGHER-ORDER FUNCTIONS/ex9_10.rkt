#lang typed/racket

(define-type Exp (U String (Listof Exp)))

(: identifier? (-> Exp Boolean))
(define (identifier? x)
  (string? x))

(: primary? (-> Exp Boolean))
(define (primary? x)
  (or (identifier? x)
      (and (list? x)
           (= 3 (length x))
           (identifier? (car x))
           (eq? '- (cadr x))
           (identifier? (caddr x)))))

(: term? (-> Exp Boolean))
(define (term? x)
  (or (primary? x)
      (and (list? x)
           (= 3 (length x))
           (primary? (car x))
           (eq? '- (cadr x))
           (primary? (caddr x)))))

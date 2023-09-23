#lang racket

; (CAND e1 e2)*n = e1*n } (SEL e1*n|(JOIN) (LDC F JOIN))
(define (compile-cand e1 e2)
  (append (compile e1)
          (list 'SEL (append (compile e1) '(JOIN)) '(LDC F JOIN))))

; (COR e1 e2)*n = e1*n | (SEL (LDC T JOIN) e2*n|(JOIN))
(define (compile-cor e1 e2)
  (append (compile e1)
          (list 'SEL '(LDC T JOIN) (append (compile e2) '(JOIN)))))
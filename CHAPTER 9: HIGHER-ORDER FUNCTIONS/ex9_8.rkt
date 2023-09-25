#lang racket

#|
sc = case for success continuation
fc = case for failure coninuation

Rules for transforming a non-deterministic program to a deterministic one:
1. Each functions get additional two parameters: sc, fc
2. Replace non-deterministic choice with sc and fc.
3. If successful, sc is called.
4. If failed, fc is called.
|#

(define (p b sc fc)
  (if (null? b)
      (sc #t)
      (if (null? (cdr b))
          (sc #t)
          (q (car b) (cadr b)
             (lambda () (p (cdr b) sc fc))
             fc))))

(define (restrictedperm a sc fc)
  (if (null? a)
      (sc null)
      (restrictedinsert (car a)
                        (lambda (r) (restrictedperm (cdr a)
                                                    (lambda (rr) (sc (cons r rr)))
                                                    fc))
                        fc)))

(define (restrictedinsert x a sc fc)
  (if (null? a)
      (sc (cons x null))
      (build x a
            (lambda (r) (sc r))
            (lambda () (build (car a)
                              (lambda (r) (restrictedinsert x (cdr a)
                                                           (lambda (rr) (sc (cons r rr)))
                                                           fc))
                              fc)))))

(define (build x y sc fc)
  (if (q x (car y))
      (sc (cons x y))
      (fc)))

(define (q x y sc fc)
  ; q' function is for calling either 'sc' or 'fc'
  )


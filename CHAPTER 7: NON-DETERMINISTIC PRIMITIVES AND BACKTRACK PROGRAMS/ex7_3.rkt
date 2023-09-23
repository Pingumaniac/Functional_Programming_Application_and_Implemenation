#lang racket

; Abstract Machine for (e1 or none) or (none or e2)
(define (abstract-machine-1 e1 e2)
  (let ((result1 (if (eq? e1 'none) 'none e1)))
    (if (not (eq? result1 'none))
        result1
        (let ((result2 (if (eq? e2 'none) 'none e2)))
          (if (not (eq? result2 'none))
              result2
              'none)))))

; Abstract Machine for e1 or e2
(define (abstract-machine-2 e1 e2)
  (if (not (eq? e1 'none))
      e1
      (if (not (eq? e2 'none))
          e2
          'none)))

(define (test-abstract-machines)
  (define (test-case e1 e2)
    (let ((result1 (abstract-machine-1 e1 e2))
          (result2 (abstract-machine-2 e1 e2)))
      (if (eq? result1 result2)
          'same
          'different)))

  (for-each (lambda (pair)
              (display (test-case (car pair) (cdr pair)))
              (newline))
            (list (cons 'a 'b)
                  (cons 'a 'null)
                  (cons null 'b)
                  (cons null null))))

(test-abstract-machines)

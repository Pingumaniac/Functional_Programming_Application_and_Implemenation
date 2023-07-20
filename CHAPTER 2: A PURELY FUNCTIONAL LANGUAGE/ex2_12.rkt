#lang racket
(define (reduce2 x g a)
  (if (null? x)
      a
      (reduce2 (cdr x) g (g a (car x)))))

(define f_test
  (lambda (y z)
    (+ (* 10 y) z)))

(reduce2 '(1 2 3 4 5) f_test 0) ;; gives 12345
(reduce2 '(3 1 4 1 5 9 2) f_test 0) ;; gives 3141592
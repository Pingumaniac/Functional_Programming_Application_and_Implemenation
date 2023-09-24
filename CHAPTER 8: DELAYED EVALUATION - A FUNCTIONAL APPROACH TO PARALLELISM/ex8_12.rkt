#lang racket

(define (bfs tree target)
  (let ([queue (list (lambda () tree))]) 
    (let loop ([queue queue])
      (if (null? queue)
          #f
          (let ([current-node ((car queue))]) 
            (if (equal? (car current-node) target)
                #t
                (loop (append (cdr queue)
                              (map (lambda (x) (lambda () x)) (cdr current-node))))))))))

(define tree '((1 (2 (4 . #f) (5 . #f))) (3 (6 . #f) (7 . #f))))

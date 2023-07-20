#lang racket
(define (atom? x)
  (not (pair? x)))

(define (adjust x)
  (if (atom? (car x))
      x
      (let* ((m (adjust (car x))))
        (cons (car m) (cons (cdr m) (cdr x))))))

(define (samefringe x y)
  (if (atom? x)
      (if (atom? y)
          (eq? x y)
          #f)    
      (if (atom? y)
          #f
          (let ((m (adjust x)))  
            (let ((n (adjust y))) 
              (if (eq? (car m) (car n))
                  (samefringe (cdr m) (cdr n))
                  #f))))))  

(samefringe '(1 (2 3) 4) '(1 (2 3) 4)) ; returns #t
(samefringe '(1 (2 3) 4) '(1 (2 3) 4 5)) ; returns #f
      
          

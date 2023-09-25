#lang racket

(define (append x y)
  (if (null? x)
      y
      (cons (car x) (delay (append (force (cdr x)) y)))))

#|
cons: X x Delayed(Delayedlist(X)) -> Delayedlist(X)
car: Delayedlist(X) -> X
cdr: Delayedlist(X) -> Delayed(Delayedlist(X))
append: Delayedlist(X) x Delayedlist(X) -> Delayedlist(X)
x: Delayedlist(X)
y: Delayedlist(X)
cdr(x): Delayed(Delayedlist(X))
force cdr(x): Delayedlist(X)
car(x): X
cons(car(x), delay(append(force cdr(x), y))): Delayedlist(X)
|#
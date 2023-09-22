#lang racket

(define (dagger q n)
  (lambda (v)
    (cond ((is-expression? q) (val q n v))
          ((is-statement? q) (effect q n v))
          (else 'ERROR))))

#|
The dagger function is more akin to a compiler than an interpreter.
This is beause the function creates a function which encapsulates the semantics of the
input expression or statement.
By contrast, an interpreter directly executes or evaluates each line of code.
|#
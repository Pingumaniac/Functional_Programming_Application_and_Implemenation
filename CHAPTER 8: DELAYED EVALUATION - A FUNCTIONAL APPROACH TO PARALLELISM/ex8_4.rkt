#lang racket

#|
The function delay returns a lambda function, in which returns the valuation of the expression e
when forced to evaluate it.
In other words, delay evaluation is made when the function delay is called.
So, force(delay e) will invoke that lambda and evaluate e.
|#
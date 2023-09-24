#lang racket

#|
Method of evaluation: Delay all arguments to user-defined functions and to cons and
delay all definitions (rules (1) - (3) of lazy evaluation). Repeatedly force all variables
and the results of car and cdr.

This makes everything lazy. This prevents doing unnecessary work.
But this adds complexity for bookkeeping, and thus requires a lot of "forcing"
to actually obtain values.
|#
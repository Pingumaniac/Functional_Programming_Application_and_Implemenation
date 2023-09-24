#lang racket

#|
1. Create a FIFO queue of recipes requiring evaluation.
2. Maintain a queue of processes waiting for recipes.
3. As recipes get evaluated, remove them from the queue and assign to waiting processes if any.

Different interpretations can arise during parallel, concurrent, distributed execution
in the multiprogrammed version, unlike uniprogrammed interpretation.
|#
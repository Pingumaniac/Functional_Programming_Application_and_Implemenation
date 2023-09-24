#lang racket

#|
delay(force e) is not equivalent in effect to the code for e.
This is because the function force will evaluate e and then the delay function will delay the
result of evaluation.
|#
#lang racket

#|
To show that the stack pointer top is not strictly necessary and that its value at any point in the
statemnet seqeuence can be determined to be a fixed displacement from the value of act,
consider using a counter within each function call to track how deep you are in the recursion.
This depth can then serve as a substitute for top, eliminating the need for top.
|#
#lang racket

#|
Sequence of Statements: A sequence S1; S2 can be collapsed into a single parallel assignment
that combines the changes of both S1 and S2.

Conditional Statements: IF condition THEN S1 ELSE S2 can be transformed by evaluating
both S1 and S2 but applying only the effect of one, based on the condition.

Loops: For loops like WHILE condition DO S, you could unroll the loop into a sequence
of conditional statements, which themselves could be collapsed into parallel assignments.

Assignments and Expressions: These are essentially parallel assignments to variables.
|#
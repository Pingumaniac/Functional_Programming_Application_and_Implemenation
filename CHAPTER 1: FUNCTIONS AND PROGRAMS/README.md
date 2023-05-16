# Notes

### Question: Do we need more than just a repertoire of basic functions and the ability to compose them in order to define a library of functional programs?

Answer "we do not and it is the purpose of the remainder of this book to illustrate just that point. (6)"

### Function vs Procedure

Pure function -> "always returns a result (9)" 
Procedure -> "Rather than returning a result, instead assign a value to one of their parameters. (9)"

"When composing programs from such procedures we must think in terms of the incremental changes made to variables by successive assignments. That is to say, we are computing by effect rather than just computing values. (10)"

### About pure functional programming language

1. "Assignment is missing. So is the familiar programming notion of a variable as something which holds a value which is changed from time to time by assignment. Rather, the variables in our purely functional programming language are like the mathematical variables... used only to name the argument values of functions and are associated with these constant values for the duration of the evaluaton of the algebraic expression which defines the result of the function. (11-12)"
2. Has "data structuring capability (12)" -> "entire data structures are treated as single values... once a data structure has been built it cannot be altered, its value will remain inviolate. (12)"
3. Has "an ability to define what are called higher-order functions (12)" -> "can lead to progams that are remarkablely short and succinct for the computation which they perform (12)"

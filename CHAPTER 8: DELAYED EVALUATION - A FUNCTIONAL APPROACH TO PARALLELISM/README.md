# Notes

## Lazy Evaluation

* "delaying almost every expression in a program and driving execution by repeatedly forcing the unevaluated result to resume evaluation (214)"
* "gives a more general, and generally more acceptable, interpretation to letrec (214)"
* "process of delaying both the arugments to user-defined functions and the arguments to cons (226)"

"In a purely functional program, usually without any explicit delays or forces, we make the following changes throughout the entire program;

1. delay all arguments to user-defined functions;
2. delay all arguments to cons;
3. delay all definitions in both let and letrec blocks;
4. repeatedly force all arguments to primitive functions (other than cons);
5. repeatedly force the test in conditional expressions;
6. repeatedly force the function in a function application. (226-227)"
